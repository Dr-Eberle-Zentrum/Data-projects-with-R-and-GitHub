    library(readxl)
    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    library(tidyr)
    library(purrr)
    library(ggplot2)
    library(broom) # For one-row summary of model containing R^2
    library(rnaturalearth) # For World map canvas
    library(rnaturalearthdata) # For World map

    ## 
    ## Attaching package: 'rnaturalearthdata'

    ## The following object is masked from 'package:rnaturalearth':
    ## 
    ##     countries110

    library(sf) # For simplified spatial data

    ## Linking to GEOS 3.13.0, GDAL 3.8.5, PROJ 9.5.1; sf_use_s2() is TRUE

    library(countrycode)

## 1) Loading Data

    tempfile_path <- tempfile(fileext = ".xlsx")

    download.file(
      url = "https://gfw2-data.s3.amazonaws.com/country-pages/country_stats/download/gfw_2023_statistics_summary_v30102024.xlsx",
      destfile = tempfile_path,
      mode = "wb"  # Write binary, important for Excel files
    )

    # Load sheet 2 (named "Country tree cover loss")
    data_raw <- read_excel(
      path = tempfile_path,
      sheet = "Country tree cover loss"
    ) %>% janitor::clean_names()

## 2) Data Wrangling

    # Mutate threshold to numeric and filter for 30 % threshold
    data_loss <- data_raw %>%
      mutate(threshold = as.numeric(threshold)) %>%
      filter(threshold == 30) %>%
      select(
        country,
        area_ha,
        starts_with("tc_loss_ha_")
      )

    # We want one row per country, year and loss value
    data_long <- data_loss %>%
      pivot_longer(
        cols = starts_with("tc_loss_ha_"), # create explicit year coloumn
        names_to = "year",
        names_prefix = "tc_loss_ha_",
        values_to = "loss_ha"
      ) %>%
      mutate(year = as.integer(year))

    # Prepare nest data per country
    nested <- data_long %>%
      group_by(country, area_ha) %>%
      nest()  # creates a column `data` that holds data frames for each country

## 3) Fitting and Predicting

    # Fitting with map()
    nested <- nested %>%
      mutate(
        model = map(data, ~ lm(loss_ha ~ poly(year, 2), data = .x))
      )

    # Predict 2050 values via predict()
    nested <- nested %>%
      mutate(
        prediction_2050 = map(model, ~ predict(.x, newdata = data.frame(year = 2050), se.fit = TRUE)),
        expected_tc_ha_2050 = map_dbl(prediction_2050, ~ .x$fit),
        var_expected_tc_ha_2050 = map_dbl(prediction_2050, ~ (.x$se.fit)^2)
      )

    # Compute R2 value
    nested <- nested %>%
      mutate(
        model_glance = map(model, glance),
        r_squared = map_dbl(model_glance, "r.squared")
      )

    # Un-nest to obtain final result
    result <- nested %>%
      select(country, area_ha, expected_tc_ha_2050, var_expected_tc_ha_2050, r_squared)

    # Join data
    final_data <- result %>%
      left_join(
        data_loss,
        by = c("country", "area_ha")
      ) %>%
      mutate(
        tc_loss_pct_2023 = tc_loss_ha_2023 / area_ha  # normalize for world map
      )



    # Delete entries with poor fits and negative prediction values
    final_data <- final_data %>%
       filter(expected_tc_ha_2050>0 | r_squared > 0.2)

## 4) Prepare for prediction plots

    countries_to_plot <- c("Cambodia","Austria", "Canada", "Spain", "Russia", "United States")

    # Get model predictions for 2050
    pred_2050 <- final_data %>%
      filter(country %in% countries_to_plot) %>%
      transmute(
        country,
        year = 2050,                     # Explicitly set year to 2050
        loss_ha = expected_tc_ha_2050    # Use model output as the predicted value
      )

    # Combine observed and predicted data
    combined_plot_data <- bind_rows(
      data_long %>%
        filter(country %in% countries_to_plot) %>% select(country, year, loss_ha),
      pred_2050
    )


    # Extract R2 labels
    r2_labels <- final_data %>%
      filter(country %in% countries_to_plot) %>%
      select(country, r_squared) %>%
      mutate(
        label = paste0("R² = ", round(r_squared, 3))
      )

    ## Adding missing grouping variables: `area_ha`

## 5) Plot with predictions

    # Plot: Actual data + model fit + 2050 prediction + R2 label

    ggplot(combined_plot_data, aes(x = year, y = loss_ha)) +
      geom_point(alpha = 0.6, size = 2) +  # actual data points
      geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, color = "steelblue") +
      geom_point(data = pred_2050, aes(x = year, y = loss_ha), color = "red", size = 3, shape = 18) +
      
      # Add R² label 
      geom_label(
        data = r2_labels,
        aes(x = 2002, y = Inf, label = label, color = r_squared),
        vjust = 2,
        hjust = -2,
        fill= "white",
        size=2,
        inherit.aes = FALSE
      ) +
      
      facet_wrap(~ country, scales = "free_y") +
      labs(
        title = "Tree Cover Loss (Observed and Predicted for 2050)",
        x = "Year",
        y = "Loss in hectares",
        caption = "Red point: predicted value for 2050 using 2nd-degree polynomial fit"
      ) +
      theme_minimal()

![](hd25viet_files/figure-markdown_strict/Facet%20plotting%20of%20countries-1.png)

## 6) Plot world map

    # Get world map canvas
    world <- ne_countries(scale = "medium", returnclass = "sf")

    # Add a standardized country names to your data
    final_data <- final_data %>%
      mutate(country_std = countrycode(country, origin = "country.name", destination = "country.name"))

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `country_std = countrycode(country, origin = "country.name",
    ##   destination = "country.name")`.
    ## ℹ In group 118: `country = "Saint-Martin"` `area_ha = 5616`.
    ## Caused by warning:
    ## ! Some values were not matched unambiguously: Saint-Martin

    # Add standardized country name to the world shapefile
    world <- world %>%
      mutate(country_std = countrycode(name, origin = "country.name", destination = "country.name"))

    ## Warning: There were 2 warnings in `stopifnot()`.
    ## The first warning was:
    ## ℹ In argument: `country_std = countrycode(name, origin = "country.name",
    ##   destination = "country.name")`.
    ## Caused by warning:
    ## ! Some values were not matched unambiguously: Ashmore and Cartier Is., Br. Indian Ocean Ter., Fr. Polynesia, Fr. S. Antarctic Lands, Indian Ocean Ter., Micronesia, S. Geo. and the Is., S. Sudan, Siachen Glacier, St-Martin, St. Vin. and Gren., U.S. Virgin Is., W. Sahara
    ## ℹ Run `dplyr::last_dplyr_warnings()` to see the 1 remaining warning.

    # Join world map with data by country code
    map_data <- world %>%
      left_join(final_data, by = "country_std")

    # Plot 
    ggplot(map_data) +
      geom_sf(aes(fill = tc_loss_pct_2023)) +
      scale_fill_viridis_c(
        name = "Tree Loss in 2023\n(% of country area)",
        begin = 0.25,
        end = 1,
        labels = scales::percent_format(accuracy = 0.01),
        na.value = "grey90"
      ) +
      labs(
        title = "Global Tree Cover Loss in 2023",
        subtitle = "Tree cover loss in hectares relative to total land area per country",
        caption = "Data source: GFW 2023"
      ) +
      theme_minimal()

![](hd25viet_files/figure-markdown_strict/Join%20via%20country%20code%20and%20plot-1.png)

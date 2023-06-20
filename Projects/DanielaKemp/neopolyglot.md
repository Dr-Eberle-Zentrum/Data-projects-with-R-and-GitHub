## R Markdown

    library(ggplot2)
    library(readr)

    # Read the data from Food_data_0.txt
    data <- read_delim("Food_data_0.txt", delim = "\t", col_names = TRUE)

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 4999 Columns: 201
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr   (74): code, url, creator, created_t, created_datetime, last_modified_d...
    ## dbl  (101): #, serving_quantity, additives_n, additives, nutriscore_score, n...
    ## lgl   (23): cities, allergens_en, butyric-acid_100g, capric-acid_100g, lauri...
    ## dttm   (3): last_modified_t, product_name, last_image_datetime
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    # Filter the subset based on conditions
    subset_data <- subset(data, !(brands == "Nestle" & grepl("palm oil", ingredients_text, ignore.case = TRUE)))

    # Filter out rows where nutriscore_score is 0
    filtered_data <- subset(subset_data, nutriscore_score != 0)

    # Define the colors for nutriscore_grade
    Nutri_Colors <- c("#058b49", "#74c928", "#fbc801", "#f4730e", "#ef2d1a")

    # Plot histogram of nutriscore_score with colors based on nutriscore_grade
    ggplot(filtered_data, aes(x = nutriscore_score, fill = toupper(nutriscore_grade))) +
      geom_histogram(binwidth = 0.5, position = "identity", alpha = 1) +
      scale_fill_manual(values = Nutri_Colors) +
      labs(x = "Nutriscore Score", y = "Frequency", fill = "Nutriscore Grade") +
      theme_minimal()

![](neopolyglot_files/figure-markdown_strict/unnamed-chunk-1-1.png)

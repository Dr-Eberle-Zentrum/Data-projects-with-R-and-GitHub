## Loading and cleaning up the data

    # # Read lines from the file
    # lines <- read_lines("Projects/timow98/SoilData.csv")
    # 
    # # Remove the second line before reading in the file
    # units <- lines[2] # save the line with the units for later
    # lines <- lines[-2]
    # 
    # # Create a temporary file-like object
    # temp_file <- tempfile()
    # write_lines(lines, temp_file)
    # 
    # # Read the modified lines into a data frame
    # df <- read.delim2(temp_file, sep = ";", 
    #                   na = c("99", "99999,99", 99999))
    # 
    df_col <- read_delim("Projects/timow98/SoilData.csv", delim = ";",
                          n_max = 1,
                          show_col_types = F)

    df <- read_delim("Projects/timow98/SoilData.csv", delim = ";",
                         locale = locale(decimal_mark = ","),
                         skip = 2,
                         col_names = F,
                         na = c("99", "99999,99", 99999),
                         show_col_types = F)

### Clean-Up

1.1 the column KAKpot2 is not needed  
1.2 the header displays numbers which do not make much sense. I would
like to get rid of them by using rename\_with() in combination with
regular expressions.  
1.3 there is a typo in the column “Expozition”. It should actually be
“Exposition” 1.4 integrate the unit into the header

    # Remove the random numbers in the variable names
    names(df_col) <- str_replace(names(df_col), "_.*", "") # 1.2

    # Correct spelling mistake 
    names(df_col)[9] <- "Exposition" # 1.3

    # Adding an underscore before each unit and removing all empty spaces # 1.4 ff.
    df_col %<>%
      mutate_all(~ paste0("_", .)) %>%
      mutate_all(~ str_remove_all(., " ")) %>%
      mutate_all(~ str_remove_all(., "_\\[\\]"))

    # Removing all white spaces in the names of the variables
    names(df_col) <- trimws(names(df_col), "right")

    # Adding the thing to each variable name
    units <- df_col[1,] %>% unname() %>% unlist()
    names(df_col) <- paste0(names(df_col), units)

    names(df) <- names(df_col)

    # Remove variable "KAKpot 2
    df$`KAKpot 2_[cmol/kg]` <- NULL # 1.1

1.6 two columns need to be calculated: base\_saturation\_\[%\] by
dividing “Kationen” by “KAKpot” and SOM\_\[%\] by multiplying Corg with
1,72

    df %<>%
      mutate(`base_saturation_[%]` = `Kationen_[mmol/kg]`/`KAKpot_[mmol/kg]`,
             `SOM_[%]` = 1.72 * `Corg_[%]`)

1.7 Column S+U+T is not always 100%. Write a new column and put in
“more”, “less” and “exactly” depending on the value in the column S+U+T.
Then, write a query that counts and prints the number of values.

    df %<>%
      mutate(`S+U+T_descr` = case_when(`S+U+T_[%]` > 100 ~ "more",
                                    `S+U+T_[%]` < 100 ~ "less", 
                                    `S+U+T_[%]` == 100 ~ "exactly",
                                    .default = NA))
    df %>%
      count(`S+U+T_descr`)

    ## # A tibble: 4 × 2
    ##   `S+U+T_descr`     n
    ##   <chr>         <int>
    ## 1 exactly          20
    ## 2 less             69
    ## 3 more             60
    ## 4 <NA>              4

## Visualization

### Stacked Barplot

Create a stacked barplot that shows the values for Ca, Mg and Kationen
of the **last** horizon of the profiles 55, 71, 102 and 109. Use the
same colors as in the example plot (viridis)

    # make a dataset that includes only the desired values
    df_barplot <- df %>%
      filter(Profil %in% c(55, 71, 102, 109)) %>% # only these profiles are relevant
      group_by(Profil) %>%
      slice_max(Horizont) %>% # only keep the last horizon of each profile
      ungroup %>%
      select(c("Profil", "Ca_[mmol/kg]", "Mg_[mmol/kg]", "Kationen_[mmol/kg]")) # only keep Ca, Mg and Kationen variables

    # shape the dataset into long format
    df_barplot <- pivot_longer(df_barplot, cols = -Profil, names_to = "variable", values_to = "value") %>%
      mutate(Profil = factor(Profil))

    # create the barplot
    # x axis should be the 4 profiles
    # y axis should be the three kinds of variables, but stacked 
    ggplot(df_barplot, aes(x = Profil, y = value, fill = variable)) +
      geom_bar(stat = "identity", position = "stack") + 
      scale_fill_viridis_d(labels = c("Ca", "Kationen", "Mg")) + # color should come from viridis
      labs(y = "mmol/kg") +
      theme_minimal()

![](elbue_files/figure-markdown_strict/unnamed-chunk-5-1.png)

### Piechart of grain sizes

3 piecharts of the “Ah” horizons of the profiles 82, 111 and 134 next to
each other where I can see the portion of S (Sand), U (silt) and T

    # make a dataset that includes only the desired values
    df_pie <- df %>%
      filter(Profil %in% c(82, 111, 134)) %>% # only these profiles are relevant
      filter(grepl("^Ah\\s*$", Horizontbezeichnung)) %>% # only keep the horizons with "Ah"
      select(c("Profil", "S_[%]", "U_[%]", " T_[%]"))

    # melt to long format
    df_pie_long <- pivot_longer(df_pie, -Profil, names_to = "variable", values_to = "value")

    # create pie charts for each profile
    df_pie_long %>%
      ggplot(aes(x = "", y = value, fill = variable)) +
      geom_bar(stat = "identity", width = 1) +
      geom_text(aes(label = paste0(round(value), "%")), position = position_stack(vjust = 0.5)) + 
      coord_polar("y") +
      scale_fill_discrete(labels = c("Sand", "Silt", "Clay")) +  # Change legend labels
      theme_void() +
      facet_wrap(~ Profil) +
      ggtitle("Comparison of grain size composition in Ah horizons") + 
      theme(plot.title = element_text(hjust = 0.5, vjust = 5))

![](elbue_files/figure-markdown_strict/unnamed-chunk-6-1.png)
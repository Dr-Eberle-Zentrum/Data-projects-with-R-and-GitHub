## Loading and cleaning up the data

    # Read lines from the file
    lines <- read_lines("Projects/timow98/SoilData.csv")

    # Remove the second line before reading in the file
    units <- lines[2] # save the line with the units for later
    lines <- lines[-2]

    # Create a temporary file-like object
    temp_file <- tempfile()
    write_lines(lines, temp_file)

    # Read the modified lines into a data frame
    df <- read.delim2(temp_file, sep = ";", 
                      na = c("99", "99999,99", 99999))

### Clean-Up

**1.1 the column KAKpot2** is not needed  
**1.2 the header** displays numbers which do not make much sense. I
would like to get rid of them by using rename\_with() in combination
with regular expressions. **1.4 there is a typo in the column
“Expozition”**. It should actually be “Exposition”

    # Remove the random numbers in the variable names
    names(df) <- str_replace(names(df), "_.*", "") # 1.2

    # Correct spelling mistake 
    names(df)[9] <- "Exposition" # 1.4

    # Change back the two column names that were supposed to have "+" instead of "."
    names(df)[c(28, 30)] <- str_replace_all(names(df)[c(28, 30)], "\\.", "+")

\*\*1.3 integrate the unit into the header

    # Make a vector out of the string that holds the units
    units <- unlist(strsplit(units, ";"))

    # Adding an underscore before each unit
    units <- paste("_", units, sep = "")
    # manually correcting one error
    units[8] <- "_[%]"

    # Adding the thing to each variable name
    names(df) <- paste(names(df), units, sep = "")

    # Remove the unit if it is empty
    names(df) <- str_replace(names(df), "_\\[\\]$", "")

    # Remove variable "KAKpot 2
    df$"KAKpot.2_[cmol/kg]" <- NULL # 1.1

**1.6 two columns need to be calculated**: base\_saturation\_\[%\] by
dividing “Kationen” by “KAKpot” and SOM\_\[%\] by multiplying Corg with
1,72

    df %<>%
      mutate("base_saturation_[%]" = !!sym("Kationen_[mmol/kg]")/!!sym("KAKpot_[mmol/kg]"),
             "SOM_[%]" = 1.72 * !!sym("Corg_[%]"))

**1.7 Column S+U+T is not always 100%**. I would like to see how often I
got more, less and exactly 100%. Write a new column and put in “more”,
“less” and “exactly” depending on the value in the column S+U+T. Then,
write a query that counts and prints the number of values (for example
“10x less than 100%, 3x exactly 100% and 24x more than 100%”)

    df %<>%
      mutate(S_U_T = (!!sym("S_[%]") + !!sym("U_[%]") + !!sym("T_[%]") )) %>%
      mutate(S_U_T_descr = case_when(S_U_T > 100 ~ "more",
                                    S_U_T < 100 ~ "less", 
                                    S_U_T == 100 ~ "exactly",
                                    .default = NA))

## Visualization

### Stacked Barplot

Create a stacked barplot that shows the values for Ca, Mg and Kationen
of the **last** horizon of the profiles 55, 71, 102 and 109. Use the
same colors as in the example plot (viridis)

    # make a dataset that includes only the desired values
    df_barplot <- df %>%
      filter(Profil %in% c(55, 71, 102, 109)) %>% # only these profiles are relevant
      group_by(Profil) %>%
      filter(Horizont == max(Horizont)) %>% # only keep the last horizon of each profile
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

![](elbue_files/figure-markdown_strict/unnamed-chunk-6-1.png) \###
Piechart of grain sizes 3 piecharts of the “Ah” horizons of the profiles
82, 111 and 134 next to each other where I can see the portion of S
(Sand), U (silt) and T

    # make a dataset that includes only the desired values
    df_pie <- df %>%
      filter(Profil %in% c(82, 111, 134)) %>% # only these profiles are relevant
      filter(grepl("^Ah\\s*$", Horizontbezeichnung)) %>% # only keep the horizons with "Ah" (and also "Ah " - thanks for nothing! ;))
      select(c("Profil", "S_[%]", "U_[%]", "T_[%]"))

    # melt to long format
    df_pie_long <- pivot_longer(df_pie, -Profil, names_to = "variable", values_to = "value")

    # create pie charts for each row
    plots <- lapply(unique(df_pie_long$Profil), function(profile) {
      df_subset <- filter(df_pie_long, Profil == profile)
      ggplot(df_subset, aes(x = "", y = value, fill = variable)) +
        geom_bar(stat = "identity", width = 1) +
        geom_text(aes(label = paste0(round(value), "%")), position = position_stack(vjust = 0.5)) + 
        coord_polar("y") +
        labs(caption = paste("Profil", profile)) +
        scale_fill_discrete(labels = c("Sand", "Silt", "Clay")) +  # Change legend labels
        theme_void() +
        theme(plot.caption = element_text(hjust=0.5, size=rel(1.2)))
    })

    # arrange next to each other
    grid.arrange(grobs = plots, ncol = 3,
                 top = textGrob("Comparison of grain size composition in Ah horizons")
    )

![](elbue_files/figure-markdown_strict/unnamed-chunk-7-1.png)

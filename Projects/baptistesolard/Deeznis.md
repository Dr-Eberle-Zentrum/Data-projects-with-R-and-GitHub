    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.1     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    library(ggplot2)
    library(rio)
    library(here)

    ## here() starts at C:/Lehre/Data-projects-with-R-and-GitHub

    # Set the working directory
    setwd(dirname(rstudioapi::getActiveDocumentContext()$path))


    ## Import datasets
    import('Inventory_Glassworkshop.csv', setclass = 'tibble') -> inventory
    import('GlassBeads.csv', setclass = 'tibble') -> GlassBeads

# Table 1 Modification

    ## 1. Add a column SampleID after Number
    inventory <- inventory %>%
      mutate(SampleID = paste(Context, Number, sep = ".")) %>%
      relocate(SampleID, .after = "Number")

    ## 2. Create a new dataframe "Rods" with selected columns
    Rods <- inventory[, c(6, 20:23)]
    inventory <- inventory[, -c(20:23)]

    ## 3. Transform the table "inventory" into a long format, where each row represents a unique combination of "Type" and "Presence" columns, and a new column "Color" is created based on the "Type" column if the "Presence" value is 1 and the "Type" contains an underscore
    inventory2 <- inventory %>%
      pivot_longer(cols = HollowGlass:Miscellaneous, names_to = "Type", values_to = "Presence") %>%
      mutate(Colour = if_else(Presence == 1 & grepl("_", Type), sub(".*_", "", Type), NA_character_)) %>%
      drop_na(Presence) %>%
      select(-Presence)

    ## Extract base object type
    inventory2 <- inventory2 %>%
      mutate(Type = sub("_.*", "", Type)) %>%
      mutate(Colour = if_else(Colour %in% c("HollowGlass", "FlatGlass", "Splitter", "GlassChunk", "Droplet", "Slag", "Tessera", "Bead", "RV", "OvenPiece", "Miscellaneous"),
                              NA_character_, Colour))

# Table 2 Modification (Beads)

    ## 1. Add a column SampleID after Number
    GlassBeads <- GlassBeads %>%
      mutate(SampleID = paste(Context, Number, sep = ".")) %>%
      relocate(SampleID, .after = "Number")

    ## 2. Separate colour and decor
    GlassBeads <- GlassBeads %>%
      separate(col = "Colour", into = c("Colour", "Decor"), sep = ", ") %>%
      mutate(Decor = tolower(gsub("decor ", "", Decor)))

    ## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 90 rows [1, 2, 3, 4, 6,
    ## 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, ...].

    ## 3. Convert yes/no columns to boolean
    GlassBeads <- GlassBeads %>%
      mutate(
        IronOxide = case_when(
          IronOxide == "y" ~ TRUE,
          IronOxide == "n" ~ FALSE,
          TRUE ~ NA
        ),
        Broken = case_when(
          Broken == "y" ~ TRUE,
          Broken == "n" ~ FALSE,
          TRUE ~ NA
        )
      )           


    ## 1.4. Join with Beads dataset (Do the other steps below first)
    Beads_select <- select(GlassBeads, SampleID, Colour) %>% 
      mutate(Type = "Bead")
    merged_BI <- full_join(Beads_select, inventory2)

    ## Joining with `by = join_by(SampleID, Colour, Type)`

    ## 2.4. Join with previous dataframe
    inventory2_filtered <- inventory2 %>%
      filter(Type == "Bead") %>%
      select(SampleID, Colour)

    merged_BI <- full_join(inventory2_filtered, merged_BI)

    ## Joining with `by = join_by(SampleID, Colour)`

    ## Warning in full_join(inventory2_filtered, merged_BI): Detected an unexpected many-to-many relationship between `x` and `y`.
    ## ℹ Row 25 of `x` matches multiple rows in `y`.
    ## ℹ Row 269 of `y` matches multiple rows in `x`.
    ## ℹ If a many-to-many relationship is expected, set `relationship =
    ##   "many-to-many"` to silence this warning.

# Rod Table Modification

    Rods <- Rods %>%
      rename_with(~sub("Rod_", "", .), starts_with("Rod_"))
    Rods <- Rods%>%
      mutate(
        Molten = case_when(
          Molten == "y" ~ TRUE,
          Molten == "n" ~ FALSE,
          TRUE ~ NA
        ),
        Plychrome = case_when(
          Plychrome == "y" ~ TRUE,
          Plychrome == "n" ~ FALSE,
          TRUE ~ NA
        )
      )  

# Data Visualisation

    ## Fix typos in Colour column
    merged_BI <- merged_BI %>%
      mutate(Colour = ifelse(Colour == "bluee", "blue", Colour),
             Colour = ifelse(Colour == "Dm", NA, Colour))

    # Define custom color palette based on unique values in the "Colour" column
    custom_palette <- unique(merged_BI$Colour)


    # Filter data and convert Colour to factor with custom palette order
    all_data <- merged_BI %>%
      filter(!is.na(Colour)) %>%
      mutate(Colour = factor(Colour, levels = custom_palette))


    # Get unique values in the Colour column
    unique_colours <- unique(all_data$Colour)

    # Ensure that the order of unique values matches the order of colours in custom_palette
    colour_palette <- custom_palette[match(unique_colours, custom_palette)]

    # Convert Colour to factor with custom palette order
    all_data <- all_data %>%
      mutate(Colour = factor(Colour, levels = colour_palette))

    # Create histogram
    hist_by_type <- ggplot(all_data, aes(x = Colour, fill = Colour)) +
      geom_histogram(color = "black", stat = "count") +
      scale_fill_manual(values = colour_palette) +
      labs(title = "Colour Distribution for All Object Types", x = "Colour", y = "Frequency") +
      facet_wrap(~ Type, ncol = 1) +  # Facet by object type
      theme_minimal()

    ## Warning in geom_histogram(color = "black", stat = "count"): Ignoring unknown
    ## parameters: `binwidth`, `bins`, and `pad`

    # ggsave("SolutionByDennis/hist_by_type.png", plot = hist_by_type, 
    #        width = 300, height = 200, units = "mm", dpi = 600, bg = "white")
           
    print(hist_by_type)

![](Deeznis_files/figure-markdown_strict/4-1.png)

    # combined, not differentiaed by type

    hist_combined <- ggplot(all_data, aes(x = Colour, fill = Colour)) +
      geom_histogram(color = "black", stat = "count") +
      scale_fill_manual(values = colour_palette) +
      labs(title = "Colour Distribution for All Object Types", x = "Colour", y = "Frequency") +
      facet_wrap(~., ncol = 1) +  # Remove Type variable from facet_wrap
      theme_minimal()

    ## Warning in geom_histogram(color = "black", stat = "count"): Ignoring unknown
    ## parameters: `binwidth`, `bins`, and `pad`

    # ggsave("SolutionByDennis/hist_combined.png", plot = hist_combined, 
    #        width = 300, height = 200, units = "mm", dpi = 600, bg = "white")

    print(hist_combined)

![](Deeznis_files/figure-markdown_strict/4-2.png)
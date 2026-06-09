# Data Import

    raw_data  <- read_csv("dependencies/SpeciesByKingdomAndClass.csv")

    ## Rows: 75 Columns: 16
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (1): Name
    ## dbl  (4): EX, EW, CR(PEW), LR/cd
    ## num (11): Subtotal (EX+EW), CR(PE), Subtotal (EX+EW+ CR(PE)+CR(PEW)), CR, EN...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

On the website you will see that they also have data on which Kingdom
the various Classes belong to, we want to add this data
semi-automatically.

Manually note the different Kingdoms and in what order they appear in
the online table.

Use lag() and/or fill() alongside the fact that the table is ordered
lexicographically by Class-name within each Kingdom to automatically
find the boundaries between the different Kingdoms.

Add the Kingdom information in a new column named Kingdom

## Add Kingdom Data

    kingdoms <- c("Animalia", "Chromista", "Fungi", "Plantae") # list kingdoms in the order they appear in

    kingdom_data  <- raw_data %>%
      mutate(
        ClassChange = Name < lag(Name), # create column that says TRUE when a change appears (new kingdom)
        ClassChange = replace_na(ClassChange, TRUE) # replaces NA in 1st observation with TRUE
        ) %>%
      mutate(
        Kingdom = ifelse(ClassChange == TRUE, kingdoms, NA)  
        # creates a new column, where TRUE there's a kingdom name
            ) %>%
      fill(Kingdom, .direction ="down") %>%
      # fills the NAs with the value
      select(!("ClassChange"))
      # removes the ClassChange column again


    kingdom_data$Kingdom[75] <- NA 
    # removes kingdom name from last row bc. its the total & therefor has no kingdom

# Data Manipulation

    manipulated_data <- kingdom_data %>%
      select(!("CR(PE)":"Subtotal (EX+EW+ CR(PE)+CR(PEW))")) %>%
      # removes columns
      rowwise() %>%
      mutate( 
        NearThreatened = sum(across("LR/cd":"NT or LR/nt"))
        # combines columns
            ) %>%
      select(!("LR/cd":"NT or LR/nt")
             # removes columns
             ) %>%
      rename(
        "Extinct" = "EX",
        "Extinct in the Wild" = "EW",
        "Critically Endangered" = "CR",
        "Endangered" = "EN",
        "Vulnerable" = "VU",
        "Low Risk" = "LC or LR/lc",
        "Data Deficient" = "DD"
        )

# Data Visualization

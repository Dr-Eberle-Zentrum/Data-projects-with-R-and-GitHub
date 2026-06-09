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

## Add Kingdom Data

    kingdoms <- c("Animalia", "Chromista", "Fungi", "Plantae") # list kingdoms in the order they appear in

    kingdom_data  <- raw_data %>%
      mutate(
        ClassChange = Name < lag(Name), # create column that says TRUE when a change appears (new kingdom)
        ClassChange = replace_na(ClassChange, TRUE), # replaces NA in 1st observation with TRUE
        Kingdom = ifelse(ClassChange == TRUE, kingdoms[cumsum(ClassChange)], NA)
      ) %>%
      fill(Kingdom, .direction = "down") %>%
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
        "ExtinctWild" = "EW",
        "CriticallyEndangered" = "CR",
        "Endangered" = "EN",
        "Vulnerable" = "VU",
        "LowRisk" = "LC or LR/lc",
        "DataDeficient" = "DD"
        ) %>%
      select(`Name`,`Kingdom`,`Extinct`:`DataDeficient`, `NearThreatened`, `Total`)
      # changes column order

# Data Visualization

Unfortunately I couldn’t figure out how the plots are supposed to work
:(

First step: create a new seperate table

    data_table <- manipulated_data %>%
      transmute(
        `Name`,
        `Kingdom`,
        across(c(`Extinct`:`Total`), ~ .x / Total * 100, .names = "{.col} [%]")
        )

Create barplot 1:

manipulated\_data %&gt;% mutate( Unaffected =
sum(across(`LowRisk`:`NearThreatened`)) ) %&gt;% filter ( Total &gt;
1000 ) %&gt;% group\_by(Kingdom) %&gt;% summarise( Extinct =
sum(`Subtotal (EX+EW)`), Affected = sum(`Subtotal (threatened spp.)`),
Unaffected = sum(Unaffected) ) %&gt;% ggplot() + geom\_bar(aes( x =
Kingdom, y = Total, fill = “Extinct”), stat = “identity”, position =
“stack”)

\`\`\`

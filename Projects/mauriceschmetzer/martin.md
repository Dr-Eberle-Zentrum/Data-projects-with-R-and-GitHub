# Data Extraction

    dataPerYear <- list()

    # get list of pdf files in Data subdirectory
    for ( file in list.files("Data/PDF", pattern = "pdf", full.names = T)) {
      # file <- list.files("Data/PDF", pattern = "pdf", full.names = T)[[24]]
      # extract data from PDF
      dataPerYear[[file]] <-
        # parse to table
        pdftools::pdf_text(file) |>
        # join all pages
        str_c(collapse = "\n") |>
        # decompose into text lines
        str_split("\n") |>
        unlist() %>%
          {
            # hack to store column names
            # print(str_subset(., "^Foreign")[[1]])
            dataHeader <<-
              (str_subset(., "^Foreign")[[1]] |>
                 str_replace("(Preference)","Family \\1") |>  # replace first preference col name
                 str_replace_all("(Preference|Immigrants|Relatives|Worker)\\d?\\s","\\1  ") |> # manual fixes
                str_split("\\s{2,}", simplify = T) |>  # split into columns
              str_remove_all("\\d") |>
              unlist())[-1]
            # # handling of immigrant
            # if (length(str_subset(dataHeader,"Special Immigrants"))==0) {
            #   dataHeader[str_detect(dataHeader,"Immigrant")][1] <- "Special Immigrants"
            # }
            # print(dataHeader)
            # hand over to continue pipe
            .
          } %>%
          as_tibble_col(column_name = "line") |>
          filter(line=="" | str_detect(line,"^[a-zA-Z]"), # extract empty lines and data
                 !str_detect(line,"emergency|services"), # handling of 2020
                 !str_detect(line,"^Foreign State"), # drop table header
                 !str_detect(line,"Continued")) |> # drop "continent continued" lines
          mutate( lastLine = lag(line, default = "")) |> # add previous line
          filter( !(str_detect(line, "Total") | str_detect(lastLine, "Total")) ) |> # drop total lines
          mutate( Continent = if_else(str_detect(line, "^\\w[^\\d]+$")
                                      & lastLine == "", line, NA)) |> # preserve continent names
          fill(Continent, .direction = "down") |> # fill continent names
          filter( Continent != line, line != "") |> # drop continent and empty lines
          mutate( # decompose line into state and data
            Country = str_extract(line, "^[a-zA-Z][[:graph:]]*(\\s+[a-zA-Z\\-(][[:graph:]]*)*"),
            data = str_remove(line, "^[a-zA-Z][[:graph:]]*(\\s+[a-zA-Z\\-(][[:graph:])]*)*") |> str_trim() |> str_remove_all(",")
          ) |>
          # join multi-line state names
          mutate( Country = paste(Country, ifelse(lead(data, default = "")=="",lead(Country),"")) |>
                    str_replace_all("\\s+"," ") |>
                    str_trim()) |>
          select(-line, -lastLine) |> # drop line and previous line
          filter(data != "") |>
          # split data into columns
          # View()
          separate(col = data,
                   into = dataHeader,
                     # c("Immediate.Relatives",
                     #        "Special.Immigrants",
                     #        "Family.Preference",
                     #        "Employment.Preference",
                     #        "Diversity.Immigrants",
                     #        "Total"),
                   sep = "\\s+",
                   # fill = "left",
                   convert = T) |>
          pivot_longer(cols = -c(Country,Continent), names_to = "Visa_Type", values_to = "Issued")


    }

    ## Warning: Expected 6 pieces. Missing pieces filled with `NA` in 1 rows [130].

    ## Warning: Expected 6 pieces. Additional pieces discarded in 4 rows [60, 80, 88,
    ## 131].

    ## Warning: Expected 6 pieces. Additional pieces discarded in 2 rows [88, 142].

    ## Warning: Expected 6 pieces. Additional pieces discarded in 3 rows [62, 81, 89].

    ## Warning: Expected 6 pieces. Additional pieces discarded in 2 rows [89, 132].

    ## Warning: Expected 6 pieces. Missing pieces filled with `NA` in 1 rows [131].
    ## Expected 6 pieces. Missing pieces filled with `NA` in 1 rows [131].

## offene Probleme

-   2000-2003 anders formatiert (zahlen bei multi-line country auf
    zweiter statt erster zeile)
-   fussnoten brechen zT country/daten logik bzw. sind am ende der
    daten…
-   teilweise “-” statt 0 (zB Northern Ireland (DV only) 2023)
-   Country names nicht einheitlich

# Data merge and cleaning

    # combine data
    visas <-
      # merge data tables
      dataPerYear |>
      bind_rows(.id = "Fiscal_Year") |>
      mutate( Fiscal_Year = str_extract(Fiscal_Year, "\\d+") |> str_sub(-2,-1)) |>
      mutate( Fiscal_Year = 2000 + as.integer(Fiscal_Year)) |>
      mutate(
        Visa_Type = factor(
          Visa_Type,
          levels = c("Relatives", "Special Immigrants", "Family Preference", "Preference", "Worker", "Immigrants", "Total"),
          labels = c("Immediate Relatives", "Special Immigrants", "Family Preference", "Employment Preference", "Schedule A Worker", "Diversity Immigrants", "Total"),
        )
      )

# Visualization

    CountriesOfInterest <- c("Germany", "China - mainland born","Mexico","India")

    # # check spellings
    # for (country in CountriesOfInterest) {
    #   visas |>
    #     filter( str_detect(Country, str_extract(country,"\\w+"))) |>
    #     distinct(Country) |>
    #     pull(Country) |>
    #     print()
    # }

    visas |>
      mutate(
        # cleanup of china spellings
        Country = if_else(Country %in% c("China−mainland born Hong Kong Special","China−mainland born"),
                          "China - mainland born",
                          Country)
      ) |>
      filter(Country %in% CountriesOfInterest,
             Visa_Type != "Total") |>
      ggplot(aes(x = Fiscal_Year, y = Issued, fill = fct_reorder(Visa_Type,Issued))) +
      geom_bar(stat = "identity") +
      facet_wrap(~Country, ncol=1, scales = "free_y") +
      theme_minimal() +
      # set fill palette to set3
      scale_fill_brewer(palette = "Set3") +
      labs(title = "Visas Issued by Country and Visa Type",
           x = "Fiscal Year",
           y = "Visas Issued",
           fill = "Visa Type")

![](martin_files/figure-markdown_strict/visualization-1.png)
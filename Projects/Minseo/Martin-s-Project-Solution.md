    zip_reading<- "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV"

    zip_data<- list.files(zip_reading, pattern="\\.zip$", full.names=TRUE)

    zip_data

    ## [1] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2024-12-31_2025-01-31_127120425.zip"
    ## [2] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-01-28_2025-02-28_127120425.zip"
    ## [3] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-03-03_2025-03-31_127120425.zip"
    ## [4] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-03-30_2025-04-30_127120425.zip"
    ## [5] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-05-01_2025-05-31_127120425.zip"
    ## [6] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-05-30_2025-06-30_127120425.zip"
    ## [7] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-07-01_2025-07-31_127120425.zip"
    ## [8] "C:/Users/minse/OneDrive/Documents/Data-projects-with-R-and-GitHub/Projects/martin-raden/PV/2025-07-31_2025-08-31_127120425.zip"

    zip_df<- lapply(zip_data,function(zip_path){
      file_name<-unzip(zip_path, list=TRUE)$Name[1]
      read_csv2(unz(zip_path, file_name))
    })

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 32 Columns: 5

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 32 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 29 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 32 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 31 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 32 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 31 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 32 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (2): Datum, PV Ertrag [kWh]
    ## dbl (3): Netzeinspeisung [kWh], Netzbezug [kWh], Speicherung [kWh]
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    pv_data<-bind_rows(zip_df)

    names(pv_data)

    ## [1] "Datum"                 "Netzeinspeisung [kWh]" "Netzbezug [kWh]"      
    ## [4] "Speicherung [kWh]"     "PV Ertrag [kWh]"

    glimpse(pv_data)

    ## Rows: 251
    ## Columns: 5
    ## $ Datum                   <chr> "31.01.2025", "30.01.2025", "29.01.2025", "28.…
    ## $ `Netzeinspeisung [kWh]` <dbl> 6.90, 8.11, 7.85, 2.07, 0.89, 8.80, 7.66, 7.53…
    ## $ `Netzbezug [kWh]`       <dbl> 0.75, 0.88, 0.94, 0.76, 1.12, 0.87, 0.92, 0.73…
    ## $ `Speicherung [kWh]`     <dbl> 4.40, 4.25, 3.46, 4.37, 4.17, 4.65, 2.35, 3.11…
    ## $ `PV Ertrag [kWh]`       <chr> "11,99;", "14,77;", "11,7;", "6,96;", "5,35;",…

    #changing yield to dbl

    pv_data <- pv_data %>% mutate(
        `PV Ertrag [kWh]` = gsub(";", "", `PV Ertrag [kWh]`),   
        `PV Ertrag [kWh]` = gsub(",", ".", `PV Ertrag [kWh]`),
        `PV Ertrag [kWh]` = as.numeric(`PV Ertrag [kWh]`))

    #changing dates to date
    pv_data <- pv_data%>%mutate(Datum=as.Date(Datum, format = "%d.%m.%Y"))

    #missing values
    sum(is.na(pv_data))

    ## [1] 0

    #0 missing values

    #duplicated value
    sum(duplicated(pv_data))

    ## [1] 9

    #only leave the values with higher yield

    pv_data<-pv_data%>% group_by(Datum)%>% slice_max(`PV Ertrag [kWh]`,n=1)%>%ungroup()
    #Okay this doesnt work apparently, because "sum(duplicated(pv_data)) just counts the whole row to be exactly duplicated. 

    #so then, I will have to check it like this

    sum(duplicated(pv_data$Datum))

    ## [1] 9

    pv_data<- pv_data %>% arrange(Datum,desc(`PV Ertrag [kWh]`))%>%
      distinct(Datum, .keep_all=TRUE)

    #only 2025 data
    pv_data <- pv_data%>% filter(format(Datum, "%Y")=="2025")

    #Adding on colums 

    pv_data <- pv_data %>%
      mutate(`Eigenverbrauch [kWh]` = `PV Ertrag [kWh]` - `Netzeinspeisung [kWh]`- `Speicherung [kWh]`,
             `Gesamtverbrauch [kWh]` = `Eigenverbrauch [kWh]` + `Netzbezug [kWh]`,
             `Eigenverbrauchsanteil [%]` = (`Eigenverbrauch [kWh]` / `Gesamtverbrauch [kWh]`)*100) %>%arrange(Datum)

    library(dplyr)

    monthly_data<-pv_data%>%mutate(Monat= factor(format(Datum,"%B"),levels=month.name))%>%

    group_by(Monat)%>%summarise(across(c(`PV Ertrag [kWh]`,`Eigenverbrauch [kWh]` ,`Gesamtverbrauch [kWh]`,`Netzeinspeisung [kWh]`,`Netzbezug [kWh]`),sum))

    monthly_data <- monthly_data %>%
      mutate(
        Stromkosten = `Netzbezug [kWh]` * 0.30,
        Einspeiseverguetung = `Netzeinspeisung [kWh]` * 0.08,
        Einsparung_Eigenverbrauch = `Eigenverbrauch [kWh]` * 0.30,
        Gesamtwirtschaftlichkeit =
          Einsparung_Eigenverbrauch +
          Einspeiseverguetung -
          Stromkosten
      ) %>%
      arrange(Monat) %>%
      mutate(across(where(is.numeric), ~ round(.x, 2)))

    monthly_data_table <- monthly_data %>%
      rename(
        `Stromkosten` = Stromkosten,
        `Einspeiseverguetung`= Einspeiseverguetung,
        `Einsparungen durch Eigenverbrauch` = Einsparung_Eigenverbrauch,
        `Gesamtwirtschaftlichkeit` = Gesamtwirtschaftlichkeit
      )

    # WHY CAN I NOT PUT EURO SIGN??
    # WHY DOESN'T "Ü" WORK??
    knitr::kable(monthly_data_table) 

<table style="width:100%;">
<colgroup>
<col style="width: 4%" />
<col style="width: 8%" />
<col style="width: 10%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 8%" />
<col style="width: 6%" />
<col style="width: 10%" />
<col style="width: 17%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Monat</th>
<th style="text-align: right;">PV Ertrag [kWh]</th>
<th style="text-align: right;">Eigenverbrauch [kWh]</th>
<th style="text-align: right;">Gesamtverbrauch [kWh]</th>
<th style="text-align: right;">Netzeinspeisung [kWh]</th>
<th style="text-align: right;">Netzbezug [kWh]</th>
<th style="text-align: right;">Stromkosten</th>
<th style="text-align: right;">Einspeiseverguetung</th>
<th style="text-align: right;">Einsparungen durch Eigenverbrauch</th>
<th style="text-align: right;">Gesamtwirtschaftlichkeit</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">January</td>
<td style="text-align: right;">313.43</td>
<td style="text-align: right;">33.97</td>
<td style="text-align: right;">61.07</td>
<td style="text-align: right;">160.42</td>
<td style="text-align: right;">27.10</td>
<td style="text-align: right;">8.13</td>
<td style="text-align: right;">12.83</td>
<td style="text-align: right;">10.19</td>
<td style="text-align: right;">14.89</td>
</tr>
<tr>
<td style="text-align: left;">February</td>
<td style="text-align: right;">436.24</td>
<td style="text-align: right;">41.92</td>
<td style="text-align: right;">63.64</td>
<td style="text-align: right;">301.50</td>
<td style="text-align: right;">21.72</td>
<td style="text-align: right;">6.52</td>
<td style="text-align: right;">24.12</td>
<td style="text-align: right;">12.58</td>
<td style="text-align: right;">30.18</td>
</tr>
<tr>
<td style="text-align: left;">March</td>
<td style="text-align: right;">728.74</td>
<td style="text-align: right;">40.43</td>
<td style="text-align: right;">61.06</td>
<td style="text-align: right;">611.56</td>
<td style="text-align: right;">20.63</td>
<td style="text-align: right;">6.19</td>
<td style="text-align: right;">48.92</td>
<td style="text-align: right;">12.13</td>
<td style="text-align: right;">54.86</td>
</tr>
<tr>
<td style="text-align: left;">April</td>
<td style="text-align: right;">1145.89</td>
<td style="text-align: right;">48.96</td>
<td style="text-align: right;">65.89</td>
<td style="text-align: right;">1040.88</td>
<td style="text-align: right;">16.93</td>
<td style="text-align: right;">5.08</td>
<td style="text-align: right;">83.27</td>
<td style="text-align: right;">14.69</td>
<td style="text-align: right;">92.88</td>
</tr>
<tr>
<td style="text-align: left;">May</td>
<td style="text-align: right;">1343.54</td>
<td style="text-align: right;">94.70</td>
<td style="text-align: right;">109.63</td>
<td style="text-align: right;">1206.39</td>
<td style="text-align: right;">14.93</td>
<td style="text-align: right;">4.48</td>
<td style="text-align: right;">96.51</td>
<td style="text-align: right;">28.41</td>
<td style="text-align: right;">120.44</td>
</tr>
<tr>
<td style="text-align: left;">June</td>
<td style="text-align: right;">1500.56</td>
<td style="text-align: right;">99.88</td>
<td style="text-align: right;">112.46</td>
<td style="text-align: right;">1366.43</td>
<td style="text-align: right;">12.58</td>
<td style="text-align: right;">3.77</td>
<td style="text-align: right;">109.31</td>
<td style="text-align: right;">29.96</td>
<td style="text-align: right;">135.50</td>
</tr>
<tr>
<td style="text-align: left;">July</td>
<td style="text-align: right;">1186.49</td>
<td style="text-align: right;">102.94</td>
<td style="text-align: right;">118.76</td>
<td style="text-align: right;">1020.63</td>
<td style="text-align: right;">15.82</td>
<td style="text-align: right;">4.75</td>
<td style="text-align: right;">81.65</td>
<td style="text-align: right;">30.88</td>
<td style="text-align: right;">107.79</td>
</tr>
<tr>
<td style="text-align: left;">August</td>
<td style="text-align: right;">1154.59</td>
<td style="text-align: right;">49.48</td>
<td style="text-align: right;">66.55</td>
<td style="text-align: right;">1042.92</td>
<td style="text-align: right;">17.07</td>
<td style="text-align: right;">5.12</td>
<td style="text-align: right;">83.43</td>
<td style="text-align: right;">14.84</td>
<td style="text-align: right;">93.16</td>
</tr>
</tbody>
</table>

    plot_data <- monthly_data %>%
      select(Monat, Stromkosten,Einspeiseverguetung,Einsparung_Eigenverbrauch
      ) %>%
      mutate(
        Stromkosten = -Stromkosten
      ) %>%
      rename(Stromkosten=Stromkosten, Einspeiseverguetung=Einspeiseverguetung,
             `Einsparung(Eigenverbrauch)`=Einsparung_Eigenverbrauch)%>%
      pivot_longer(
        cols = c(Stromkosten, Einspeiseverguetung, `Einsparung(Eigenverbrauch)`),
        names_to = "Category",
        values_to = "Euro"
      )

    ggplot() +
      geom_col(
        data = plot_data,
        aes(x = Monat, y = Euro, fill = Category),
        position = "stack") +
      geom_line(
        data = monthly_data,
        aes(x = Monat, y = Gesamtwirtschaftlichkeit, group = 1, color="GesamtwirtschaftlichkeitP"),linewidth = 1) +
      geom_point(
        data = monthly_data,
        aes(x = Monat, y = Gesamtwirtschaftlichkeit,color="Gesamtwirtschaftlichkeit"),size = 2) +
      labs(
        x = NULL,
        y = "Euro",
        fill = NULL,color=NULL
      ) +
      scale_color_manual(values=c("Gesamtwirtschaftlichkeit"="purple"))+
      theme_minimal()

![](Martin-s-Project-Solution_files/figure-markdown_strict/ggplot%20graph-1.png)

    # WHY ARE THE MONTHS SHOWN IN ENGLISH? HOW DO I CHANGE TO GERMAN?

    annual_data <- pv_data %>%
      summarise(
        `Amortisierung` =
          sum(`Eigenverbrauch [kWh]`) * 0.30 +
          sum(`Netzeinspeisung [kWh]`) * 0.08,
        
        `Durchschnittlicher Netzbezug [kWh]` =
          mean(`Netzbezug [kWh]`),
        
        `Tage mit vollem Speicher [%]` =
          sum(`Speicherung [kWh]` < 0.5) / n() * 100,
        
        `Tage mit ueberdurchschnittlichem Netzbezug [%]` =
          sum(`Netzbezug [kWh]` >
                (mean(`Netzbezug [kWh]`) + sd(`Netzbezug [kWh]`))) / n() * 100
      ) %>%
      mutate(across(where(is.numeric), ~ round(.x, 2)))

    knitr::kable(annual_data)

<table>
<colgroup>
<col style="width: 11%" />
<col style="width: 28%" />
<col style="width: 23%" />
<col style="width: 37%" />
</colgroup>
<thead>
<tr>
<th style="text-align: right;">Amortisierung</th>
<th style="text-align: right;">Durchschnittlicher Netzbezug [kWh]</th>
<th style="text-align: right;">Tage mit vollem Speicher [%]</th>
<th style="text-align: right;">Tage mit ueberdurchschnittlichem
Netzbezug [%]</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: right;">693.74</td>
<td style="text-align: right;">0.61</td>
<td style="text-align: right;">7.05</td>
<td style="text-align: right;">17.84</td>
</tr>
</tbody>
</table>

    pie_data <- tibble(
      Category = c(
        "Einsparung",
        "Einspeiseverguetung",
        "Restkosten"
      ),
      Price= c(
        sum(pv_data$`Eigenverbrauch [kWh]`) * 0.30,
        sum(pv_data$`Netzeinspeisung [kWh]`) * 0.08,
        12000 - (
          sum(pv_data$`Eigenverbrauch [kWh]`) * 0.30 +
          sum(pv_data$`Netzeinspeisung [kWh]`) * 0.08
        )
      )
    )

    pie_data <- pie_data %>%
      mutate(
        Label = paste0(Category, " = ", round(Price, 2), " €")
      )

    ggplot(pie_data, aes(x = "", y = Price, fill = Label)) +
      geom_col(width = 1, color = "white") +
      coord_polar(theta = "y") +
      labs(fill = NULL) +
      theme_void()

![](Martin-s-Project-Solution_files/figure-markdown_strict/pie%20chart-1.png)

    #CAN I NOT SHOW THE PRICE ON THE CHART? IT'S KEEP ON OVERLAPPING

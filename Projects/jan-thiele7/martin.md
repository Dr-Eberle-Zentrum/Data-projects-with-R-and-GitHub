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
    ## 
    ## Attache Paket: 'scales'
    ## 
    ## 
    ## Das folgende Objekt ist maskiert 'package:purrr':
    ## 
    ##     discard
    ## 
    ## 
    ## Das folgende Objekt ist maskiert 'package:readr':
    ## 
    ##     col_factor

Hiermit kann man direkt aus dem gezippten Komplettdatenfile die Infos
holen, wozu man aber erst die 900 MB downloaden muss.

    # läuft ca 45s
    groupCounts <-
      read_tsv("en.openfoodfacts.org.products.csv.gz"
             , col_select = c("nutriscore_grade"
                            , "ecoscore_grade"
                            , "pnns_groups_1"
                            , "pnns_groups_2"
                            , "countries"
                            )
             , na = c("NA","unknown","", "not-applicable")
             ) |>
      filter( countries == "Germany") |>
      select( - countries ) |>
      drop_na() |>
      group_by(nutriscore_grade, ecoscore_grade, pnns_groups_1, pnns_groups_2) |>
      summarize( n = n() )

Daher holen wir die Daten aus dem CSV-File, das nur 10 MB gross ist.

    groupCounts <-
      read_csv("data_openfood.csv"
             , col_select = c("nutriscore_grade"
                              , "ecoscore_grade"
                              , "pnns_groups_1"
                              , "pnns_groups_2"
             )
             , na = c("NA","unknown","", "not-applicable")
      ) |>
      drop_na() |>
      group_by(nutriscore_grade, ecoscore_grade, pnns_groups_1, pnns_groups_2) |>
      summarize( n = n() )

    ## New names:
    ## Rows: 167776 Columns: 4
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (4): nutriscore_grade, ecoscore_grade, pnns_groups_1, pnns_groups_2
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## `summarise()` has grouped output by 'nutriscore_grade', 'ecoscore_grade',
    ## 'pnns_groups_1'. You can override using the `.groups` argument.
    ## • `` -> `...1`

Farben für die Scores definieren.

    scoreColors <- c("1" = "#009F00", "2" = "#00FF00", "3" = "#FFFF00", "4" = "#FFA500", "5" = "#FF0000")

Und Plot erstellen.

    groupCounts |>

      # convert grades to numeric for mean and sd computation
      rowwise() |>
      mutate(
        # ascii to alphabet position
        nutriscore = utf8ToInt(str_to_lower(nutriscore_grade))-96,
        ecoscore = utf8ToInt(str_to_lower(ecoscore_grade))-96,
      ) |>
      ungroup() |>
      select(-ends_with("grade")) |>

      # compute mean and sd for each group
      # group_by(pnns_groups_1, pnns_groups_2) |>
      group_by(pnns_groups_1) |>
      dplyr::summarize(
        nutriscore_mean = weighted.mean(nutriscore, n),
        nutriscore_sd = Hmisc::wtd.var(nutriscore,n),
        ecoscore_mean = weighted.mean(ecoscore,n),
        ecoscore_sd = Hmisc::wtd.var(ecoscore,n),
        .groups = "drop"
      ) |>
      ungroup() |>

      # compute difference between nutriscore and ecoscore for visualization
      mutate(
        sd_diff = abs(nutriscore_sd - ecoscore_sd)
        , eco_cat = round(ecoscore_mean, digits = 0) |> as_factor()
        , nutri_cat = round(nutriscore_mean, digits = 0) |> as_factor()
        ) |>

      #### plotting ###
      ggplot(aes(x=ecoscore_mean, y=nutriscore_mean)) +
      theme_minimal() +

      # legend points
      geom_point(
        data = tibble( ecoscore_mean = 1, nutriscore_mean = 1:5 ),
        col=scoreColors, size=4, shape="\U25D6"
      )+
      geom_point(
        data = tibble( ecoscore_mean = 1:5, nutriscore_mean = 1 ),
        col=scoreColors, size=4, shape="\u25D7"
      )+

      # spheres of standard deviation
      # geom_ellipse(aes(x0=ecoscore_mean, y0=nutriscore_mean, a=ecoscore_sd, b=nutriscore_sd, angle=0), col="lightgray") +
      geom_errorbar(aes(ymin=nutriscore_mean-(nutriscore_sd), ymax=nutriscore_mean+(nutriscore_sd)), width=0.03, col="lightgray") +
      geom_errorbarh(aes(xmin=ecoscore_mean-(ecoscore_sd), xmax=ecoscore_mean+(ecoscore_sd)), height=0.03, col="lightgray") +

      # data points at mean centers
      geom_point(aes(col = nutri_cat), size=4, shape="\u25D6") + # left half circle
      geom_point(aes(col = eco_cat), size=4, shape="\U25D7", ) + # right half circle
      # geom_point(aes(size=sd_diff, col = nutri_cat), shape="\u25D6") + # left half circle
      # geom_point(aes(size=sd_diff, col = eco_cat), shape="\U25D7", ) + # right half circle

      # data labels
      geom_text_repel(aes(label=pnns_groups_1), size=3, max.overlaps = 30) +
      # geom_text_repel(aes(label=pnns_groups_2), size=3, max.overlaps = 30) +

      labs(title="Nutriscore vs Ecoscore by food group", x="Ecoscore", y="Nutriscore") +
      # set x and y labels to integers
      scale_x_continuous(breaks = 1:5,labels = c("A","B","C","D","E")) +
      scale_y_continuous(breaks = 1:5,labels = c("A","B","C","D","E")) +
      # use nutri-score color for fill color
      scale_color_manual(values = scoreColors) +
      # disable grid lines beside all ticks
      theme(panel.grid.minor = element_blank()
            , panel.grid.major = element_blank()
            ) +
      guides(size="none", col="none")

![](martin_files/figure-markdown_strict/plot-1.png)

    ggsave("nutri-eco-score.martin.png", width=10, height=9, dpi=300)

<figure>
<img src="nutri-eco-score.martin.png"
alt="Nutriscore vs Ecoscore by food group" />
<figcaption aria-hidden="true">Nutriscore vs Ecoscore by food
group</figcaption>
</figure>
# My Solution for the Volleyball Issue

------------------------------------------------------------------------

## Import the data Part:

------------------------------------------------------------------------

Cous I’m damn lazy, even to write the import path twice, i first created
a function to search for the files in the working direction and return
the paths’s of the folder’s.

------------------------------------------------------------------------

    folders <- list.files(getwd(), full.names = TRUE) %>%
      .[!grepl("\\.", .)]

------------------------------------------------------------------------

To import all the files i recycled my `auto_import_csv`-function from
the last Project.

------------------------------------------------------------------------

    auto_import <- function(file_path, datatyp, suffix = ""){
      
      file_list <- list.files(path = file_path, pattern = paste("\\.", datatyp, "$", sep = ""), full.names = TRUE) 
      
      #-> here we could change the auto import to other data type's  -> put that part in a seperate variable inside the function
      
      data_frames <- list()
      
      for (file in file_list) {
        df_name <- tools::file_path_sans_ext(basename(file))  # uses filename as dataframe
        
        read_call <- paste0("read_", datatyp, suffix, sep = "")
        # need to paste the "2" here to read (german) encodeing <- solved it with suffix
        
        data_frames[[df_name]] <- do.call(read_call, list(file, locale = locale(encoding = "cp852")))
      }
      
      return(data_frames)
    }

------------------------------------------------------------------------

Now we can simply import all the dat’S from a folder into a list by
calling the path from the `folder`-path list and requiered datatyp.

    suppressMessages({
      all_rosters <- auto_import(folders[4], datatyp="csv", "2")
    })

------------------------------------------------------------------------

------------------------------------------------------------------------

## Adjust the data Part:

------------------------------------------------------------------------

In the data there been quiet some mistakes to correct.

Therefor I created some **adjust\_map’s** with Regular Expressions.

------------------------------------------------------------------------

    {
    adjust_map_position <- c("^[zZ].*|^[sS]e.*" = "setter",
                    "^[mM].*" = "middle blocker",
                    "^[aA]u.*|^[oO]u.*" = "outside hitter",
                    "^[dD].*|^[oO]p.*" = "opposite hitter",
                    "^[uU].*|^[lL].*" = "libero",
                    "^[tT]r.*|^[cC]h.*|.*[hH]ead.*" = "head coach")

    adjust_map_country <- c("^[dD].*|^[gG].*" = "Deutschland",
                            "wenia$" = "venia",
                            "lie$" = "lia")

    # could shorten it with ".*ie$" ->".*ia$" (eng. Australia) prob. str_detect than...
    # -> just delete the ".*" in front and its solved

    adjust_map_name <- c("B\\÷|B\\?" = "Bö",
                       "Bj\\?|Bj\\÷" = "Bjö",
                       "R\\?|R\\÷" = "Rö",
                       "Úe$" = "ée",
                       "ßn$" = "án",
                       "ńf$" = "äf",
                       "┴n" = "Án",
                       "'.*'" = "",
                       "^\\?" = "Š",
                       "\\?o" = "šo",
                       "\\?iga" = " Žiga",
                       "Djifa$" = "Djifa Julien",
                       ", Francisco$" = ", Francisco Javier",
                       ", Miguel$" = ", Miguel Angel")
    }

------------------------------------------------------------------------

The `Nationality` columns contains two different languages, but the
`countrycode`-package can only handle one at the time, so there’s a
function to shorten the call.

------------------------------------------------------------------------

    country_code <- function(df, language){
      df$Nationality <- countrycode(df$Nationality, origin = paste("country.name", language, sep = "."), destination = "ioc", nomatch=NULL)
      return(df)
    }

------------------------------------------------------------------------

Now let’s apply all the predefined stuff on the data.

    {
    all_rosters_clean <- lapply(all_rosters, function(df) {
      suppressWarnings({
        df %>%
          rename("Name"="Last Name First Name")%>%
          mutate(Gender = ifelse(str_detect(Gender, "^[fF]|2"), "female", "male"),
                 Position = str_replace_all(Position, adjust_map_position),
                 Nationality = str_replace_all(Nationality, adjust_map_country),
                 Name = str_replace_all(Name, adjust_map_name))%>%
          filter(Position %in% adjust_map_position)%>%
          mutate(Height = as.numeric(Height)/100)%>%
          country_code(language ="de")%>%
          country_code(language ="en")%>%
          select(-(1:3))
        })
      })

    all_rosters_clean2 <- all_rosters_clean%>%
       bind_rows(.id = "Team")%>%
      mutate(Team = gsub("^roster_", "", Team))
    }

*Note: I used a second variable to apply the* `bind_row()` *-function,
becouse i wasn’t sure at that time, if i need the data later in a
seperated order*

------------------------------------------------------------------------

To import and clean the `topscorer`files with the import function, i
first had to mutate the `.txt`into `.tsv`format.

------------------------------------------------------------------------

    txt_files <- list.files(path = folder_path_topscorers, pattern = "\\.txt$", full.names = TRUE)

    for (file in txt_files) {
      tsv_file <- sub("\\.txt$", ".tsv", file)
      file.copy(file, tsv_file)
    }

*Note: Erese the eval = FALSE part if you first using the code*

------------------------------------------------------------------------

    suppressMessages({
      all_topscorer <- auto_import(folders[5], datatyp="tsv")
    })

Now clean the data with the`adjust_map`, and mutate the
`errors_per_set`-column.

------------------------------------------------------------------------

    {
    all_topscorer_clean <- lapply(all_topscorer, function(df) {
        df %>%
        setNames(gsub(" ", "_", colnames(.)))%>%
        # instead of rename, replaces all "spaces" with "_",colnames(.)to backreference to df in functions
        mutate(Position = str_replace_all(Position, adjust_map_position),
               Name = str_replace_all(Name, adjust_map_name),
               errors_per_set = (Errors_overall / Sets_played)) 
    })
    all_topscorer_clean[[2]] <- all_topscorer_clean[[2]] %>%
      # couldn't find out how to do in lapply-fct, due to not all df got "team" column "yet"
      mutate(Team = gsub("Ř", "ü", Team))

    all_topscorer_clean2 <- all_topscorer_clean %>%
      bind_rows()%>%
      select(-c("Team", "Country", "Position"))%>% 
      # otherwise we would had an "many to many" issues in the join-function
      mutate(Points_per_Set = as.numeric(gsub(",", ".",Points_per_Set)))
    }

------------------------------------------------------------------------

Same for the `games`files

    suppressMessages({
      all_games <- auto_import(folders[2], datatyp="csv", "2")
    })

    all_games_clean <- lapply(all_games, function(df) {
        df %>%
        setNames(gsub(" ", "", gsub("-", "_", colnames(.)))) %>%
      mutate(Mannschaft1 = gsub("Ř", "ü", Mannschaft1),
             Mannschaft2 = gsub("Ř", "ü", Mannschaft2),
             Gastgeber = gsub("Ř", "ü", Gastgeber),
             Austragungsort = gsub("Ř", "ü", Austragungsort),
             Geschlecht = ifelse(str_detect(Geschlecht, "^[fF]|2"), "female", "male"))
    })%>%
      bind_rows()

------------------------------------------------------------------------

## Mutating the variables Part:

------------------------------------------------------------------------

To mutate all the requiered values in the graph for all the teams at
once, i created a list of **all teams**

    all_teams <- unique(all_games_clean$Mannschaft1)

------------------------------------------------------------------------

    mutate_team_var1 <- function(team, df) {
      
      # Result Variables:
      
      total_games <- df %>%
        filter(Mannschaft1 == team | Mannschaft2 == team) %>%
        nrow()
      
      num_victory <- df%>%
        filter((Mannschaft1 == team & Satzpunkte1 == 3) | (Mannschaft2 == team & Satzpunkte2 == 3))%>%
        nrow()
      
      num_losses <-  df%>%
        filter((Mannschaft1 == team & Satzpunkte1 != 3) | (Mannschaft2 == team & Satzpunkte2 != 3))%>%
        nrow()
      
      sets_per_wingame <- df %>%
        filter(Mannschaft1 == team | Mannschaft2 == team) %>%
        summarise(
          #Sum_Satzpunkte = round(sum(Satzpunkte1 + Satzpunkte2), 2), # not sure if we need that one
          "Avg_Satzpunkte" = round(mean(Satzpunkte1 + Satzpunkte2), 2))
      
      avg_point_per_set <- df %>%  
        
        # why is it only working with backticks? -> cous i had an special letter in "-" gsub'ed it out, could remove backticks now
      filter(Mannschaft1 == team | Mannschaft2 == team) %>%
        summarise(
          "Avg_Ballpunkte_first_set" = round(mean(ifelse(Mannschaft1 == team, `Satz1_Ballpunkte1`, `Satz1_Ballpunkte2`)), 2),
          #Avg_Ballpunkte_sec_set = round(mean(ifelse(Mannschaft1 == team, `Satz2_Ballpunkte1`, `Satz2_Ballpunkte2`)), 2),
          #Avg_Ballpunkte_third_set = round(mean(ifelse(Mannschaft1 == team, `Satz3_Ballpunkte1`, `Satz3_Ballpunkte2`)), 2),
          #Avg_Ballpunkte_fourth_set = round(mean(ifelse(Mannschaft1 == team, `Satz4_Ballpunkte1`, `Satz4_Ballpunkte2`), na.rm=TRUE), 2),
          #Avg_Ballpunkte_fifth_set = round(mean(ifelse(Mannschaft1 == team, `Satz5_Ballpunkte1`, `Satz5_Ballpunkte2`), na.rm=TRUE), 2))
        ) # remove if take all
      
      
      max_ballpoint_ever <- max(ifelse(df$Mannschaft1 == team, df$Satz1_Ballpunkte1, df$Satz1_Ballpunkte2))
      
      min_ballpoint_ever <- min(ifelse(df$Mannschaft1 == team, df$Satz1_Ballpunkte1, df$Satz1_Ballpunkte2))
        
    # don't know how to proper look for the max-value of all satz X, or condition (|), pmax(), max (..1,..2,..) don'T work
    # could do an max and min for each set and do an max again on it but....
      
      
      
      # Stadium Variables:
      
      home_games <- df %>%
        filter(Mannschaft1 == team) %>%
        nrow()
      
      away_games <- df %>%
        filter(Mannschaft2 == team) %>%
        nrow()
      
      
      avg_ballpoint_home <- df %>%
      filter(Mannschaft1 == team) %>%
      mutate(Ballpunkte = str_extract(Ballpunkte, "\\d+")) %>%
      summarise(avg_ballpoint_home = round(mean(as.numeric(Ballpunkte)),2))
      
      avg_ballpoint_away <- df %>%
      filter(Mannschaft2 == team) %>%
      mutate(Ballpunkte = str_extract(Ballpunkte, "(?<=:)(\\d+)")) %>%
      summarise(avg_ballpoint_away = round(mean(as.numeric(Ballpunkte)),2))
      
      avg_attendance_home <- df %>%
      filter(Mannschaft1 == team) %>%
      summarise(avg_attendance_home = round(mean(as.numeric(Zuschauerzahl))))
      
      return(c(Team = team, Home = home_games, Away = away_games, Total = total_games,
               Victories = num_victory, Losses = num_losses,
               avg_sets = sets_per_wingame$Avg_Satzpunkte, avg_point_per_1set = avg_point_per_set$Avg_Ballpunkte_first_set,
               max_point = max_ballpoint_ever, min_point = min_ballpoint_ever,
               avg_ballpoint_home, avg_ballpoint_away, avg_attendance_home))
    }

    {
    all_var1_list <- t(mapply(mutate_team_var1, team = all_teams, df = rep(list(all_games_clean), length(all_teams))))
    #t() transponiert output Struktur ( für alle teams,home,etc. in einer Spalte)
    all_var1 <- as_tibble(all_var1_list) %>%
      mutate(Team = as.character(Team),
             across(-Team, as.numeric))
    all_var1 <- all_var1 %>%
      mutate(Team = as.factor(Team),
             Team = gsub(" ", "_", Team))
    }
    all_var1

    ## # A tibble: 9 × 13
    ##   Team   Home  Away Total Victories Losses avg_sets avg_point_per_1set max_point
    ##   <chr> <dbl> <dbl> <dbl>     <dbl>  <dbl>    <dbl>              <dbl>     <dbl>
    ## 1 SVG_…    14    14    28        17     11     3.75               23.5        33
    ## 2 BERL…    16    14    30        26      4     3.5                24.5        31
    ## 3 SWD_…    13    14    27        15     12     3.81               23.3        33
    ## 4 VfB_…    16    16    32        21     11     3.84               23.8        33
    ## 5 Heli…    12    14    26        15     11     3.73               24.1        33
    ## 6 Ener…    12    13    25         7     18     3.76               21.7        33
    ## 7 TSV_…    12    13    25         4     21     3.36               19.7        33
    ## 8 WWK_…    12    13    25        14     11     3.64               22.7        33
    ## 9 VCO_…    12     8    20         0     20     3.1                17.7        33
    ## # ℹ 4 more variables: min_point <dbl>, avg_ballpoint_home <dbl>,
    ## #   avg_ballpoint_away <dbl>, avg_attendance_home <dbl>

------------------------------------------------------------------------

For further variable mutating, i need to join the `topscore`file with
the `roster` file first.

    suppressWarnings({
      joined_topscore_roster <- right_join(all_topscorer_clean2,all_rosters_clean2, "Name")
    })

------------------------------------------------------------------------

    suppressMessages({
      
      # Attacking & Topscorer Variables:
    calculate_avg_var <- function(data, value_column) {
      result <- data %>%
        group_by(Team, Position) %>%
        summarise(avg_value = round(mean({{value_column}}, na.rm = TRUE), 1)) %>%
        ungroup() %>%
        filter(!is.na(avg_value))
      
      return(result)
    }

    attack_var2 <- calculate_avg_var(joined_topscore_roster, Points_per_Set)%>%
      rename("avg_point_per_set" = avg_value)
    topscore_var2 <- calculate_avg_var(joined_topscore_roster, Points_overall)%>%
      rename("avg_topscore" = avg_value)

    error_var <- joined_topscore_roster %>%
      group_by(Team, Position) %>%
        filter(!is.na(errors_per_set))%>%
      summarise(max_errors = round(max(errors_per_set),2)) %>%
      ungroup()

    all_var2 <- attack_var2%>%
      mutate("avg_topscore" = topscore_var2$avg_topscore,
             "max_errors" = error_var$max_errors,
             "Team" = as_factor(Team),
             "Position" = as_factor(Position))

    merged_var <- all_var1 %>%
      inner_join(all_var2, by = c("Team" = "Team"))
    })

**Finally we got all requested variables in one table**

------------------------------------------------------------------------

## Plotting the Graph Part:

------------------------------------------------------------------------

First get them into a long-format:

    tidy_var <- pivot_longer(merged_var, cols = -c(Team, Position), names_to = "Kennzahl", values_to = "Wert")%>%
      mutate("Kennzahl" = as.factor(Kennzahl))
    tidy_var

    ## # A tibble: 585 × 4
    ##    Team         Position Kennzahl            Wert
    ##    <chr>        <fct>    <fct>              <dbl>
    ##  1 SVG_Lüneburg libero   Home               14   
    ##  2 SVG_Lüneburg libero   Away               14   
    ##  3 SVG_Lüneburg libero   Total              28   
    ##  4 SVG_Lüneburg libero   Victories          17   
    ##  5 SVG_Lüneburg libero   Losses             11   
    ##  6 SVG_Lüneburg libero   avg_sets            3.75
    ##  7 SVG_Lüneburg libero   avg_point_per_1set 23.5 
    ##  8 SVG_Lüneburg libero   max_point          33   
    ##  9 SVG_Lüneburg libero   min_point          12   
    ## 10 SVG_Lüneburg libero   avg_ballpoint_home 91.6 
    ## # ℹ 575 more rows

    tidy_var %>%
      ggplot(aes(x = Kennzahl, y = Wert, fill = Kennzahl)) +
      geom_bar(stat = "identity") +
      ylim(-50, 75) +
      theme_minimal() +
      theme(axis.text = element_blank(),
            axis.title = element_blank(),
            panel.grid = element_blank()
            , text = element_text(color = "grey") #  in the png background is dark
            ) +
      coord_polar(start = 0) +
      facet_wrap(~ Team) +
      ggtitle("Team wise Ploted")

    ## Warning: Removed 104 rows containing missing values (`position_stack()`).

    ## Warning: Removed 97 rows containing missing values (`geom_bar()`).

![](My_Solution_for_Laura_files/figure-markdown_strict/plot_all-1.png)

    ggsave("All_team_plot.png", plot = last_plot(), width = 20, height = 20, units = "cm")

    ## Warning: Removed 104 rows containing missing values (`position_stack()`).
    ## Removed 97 rows containing missing values (`geom_bar()`).

![](All_team_plot.png)

So far working proper, of course there still lot of adjustments to do.
The avg & max point/error per *Position* still not working.

But i think its okay for now.

------------------------------------------------------------------------

    tidy_team <- tidy_var %>%
      filter(Team == "BERLIN_RECYCLING_Volleys")

    plot_try2 <- ggplot(tidy_team, aes(x = Kennzahl, y = Wert, fill = Kennzahl)) +
      geom_bar(stat = "identity") +
      ylim(-50, 75) +
      theme_minimal() +
      theme(axis.text = element_blank(),
            axis.title = element_blank(),
            panel.grid = element_blank()) +
      coord_polar(start = 0) +
      ggtitle("BERLIN RECYCLING Volleys")


    print(plot_try2)

    ## Warning: Removed 13 rows containing missing values (`position_stack()`).

    ## Warning: Removed 9 rows containing missing values (`geom_bar()`).

![](My_Solution_for_Laura_files/figure-markdown_strict/only_plot_one-1.png)

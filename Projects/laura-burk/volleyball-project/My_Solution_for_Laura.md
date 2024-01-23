------------------------------------------------------------------------

OKay let’s start with the roster files.

------------------------------------------------------------------------

------------------------------------------------------------------------

But we could also start with creating all folder path’s in once aswell.

------------------------------------------------------------------------

    folders <- list.files(getwd(), full.names = TRUE) %>%
      .[!grepl("\\.", .)]

    #folders

------------------------------------------------------------------------

To import the `csv-dats` let’s recycle the `auto_import_csv`-function
from my other Project Solution. (Had to modify it a bit so we can use it
for all datatyp’s more easily) -&gt; got no glue why bus this not
working for `.tsv`files and read\_tsv solved it by apply an
`suffix`variable

------------------------------------------------------------------------

    auto_import <- function(file_path, datatyp, suffix = ""){
      
      file_list <- list.files(path = file_path, pattern = paste("\\.", datatyp, "$", sep = ""), full.names = TRUE)        #-> here we could change the auto import to other data type's  -> put that part in a seperate variable inside the function
      data_frames <- list()
      
      for (file in file_list) {
        df_name <- tools::file_path_sans_ext(basename(file))  # uses filename as dataframe
        
        read_call <- paste0("read_", datatyp, suffix, sep = "") # need to paste the "2" here to read (german) encodeing <- solved it with suffix
        
        data_frames[[df_name]] <- do.call(read_call, list(file, locale = locale(encoding = "cp852")))
      }
      
      return(data_frames)
    }

------------------------------------------------------------------------

    suppressMessages({
      all_rosters <- auto_import(folders[4], datatyp="csv", "2")
    })

    #str(all_rosters, list.len = 2)

------------------------------------------------------------------------

Alright, now let’s start to clean the data.

To do so, let’s have a closer look what’s the unique values and find
some Regex for.

Therefor i wrote a `get_unique_values` function to take a closer look at
all the unique values.

------------------------------------------------------------------------

    get_unique_values <- function(data, column){
      unique_values <- unique(unlist(lapply(data, function(df) df[[column]])))
      return(unique_values)
    }

------------------------------------------------------------------------

Now we can easily look into the column’s values

------------------------------------------------------------------------

    #get_unique_values(all_rosters, "Gender")
    #get_unique_values(all_rosters, "Position")
    #get_unique_values(all_rosters, "Nationality")

------------------------------------------------------------------------

Quiet some mistakes to correct, let’s create some `adjust_map's` for the
Regex

To use the `countrycode`package proper we also should do some pre
mutating for `Nationality`.

------------------------------------------------------------------------

    adjust_map_position <- c("^[zZ].*|^[sS]e.*" = "setter",
                    "^[mM].*" = "middle blocker",
                    "^[aA]u.*|^[oO]u.*" = "outside hitter",
                    "^[dD].*|^[oO]p.*" = "opposite hitter",
                    "^[uU].*|^[lL].*" = "libero",
                    "^[tT]r.*|^[cC]h.*|.*[hH]ead.*" = "head coach")

    adjust_map_country <- c("^[dD].*|^[gG].*"= "Deutschland",
                            ".*wenia$"= "Slovenia",
                            ".*lie$"="Australien") # could shorten it with ".*ie$" ->".*ia$" (eng. Australia) prob. str_detect than

------------------------------------------------------------------------

Due to `Nationality` contains two different languages, we need a
function to do it (at once).

------------------------------------------------------------------------

    country_code <- function(df, language){
      df$Nationality <- countrycode(df$Nationality, origin = paste("country.name", language, sep = "."), destination = "ioc", nomatch=NULL)
      return(df)
    }

------------------------------------------------------------------------

    all_rosters_clean <- lapply(all_rosters, function(df) {
      suppressWarnings({
        df %>%
        mutate(Gender = ifelse(str_detect(Gender, "^[fF]|2"), "female", "male"),
               Position = str_replace_all(Position, adjust_map_position),
               Nationality = str_replace_all(Nationality, adjust_map_country))%>%
        filter(Position %in% adjust_map_position)%>%
        mutate(Height = as.numeric(Height)/100)%>%
        country_code(language ="de")%>%
        country_code(language ="en")%>%
        select(-(1:3))%>%
        rename("Name"="Last Name First Name")
      })
    })

    all_rosters_clean2 <- all_rosters_clean%>%
       bind_rows(.id = "Team")%>%
      mutate(Team = gsub("^roster_", "", Team))
      
    #all_rosters_clean2
    #str(all_rosters_clean, list.len = 3)

*Note: Probably could done it already in the import part (bind all
rosters into one table), but wasn’t sure if i wont need it separated
later*

------------------------------------------------------------------------

Alright this Part is done, lets go for the `topscorer's`files

For simply import them by the `auto_import` function we first have to
mutate the `.txt`into `.tsv`format. (Due to the logic of the function)

------------------------------------------------------------------------

    txt_files <- list.files(path = folder_path_topscorers, pattern = "\\.txt$", full.names = TRUE)

    for (file in txt_files) {
      tsv_file <- sub("\\.txt$", ".tsv", file)
      file.copy(file, tsv_file)
    }

#### Remind:

**Note: Erease the eval = FALSE part if you first using the code**

------------------------------------------------------------------------

Now we can simply apply the `auto_import`function.

------------------------------------------------------------------------

    all_topscorer <- auto_import(folders[5], datatyp="tsv")

    ## Rows: 50 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (3): Name, Position, Points per Set
    ## dbl (6): Rank, Points overall, Errors overall, Sets played, Games played, To...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## Rows: 40 Columns: 11
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (4): Name, Position, Team, Points per Set
    ## dbl (6): Rank, Points overall, Errors overall, Sets played, Games played, To...
    ## lgl (1): Country
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## Rows: 70 Columns: 11
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (4): Name, Position, Team, Points per Set
    ## dbl (6): Rank, Points overall, Errors overall, Sets played, Games played, To...
    ## lgl (1): Country
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## Rows: 100 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "\t"
    ## chr (3): Name, Position, Points per Set
    ## dbl (6): Rank, Points overall, Errors overall, Sets played, Games played, To...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    #str(all_topscores, list.len = 2)

------------------------------------------------------------------------

Let’s check for misstakes with our previous `get_unique_values`function.

------------------------------------------------------------------------

------------------------------------------------------------------------

As we can see there’s some `NA`-values, but these shouldn’t border us
right now.

------------------------------------------------------------------------

Now let’s clean the Position column with our `adjust_map`, adjust column
names and mutate the `errors_per_set`-column.

------------------------------------------------------------------------

    all_topscorer_clean <- lapply(all_topscorer, function(df) {
        df %>%
        setNames(gsub(" ", "_", colnames(.)))%>% # instead of rename, replaces all "spaces" with "_",colnames(.)to backreference to df in functions
        mutate(Position = str_replace_all(Position, adjust_map_position),
               errors_per_set = (Errors_overall / Sets_played)) 
    })
    all_topscorer_clean[[2]] <- all_topscorer_clean[[2]] %>% # couldn't find out how to do in lapply-fct, due to not all df got "team" column "yet"
      mutate(Team = gsub("Ř", "ü", Team))

    all_topscorer_clean2 <- all_topscorer_clean %>%
      bind_rows()%>%
      select(-c("Team", "Country", "Position"))%>% # otherwise we would had an "many to many" issues in the join-function
      mutate(Points_per_Set = as.numeric(gsub(",", ".",Points_per_Set)))
    all_topscorer_clean2

    ## # A tibble: 260 × 9
    ##     Rank Name           Points_overall Errors_overall Points_per_Set Sets_played
    ##    <dbl> <chr>                   <dbl>          <dbl>          <dbl>       <dbl>
    ##  1    34 Amedegnato, D…              6             11            0.5          11
    ##  2    31 Barsemian, Ra…              9             13            1             9
    ##  3    21 Baumann, Felix             39             39            3            13
    ##  4    15 Baxpöhler, No…             35             32            1.8          20
    ##  5    10 Borris, Maciej             67             51            2.8          24
    ##  6    21 Chamberlain, …             10             10            1.1           9
    ##  7     7 Colito, Augus…             62             44            3.9          16
    ##  8     1 Deweese, Randy            126             59            5            25
    ##  9    25 Engelmann, Li…              4              5            0.4          10
    ## 10    16 Engemann, Nor…              2              0            1             2
    ## # ℹ 250 more rows
    ## # ℹ 3 more variables: Games_played <dbl>, `Top-Scorer` <dbl>,
    ## #   errors_per_set <dbl>

    #str(all_topscorer_clean, list.len = 3)

------------------------------------------------------------------------

**Note :** *Could probably go for the misstakes in Names by apply the
`get_unique_values`function to both, the topscorer & roster list, store
them in a list and apply the function again on it.*

**Than we could join, roster and topscorer by Name**

------------------------------------------------------------------------

Okay let’s go for the games now.

------------------------------------------------------------------------

    suppressMessages({
      all_games <- auto_import(folders[2], datatyp="csv", "2")
    })

    #str(all_games, list.len = 2)

------------------------------------------------------------------------

Let’s have alook with our `get_unique_values` function and clean it.

------------------------------------------------------------------------

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
      
    #all_games_clean

------------------------------------------------------------------------

Alright,so far, so good!

Next mutating all these values requiered for the barplot.

Let’s get a list of all Teams first \*\*\*

    all_games_teams <- unique(all_games_clean$Mannschaft1)
    #all_games_teams

------------------------------------------------------------------------

now let’s mutate some variable for the graph, lets’s start with variable
requested in `results`, ex. count how often each of them played at
home/away and their wins/losses…

------------------------------------------------------------------------

    mutate_team_games_var1 <- function(team, df) {
      home_games <- df %>%
        filter(Mannschaft1 == team) %>%
        nrow()
      
      away_games <- df %>%
        filter(Mannschaft2 == team) %>%
        nrow()
      
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
          Sum_Satzpunkte = round(sum(Satzpunkte1 + Satzpunkte2), 2), # not sure if we need that one
          Avg_Satzpunkte = round(mean(Satzpunkte1 + Satzpunkte2), 2))
      
      avg_point_per_set <- df %>%   # why is it only working with backticks? -> cous i had an special letter in "-" gsub'ed it out, could remove backticks now
      filter(Mannschaft1 == team | Mannschaft2 == team) %>%
        summarise(
          Avg_Ballpunkte_first_set = round(mean(ifelse(Mannschaft1 == team, `Satz1_Ballpunkte1`, `Satz1_Ballpunkte2`)), 2),
          Avg_Ballpunkte_sec_set = round(mean(ifelse(Mannschaft1 == team, `Satz2_Ballpunkte1`, `Satz2_Ballpunkte2`)), 2),
          Avg_Ballpunkte_third_set = round(mean(ifelse(Mannschaft1 == team, `Satz3_Ballpunkte1`, `Satz3_Ballpunkte2`)), 2),
          Avg_Ballpunkte_fourth_set = round(mean(ifelse(Mannschaft1 == team, `Satz4_Ballpunkte1`, `Satz4_Ballpunkte2`), na.rm=TRUE), 2),
          Avg_Ballpunkte_fifth_set = round(mean(ifelse(Mannschaft1 == team, `Satz5_Ballpunkte1`, `Satz5_Ballpunkte2`), na.rm=TRUE), 2))
      
      
      max_ballpoint_ever <- max(ifelse(df$Mannschaft1 == team, df$Satz1_Ballpunkte1, df$Satz1_Ballpunkte2))
      
      min_ballpoint_ever <- min(ifelse(df$Mannschaft1 == team, df$Satz1_Ballpunkte1, df$Satz1_Ballpunkte2))
        
    # don't know how to proper look for the max-value of all satzX, or condition (|), pmax(), max (..1,..2,..) don'T work
    # could do an max and min for each set and do an max again on it but....
      
     
      
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
               avg_sets = sets_per_wingame, avg_point_per_set = avg_point_per_set,
               max_point = max_ballpoint_ever, min_point = min_ballpoint_ever,
               avg_ballpoint_home, avg_ballpoint_away, avg_attendance_home))
    }

    result_variable_all_team_games <- t(mapply(mutate_team_games_var1, team = all_games_teams, df = rep(list(all_games_clean), length(all_games_teams)))) #t() transponiert output Struktur ( für alle teams,home,etc. in einer Spalte)

    #result_variable_all_team_games

------------------------------------------------------------------------

**Finally got the Result and Stadium stuff ready, lets go for the
next.**

------------------------------------------------------------------------

Already got an idea, could go over the positions with a function.
Therefore lets get the unique positions in a list first.

------------------------------------------------------------------------

    all_positions <- get_unique_values(all_rosters_clean, "Position")[-6] # removes the head coach

    #all_positions

Probably won’t need it.

Need to join topscorer and roster to get all the team names into the
topscorer file, there is already a column called `points_per_set` so if
i get it done i just need to `group_by(Position)` and
`Summarize(mean(Positon))`with lapply? over all teams.

    joined_topscore_roster <- right_join(all_topscorer_clean2,all_rosters_clean2, "Name")

    ## Warning in right_join(all_topscorer_clean2, all_rosters_clean2, "Name"): Detected an unexpected many-to-many relationship between `x` and `y`.
    ## ℹ Row 3 of `x` matches multiple rows in `y`.
    ## ℹ Row 115 of `y` matches multiple rows in `x`.
    ## ℹ If a many-to-many relationship is expected, set `relationship =
    ##   "many-to-many"` to silence this warning.

    joined_topscore_roster

    ## # A tibble: 259 × 16
    ##     Rank Name           Points_overall Errors_overall Points_per_Set Sets_played
    ##    <dbl> <chr>                   <dbl>          <dbl>          <dbl>       <dbl>
    ##  1    34 Amedegnato, D…              6             11            0.5          11
    ##  2    31 Barsemian, Ra…              9             13            1             9
    ##  3    21 Baumann, Felix             39             39            3            13
    ##  4    21 Baumann, Felix             39             39            3            13
    ##  5    15 Baxpöhler, No…             35             32            1.8          20
    ##  6    21 Chamberlain, …             10             10            1.1           9
    ##  7     7 Colito, Augus…             62             44            3.9          16
    ##  8     1 Deweese, Randy            126             59            5            25
    ##  9    25 Engelmann, Li…              4              5            0.4          10
    ## 10    16 Engemann, Nor…              2              0            1             2
    ## # ℹ 249 more rows
    ## # ℹ 10 more variables: Games_played <dbl>, `Top-Scorer` <dbl>,
    ## #   errors_per_set <dbl>, Team <chr>, Height <dbl>, Gender <chr>,
    ## #   `Date of Birth` <chr>, `Jersey Number` <dbl>, Nationality <chr>,
    ## #   Position <chr>

------------------------------------------------------------------------

For a finally fix, as mentioned before, we should fix the mistakes in
names first by using our `get_unique_values` function

Anyway let’s go for mutating the rest of requested variables

------------------------------------------------------------------------

    attack_var <- joined_topscore_roster%>%
      group_by(Team, Position)%>%
      summarise(avg_point_per_position = round(mean(Points_per_Set, na.rm = TRUE), 1))%>%
      ungroup()#%>%

    ## `summarise()` has grouped output by 'Team'. You can override using the
    ## `.groups` argument.

      #filter(!is.na(avg_point_per_position))

    #attack_var
    topscore_var <- joined_topscore_roster%>%
      group_by(Team, Position)%>%
      summarise(avg_toppoints_per_position = round(mean(Points_overall, na.rm = TRUE), 1))%>%
      ungroup()#%>%

    ## `summarise()` has grouped output by 'Team'. You can override using the
    ## `.groups` argument.

      #filter(!is.na(avg_point_per_position))
    #topscore_var

    error_var <- joined_topscore_roster %>%
      group_by(Team, Position) %>%
        filter(!is.na(errors_per_set))%>%
      summarise(max_errors = max(errors_per_set)) %>%
      ungroup()

    ## `summarise()` has grouped output by 'Team'. You can override using the
    ## `.groups` argument.

    #error_var

    calculate_avg_var <- function(data, value_column) {
      result <- data %>%
        group_by(Team, Position) %>%
        summarise(avg_value = round(mean({{value_column}}, na.rm = TRUE), 1)) %>%
        ungroup() %>%
        filter(!is.na(avg_value))
      
      return(result)
    }

    attack_var2 <- calculate_avg_var(joined_topscore_roster, Points_per_Set)

    ## `summarise()` has grouped output by 'Team'. You can override using the
    ## `.groups` argument.

    #attack_var2
    topscore_var2 <- calculate_avg_var(joined_topscore_roster, Points_overall)

    ## `summarise()` has grouped output by 'Team'. You can override using the
    ## `.groups` argument.

    #topscore_var2

------------------------------------------------------------------------

Now we got all requested `Attacking` & `Topscorer` & `Errors`variables.

Let’s go for the Graph now.

------------------------------------------------------------------------

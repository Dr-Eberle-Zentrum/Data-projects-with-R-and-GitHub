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

    all_rosters <- auto_import(folders[4], datatyp="csv", "2")

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## Rows: 22 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 20 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (8): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (2): Height, Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 22 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 25 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 23 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 28 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 38 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 25 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.
    ## 
    ## Rows: 21 Columns: 10
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ";"
    ## chr (9): Last Name, First Name, First Name Last Name, Last Name First Name, ...
    ## dbl (1): Jersey Number
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

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
    #str(all_rosters_clean, list.len = 3)

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

    get_unique_values(all_topscorer_clean, "Team")
    get_unique_values(all_topscorer_clean, "Position")
    na_count <- sapply(all_topscorer_clean, function(df) sum(is.na(df$Position)))

    na_count

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

    #str(all_topscorer_clean, list.len = 3)

------------------------------------------------------------------------

**Note :** *Could probably go for the misstakes in Names by apply the
`get_unique_values`function to both, the topscorer & roster list, store
them in a list and apply the function again on it.*

**Than we could join, roster and topscorer by Name**

------------------------------------------------------------------------

Okay let’s go for the games now.

------------------------------------------------------------------------

    all_games <- auto_import(folders[2], datatyp="csv", "2")

    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for more control.

    ## New names:
    ## Rows: 19 Columns: 39
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: ";" chr
    ## (18): Datum, Spielgruppe, Mannschaft 1, Mannschaft 2, Gastgeber, Ergebn... dbl
    ## (19): Spieldauer, Zuschauerzahl, Satzpunkte 1, Satzpunkte 2, Satz 1 - B... time
    ## (2): Uhrzeit, Satzpunkte
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for
    ## more control.
    ## New names:
    ## Rows: 72 Columns: 39
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: ";" chr
    ## (18): Datum, ST, Mannschaft 1, Mannschaft 2, Gastgeber, Austragungsort/... dbl
    ## (19): Spieldauer, Zuschauerzahl, Satzpunkte 1, Satzpunkte 2, Satz 1 - B... time
    ## (2): Uhrzeit, Satzpunkte
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for
    ## more control.
    ## New names:
    ## Rows: 12 Columns: 39
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: ";" chr
    ## (17): Datum, ST, Mannschaft 1, Mannschaft 2, Gastgeber, Austragungsort/... dbl
    ## (16): Spieldauer, Zuschauerzahl, Satzpunkte 1, Satzpunkte 2, Satz 1 - B... lgl
    ## (4): Satz 5 - Ballpunkte 1, :...37, Satz 5 - Ballpunkte 2, Satz 5 - Sa... time
    ## (2): Uhrzeit, Satzpunkte
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## ℹ Using "','" as decimal and "'.'" as grouping mark. Use `read_delim()` for
    ## more control.
    ## New names:
    ## Rows: 16 Columns: 39
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: ";" chr
    ## (18): Datum, ST, Mannschaft 1, Mannschaft 2, Gastgeber, Austragungsort/... dbl
    ## (19): Spieldauer, Zuschauerzahl, Satzpunkte 1, Satzpunkte 2, Satz 1 - B... time
    ## (2): Uhrzeit, Satzpunkte
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `Ergebnis` -> `Ergebnis...7`
    ## • `Ergebnis` -> `Ergebnis...9`
    ## • `:` -> `:...18`
    ## • `:` -> `:...21`
    ## • `:` -> `:...25`
    ## • `:` -> `:...29`
    ## • `:` -> `:...33`
    ## • `:` -> `:...37`

    #str(all_games, list.len = 2)

------------------------------------------------------------------------

Let’s have alook and clean it.

------------------------------------------------------------------------

    get_unique_values(all_games_clean, "Geschlecht")
    na_count <- sapply(all_games, function(df) sum(is.na(df$Geschlecht)))

    na_count

------------------------------------------------------------------------

    all_games_clean <- lapply(all_games, function(df) {
        df %>%
        setNames(gsub(" ", "_", colnames(.))) %>%
      mutate(Mannschaft_1 = gsub("Ř", "ü", Mannschaft_1),
             Mannschaft_2 = gsub("Ř", "ü", Mannschaft_2),
             Gastgeber = gsub("Ř", "ü", Gastgeber),
             Austragungsort = gsub("Ř", "ü", Austragungsort),
             Geschlecht = ifelse(str_detect(Geschlecht, "^[fF]|2"), "female", "male"))
    })
      
    all_games_clean

    ## $Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 19 × 39
    ##    Datum    Uhrzeit Spielgruppe Mannschaft_1 Mannschaft_2 Gastgeber Ergebnis...7
    ##    <chr>    <time>  <chr>       <chr>        <chr>        <chr>     <chr>       
    ##  1 25.03.2… 17:30   Viertelfin… SVG Lüneburg Energiequel… SVG Lüne… 3:1 / 96:75 
    ##  2 25.03.2… 20:00   Viertelfin… BERLIN RECY… TSV Haching… BERLIN R… 3:0 / 75:45 
    ##  3 26.03.2… 15:00   Viertelfin… SWD powervo… WWK Volleys… SWD powe… 3:1 / 98:84 
    ##  4 26.03.2… 17:30   Viertelfin… VfB Friedri… Helios GRIZ… VfB Frie… 2:3 / 100:1…
    ##  5 01.04.2… 17:30   Viertelfin… Helios GRIZ… VfB Friedri… Helios G… 1:3 / 91:98 
    ##  6 02.04.2… 15:00   Viertelfin… Energiequel… SVG Lüneburg Energieq… 1:3 / 92:98 
    ##  7 02.04.2… 17:30   Viertelfin… TSV Haching… BERLIN RECY… TSV Hach… 0:3 / 51:75 
    ##  8 04.04.2… 20:00   Viertelfin… WWK Volleys… SWD powervo… WWK Voll… 0:3 / 66:79 
    ##  9 08.04.2… 20:00   Viertelfin… VfB Friedri… Helios GRIZ… VfB Frie… 3:2 / 110:99
    ## 10 12.04.2… 19:00   Halbfinale… SVG Lüneburg VfB Friedri… SVG Lüne… 2:3 / 103:1…
    ## 11 12.04.2… 19:45   Halbfinale… BERLIN RECY… SWD powervo… BERLIN R… 3:1 / 91:87 
    ## 12 15.04.2… 19:30   Halbfinale… SWD powervo… BERLIN RECY… SWD powe… 1:3 / 87:94 
    ## 13 16.04.2… 17:30   Halbfinale… VfB Friedri… SVG Lüneburg VfB Frie… 3:0 / 75:68 
    ## 14 19.04.2… 19:00   Halbfinale… SVG Lüneburg VfB Friedri… SVG Lüne… 3:0 / 75:65 
    ## 15 19.04.2… 19:45   Halbfinale… BERLIN RECY… SWD powervo… BERLIN R… 3:1 / 91:79 
    ## 16 23.04.2… 17:30   Halbfinale… VfB Friedri… SVG Lüneburg VfB Frie… 3:1 / 97:84 
    ## 17 01.05.2… 18:00   Finale Pla… BERLIN RECY… VfB Friedri… BERLIN R… 3:1 / 103:92
    ## 18 04.05.2… 20:00   Finale Pla… VfB Friedri… BERLIN RECY… VfB Frie… 0:3 / 45:75 
    ## 19 06.05.2… 20:00   Finale Pla… BERLIN RECY… VfB Friedri… BERLIN R… 3:1 / 93:86 
    ## # ℹ 32 more variables: Austragungsort <chr>, Ergebnis...9 <chr>, Saison <chr>,
    ## #   Spielrunde <chr>, Geschlecht <chr>, Satzpunkte <time>, Ballpunkte <chr>,
    ## #   Spieldauer <dbl>, Zuschauerzahl <dbl>, Satzpunkte_1 <dbl>, `:...18` <chr>,
    ## #   Satzpunkte_2 <dbl>, `Satz_1_-_Ballpunkte_1` <dbl>, `:...21` <chr>,
    ## #   `Satz_1_-_Ballpunkte_2` <dbl>, `Satz_1_-_Satzdauer` <dbl>,
    ## #   `Satz_2_-_Ballpunkte_1` <dbl>, `:...25` <chr>,
    ## #   `Satz_2_-_Ballpunkte_2` <dbl>, `Satz_2_-_Satzdauer` <dbl>, …
    ## 
    ## $Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 72 × 39
    ##    Datum      Uhrzeit ST         Mannschaft_1             Mannschaft_2 Gastgeber
    ##    <chr>      <time>  <chr>      <chr>                    <chr>        <chr>    
    ##  1 08.10.2022 17:30   Spieltag 1 Energiequelle Netzhoppe… Helios GRIZ… Energieq…
    ##  2 08.10.2022 20:00   Spieltag 1 WWK Volleys Herrsching   SWD powervo… WWK Voll…
    ##  3 09.10.2022 16:00   Spieltag 1 TSV Haching München      BERLIN RECY… TSV Hach…
    ##  4 09.10.2022 17:30   Spieltag 1 SVG Lüneburg             VCO Berlin   SVG Lüne…
    ##  5 15.10.2022 17:30   Spieltag 2 Helios GRIZZLYS Giesen   TSV Haching… Helios G…
    ##  6 15.10.2022 20:00   Spieltag 2 SWD powervolleys Düren   Energiequel… SWD powe…
    ##  7 16.10.2022 13:00   Spieltag 2 VCO Berlin               WWK Volleys… VCO Berl…
    ##  8 16.10.2022 16:00   Spieltag 2 BERLIN RECYCLING Volleys VfB Friedri… BERLIN R…
    ##  9 19.10.2022 19:00   Spieltag 3 TSV Haching München      VfB Friedri… TSV Hach…
    ## 10 19.10.2022 19:30   Spieltag 3 Helios GRIZZLYS Giesen   SWD powervo… Helios G…
    ## # ℹ 62 more rows
    ## # ℹ 33 more variables: `Austragungsort/Ergebnis` <chr>, Austragungsort <chr>,
    ## #   Ergebnis <chr>, Saison <chr>, Spielrunde <chr>, Geschlecht <chr>,
    ## #   Satzpunkte <time>, Ballpunkte <chr>, Spieldauer <dbl>, Zuschauerzahl <dbl>,
    ## #   Satzpunkte_1 <dbl>, `:...18` <chr>, Satzpunkte_2 <dbl>,
    ## #   `Satz_1_-_Ballpunkte_1` <dbl>, `:...21` <chr>,
    ## #   `Satz_1_-_Ballpunkte_2` <dbl>, `Satz_1_-_Satzdauer` <dbl>, …
    ## 
    ## $`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 12 × 39
    ##    Datum      Uhrzeit ST         Mannschaft_1             Mannschaft_2 Gastgeber
    ##    <chr>      <time>  <chr>      <chr>                    <chr>        <chr>    
    ##  1 04.02.2023 20:00   Spieltag 1 BERLIN RECYCLING Volleys SWD powervo… BERLIN R…
    ##  2 05.02.2023 15:00   Spieltag 1 SVG Lüneburg             VfB Friedri… SVG Lüne…
    ##  3 11.02.2023 20:00   Spieltag 2 SVG Lüneburg             BERLIN RECY… SVG Lüne…
    ##  4 12.02.2023 17:30   Spieltag 2 VfB Friedrichshafen      SWD powervo… VfB Frie…
    ##  5 18.02.2023 15:00   Spieltag 3 SWD powervolleys Düren   SVG Lüneburg SWD powe…
    ##  6 19.02.2023 17:30   Spieltag 3 BERLIN RECYCLING Volleys VfB Friedri… BERLIN R…
    ##  7 03.03.2023 19:30   Spieltag 4 SWD powervolleys Düren   BERLIN RECY… SWD powe…
    ##  8 04.03.2023 20:00   Spieltag 4 VfB Friedrichshafen      SVG Lüneburg VfB Frie…
    ##  9 12.03.2023 15:00   Spieltag 5 BERLIN RECYCLING Volleys SVG Lüneburg BERLIN R…
    ## 10 12.03.2023 17:30   Spieltag 5 SWD powervolleys Düren   VfB Friedri… SWD powe…
    ## 11 18.03.2023 20:00   Spieltag 6 SVG Lüneburg             SWD powervo… SVG Lüne…
    ## 12 19.03.2023 17:30   Spieltag 6 VfB Friedrichshafen      BERLIN RECY… VfB Frie…
    ## # ℹ 33 more variables: `Austragungsort/Ergebnis` <chr>, Austragungsort <chr>,
    ## #   Ergebnis <chr>, Saison <chr>, Spielrunde <chr>, Geschlecht <chr>,
    ## #   Satzpunkte <time>, Ballpunkte <chr>, Spieldauer <dbl>, Zuschauerzahl <dbl>,
    ## #   Satzpunkte_1 <dbl>, `:...18` <chr>, Satzpunkte_2 <dbl>,
    ## #   `Satz_1_-_Ballpunkte_1` <dbl>, `:...21` <chr>,
    ## #   `Satz_1_-_Ballpunkte_2` <dbl>, `Satz_1_-_Satzdauer` <dbl>,
    ## #   `Satz_2_-_Ballpunkte_1` <dbl>, `:...25` <chr>, …
    ## 
    ## $`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 16 × 39
    ##    Datum      Uhrzeit ST         Mannschaft_1             Mannschaft_2 Gastgeber
    ##    <chr>      <time>  <chr>      <chr>                    <chr>        <chr>    
    ##  1 03.02.2023 20:00   Spieltag 1 WWK Volleys Herrsching   TSV Haching… WWK Voll…
    ##  2 04.02.2023 17:30   Spieltag 1 Energiequelle Netzhoppe… Helios GRIZ… Energieq…
    ##  3 05.02.2023 17:30   Spieltag 1 VCO Berlin               Helios GRIZ… VCO Berl…
    ##  4 12.02.2023 15:00   Spieltag 2 TSV Haching München      Helios GRIZ… TSV Hach…
    ##  5 18.02.2023 17:30   Spieltag 3 Energiequelle Netzhoppe… TSV Haching… Energieq…
    ##  6 18.02.2023 20:00   Spieltag 3 Helios GRIZZLYS Giesen   WWK Volleys… Helios G…
    ##  7 19.02.2023 14:00   Spieltag 3 VCO Berlin               TSV Haching… VCO Berl…
    ##  8 22.02.2023 20:00   Spieltag 2 WWK Volleys Herrsching   Energiequel… WWK Voll…
    ##  9 04.03.2023 17:30   Spieltag 4 Helios GRIZZLYS Giesen   Energiequel… Helios G…
    ## 10 05.03.2023 17:00   Spieltag 4 TSV Haching München      WWK Volleys… TSV Hach…
    ## 11 11.03.2023 17:30   Spieltag 5 Energiequelle Netzhoppe… WWK Volleys… Energieq…
    ## 12 11.03.2023 20:00   Spieltag 5 Helios GRIZZLYS Giesen   TSV Haching… Helios G…
    ## 13 13.03.2023 18:30   Spieltag 5 VCO Berlin               WWK Volleys… VCO Berl…
    ## 14 15.03.2023 18:30   Spieltag 6 VCO Berlin               Energiequel… VCO Berl…
    ## 15 15.03.2023 20:00   Spieltag 6 WWK Volleys Herrsching   Helios GRIZ… WWK Voll…
    ## 16 19.03.2023 15:00   Spieltag 6 TSV Haching München      Energiequel… TSV Hach…
    ## # ℹ 33 more variables: `Austragungsort/Ergebnis` <chr>, Austragungsort <chr>,
    ## #   Ergebnis <chr>, Saison <chr>, Spielrunde <chr>, Geschlecht <chr>,
    ## #   Satzpunkte <time>, Ballpunkte <chr>, Spieldauer <dbl>, Zuschauerzahl <dbl>,
    ## #   Satzpunkte_1 <dbl>, `:...18` <chr>, Satzpunkte_2 <dbl>,
    ## #   `Satz_1_-_Ballpunkte_1` <dbl>, `:...21` <chr>,
    ## #   `Satz_1_-_Ballpunkte_2` <dbl>, `Satz_1_-_Satzdauer` <dbl>,
    ## #   `Satz_2_-_Ballpunkte_1` <dbl>, `:...25` <chr>, …

------------------------------------------------------------------------

Alright,so far, so good!

Next mutating all these values requiered for the barplot.

Let’s get a list of all Teams first \*\*\*

    all_games_teams <- get_unique_values(all_games_clean, "Mannschaft_1")
    all_games_teams

    ## [1] "SVG Lüneburg"                          
    ## [2] "BERLIN RECYCLING Volleys"              
    ## [3] "SWD powervolleys Düren"                
    ## [4] "VfB Friedrichshafen"                   
    ## [5] "Helios GRIZZLYS Giesen"                
    ## [6] "Energiequelle Netzhoppers KW-Bestensee"
    ## [7] "TSV Haching München"                   
    ## [8] "WWK Volleys Herrsching"                
    ## [9] "VCO Berlin"

------------------------------------------------------------------------

now let’s check how often each of them played at home and away

------------------------------------------------------------------------

    num_home_games <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter(Mannschaft_1 == team)%>%
        nrow()
      })
    })

    num_away_games <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter(Mannschaft_2 == team)%>%
        nrow()
      })
    })

    num_total_games <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter(Mannschaft_1 == team|Mannschaft_2 == team)%>%
        nrow()
      })
    })

------------------------------------------------------------------------

This already looks like, as we can put it together.

------------------------------------------------------------------------

    count_team_games <- function(team, df) {
      home_games <- df %>%
        filter(Mannschaft_1 == team) %>%
        nrow()
      
      away_games <- df %>%
        filter(Mannschaft_2 == team) %>%
        nrow()
      
      total_games <- df %>%
        filter(Mannschaft_1 == team | Mannschaft_2 == team) %>%
        nrow()
      
      return(c(Home = home_games, Away = away_games, Total = total_games))
    }

    num_games_in_once <- lapply(all_games_teams, function(team) {
      lapply(all_games_clean, count_team_games, team = team)
    })
    num_games_in_once

    ## [[1]]
    ## [[1]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     3     3     6 
    ## 
    ## [[1]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     3     3     6 
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## 
    ## [[2]]
    ## [[2]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     5     3     8 
    ## 
    ## [[2]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     3     3     6 
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## 
    ## [[3]]
    ## [[3]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     2     3     5 
    ## 
    ## [[3]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     3     3     6 
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## 
    ## [[4]]
    ## [[4]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     5     5    10 
    ## 
    ## [[4]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     3     3     6 
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## 
    ## [[5]]
    ## [[5]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     1     2     3 
    ## 
    ## [[5]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     3     4     7 
    ## 
    ## 
    ## [[6]]
    ## [[6]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     1     1     2 
    ## 
    ## [[6]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     3     4     7 
    ## 
    ## 
    ## [[7]]
    ## [[7]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     1     1     2 
    ## 
    ## [[7]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     3     4     7 
    ## 
    ## 
    ## [[8]]
    ## [[8]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     1     1     2 
    ## 
    ## [[8]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     3     4     7 
    ## 
    ## 
    ## [[9]]
    ## [[9]]$Spielplan_1._Bundesliga_Männer_Playoff
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[9]]$Spielplan_1._Bundesliga_Männer_regular_season
    ##  Home  Away Total 
    ##     8     8    16 
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ##  Home  Away Total 
    ##     0     0     0 
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ##  Home  Away Total 
    ##     4     0     4

------------------------------------------------------------------------

Next go fpr win and losses

------------------------------------------------------------------------

    num_victory <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter((Mannschaft_1 == team & Satzpunkte_1 == 3) | (Mannschaft_2 == team & Satzpunkte_2 == 3))%>%
        nrow()
      })
    })

    num_losses <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter((Mannschaft_1 == team & Satzpunkte_1 != 3) | (Mannschaft_2 == team & Satzpunkte_2 != 3))%>%
        nrow()
      })
    })
    num_losses

    ## [[1]]
    ## [[1]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 3
    ## 
    ## [[1]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 5
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 3
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 0
    ## 
    ## 
    ## [[2]]
    ## [[2]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 0
    ## 
    ## [[2]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 2
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 2
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 0
    ## 
    ## 
    ## [[3]]
    ## [[3]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 3
    ## 
    ## [[3]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 6
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 3
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 0
    ## 
    ## 
    ## [[4]]
    ## [[4]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 5
    ## 
    ## [[4]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 2
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 4
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 0
    ## 
    ## 
    ## [[5]]
    ## [[5]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 2
    ## 
    ## [[5]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 7
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 0
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 2
    ## 
    ## 
    ## [[6]]
    ## [[6]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 2
    ## 
    ## [[6]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 13
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 0
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 3
    ## 
    ## 
    ## [[7]]
    ## [[7]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 2
    ## 
    ## [[7]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 13
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 0
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 6
    ## 
    ## 
    ## [[8]]
    ## [[8]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 2
    ## 
    ## [[8]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 8
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 0
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 1
    ## 
    ## 
    ## [[9]]
    ## [[9]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## [1] 0
    ## 
    ## [[9]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## [1] 16
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## [1] 0
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## [1] 4

------------------------------------------------------------------------

For all the average stuff im not sure if it aint more easy to combine
all games into one df to get total counts more easy for each team.

Anyway we can count total of sets now ans than let’s see.

------------------------------------------------------------------------

    num_sets_per_game_played <-lapply(all_games_teams, function(team){
      lapply(all_games_clean, function(df){
        df%>%
        filter(Mannschaft_1 == team|Mannschaft_2 == team)%>%
        summarise(
          Sum_Satzpunkte = sum(Satzpunkte_1 + Satzpunkte_2),
          Avg_Satzpunkte = mean(Satzpunkte_1 + Satzpunkte_2)) # actually could put the whole sum function in the mean function
      })
    })

------------------------------------------------------------------------

**Note:** \* This is the total and average number of setsplayed per
game\* **not** average sets to win, wait a minute…..

than it should be **right?**

Next Average points per set

------------------------------------------------------------------------

**Dunno here why its working with backticks but aint with normal ““**

    avg_points_per_set<- lapply(all_games_teams, function(team) {
      lapply(all_games_clean, function(df) {
        df %>%
          filter(Mannschaft_1 == team | Mannschaft_2 == team) %>%
          summarise(
            Avg_Ballpunkte_first_set = mean(ifelse(Mannschaft_1 == team, `Satz_1_-_Ballpunkte_1`, `Satz_1_-_Ballpunkte_2`)),
            Avg_Ballpunkte_sec_set = mean(ifelse(Mannschaft_1 == team, `Satz_2_-_Ballpunkte_1`, `Satz_2_-_Ballpunkte_2`)),
            Avg_Ballpunkte_third_set = mean(ifelse(Mannschaft_1 == team, `Satz_3_-_Ballpunkte_1`, `Satz_3_-_Ballpunkte_2`)),
            Avg_Ballpunkte_fourth_set = mean(ifelse(Mannschaft_1 == team, `Satz_4_-_Ballpunkte_1`, `Satz_4_-_Ballpunkte_2`)),
            Avg_Ballpunkte_fifth_set = mean(ifelse(Mannschaft_1 == team, `Satz_5_-_Ballpunkte_1`, `Satz_5_-_Ballpunkte_2`))
            
          )
      })
    })

    avg_points_per_set

    ## [[1]]
    ## [[1]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     22.8                   23.7                       22
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[1]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.8                   24.6                     22.4
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.3                   21.8                     24.7
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[1]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[2]]
    ## [[2]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.9                     25                     22.4
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[2]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     25.2                   24.4                     24.6
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.3                   26.8                     23.5
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[2]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[3]]
    ## [[3]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                       23                     22                     24.6
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[3]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                       24                   22.4                     23.1
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     21.8                   24.7                     22.7
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[3]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[4]]
    ## [[4]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     22.7                   20.3                     23.9
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[4]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     24.5                   25.6                     23.8
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.7                     27                     22.5
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[4]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[5]]
    ## [[5]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     25.7                   24.3                     18.7
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[5]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     23.4                   22.6                       24
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[5]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     25.1                   25.6                     26.3
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[6]]
    ## [[6]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     16.5                   19.5                       23
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[6]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     21.2                   21.1                       22
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[6]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     24.1                   23.4                     21.7
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[7]]
    ## [[7]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                       17                   19.5                     11.5
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[7]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     19.8                   19.1                     19.6
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[7]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     20.3                   18.3                     21.9
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[8]]
    ## [[8]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     21.5                     22                       21
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[8]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     22.7                   22.8                     22.4
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[8]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                       23                   23.7                     26.4
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## 
    ## [[9]]
    ## [[9]]$Spielplan_1._Bundesliga_Männer_Playoff
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[9]]$Spielplan_1._Bundesliga_Männer_regular_season
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                     16.9                   18.8                     18.6
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_1-4`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                      NaN                    NaN                      NaN
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>
    ## 
    ## [[9]]$`Spielplan_1._Bundesliga_Männer_Zwischenrunde_5-9`
    ## # A tibble: 1 × 5
    ##   Avg_Ballpunkte_first_set Avg_Ballpunkte_sec_set Avg_Ballpunkte_third_set
    ##                      <dbl>                  <dbl>                    <dbl>
    ## 1                       21                   17.5                     19.8
    ## # ℹ 2 more variables: Avg_Ballpunkte_fourth_set <dbl>,
    ## #   Avg_Ballpunkte_fifth_set <dbl>

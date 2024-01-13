OKay let’s start with the roster files

------------------------------------------------------------------------

    ## [1] "C:/Users/Pirate/Documents/Data-projects-with-R-and-GitHub/Projects/laura-burk/volleyball-project/team-rosters"

------------------------------------------------------------------------

To import the `csv-dats` let’s recycle the `auto_import_csv`-function
from my other Project Solution.

------------------------------------------------------------------------

    auto_import_csv <- function(file_path){
      
      file_list <- list.files(path = file_path, pattern = "\\.csv$", full.names = TRUE)        #-> here we could change the auto import to other data type's 
      data_frames <- list()
      
      for (file in file_list) {
        df_name <- tools::file_path_sans_ext(basename(file))  # uses filename as dataframe
        
        
        data_frames[[df_name]] <- read.csv2(file, fileEncoding = "cp852")
      }
      
      return(data_frames)
    }
    all_rosters <- auto_import_csv(folder_path_roster)

    str(all_rosters, list.len = 2)

    ## List of 9
    ##  $ roster_BERLIN_RECYCLING_Volleys              :'data.frame':   22 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:22] "Brehme" "Carle" "Dosanjh" "Kessel" ...
    ##   ..$ First.Name          : chr [1:22] "Anton" "Timothée" "Arshdeep" "Cody" ...
    ##   .. [list output truncated]
    ##  $ roster_Energiequelle_Netzhoppers_KW-Bestensee:'data.frame':   20 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:20] "Barsemian" "Baumann" "Berger" "Chamberlain" ...
    ##   ..$ First.Name          : chr [1:20] "Raymond Sarkis" "Felix" "Gian-Luca" "Max" ...
    ##   .. [list output truncated]
    ##   [list output truncated]

------------------------------------------------------------------------

Alright, now let’s start to clean the data.

To do so, let’s have a closer look what’s the unique values and find
some Regex for.

------------------------------------------------------------------------

    get_unique_values <- function(data, column){
      unique_values <- unique(unlist(lapply(data, function(df) df[[column]])))
      return(unique_values)
    }
    get_unique_values(all_rosters, "Gender")

    ##  [1] "männlich" "Male"     "male"     "1"        "female"   "Frau"    
    ##  [7] "Mann"     "m?nnlich" "2"        "weiblich"

    get_unique_values(all_rosters, "Position")

    ##  [1] "middle     blocker"  "Außenangriff"        "Zuspiel"            
    ##  [4] "Libero"              "Diagonal"            "Mittelblock"        
    ##  [7] "opposite "           "setter"              "Cheftrainer"        
    ## [10] "Co-Trainer"          "Co-Trainer (Scout)"  "Arzt"               
    ## [13] "Physiotherapeut"     "Statistiker"         "opposite hitter"    
    ## [16] "Middle Blocker"      "Setter"              "Opposite"           
    ## [19] "Trainer"             "middle"              "outside"            
    ## [22] "head coach"          "Auáenangriff"        "middle blocker"     
    ## [25] "Universal"           "coach (headcoach)"   "Outside Hitter"     
    ## [28] "Coach"               "middle  blocker"     "opposite"           
    ## [31] "chef trainer"        "Opposite Hitter"     "opoositte    hitter"
    ## [34] "head of coaching"    "Middle blocker"

    get_unique_values(all_rosters, "Nationality")

    ##  [1] "Deutschland"                    "Frankreich"                    
    ##  [3] "Australien"                     "Vereinigte Staaten von Amerika"
    ##  [5] "Polen"                          "Brasilien"                     
    ##  [7] "Finnland"                       "ger"                           
    ##  [9] "Tschechische Republik"          "Spain"                         
    ## [11] "Japan"                          "Slowenien"                     
    ## [13] "Italien"                        "DE"                            
    ## [15] "USA"                            "de"                            
    ## [17] "Kanada"                         "GER"                           
    ## [19] "Poland"                         "Spanien"                       
    ## [21] "Finland"                        "Israel"                        
    ## [23] "Canada"                         "Holland"                       
    ## [25] "Ger"                            "Chile"                         
    ## [27] "Schweden"                       "Tunesien"                      
    ## [29] "Ungarn"                         "Bosnien und Herzegowina"       
    ## [31] "Rumänien"                       "Serbia"                        
    ## [33] "Australie"                      "Bulgarien"                     
    ## [35] "Montenegro"                     "Kolumbien"                     
    ## [37] "Serbien"                        "Argentinien"                   
    ## [39] "Slowenia"                       "Österreich"

------------------------------------------------------------------------

Quiet some mistakes to correct, let’s create some `adjust_map's` for the
Regex

To use the `countrycode`package proper we also should do some pre
mutating for `Nationnality`.

------------------------------------------------------------------------

    adjust_map_position <- c("^[zZ].*|^[sS]e.*" = "setter",
                    "^[mM].*" = "middle blocker",
                    "^[aA]u.*|^[oO]u.*" = "outside hitter",
                    "^[dD].*|^[oO]p.*" = "opposite hitter",
                    "^[uU].*|^[lL].*" = "libero",
                    "^[tT]r.*|^[cC]h.*|.*[hH]ead.*" = "head coach")

    adjust_map_country <- c("^[dD].*|^[gG].*"= "Deutschland",
                            ".*wenia$"= "Slovenia",
                            ".*lie$"="Australien")

------------------------------------------------------------------------

------------------------------------------------------------------------

    all_rosters_clean <- lapply(all_rosters, function(df) {
     df %>%
        mutate(Gender = ifelse(str_detect(Gender, "^[fF]|2"), "female", "male"),
               Position = str_replace_all(Position, adjust_map_position),
               Nationality = str_replace_all(Nationality, adjust_map_country))%>%
        filter(Position %in% adjust_map_position)%>%
        mutate(Height = as.numeric(Height)/100)
        
    })

    ## Warning: There was 1 warning in `mutate()`.
    ## ℹ In argument: `Height = as.numeric(Height)/100`.
    ## Caused by warning:
    ## ! NAs durch Umwandlung erzeugt

    all_rosters_clean

    ## $roster_BERLIN_RECYCLING_Volleys
    ##    Last.Name First.Name First.Name.Last.Name Last.Name.First.Name Height Gender
    ## 1     Brehme      Anton         Anton Brehme        Brehme, Anton   2.06   male
    ## 2      Carle   Timothée       Timothée Carle      Carle, Timothée   1.98   male
    ## 3    Dosanjh   Arshdeep     Arshdeep Dosanjh    Dosanjh, Arshdeep   2.05   male
    ## 4     Kessel       Cody          Cody Kessel         Kessel, Cody   1.97   male
    ## 5   Kowalski       Adam        Adam Kowalski       Kowalski, Adam   1.80   male
    ## 6   Krauchuk    Matheus     Matheus Krauchuk    Krauchuk, Matheus   2.01   male
    ## 7       Mote   Nehemiah        Nehemiah Mote       Mote, Nehemiah   2.03   male
    ## 8      Patch   Benjamin       Benjamin Patch      Patch, Benjamin   2.05   male
    ## 9  Ronkainen      Antti      Antti Ronkainen     Ronkainen, Antti   1.91   male
    ## 10    Schott      Ruben         Ruben Schott        Schott, Ruben   1.92   male
    ## 11    Sotola      Marek         Marek Sotola        Sotola, Marek   2.08   male
    ## 12     Tille   Johannes       Johannes Tille      Tille, Johannes   1.84   male
    ## 13  Trinidad      Ángel       Ángel Trinidad      Trinidad, Ángel   1.92   male
    ## 14    Tsuiki    Satoshi       Satoshi Tsuiki      Tsuiki, Satoshi   1.74   male
    ## 15  ?talekar       Sa?o        Sa?o ?talekar       ?talekar, Sa?o   2.14   male
    ## 16     Enard     Cédric         Cédric Enard        Enard, Cédric     NA   male
    ##    Date.of.Birth Jersey.Number                    Nationality        Position
    ## 1     10.08.1999             8                    Deutschland  middle blocker
    ## 2     30.11.1995             9                     Frankreich  outside hitter
    ## 3     30.07.1996             4                     Australien          setter
    ## 4     03.12.1991            11 Vereinigte Staaten von Amerika  outside hitter
    ## 5     16.09.1994             1                          Polen          libero
    ## 6     04.11.1997            18                      Brasilien opposite hitter
    ## 7     21.06.1993             5                     Australien  middle blocker
    ## 8     21.06.1994            16 Vereinigte Staaten von Amerika opposite hitter
    ## 9     11.08.1996             3                       Finnland  outside hitter
    ## 10    08.07.1994            13                    Deutschland  outside hitter
    ## 11    05.11.1999            17          Tschechische Republik opposite hitter
    ## 12    07.05.1997             6                    Deutschland          setter
    ## 13    27.03.1993            10                          Spain          setter
    ## 14    16.01.1992             2                          Japan          libero
    ## 15    03.05.1996            12                      Slowenien  middle blocker
    ## 16    20.03.1976            NA                     Frankreich      head coach
    ## 
    ## $`roster_Energiequelle_Netzhoppers_KW-Bestensee`
    ##      Last.Name     First.Name     First.Name.Last.Name
    ## 1    Barsemian Raymond Sarkis Raymond Sarkis Barsemian
    ## 2      Baumann          Felix            Felix Baumann
    ## 3       Berger      Gian-Luca         Gian-Luca Berger
    ## 4  Chamberlain            Max          Max Chamberlain
    ## 5      Deweese          Randy            Randy Deweese
    ## 6      Eckardt         Moritz           Moritz Eckardt
    ## 7      Goralik        Yannick          Yannick Goralik
    ## 8    Keturakis          Byron          Byron Keturakis
    ## 9       Presho          Kyler             Kyler Presho
    ## 10  Schmidgall          Mario         Mario Schmidgall
    ## 11      Schulz            Max               Max Schulz
    ## 12  Timmermann           Theo          Theo Timmermann
    ## 13    Westphal           Dirk            Dirk Westphal
    ## 14 Wasilkowski         Tomasz       Tomasz Wasilkowski
    ##         Last.Name.First.Name Height Gender Date.of.Birth Jersey.Number
    ## 1  Barsemian, Raymond Sarkis   1.98   male    13.09.1997             2
    ## 2             Baumann, Felix   2.01   male    07.03.2005            17
    ## 3          Berger, Gian-Luca   1.85   male    27.08.2002            16
    ## 4           Chamberlain, Max   2.00   male    24.02.1997             5
    ## 5             Deweese, Randy   2.01   male    05.06.1998            12
    ## 6            Eckardt, Moritz   1.85   male    15.06.2001            15
    ## 7           Goralik, Yannick   2.06   male    23.10.1997             4
    ## 8           Keturakis, Byron   2.00   male    11.01.1996             1
    ## 9              Presho, Kyler   2.03   male    08.08.1999            14
    ## 10         Schmidgall, Mario   2.06   male    02.05.1998             3
    ## 11               Schulz, Max   1.98   male    25.08.2002             9
    ## 12          Timmermann, Theo   1.90   male    14.09.1996            11
    ## 13            Westphal, Dirk   2.03   male    31.01.1986             8
    ## 14       Wasilkowski, Tomasz     NA   male    20.07.1983            NA
    ##                       Nationality        Position
    ## 1  Vereinigte Staaten von Amerika opposite hitter
    ## 2                     Deutschland  outside hitter
    ## 3                     Deutschland          libero
    ## 4  Vereinigte Staaten von Amerika  middle blocker
    ## 5                             USA opposite hitter
    ## 6                     Deutschland          libero
    ## 7                     Deutschland  middle blocker
    ## 8                          Kanada          setter
    ## 9  Vereinigte Staaten von Amerika  middle blocker
    ## 10                    Deutschland          setter
    ## 11                    Deutschland  outside hitter
    ## 12                    Deutschland opposite hitter
    ## 13                    Deutschland  outside hitter
    ## 14                         Poland      head coach
    ## 
    ## $roster_Helios_GRIZZLYS_Giesen
    ##             Last.Name       First.Name                First.Name.Last.Name
    ## 1           Baxpöhler             Noah                      Noah Baxpöhler
    ## 2              Colito   Augusto Renato               Augusto Renato Colito
    ## 3           Engelmann      Linus Jonas               Linus Jonas Engelmann
    ## 4             Günthör            Jakob                       Jakob Günthör
    ## 5  Iribarne Fernandez Francisco Javier Francisco Javier Iribarne Fernandez
    ## 6              Ivanov            Fedor                        Fedor Ivanov
    ## 7           Karlitzek           Lorenz                    Lorenz Karlitzek
    ## 8              Köykkä    Voitto Aleksi                Voitto Aleksi Köykkä
    ## 9              Mantha   Jori Alexander               Jori Alexander Mantha
    ## 10             Röling              Jan                          Jan Röling
    ## 11          Seybering            David                     David Seybering
    ## 12             Wagner            Hauke                        Hauke Wagner
    ## 13              Stein           Itamar                        Itamar Stein
    ##                    Last.Name.First.Name Height Gender Date.of.Birth
    ## 1                       Baxpöhler, Noah   2.09   male    13.08.1993
    ## 2                Colito, Augusto Renato   1.96   male    23.01.1997
    ## 3                Engelmann, Linus Jonas   1.93   male    01.02.2002
    ## 4                        Günthör, Jakob   2.12   male    21.09.1995
    ## 5  Iribarne Fernandez, Francisco Javier   1.97   male    13.07.1998
    ## 6                         Ivanov, Fedor   1.95   male    01.12.2000
    ## 7                     Karlitzek, Lorenz   1.95   male    17.02.1999
    ## 8                 Köykkä, Voitto Aleksi   1.79   male    03.06.1999
    ## 9                Mantha, Jori Alexander   1.92   male    27.11.1992
    ## 10                          Röling, Jan   1.89   male    15.09.1999
    ## 11                     Seybering, David   2.04   male    19.12.1995
    ## 12                        Wagner, Hauke   1.98   male    30.05.1987
    ## 13                        Stein, Itamar   1.99   male    12.02.1983
    ##    Jersey.Number Nationality        Position
    ## 1             18 Deutschland  middle blocker
    ## 2              1     Spanien opposite hitter
    ## 3             11 Deutschland  outside hitter
    ## 4             12 Deutschland  middle blocker
    ## 5              4     Spanien  outside hitter
    ## 6             13     Finland          setter
    ## 7             15 Deutschland  outside hitter
    ## 8              9    Finnland          libero
    ## 9              3      Kanada  outside hitter
    ## 10            10 Deutschland          setter
    ## 11             8 Deutschland  middle blocker
    ## 12             5 Deutschland opposite hitter
    ## 13            NA      Israel      head coach
    ## 
    ## $roster_SVG_Lüneburg
    ##      Last.Name            First.Name             First.Name.Last.Name
    ## 1        B?hme           Yann Niclas                Yann Niclas B?hme
    ## 2       Cowell           Colton Mark               Colton Mark Cowell
    ## 3      Eshenko               Pearson                  Pearson Eshenko
    ## 4        Ewert                Jordan                     Jordan Ewert
    ## 5       Gerken                Hannes                    Hannes Gerken
    ## 6   Ketrzynski Xander Wolf Wassenaar Xander Wolf Wassenaar Ketrzynski
    ## 7        Maase                 Lukas                      Lukas Maase
    ## 8    Mohwinkel                  Theo                   Theo Mohwinkel
    ## 9    Schnitzer          Jordan Ralph           Jordan Ralph Schnitzer
    ## 10 van de Kamp                  Auke                 Auke van de Kamp
    ## 11     Worsley           Gage Thomas              Gage Thomas Worsley
    ## 12     Worsley                Joseph                   Joseph Worsley
    ## 13      Hübner                Stefan                    Stefan Hübner
    ##                 Last.Name.First.Name Height Gender Date.of.Birth Jersey.Number
    ## 1                 B?hme, Yann Niclas   2.04   male    02.08.1997            10
    ## 2                Cowell, Colton Mark   1.85   male    04.03.1997            17
    ## 3                   Eshenko, Pearson   2.04   male    16.10.1997             2
    ## 4                      Ewert, Jordan   1.94   male    18.03.1997             4
    ## 5                     Gerken, Hannes   1.87   male    29.05.1998             9
    ## 6  Ketrzynski, Xander Wolf Wassenaar   2.08   male    27.01.2000            11
    ## 7                       Maase, Lukas   2.12   male    28.08.1998            12
    ## 8                    Mohwinkel, Theo   1.96   male    22.11.2002             8
    ## 9            Schnitzer, Jordan Ralph   1.98   male    28.07.1999            16
    ## 10                 van de Kamp, Auke   2.02   male    31.07.1995             5
    ## 11              Worsley, Gage Thomas   1.88   male    21.10.1998             6
    ## 12                   Worsley, Joseph   1.85   male    16.06.1997             1
    ## 13                    Hübner, Stefan   2.00   male    13.06.1975            NA
    ##                       Nationality        Position
    ## 1                     Deutschland opposite hitter
    ## 2  Vereinigte Staaten von Amerika  outside hitter
    ## 3                          Canada  middle blocker
    ## 4  Vereinigte Staaten von Amerika  outside hitter
    ## 5                     Deutschland          setter
    ## 6                          Kanada  middle blocker
    ## 7                     Deutschland opposite hitter
    ## 8                     Deutschland          libero
    ## 9                          Kanada  middle blocker
    ## 10                        Holland  outside hitter
    ## 11 Vereinigte Staaten von Amerika          libero
    ## 12                            USA          setter
    ## 13                    Deutschland      head coach
    ## 
    ## $roster_SWD_powervolleys_Düren
    ##            Last.Name    First.Name    First.Name.Last.Name
    ## 1             Andrae         Björn            Björn Andrae
    ## 2             Andrei       Michael          Michael Andrei
    ## 3            Batanov          Ivan            Ivan Batanov
    ## 4          Bernsmann           Leo           Leo Bernsmann
    ## 5              Brand        Tobias            Tobias Brand
    ## 6           Burggräf          Eric           Eric Burggräf
    ## 7        Ernastowicz        Marcin      Marcin Ernastowicz
    ## 8             Gevert     Sebastián        Sebastián Gevert
    ## 9               John         Filip              Filip John
    ## 10 Kocian-Falkenbach         Tomas Tomas Kocian-Falkenbach
    ## 11        Pettersson         David        David Pettersson
    ## 12             Röhrs Erik Johannes     Erik Johannes Röhrs
    ## 13             Urban          Melf              Melf Urban
    ## 14       van der Ent          Luuc        Luuc van der Ent
    ##        Last.Name.First.Name Height Gender Date.of.Birth Jersey.Number
    ## 1             Andrae, Björn   2.00   male    14.05.1981             8
    ## 2           Andrei, Michael   2.08   male    06.08.1985            11
    ## 3             Batanov, Ivan   1.85   male    25.04.2000             1
    ## 4            Bernsmann, Leo   1.87   male    14.07.2004            16
    ## 5             Brand, Tobias   1.95   male    09.07.1998            10
    ## 6            Burggräf, Eric   1.84   male    10.03.1999            12
    ## 7       Ernastowicz, Marcin   1.90   male    31.07.1997             9
    ## 8         Gevert, Sebastián   2.04   male    23.06.1988            13
    ## 9               John, Filip   2.04   male    01.08.2001             7
    ## 10 Kocian-Falkenbach, Tomas   1.92   male    27.03.1988            17
    ## 11        Pettersson, David   2.06   male    21.01.1994            14
    ## 12     Röhrs, Erik Johannes   2.01   male    24.04.2001             6
    ## 13              Urban, Melf   2.03   male    28.06.2001             4
    ## 14        van der Ent, Luuc   2.08   male    27.07.1998             5
    ##    Nationality        Position
    ## 1  Deutschland  outside hitter
    ## 2  Deutschland  middle blocker
    ## 3  Deutschland          libero
    ## 4  Deutschland          libero
    ## 5  Deutschland  outside hitter
    ## 6  Deutschland          setter
    ## 7        Polen  outside hitter
    ## 8        Chile opposite hitter
    ## 9  Deutschland opposite hitter
    ## 10 Deutschland          setter
    ## 11    Schweden  middle blocker
    ## 12 Deutschland  outside hitter
    ## 13 Deutschland  middle blocker
    ## 14     Holland  middle blocker
    ## 
    ## $roster_TSV_Haching_München
    ##        Last.Name      First.Name   First.Name.Last.Name    Last.Name.First.Name
    ## 1         Chefai         Mohamed         Mohamed Chefai         Chefai, Mohamed
    ## 2      Gehringer            Paul         Paul Gehringer         Gehringer, Paul
    ## 3       Gumenjuk            Mark          Mark Gumenjuk          Gumenjuk, Mark
    ## 4        Günther          Daniel         Daniel Günther         Günther, Daniel
    ## 5        Krenkel         Florian        Florian Krenkel        Krenkel, Florian
    ## 6  Mikuláss Koch         Marcell  Marcell Mikuláss Koch  Mikuláss Koch, Marcell
    ## 7       Paduretu            Eric          Eric Paduretu          Paduretu, Eric
    ## 8       Petrusic            Juro          Juro Petrusic          Petrusic, Juro
    ## 9      Rupprecht         Patrick      Patrick Rupprecht      Rupprecht, Patrick
    ## 10        Rösler Sebastian Lucas Sebastian Lucas Rösler Rösler, Sebastian Lucas
    ## 11      Schumann         Philipp       Philipp Schumann       Schumann, Philipp
    ## 12        Takano      Mika Kenji      Mika Kenji Takano      Takano, Mika Kenji
    ## 13     Katanovic            Adis         Adis Katanovic         Katanovic, Adis
    ## 14      Paduretu           Mihai         Mihai Paduretu         Paduretu, Mihai
    ## 15        Pochop       Stanislav       Stanislav Pochop       Pochop, Stanislav
    ## 16        Tanase          Bogdan          Bogdan Tanase          Tanase, Bogdan
    ##    Height Gender Date.of.Birth Jersey.Number             Nationality
    ## 1    1.90   male    13.09.1994            18                Tunesien
    ## 2    1.98   male    29.10.2000             4             Deutschland
    ## 3    1.96   male    24.01.2000            12             Deutschland
    ## 4    2.02   male    24.10.2005            10             Deutschland
    ## 5    1.93   male    17.02.2001             3             Deutschland
    ## 6    1.88   male    23.10.2002             1                  Ungarn
    ## 7    1.82   male    20.09.1999            17             Deutschland
    ## 8    1.97   male    22.05.2003            11             Deutschland
    ## 9    1.95   male    28.05.2003            15             Deutschland
    ## 10   1.97   male    02.11.2001            13             Deutschland
    ## 11   2.00   male    02.05.1993             5             Deutschland
    ## 12   1.80   male    03.05.2008             2             Deutschland
    ## 13   1.94   male    29.09.1977            NA Bosnien und Herzegowina
    ## 14   1.92   male    18.01.1967            NA             Deutschland
    ## 15   2.02   male    19.09.1966            NA   Tschechische Republik
    ## 16     NA   male    07.07.1981            NA                Rumänien
    ##           Position
    ## 1           libero
    ## 2   middle blocker
    ## 3   middle blocker
    ## 4   middle blocker
    ## 5   outside hitter
    ## 6           setter
    ## 7           setter
    ## 8  opposite hitter
    ## 9   outside hitter
    ## 10  middle blocker
    ## 11 opposite hitter
    ## 12          libero
    ## 13      head coach
    ## 14      head coach
    ## 15      head coach
    ## 16      head coach
    ## 
    ## $roster_VCO_Berlin
    ##     Last.Name   First.Name    First.Name.Last.Name     Last.Name.First.Name
    ## 1  Amedegnato Djifa Julien Djifa Julien Amedegnato Amedegnato, Djifa Julien
    ## 2     Baumann        Felix           Felix Baumann           Baumann, Felix
    ## 3     Eckardt       Marius          Marius Eckardt          Eckardt, Marius
    ## 4      Hemmer        Felix            Felix Hemmer            Hemmer, Felix
    ## 5   Homberger        Lovis         Lovis Homberger         Homberger, Lovis
    ## 6        Jung        Anton              Anton Jung              Jung, Anton
    ## 7        Jung       Fabian             Fabian Jung             Jung, Fabian
    ## 8      Kirsch     Benjamin         Benjamin Kirsch         Kirsch, Benjamin
    ## 9       Klehm Karl-Lennart      Karl-Lennart Klehm      Klehm, Karl-Lennart
    ## 10  Kunstmann       Joscha        Joscha Kunstmann        Kunstmann, Joscha
    ## 11     Kvrzic        Milan            Milan Kvrzic            Kvrzic, Milan
    ## 12      König   Maximilian        Maximilian König        König, Maximilian
    ## 13     Möller         Carl             Carl Möller             Möller, Carl
    ## 14     Nissen   Maximilian       Maximilian Nissen       Nissen, Maximilian
    ## 15      Türpe          Tim               Tim Türpe               Türpe, Tim
    ## 16     Welsch      Laurenz          Laurenz Welsch          Welsch, Laurenz
    ## 17    Wiesner       Jannes          Jannes Wiesner          Wiesner, Jannes
    ## 18      Ilott  Daniel John       Daniel John Ilott       Ilott, Daniel John
    ##    Height Gender Date.of.Birth Jersey.Number Nationality        Position
    ## 1    1.98   male    17.09.2003             1 Deutschland          setter
    ## 2    2.01   male    07.03.2005             2 Deutschland  outside hitter
    ## 3    1.82   male    02.09.2003            10 Deutschland          libero
    ## 4    1.96   male    25.06.2004            14 Deutschland opposite hitter
    ## 5    2.04   male    11.02.2004             5 Deutschland opposite hitter
    ## 6    1.99   male    20.03.2003             8 Deutschland  outside hitter
    ## 7    1.99   male    03.06.2003            13 Deutschland  middle blocker
    ## 8    2.04   male    03.04.2006            14 Deutschland  middle blocker
    ## 9    2.00   male    25.07.2003             9 Deutschland  middle blocker
    ## 10   2.00   male    20.07.2003            11 Deutschland opposite hitter
    ## 11   1.93   male    16.05.2004             4 Deutschland          setter
    ## 12   2.00   male    15.01.2005             3 Deutschland  middle blocker
    ## 13   2.07   male    26.01.2004             7 Deutschland  middle blocker
    ## 14   2.06   male    06.01.2003             6 Deutschland  outside hitter
    ## 15   1.77   male    28.07.2005            18 Deutschland          libero
    ## 16   1.95   male    20.06.2003            12 Deutschland          libero
    ## 17   1.96   male    18.07.2003            17 Deutschland  outside hitter
    ## 18     NA   male    27.01.1975            NA  Australien      head coach
    ## 
    ## $roster_VfB_Friedrichshafen
    ##            Last.Name   First.Name           First.Name.Last.Name
    ## 1               Bann        Blair                     Blair Bann
    ## 2            Biernat      Mateusz                Mateusz Biernat
    ## 3              Brown        Andre                    Andre Brown
    ## 4              Böhme       Marcus                   Marcus Böhme
    ## 5              Cacic        Vojin                    Vojin Cacic
    ## 6               Kohn        Simon                     Simon Kohn
    ## 7  Martinez Palacios Miguel Angel Miguel Angel Martinez Palacios
    ## 8        Nedeljkovic   Aleksandar         Aleksandar Nedeljkovic
    ## 9            Pekovic       Nikola                 Nikola Pekovic
    ## 10             Peter          Tim                      Tim Peter
    ## 11          Superlak       Michal                Michal Superlak
    ## 12          Vicentin      Luciano               Luciano Vicentin
    ## 13            Vincic        Dejan                   Dejan Vincic
    ## 14             ?tern         ?iga                     ?iga ?tern
    ## 15           Lebedew         Mark                   Mark Lebedew
    ##               Last.Name.First.Name Height Gender Date.of.Birth Jersey.Number
    ## 1                      Bann, Blair   1.95   male    26.02.1988             8
    ## 2                 Biernat, Mateusz   1.95   male    19.05.1992             5
    ## 3                     Brown, Andre   2.06   male    24.08.1990            18
    ## 4                    Böhme, Marcus   2.12   male    25.08.1985            11
    ## 5                     Cacic, Vojin   2.02   male    31.03.1990            13
    ## 6                      Kohn, Simon   1.90   male    05.08.2004            16
    ## 7  Martinez Palacios, Miguel Angel   2.00   male    23.10.2003            17
    ## 8          Nedeljkovic, Aleksandar   2.07   male    27.10.1997             1
    ## 9                  Pekovic, Nikola   1.76   male    06.03.1990            10
    ## 10                      Peter, Tim   1.97   male    08.09.1997             4
    ## 11                Superlak, Michal   2.06   male    16.11.1993             6
    ## 12               Vicentin, Luciano   1.97   male    04.04.2000             7
    ## 13                   Vincic, Dejan   2.02   male    15.09.1986             9
    ## 14                     ?tern, ?iga   1.93   male    02.01.1994            14
    ## 15                   Lebedew, Mark   0.00   male    06.05.1967            NA
    ##    Nationality        Position
    ## 1       Kanada          libero
    ## 2        Polen          setter
    ## 3       Kanada  middle blocker
    ## 4  Deutschland  middle blocker
    ## 5   Montenegro  outside hitter
    ## 6  Deutschland          libero
    ## 7    Kolumbien opposite hitter
    ## 8      Serbien  middle blocker
    ## 9       Serbia          libero
    ## 10 Deutschland  outside hitter
    ## 11       Polen opposite hitter
    ## 12 Argentinien  outside hitter
    ## 13    Slovenia          setter
    ## 14   Slowenien  outside hitter
    ## 15  Australien      head coach
    ## 
    ## $roster_WWK_Volleys_Herrsching
    ##   Last.Name First.Name First.Name.Last.Name Last.Name.First.Name Height Gender
    ## 1    Brandt    Severin       Severin Brandt      Brandt, Severin   1.85   male
    ## 2  Dustinac       Enes        Enes Dustinac       Dustinac, Enes   2.05   male
    ## 3  Engemann    Norbert     Norbert Engemann    Engemann, Norbert   2.01   male
    ## 4    Graven    Leonard       Leonard Graven      Graven, Leonard   1.80   male
    ## 5      Ilic    Djordje         Djordje Ilic        Ilic, Djordje   2.08   male
    ## 6  Kaminski      Jonas       Jonas Kaminski      Kaminski, Jonas   1.96   male
    ## 7     Tille  Ferdinand      Ferdinand Tille     Tille, Ferdinand   1.85   male
    ## 8    Welsch    Laurenz       Laurenz Welsch      Welsch, Laurenz   1.95   male
    ## 9    Ranner     Thomas        Thomas Ranner       Ranner, Thomas   2.03   male
    ##   Date.of.Birth Jersey.Number Nationality        Position
    ## 1    06.02.2004            13 Deutschland          setter
    ## 2    05.02.1992             5      Serbia  middle blocker
    ## 3    17.09.1997            10 Deutschland  middle blocker
    ## 4    22.04.2004            17 Deutschland          libero
    ## 5    23.09.1994             1     Serbien  middle blocker
    ## 6    08.05.1996             8 Deutschland opposite hitter
    ## 7    08.12.1988             7 Deutschland          libero
    ## 8    20.06.2003            12 Deutschland  outside hitter
    ## 9    31.07.1987            NA Deutschland      head coach

    str(all_rosters_clean)

    ## List of 9
    ##  $ roster_BERLIN_RECYCLING_Volleys              :'data.frame':   16 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:16] "Brehme" "Carle" "Dosanjh" "Kessel" ...
    ##   ..$ First.Name          : chr [1:16] "Anton" "Timothée" "Arshdeep" "Cody" ...
    ##   ..$ First.Name.Last.Name: chr [1:16] "Anton Brehme" "Timothée Carle" "Arshdeep Dosanjh" "Cody Kessel" ...
    ##   ..$ Last.Name.First.Name: chr [1:16] "Brehme, Anton" "Carle, Timothée" "Dosanjh, Arshdeep" "Kessel, Cody" ...
    ##   ..$ Height              : num [1:16] 2.06 1.98 2.05 1.97 1.8 2.01 2.03 2.05 1.91 1.92 ...
    ##   ..$ Gender              : chr [1:16] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:16] "10.08.1999" "30.11.1995" "30.07.1996" "03.12.1991" ...
    ##   ..$ Jersey.Number       : int [1:16] 8 9 4 11 1 18 5 16 3 13 ...
    ##   ..$ Nationality         : chr [1:16] "Deutschland" "Frankreich" "Australien" "Vereinigte Staaten von Amerika" ...
    ##   ..$ Position            : chr [1:16] "middle blocker" "outside hitter" "setter" "outside hitter" ...
    ##  $ roster_Energiequelle_Netzhoppers_KW-Bestensee:'data.frame':   14 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:14] "Barsemian" "Baumann" "Berger" "Chamberlain" ...
    ##   ..$ First.Name          : chr [1:14] "Raymond Sarkis" "Felix" "Gian-Luca" "Max" ...
    ##   ..$ First.Name.Last.Name: chr [1:14] "Raymond Sarkis Barsemian" "Felix Baumann" "Gian-Luca Berger" "Max Chamberlain" ...
    ##   ..$ Last.Name.First.Name: chr [1:14] "Barsemian, Raymond Sarkis" "Baumann, Felix" "Berger, Gian-Luca" "Chamberlain, Max" ...
    ##   ..$ Height              : num [1:14] 1.98 2.01 1.85 2 2.01 1.85 2.06 2 2.03 2.06 ...
    ##   ..$ Gender              : chr [1:14] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:14] "13.09.1997" "07.03.2005" "27.08.2002" "24.02.1997" ...
    ##   ..$ Jersey.Number       : int [1:14] 2 17 16 5 12 15 4 1 14 3 ...
    ##   ..$ Nationality         : chr [1:14] "Vereinigte Staaten von Amerika" "Deutschland" "Deutschland" "Vereinigte Staaten von Amerika" ...
    ##   ..$ Position            : chr [1:14] "opposite hitter" "outside hitter" "libero" "middle blocker" ...
    ##  $ roster_Helios_GRIZZLYS_Giesen                :'data.frame':   13 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:13] "Baxpöhler" "Colito" "Engelmann" "Günthör" ...
    ##   ..$ First.Name          : chr [1:13] "Noah" "Augusto Renato" "Linus Jonas" "Jakob" ...
    ##   ..$ First.Name.Last.Name: chr [1:13] "Noah Baxpöhler" "Augusto Renato Colito" "Linus Jonas Engelmann" "Jakob Günthör" ...
    ##   ..$ Last.Name.First.Name: chr [1:13] "Baxpöhler, Noah" "Colito, Augusto Renato" "Engelmann, Linus Jonas" "Günthör, Jakob" ...
    ##   ..$ Height              : num [1:13] 2.09 1.96 1.93 2.12 1.97 1.95 1.95 1.79 1.92 1.89 ...
    ##   ..$ Gender              : chr [1:13] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:13] "13.08.1993" "23.01.1997" "01.02.2002" "21.09.1995" ...
    ##   ..$ Jersey.Number       : int [1:13] 18 1 11 12 4 13 15 9 3 10 ...
    ##   ..$ Nationality         : chr [1:13] "Deutschland" "Spanien" "Deutschland" "Deutschland" ...
    ##   ..$ Position            : chr [1:13] "middle blocker" "opposite hitter" "outside hitter" "middle blocker" ...
    ##  $ roster_SVG_Lüneburg                          :'data.frame':   13 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:13] "B?hme" "Cowell" "Eshenko" "Ewert" ...
    ##   ..$ First.Name          : chr [1:13] "Yann Niclas" "Colton Mark" "Pearson" "Jordan" ...
    ##   ..$ First.Name.Last.Name: chr [1:13] "Yann Niclas B?hme" "Colton Mark Cowell" "Pearson Eshenko" "Jordan Ewert" ...
    ##   ..$ Last.Name.First.Name: chr [1:13] "B?hme, Yann Niclas" "Cowell, Colton Mark" "Eshenko, Pearson" "Ewert, Jordan" ...
    ##   ..$ Height              : num [1:13] 2.04 1.85 2.04 1.94 1.87 2.08 2.12 1.96 1.98 2.02 ...
    ##   ..$ Gender              : chr [1:13] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:13] "02.08.1997" "04.03.1997" "16.10.1997" "18.03.1997" ...
    ##   ..$ Jersey.Number       : int [1:13] 10 17 2 4 9 11 12 8 16 5 ...
    ##   ..$ Nationality         : chr [1:13] "Deutschland" "Vereinigte Staaten von Amerika" "Canada" "Vereinigte Staaten von Amerika" ...
    ##   ..$ Position            : chr [1:13] "opposite hitter" "outside hitter" "middle blocker" "outside hitter" ...
    ##  $ roster_SWD_powervolleys_Düren                :'data.frame':   14 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:14] "Andrae" "Andrei" "Batanov" "Bernsmann" ...
    ##   ..$ First.Name          : chr [1:14] "Björn" "Michael" "Ivan" "Leo" ...
    ##   ..$ First.Name.Last.Name: chr [1:14] "Björn Andrae" "Michael Andrei" "Ivan Batanov" "Leo Bernsmann" ...
    ##   ..$ Last.Name.First.Name: chr [1:14] "Andrae, Björn" "Andrei, Michael" "Batanov, Ivan" "Bernsmann, Leo" ...
    ##   ..$ Height              : num [1:14] 2 2.08 1.85 1.87 1.95 1.84 1.9 2.04 2.04 1.92 ...
    ##   ..$ Gender              : chr [1:14] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:14] "14.05.1981" "06.08.1985" "25.04.2000" "14.07.2004" ...
    ##   ..$ Jersey.Number       : int [1:14] 8 11 1 16 10 12 9 13 7 17 ...
    ##   ..$ Nationality         : chr [1:14] "Deutschland" "Deutschland" "Deutschland" "Deutschland" ...
    ##   ..$ Position            : chr [1:14] "outside hitter" "middle blocker" "libero" "libero" ...
    ##  $ roster_TSV_Haching_München                   :'data.frame':   16 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:16] "Chefai" "Gehringer" "Gumenjuk" "Günther" ...
    ##   ..$ First.Name          : chr [1:16] "Mohamed" "Paul" "Mark" "Daniel" ...
    ##   ..$ First.Name.Last.Name: chr [1:16] "Mohamed Chefai" "Paul Gehringer" "Mark Gumenjuk" "Daniel Günther" ...
    ##   ..$ Last.Name.First.Name: chr [1:16] "Chefai, Mohamed" "Gehringer, Paul" "Gumenjuk, Mark" "Günther, Daniel" ...
    ##   ..$ Height              : num [1:16] 1.9 1.98 1.96 2.02 1.93 1.88 1.82 1.97 1.95 1.97 ...
    ##   ..$ Gender              : chr [1:16] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:16] "13.09.1994" "29.10.2000" "24.01.2000" "24.10.2005" ...
    ##   ..$ Jersey.Number       : int [1:16] 18 4 12 10 3 1 17 11 15 13 ...
    ##   ..$ Nationality         : chr [1:16] "Tunesien" "Deutschland" "Deutschland" "Deutschland" ...
    ##   ..$ Position            : chr [1:16] "libero" "middle blocker" "middle blocker" "middle blocker" ...
    ##  $ roster_VCO_Berlin                            :'data.frame':   18 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:18] "Amedegnato" "Baumann" "Eckardt" "Hemmer" ...
    ##   ..$ First.Name          : chr [1:18] "Djifa Julien" "Felix" "Marius" "Felix" ...
    ##   ..$ First.Name.Last.Name: chr [1:18] "Djifa Julien Amedegnato" "Felix Baumann" "Marius Eckardt" "Felix Hemmer" ...
    ##   ..$ Last.Name.First.Name: chr [1:18] "Amedegnato, Djifa Julien" "Baumann, Felix" "Eckardt, Marius" "Hemmer, Felix" ...
    ##   ..$ Height              : num [1:18] 1.98 2.01 1.82 1.96 2.04 1.99 1.99 2.04 2 2 ...
    ##   ..$ Gender              : chr [1:18] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:18] "17.09.2003" "07.03.2005" "02.09.2003" "25.06.2004" ...
    ##   ..$ Jersey.Number       : int [1:18] 1 2 10 14 5 8 13 14 9 11 ...
    ##   ..$ Nationality         : chr [1:18] "Deutschland" "Deutschland" "Deutschland" "Deutschland" ...
    ##   ..$ Position            : chr [1:18] "setter" "outside hitter" "libero" "opposite hitter" ...
    ##  $ roster_VfB_Friedrichshafen                   :'data.frame':   15 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:15] "Bann" "Biernat" "Brown" "Böhme" ...
    ##   ..$ First.Name          : chr [1:15] "Blair" "Mateusz" "Andre" "Marcus" ...
    ##   ..$ First.Name.Last.Name: chr [1:15] "Blair Bann" "Mateusz Biernat" "Andre Brown" "Marcus Böhme" ...
    ##   ..$ Last.Name.First.Name: chr [1:15] "Bann, Blair" "Biernat, Mateusz" "Brown, Andre" "Böhme, Marcus" ...
    ##   ..$ Height              : num [1:15] 1.95 1.95 2.06 2.12 2.02 1.9 2 2.07 1.76 1.97 ...
    ##   ..$ Gender              : chr [1:15] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:15] "26.02.1988" "19.05.1992" "24.08.1990" "25.08.1985" ...
    ##   ..$ Jersey.Number       : int [1:15] 8 5 18 11 13 16 17 1 10 4 ...
    ##   ..$ Nationality         : chr [1:15] "Kanada" "Polen" "Kanada" "Deutschland" ...
    ##   ..$ Position            : chr [1:15] "libero" "setter" "middle blocker" "middle blocker" ...
    ##  $ roster_WWK_Volleys_Herrsching                :'data.frame':   9 obs. of  10 variables:
    ##   ..$ Last.Name           : chr [1:9] "Brandt" "Dustinac" "Engemann" "Graven" ...
    ##   ..$ First.Name          : chr [1:9] "Severin" "Enes" "Norbert" "Leonard" ...
    ##   ..$ First.Name.Last.Name: chr [1:9] "Severin Brandt" "Enes Dustinac" "Norbert Engemann" "Leonard Graven" ...
    ##   ..$ Last.Name.First.Name: chr [1:9] "Brandt, Severin" "Dustinac, Enes" "Engemann, Norbert" "Graven, Leonard" ...
    ##   ..$ Height              : num [1:9] 1.85 2.05 2.01 1.8 2.08 1.96 1.85 1.95 2.03
    ##   ..$ Gender              : chr [1:9] "male" "male" "male" "male" ...
    ##   ..$ Date.of.Birth       : chr [1:9] "06.02.2004" "05.02.1992" "17.09.1997" "22.04.2004" ...
    ##   ..$ Jersey.Number       : int [1:9] 13 5 10 17 1 8 7 12 NA
    ##   ..$ Nationality         : chr [1:9] "Deutschland" "Serbia" "Deutschland" "Deutschland" ...
    ##   ..$ Position            : chr [1:9] "setter" "middle blocker" "middle blocker" "libero" ...

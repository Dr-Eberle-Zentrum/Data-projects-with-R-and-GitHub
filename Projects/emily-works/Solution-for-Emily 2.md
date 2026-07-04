# Distribution of Speakers Time in Lord of the Rings

Lord of the Rings is a fantasy novel trilogy written by J.R.R. Tolkien.
Until today, it is one of the most popular and influential works of
fantasy literature, and has been adapted into several films, video
games, and other media. The story follows a group of characters as they
embark on a quest to destroy a powerful ring that has the potential to
enslave the world.

In this analysis, we will explore the distribution of speakers time in
Lord of the Rings. For that, not the minutes of speaking in the movies,
but the number of words spoken by each character in the three books will
be used as a proxy for the time spent speaking (with some tweaking to
include movie-only characters). This is due to practical reasons (data
availability), as well as the fact that the movies are an adaption of
the three books, making the novels the source material. We will analyze
the amount of time each character spends speaking in the novel, and how
it is distributed among the different characters.

This analysis will help us understand which characters have the most
dialogue and how the speaking time is distributed among the characters
in the story. We will also explore any patterns or trends in the
distribution of speakers time, and how it may relate to the overall
narrative of the novel. This also in light of the gender representation
in the novel, as the movies are often criticized for their lack of
diverse representation, like not passing the [Bechdel-Wallace
Test](https://bechdeltest.com).

------------------------------------------------------------------------

## Data

The data used for this analysis will consist of two datasets.

### Words by Character

This dataset is concerned with the number of words spoken contains the
number of words spoken by each character in all three volumes of Lord of
the Rings. The dataset was created by counting the number of words
spoken by each character in the novels, and is available in the project
folder under the name `WordsByCharacter.csv`.

The creator of this dataset is **Mukund Raghav Sharma (MokoSan)** (on
GitHub). All information about it, as well as the original dataset can
be found here:
<https://github.com/MokoSan/FSharpAdvent/blob/master/Data>.

The data is organized in a tabular format, with each row representing a
character and the number of words they spoke in a particular chapter of
the novel. The columns include the name of the film (book), the chapter,
the character’s name, race and the number of words spoken by them:

<table>
<colgroup>
<col style="width: 41%" />
<col style="width: 20%" />
<col style="width: 16%" />
<col style="width: 11%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;">Film</th>
<th style="text-align: center;">Chapter</th>
<th style="text-align: center;">Character</th>
<th style="text-align: center;">Race</th>
<th style="text-align: center;">Words</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">The Fellowship of the Ring</td>
<td style="text-align: center;">01: Prologue</td>
<td style="text-align: center;">Bilbo</td>
<td style="text-align: center;">Hobbit</td>
<td style="text-align: center;">4</td>
</tr>
<tr>
<td style="text-align: center;">The Fellowship of the Ring</td>
<td style="text-align: center;">01: Prologue</td>
<td style="text-align: center;">Elrond</td>
<td style="text-align: center;">Elf</td>
<td style="text-align: center;">5</td>
</tr>
<tr>
<td style="text-align: center;">The Fellowship of the Ring</td>
<td style="text-align: center;">01: Prologue</td>
<td style="text-align: center;">Galadriel</td>
<td style="text-align: center;">Elf</td>
<td style="text-align: center;">460</td>
</tr>
</tbody>
</table>

The columns are defined as follows:

-   **Film**: The name of the individual novel (The Fellowship of the
    Ring, The Two Towers, The Return of the King).
-   **Chapter**: The chapter of the specified novel in which the
    character speaks.
-   **Character**: The name of the character who speaks.
-   **Race**: The race (species) of the specified character.
-   **Words**: The number of words spoken by the specified character in
    the specified chapter within the specified book.

### Character Information

The second dataset contains information about the characters in Lord of
the Rings, including their name, race, gender and realm.

The dataset is available in the project folder under the name
`InformationByCharacter.csv`. The creator of this dataset is me, Emily.
The data was collected and compiled by me, based on information from the
novels and other sources, such as the LOTR-Wiki.

The data is organized in a tabular format, with each row representing a
character:

<table>
<thead>
<tr>
<th style="text-align: center;">Character</th>
<th style="text-align: center;">Race</th>
<th style="text-align: center;">Gender</th>
<th style="text-align: center;">Realm</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Aragorn</td>
<td style="text-align: center;">Men</td>
<td style="text-align: center;">Male</td>
<td style="text-align: center;">Gondor</td>
</tr>
<tr>
<td style="text-align: center;">Arwen</td>
<td style="text-align: center;">Elf</td>
<td style="text-align: center;">Female</td>
<td style="text-align: center;">Rivendell</td>
</tr>
<tr>
<td style="text-align: center;">Bilbo</td>
<td style="text-align: center;">Hobbit</td>
<td style="text-align: center;">Male</td>
<td style="text-align: center;">The Shire</td>
</tr>
</tbody>
</table>

The columns are defined as follows:

-   **Name**: The name of the specified character.
-   **Race**: The race (species) of the specified character.
-   **Gender**: The gender of the specified character.
-   **Realm**: The realm (location) of which the specified character is
    mainly associated with.

**Disclaimer**: The data used in this analysis is not official data, but
rather data that has been collected and compiled by fans of the Lord of
the Rings series (and me). Therefore, there may be inaccuracies or
inconsistencies in the data, and it should be interpreted with caution.
However, it is still a valuable resource for analyzing the
characteristics of speakers time in the novels.

------------------------------------------------------------------------

# Tasks

## 1. Data import

The first step in the analysis is to import the data from the two
datasets into R. As the data is split into two different files, we will
need to **import** both datasets and then **merge** them together based
on the **character’s name**. This will allow us to have all the relevant
information about each character in one dataset, which will make it
easier to analyze the distribution of speakers time.

Please note, that characters can appear **multiple times** in the
`WordsByCharacter` dataset, as they can speak in multiple chapters
across the three books. In the `InformationByCharacter` dataset, each
character appears only once, as it contains general information about
the characters.

Please check:

-   Has every piece of data been imported correctly? Please pay special
    attention to the `Realm` data, as it contains some special
    characters (e.g. “Lothlórien”).
-   Is every data record complete (no missing values)?
    -   If not, can the missing values be reasonably filled in
        (i.e. gender = “Unknown”?).
    -   The corresponding rows should **NOT** be removed.
-   Are there any inconsistencies in the data (e.g. different spellings
    of the same character’s name)?
    -   In the event of a mismatch in the `Character` or `Race` column
        between the two datasets, the corresponding rows should be
        merged based on the content of dataset 1 (`WordsByCharacter`).

<!-- -->

    library(tidyverse)

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.1     ✔ stringr   1.5.2
    ## ✔ ggplot2   4.0.0     ✔ tibble    3.3.0
    ## ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ## ✔ purrr     1.1.0     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

    words_data<-read_csv("WordsByCharacter.csv")

    ## Rows: 731 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (4): Film, Chapter, Character, Race
    ## dbl (1): Words
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    info_data<-read_csv("InformationByCharacter.csv", locale=locale(encoding="Windows-1252"))

    ## Rows: 74 Columns: 4
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (4): Character, Race, Gender, Realm
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ### nope it doesn't change to Lothlórien

    info_data<-read_csv("InformationByCharacter.csv", locale=locale(encoding="Windows-1252"))

    ## Rows: 74 Columns: 4
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (4): Character, Race, Gender, Realm
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    info_data<-info_data%>%mutate(Realm=case_when(Realm=="Lothl—rien"~"Lothlórien",TRUE~Realm))

    info_data%>%distinct(Realm)

    ## # A tibble: 18 × 1
    ##    Realm                
    ##    <chr>                
    ##  1 Gondor               
    ##  2 Rivendell            
    ##  3 The Shire            
    ##  4 Lothlórien           
    ##  5 <NA>                 
    ##  6 Ithilien             
    ##  7 Vales of Anduin      
    ##  8 Rohan                
    ##  9 Valinor              
    ## 10 Lonely Mountain      
    ## 11 Misty Mountains      
    ## 12 Mordor               
    ## 13 Bree                 
    ## 14 The Paths of the Dead
    ## 15 Mirkwood             
    ## 16 Isengard             
    ## 17 Fangorn              
    ## 18 Dunland

    sum(is.na(words_data))

    ## [1] 0

    sum(is.na(info_data))

    ## [1] 4

    info_data%>%
      filter(if_any(everything(),is.na))

    ## # A tibble: 3 × 4
    ##   Character         Race  Gender Realm   
    ##   <chr>             <chr> <chr>  <chr>   
    ## 1 Crowd             Men   Mixed  <NA>    
    ## 2 Uruk-hai          Orc   <NA>   Isengard
    ## 3 Voice Of The Ring Ainur <NA>   <NA>

    info_data <- info_data %>%
      mutate( Gender = replace_na(Gender, "Unknown"),
              Realm  = replace_na(Realm, "Unknown"))

    words_names <- unique(words_data$Character)

    info_names  <- unique(info_data$Character)

    setdiff(unique(words_data$Character), unique(info_data$Character))

    ## [1] "Boson"

    info_data$Character[info_data$Character=="Bosun"]<-"Boson"

    lotr_joined<- words_data %>%
      left_join(info_data,
        by = "Character")

    lotr_data<- lotr_joined %>%
      select(-Race.y) %>%
      rename(Race = Race.x)

## 2. Data Analysis & Visualization

Once the data is imported, we can begin analyzing the distribution of
speakers time.

### 2.1. Speakers Time by Volume

The first step is to calculate the total number of words spoken in each
of the three books. For that, create a new table that includes:

    words_spoken <- lotr_data %>%
      group_by(Film) %>%
      summarise( total_words = sum(Words))

    words_spoken

    ## # A tibble: 3 × 2
    ##   Film                       total_words
    ##   <chr>                            <dbl>
    ## 1 The Fellowship Of The Ring       11225
    ## 2 The Return Of The King            9575
    ## 3 The Two Towers                   11169

-   What is the total number of words spoken?

The Fellowship Of The Ring: 1.1225^{4} The Return Of The King: 9575 The
Two Towers: 1.1169^{4}

-   Which book has the highest number of words spoken?

Highest: The Fellowship Of The Ring

-   Which book has the lowest number of words spoken?

Lowest: The Return Of The King

Please visualize the distribution of the total number of words across
the three volumes, using a donut chart

    words_spoken<- lotr_data%>%
      group_by(Film)%>%
      summarise(total_words=sum(Words, na.rm=T), .groups="drop")



    library(ggplot2)

    p_donut<-words_spoken%>%
      mutate(percentage=total_words/sum(total_words)*100,label=paste0(round(percentage,2),"%"))%>%
      ggplot(aes(x=2,y=total_words,fill=Film))+
      geom_col()+
      geom_text(aes(label=label),position=position_stack(vjust=0.5))+
      coord_polar(theta="y")+
      xlim(0,2.5)+
      theme_void()+
      labs(fill="Books")
      annotate("text",x = 0,y = 0,label = "Number of Words by Volume")

    ## mapping: x = ~x, y = ~y 
    ## geom_text: na.rm = FALSE
    ## stat_identity: na.rm = FALSE
    ## position_identity

    p_donut

![](Solution-for-Emily_files/figure-markdown_strict/donut%20chart-1.png)

<figure>
<img src="donut%20chart-1.png" alt="Donut chart" />
<figcaption aria-hidden="true">Donut chart</figcaption>
</figure>



    ### 2.2. Speakers Time by Character



    The next step is to calculate the total number of words spoken by each character. This will allow us to analyze which characters have the most speaking time and which characters have the least speaking time. 

    #### 2.2.1. Total Speaking Time by Character across all 3 books
    At first, we will calculate the total number of words spoken by each character across all three books. For that create a new table that summarizes the total number of words across all volumes spoken by each character. 

    Please visualize this distribution using a **pie chart**, similar to the one below. 

    - Only show the **top 9 characters with the most speaking time**, and group all other characters into a single category.
    - The coloring of the pie chart should be based on the `Gender` of the characters, but each character should have a different shade of the color.
    - Use the `ggplot2` package for the visualization, and the `fct_lump()` function to group the characters with the least speaking time into the "other" category.

    _Make sure the percentages are included as labels, because otherwise the pie charts are practically unreadable_


    ``` r
    library(ggrepel)

    ## Warning: package 'ggrepel' was built under R version 4.5.3

    top9_data <- lotr_data %>%
      group_by(Character, Gender) %>%
      summarise(total_words = sum(Words, na.rm=TRUE),.groups="drop") %>%
      mutate(Character=fct_lump(Character,n=9, w=total_words, other_level="Other"),
      Gender=if_else(Character=="Other","Other",Gender)) %>%
      group_by(Character, Gender) %>% 
      summarise(total_words=sum(total_words),.groups="drop") %>%
      mutate(percentage=total_words/sum(total_words)*100,label=paste0(round(percentage,2),"%")) %>%
      arrange(desc(total_words))

    p_top9_books<-top9_data%>%
    mutate(label=paste0(round(percentage,1),"%"))%>%
    ggplot(aes(x="",y=total_words,fill=Character))+
      geom_col()+
      geom_text(aes(label=label),position=position_stack(vjust=0.5),size=2)+
      coord_polar(theta="y")+
      theme_void()+
      labs(title="Total Speaking Time by Character across all 3 books", fill="Characters")+
      scale_fill_manual(values=c(setNames(hcl.colors(sum(top9_data$Gender=="Male"),palette="Blues"),top9_data$Character[top9_data$Gender=="Male"]),"Other"="grey"))

    p_top9_books

![](Solution-for-Emily_files/figure-markdown_strict/top%209%20chart%20all%20three%20books-1.png)

#### 2.2.2. Total Speaking Time by Character for each individual book

Next we will calculate the total number of words spoken by each
character for each individual book. This will allow us to analyze how
the speaking time of each character is distributed across the three
books, and whether there are any changes in the speaking time of
characters across the different volumes.

Please visualize this distribution using **three (3) pie charts**,
similar to the one above.

-   Only show the **top 9 characters with the most speaking time**, and
    group all other characters into a single category.
-   The coloring of the pie chart should be based on the `Gender` of the
    characters, but each character should have a different shade of the
    color.
-   Use the `ggplot2` package for the visualization, and the
    `fct_lump()` function to group the characters with the least
    speaking time into the “other” category.

<!-- -->

    top9_by_book<-lotr_data%>%
    group_by(Film,Character,Gender)%>%
    summarise(total_words=sum(Words,na.rm=TRUE),.groups="drop")%>%
      group_by(Film)%>%
     mutate(Character=fct_lump(Character,n=9,w=total_words,other_level="Other"),Gender=if_else(Character=="Other","Other",Gender))%>%group_by(Film,Character,Gender)%>%
      summarise(total_words=sum(total_words),.groups="drop")%>%group_by(Film)%>%mutate(percentage=total_words/sum(total_words)*100,label=paste0(round(percentage,1),"%"))%>%ungroup()

    p_top9_by_book<-top9_by_book %>%
      ggplot(aes(x = "",y = percentage,fill = Character)) +
      geom_col() +
      geom_text(aes(label = label),position = position_stack(vjust = 0.5),size = 2) +
      facet_wrap(~Film) +
      coord_polar(theta = "y") +
      scale_fill_manual(values = c(
        setNames(hcl.colors(length(unique(top9_by_book$Character[top9_by_book$Gender == "Male"])),palette = "Blues"),
        unique(top9_by_book$Character[top9_by_book$Gender == "Male"])),
        setNames(hcl.colors(length(unique(top9_by_book$Character[top9_by_book$Gender == "Female"])),palette = "Reds"),
        unique(top9_by_book$Character[top9_by_book$Gender == "Female"])),"Other" = "grey"))+
      theme_void()
      
    p_top9_by_book

![](Solution-for-Emily_files/figure-markdown_strict/top%209%20by%20book%20chart-1.png)

### 2.3. Speakers Time of Frodo

Finally, we can analyze the speaking time of `Frodo`, the main character
of the story.

*A quick note on this task: This task has 3 subtasks, however all plots
that you are about to create should be generated as *ONE SINGLE
COMPOSITE PLOT**

#### 2.3.1. PIE CHART RIGHT: Speaking Time of Frodo across all 3 books

-   Calculate the total number of words spoken by Frodo across all three
    books.
    -   Compare his total number of words to the total number of words
        spoken by all characters.
    -   Visualize this in a pie chart, similar to the one below:

<!-- -->

    frodo_data<-data.frame(category=c("Frodo","Other"),
    words=c(sum(lotr_data$Words[lotr_data$Character=="Frodo"]),
            sum(lotr_data$Words[lotr_data$Character!="Frodo"])))%>%
    mutate(percent=words/sum(words)*100,label=paste0(category,"\n",round(percent,2),"%"))

    p_frodo_book<-frodo_data%>%ggplot(aes(x="",y=words,fill=category))+
      geom_col()+
      geom_text(aes(label=label),position=position_stack(vjust=0.5),size=2)+
      coord_polar(theta="y")+
      theme_void()+
      labs(title="Speaking Time of Frodo \n in all 3 books", fill="Character")+
      scale_fill_manual(values=c("Frodo"="Blue","Other"="Grey"))+
      theme(legend.position="none", plot.title=element_text(hjust=0.5,size=10))

#### 2.3.2. PIE CHART LEFT: Number of chapters in which Frodo speaks

-   Calculate the number of chapters in which Frodo speaks.
    -   Compare the number of chapters in which Frodo speaks to the
        total number of chapters in the three books.
    -   Visualize this in a pie chart, similar to the one below:

<!-- -->

    chapters_all<-lotr_data%>%
    distinct(Film,Chapter)%>%
    nrow()

    chapters_frodo<-lotr_data%>%
    filter(Character=="Frodo")%>%
    distinct(Film,Chapter)%>%
    nrow()

    chapters_piechart<-data.frame(category=c("Frodo","Other"),
    count=c(chapters_frodo,chapters_all-chapters_frodo))%>%
    mutate(percent=count/sum(count)*100,label=paste0(category,"\n",round(percent,2),"%"))

    p_frodo_chapters<-chapters_piechart%>%ggplot(aes(x="",y=count,fill=category))+
      geom_col()+
      geom_text(aes(label=label),position=position_stack(vjust=0.5))+
      coord_polar(theta="y")+
      theme_void()+
      labs(title="Number of Chapters  \n in which Frodo speaks", fill="Character")+
      scale_fill_manual(values=c("Frodo"="Blue","Other"="Grey"))+
      theme(legend.position="none", plot.title=element_text(hjust=0.5,size=10))

#### 2.3.2. STACKED BARPLOT TOP: Number of chapters in which Frodo speaks

-   Calculate the percentage of Frodo’s words in each chapter, compared
    to the total number of words spoken in that chapter.
    -   Visualize this in a stacked barplot, similar to the one below:

<!-- -->

    frodo_chapters<-lotr_data%>%
      group_by(Film,Chapter)%>%
      summarise(total_words=sum(Words),frodo_words=sum(Words[Character=="Frodo"]),.groups="drop")%>%
      mutate(
        frodo_percent=frodo_words/total_words*100,
        other_percent=100-frodo_percent)%>%
        arrange(Film)
        
    frodo_chapters

    ## # A tibble: 188 × 6
    ##    Film              Chapter total_words frodo_words frodo_percent other_percent
    ##    <chr>             <chr>         <dbl>       <dbl>         <dbl>         <dbl>
    ##  1 The Fellowship O… 01: Pr…         489           0          0            100  
    ##  2 The Fellowship O… 02: Co…         214           0          0            100  
    ##  3 The Fellowship O… 03: Th…         417         128         30.7           69.3
    ##  4 The Fellowship O… 04: Ve…         411           0          0            100  
    ##  5 The Fellowship O… 05: A …         423          32          7.57          92.4
    ##  6 The Fellowship O… 06: Fa…         330           0          0            100  
    ##  7 The Fellowship O… 07: Ke…          99          33         33.3           66.7
    ##  8 The Fellowship O… 08: Th…         124           0          0            100  
    ##  9 The Fellowship O… 09: At…         290          17          5.86          94.1
    ## 10 The Fellowship O… 10: Th…         797         139         17.4           82.6
    ## # ℹ 178 more rows

    ###r barplot data

    barplot_data<-bind_rows(
      frodo_chapters%>%
      transmute(Film,Chapter,category="Frodo",percent=frodo_percent),
      frodo_chapters%>%
      transmute(Film,Chapter,category="Other",percent=other_percent))

    p_frodo_bar<-barplot_data%>%ggplot(aes(x=Chapter,y=percent,fill=category))+
      geom_col()+
      facet_wrap(~Film)+
      labs(title="Percentage of Words Spoken by Frodo in each Chapter",x="Chapter",y="Percentage of Words")+
      scale_fill_manual(values=c("Frodo"="Blue","Other"="Grey"))+
      theme_minimal()

    ###I don't really know how they can look like the barchart example picture. Did I understand the task somehow wrong?

    library(patchwork)

    ## Warning: package 'patchwork' was built under R version 4.5.3

    plot_all<-p_frodo_bar / (p_frodo_chapters | p_frodo_book)

    plot_all

![](Solution-for-Emily_files/figure-markdown_strict/combine%20all%203%20charts-1.png)

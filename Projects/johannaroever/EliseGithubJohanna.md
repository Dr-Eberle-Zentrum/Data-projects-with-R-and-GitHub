# Read in and clean data

    data <- read.csv("Projects/johannaroever/StelaeCyprus.csv", 
                     sep = ";", 
                     header = TRUE,
                     na = c("unknown", "undefined"))

## Data modification

### 2. In `epoch` the value *antoninisch* should be replaced by *antonine* for using a consistent language.

    data %<>%
      mutate(epoch = str_replace(epoch, "antoninisch", "antonine"))

### 3. In the column `type`some values still include a “?” which should be deleted, since the information it was meant to convey is written in `typeCertain`.

    data %<>%
      mutate(type = str_replace_all(type, "\\?", ""))

### 4. For the stelae with the `catNo` = *98* and *99* the value of `type` has to be changed to *6*.

    data %<>%
      mutate(type = if_else(catNo == 98 | catNo == 99, "6", type))

### 5. The values in `typeCertain` are to be replaced for easier handling in R: *0* to *FALSE*, *1* to *TRUE*.

    data %<>%
      mutate(typeCertain = (typeCertain == 0))

### 6. The column `location` has to be reviewed for only containing the values of the general regions, while more specific information can be deleted:

    * _Amathus, Golgoi, Idalion, Kition, Marion/Paphos, Salamis, Soloi, Tamassos_
    * (1) All _unknown_ in this column can be converted to _Cyprus_. - CHECK
    * (2) All values which include "(?)" can be converted to _Cyprus_. - CHECK
    * (5) If the current value already includes one of the region names, shorten it to only that. This applies to values which include  "near", "bei"
    * (3) The value of the observation of `catNo`=_12_ which says "probably Idalion" should be changed to _Cyprus_.
    * (4) Other:
        * region of Limassol --> Amathus
        * Limassol --> Amathus
        * Mathikoloni --> Amathus  
        * Athienou --> Golgoi
        * Melousha --> Golgoi
        * Pergamon --> Golgoi  
        * Alambra (Larnaca) --> Kition
        * Pano Arodes --> Marion
        * Polis --> Marion  
        * Kotschines (neighbourhood of Lysi) --> Salamis
        * north of Lysi, district Famagusta --> Salamis    
        * Ambelia, near Morphou --> Soloi  
        * Pera (Asproji) --> Tamassos

    data %<>%
      mutate(location = if_else(location == "unknown", "Cyprus", location)) %>% # (1)
      mutate(location = if_else(str_detect(location, "\\?"), "Cyprus", location)) %>% # (2)
      mutate(location = if_else(location == "probably Idalion", "Cyprus", location)) %>% # (3)
      mutate(location = if_else(location == "region of Limassol" | location == "Limassol" | location == "Mathikoloni", "Amathus", location)) %>% # (4 ff.)
      mutate(location = if_else(location == "Athienou" | location == "Melousha" | location == "Pergamon", "Golgoi", location)) %>%
      mutate(location == if_else(location == "Alambra (Larnaca)", "Kition", location)) %>%
      mutate(location == if_else(location == "Pano Arodes" | location == "Polis", "Marion", location)) %>%
      mutate(location == if_else(location == "Kotschines (neighbourhood of Lysi)" | location == "north of Lysi, district Famagusta", "Salamis", location)) %>%
      mutate(location == if_else(location == "Ambelia, near Morphou", "Soloi", location)) %>%
      mutate(location == if_else(location == "Pera (Asproji", "Tamassos", location))

    data %<>% # (5 ff.)
      mutate(location = case_when(str_detect(location, "Golgoi") ~ "Golgoi",
                                  str_detect(location, "Tamassos") ~ "Tamassos",
                                  str_detect(location, "Marion") ~ "Marion",
                                  str_detect(location, "Amathus") ~ "Amathus",
                                  str_detect(location, "Idalion") ~ "Idalion",
                                  str_detect(location, "Salamis") ~ "Salamis",
                                  str_detect(location, "Salamiu") ~ "Salamis")
             )

even after this, there are some regions that are single, or I am not
sure where to put them - is this correct? Or do they belong to another
region?

### 7. For easier handling of `material` the values should just be reduced to either *limestone* or *marble*.

    data %<>%
      mutate(material = if_else(str_detect(material, "limestone"), "limestone", material)) %>%
      mutate(material = if_else(str_detect(material, "marble"), "marble", material))

# Visualization

## 1. Stacked bar plot epoch - type

### Table to show amount of type per epoch

    data$epoch <- factor(data$epoch, ordered = TRUE, 
                            levels = c("cypro-archaic", "cypro-classical", "hellenistic",
                                       "julian-claudian", "early_imperial", "flavian",
                                       "antonine"))
    data$type <- factor(data$type)
    data$epoch <- factor(data$epoch)
    levels(data$epoch)[6] <- "hellenistic-roman"

    knitr::kable(table(data$type, data$epoch))

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 14%" />
<col style="width: 16%" />
<col style="width: 12%" />
<col style="width: 16%" />
<col style="width: 9%" />
<col style="width: 18%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">cypro-archaic</th>
<th style="text-align: right;">cypro-classical</th>
<th style="text-align: right;">hellenistic</th>
<th style="text-align: right;">julian-claudian</th>
<th style="text-align: right;">antonine</th>
<th style="text-align: right;">hellenistic-roman</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">1a</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">1b</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">2a</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">2b</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">2c</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">3</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">13</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">4a</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">4b</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">5a</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">5b</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">6</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">not defined</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

### Stacked bar plot to show the correlation `epoch - type`:

-   How can you show a correlation with a bar plot?

<!-- -->

    typeData <- 
      distinct(data, type,typeDesc) %>% 
      replace_na(list(type = "NA", typeDesc = "unknown")) %>%
      arrange(type)

    data %<>% 
      mutate( type = factor(type, levels = typeData$type, labels = typeData$typeDesc))

    # make a color palette to be used
    my_colors <- viridis_pal()(13)
    my_colors[1] <- "#750786FF"
    my_colors[2] <- "#6D378CFF"

    ggplot(data, aes(x = epoch, fill = type)) +
      geom_bar() +
      labs(title = "Stacked Barplot",
           x = "epoch",
           fill = "type") +
      geom_text(stat = "count", aes(label = after_stat(count)), position = position_stack(vjust = 0.6), size = 2) +
      theme_minimal() + 
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_fill_manual(values = my_colors)

![](EliseGithubJohanna_files/figure-markdown_strict/unnamed-chunk-9-1.png)

## 2. Stacked barplot type - material

### Table to show amounts of each material per type

    knitr::kable(table(data$type, data$material))

<table>
<colgroup>
<col style="width: 78%" />
<col style="width: 12%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">limestone</th>
<th style="text-align: right;">marble</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Grave stelae with guard animals, crowned
by two sphinxes</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Wide symposium niche with high relief,
Fragment</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Symposium niche crowned by lion</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Double niche with symposium scene</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Wide symposium niche with high relief</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Niche stele</td>
<td style="text-align: right;">17</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Frameless, crowned with plant
ornamentation</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Frameless, narrow, mostly crowned with
anthemion</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
</tr>
<tr class="even">
<td style="text-align: left;">Naiskos stele</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">pseudo-naiskos stele</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">Cippus</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">not defined</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">1</td>
</tr>
</tbody>
</table>

### Stacked bar plot to show the correlation type - material

Also here: how can you see a correlation with a barplot?

    ggplot(data, aes(x = type, fill = material)) +
      geom_bar() +
      labs(title = "Stacked Barplot",
           x = "type",
           fill = "material") +
      geom_text(stat = "count", aes(label = after_stat(count)), position = position_stack(vjust = 0.6), size = 2) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

![](EliseGithubJohanna_files/figure-markdown_strict/unnamed-chunk-11-1.png)

-   do you really want the type on the x-axis? It looks a bit weird…
    would look nicer if material was on the x axis I think!

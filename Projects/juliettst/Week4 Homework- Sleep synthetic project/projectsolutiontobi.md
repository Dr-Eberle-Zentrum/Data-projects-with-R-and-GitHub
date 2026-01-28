---
title: "projectsolution"
output: html_document
---

# 1. Data import

Ich war erst mal völlig überfordert und konnte mit den Anweisung gar nichts
anfangen. Dann habe ich mich von Gabriel inspirieren lassen:
```{r setup, echo = FALSE}
library(ggplot2)
library(lubridate)
library(tidyverse)
```

```{r import}
files <- list.files(pattern = "^subject_.*\\.csv$")
all_subjects <- read_csv(files, id = "file_path")

PANAS <- read_csv("PANAS_scores.csv")
BDI   <- read_csv("BDI_scores.csv")
```
Jetzt kommt das Data cleaning:

```{r datacleaning}
# Spalten umbenennen:
all_subjects <- all_subjects %>%
  mutate(
    von = ymd_hms(von),
    bis = ymd_hms(bis)
  )
# Duplikate entfernen: 
all_subjects <- all_subjects %>%
  arrange(von, bis, participant, desc(Dauer.des.Schlafs..s.)) %>%
  distinct(von, bis, participant, .keep_all = TRUE)
# 
only_duplicates <- all_subjects %>%
  filter(duplicated(across(c(participant, von, bis)))) %>%
  arrange(von, bis, participant, desc(Dauer.des.Schlafs..s.))
```
Da only_duplicates keine Zeilen hat, sind keine Duplikate mehr vorhanden.

```{r datacleaning2}
all_subjects %>% count(is.na(all_subjects))
all_subjects <- all_subjects %>% 
  mutate(
    unplausible =
      ifelse(Dauer.des.Schlafs..s. > 57600 | Herzfrequenz..min. < 30 | Herzfrequenz..max. > 200, 1, 0) # no implausible values
  )
```

```{r datavalidation}
# Verfiy sleep duration:

all_subjects <- all_subjects %>%
  mutate(
    sleep_sum =`leicht..s.` +`tief..s.`+`rem..s.`+`wach..s.`,
    diff_secs = `Dauer.des.Schlafs..s.` - sleep_sum, 
    sleep_ok = abs(diff_secs) <= 600
  )

# Confirm timestamp logical (bis > von): Wenn bis länger ist als von, dann kommt in die neue Spalte der Eintrag von TRUE!
all_subjects <- all_subjects %>%
  mutate(
    timestamp_ok = bis > von
  )

# Check sleep period duration matches timestamp difference:
all_subjects <- all_subjects %>% 
  mutate(
    duration_secs_calc = as.numeric(bis - von, units = "secs"),
    duration_check = abs(duration_secs_calc - `Dauer.des.Schlafs..s.`) <= 60*5 
  )
# duration_secs_calc rechnet die Schlafdauer in Sekundendauer aus
# die Logik oder sinnhaftigkeit prüft die neue Spalte: duration_check, dort steht überall False, sprich die Dauer sind gleich, die differenz ist 0

# Outlier identifier:
all_subjects <- all_subjects %>% 
  mutate(
    sleepduration.over.12 = ifelse(Dauer.des.Schlafs..s. > 12*60*60, 1, 0),
    sleepduration.under.3 = ifelse(Dauer.des.Schlafs..s. < 3*60*60, 1, 0)
  )
# Prüfen auf physiologische Plausibilität:
all_subjects <- all_subjects %>%
  mutate(
    physiologically.plausible= ifelse(Herzfrequenz..min. > 40 & Herzfrequenz..max. < 100, 1, 0)
  )
```

Ganz ehrlich, diese ganze Anleitung ist eine Anleitung der Verwirrung. Es ist eine Auflistung an Variablen und nicht an Handlungsanweisungen. Ich kann kaum etwas damit anfangen. 


```{r sleeparchitectureovertime}

all_subjects <- all_subjects %>%
  mutate(
    study_date = as.Date(`von`),
    duration_hrs = as.numeric(`Dauer.des.Schlafs..s.`/3600)
  ) %>%
  filter(duration_hrs <= 16)

# Variante: Durchschnitt pro Tag plotten
all_subjects %>%
  group_by(study_date) %>%
  summarise(mean_duration = mean(duration_hrs, na.rm = TRUE)) %>%
  ggplot(aes(x = study_date, y = mean_duration)) +
  geom_area(color = "steelblue", fill = "steelblue") +
  geom_smooth(method = "loess", color = "green") + # Die Trendlinie, die du wolltest
  labs(y = "Durchschnittliche Schlafdauer (h)", x = "Datum")
```
![visualization1](plots/visualization1.png)

```{r vis2, fig.height=8}
# Sleep duration distribution:
library(ggridges)
all_subjects <- all_subjects %>%
  mutate(two_week = cut(study_date, breaks = "2 weeks"))

ggplot(all_subjects, aes(y = two_week, x = duration_hrs, fill = two_week))+
  geom_density_ridges(alpha = 0.7, scale = 1.5)+
  theme_ridges()+
  scale_fill_viridis_d(guide = "none")+
  labs(
    title = "Sleept duration distribution per 2 week blocs",
    x = "Sleep duration (hrs)",
    y = "Time slots (2-week-blocks)"
  )+
  xlim(0, 14)

ggsave("plots/visualization2.png", width = 10, height = 10, dpi = 300)
```
![visualization2](plots/visualization2.png)


```{r vis3, warning = FALSE}

BDI <- BDI %>%
  mutate(date = ymd(date)) %>% 
  ggplot(
    aes(
      x = date,
      y = BDI_score
    )
  )+
  geom_violin(
    aes(
      fill = participant),
    alpha = 0.3
    )+
  scale_x_date(date_breaks = "50 weeks", date_labels = "%b %Y")+
  facet_wrap(~ participant, scales = "free_x")
ggsave("plots/visualization3.png", width = 10, height = 10, dpi = 300)
```
![visualization3](plots/visualization3.png)

Circadian Pattern Visualization
```{r vis4, fig.height=10}
all_subjects <- all_subjects %>%
  mutate(
    onset_hour = hour(von),
    month_block = floor_date(study_date, "month")
  ) %>%
  filter(duration_hrs > 0 & duration_hrs <= 16)
  
ggplot(
  all_subjects,
  aes(x = hour(von))
) +
  stat_summary_bin(
    aes(y = Dauer.des.Schlafs..s., fill = after_stat(y)),
    fun = sum,
    binwidth = 1,
    geom = "col",
    color = "white",
    alpha = 0.9
  ) +
  coord_polar(start = -pi/2) +
  scale_x_continuous(
    breaks = seq(0, 21, 3),
    limits = c(0, 24),
    minor_breaks = NULL,
    labels = function(x) sprintf("%02d:00", x)
  ) +
  scale_fill_viridis_c(option = "C", name = "Total sleep (h)") +
  facet_wrap(~ floor_date(von, "month")) +
  labs(
    title = "Circadian Pattern of Sleep Onset",
    x = "Sleep onset time (hour of day)",
    y = "Total sleep duration (hours, per bin)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    axis.title.y  = element_blank(),
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold", hjust = 0.5)
  )
ggsave("plots/visualization4.png", width = 10, height = 10, dpi = 300)
```
![visualization4](plots/visualization4.png)

```{r formatedmarkdowntable}
library(dplyr)
library(knitr)

sumary_stats <- all_subjects %>%
  group_by(two_week) %>%
  summarise(
    N_Nights = n(),
    Mean_Duration = mean(duration_hrs, na.rm =TRUE),
    SD_Duration = sd(duration_hrs, na.rm = TRUE),
    Missing_Pct = mean(is.na(duration_hrs))*100
  )

overall_stats <- all_subjects %>%
  summarise(
    two_week = "Overall",
    N_Nights = n(),
    Mean_Duration = mean(duration_hrs, na.rm = TRUE),
    SD_Duration = sd(duration_hrs, na.rm = TRUE),
    Missing_Pct = mean(is.na(duration_hrs)) * 100
  )

final_table <- bind_rows(overall_stats, sumary_stats)
knitr::kable(final_table)
```

| two weeks | Nights | Mean duration |SD duration | Missing Pct |
| :--- | :--- | :--- | :--- | :--- |
|Overall |	585|	5.758555|	2.712729	|0|
|2023-02-20	|7	|6.872459|	2.880538	|0|
|2023-03-06	|6	|5.621787|	2.971915	|0|
|2023-02-06	|5	|7.284141|	2.269782	|0|
|2023-03-20	|3	|6.006868|	4.383243	|0|
|2023-04-03	|9	|5.223747|	2.348282	|0|
|2023-04-17	|18|	5.847786|	3.237522	|0|
|2023-05-01	|23	|4.879904|	3.042046	|0|
|2023-05-15	|24|	5.263157|	2.484784	|0|
|2023-05-29	|29|	5.861260|	2.764309	|0|
|2023-06-12	|34|	5.496012|	2.522922	|0|
|2023-06-26	|25|	6.172346|	2.432088	|0|
|2023-07-10	|27|	5.665254|	2.722580	|0|
|2023-08-07	|22	|6.120565|	2.598519	|0|
|2023-07-24	|29|	5.594536|	2.896009	|0|
|2023-08-21	|18|	5.902706|	2.917680	|0| 
|2023-09-04	|15	|5.470159|	2.472799	|0|
|2023-09-18	|17|	6.111224|	2.825871	|0|
|2023-10-02	|16|	6.595784|	1.612059	|0|
|2023-10-16	|14	|5.471988|	2.235931	|0|
|2023-11-13	|22|	5.386530|	3.370567	|0|
|2023-10-30	|13|	6.514802|	2.311773	|0|
|2023-11-27	|17|	4.585799|	2.985391	|0|
|2023-12-11	|19|	5.499997|	2.790528	|0|
|2023-12-25	|22|	5.798615|	2.689309	|0|
|2024-01-22	|21|	6.837564|	2.778917	|0|
|2024-01-08	|25|	6.829007|	2.603796	|0|
|2024-02-05	|30|	5.356351|	2.778937	|0|
|2024-03-18	|19|	6.140192|	2.928621	|0|
|2024-02-19	|16|	5.722802|	2.374110	|0|
|2024-03-04	|24|	5.587185|	2.748788	|0|
|2024-04-01	|12|	4.502679|	2.156709	|0|
|2024-04-15	|4	|5.432082|	3.962703	|0|
          
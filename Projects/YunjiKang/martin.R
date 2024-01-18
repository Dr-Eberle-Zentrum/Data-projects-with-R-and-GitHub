
# set working directory to source file location
library(this.path)
setwd(this.path::here())

########### task 1 ####################

#https://github.com/rOpenGov/eurostat/issues/80
library(eurostat)
# load spacial data of whole europe
df60 <- get_eurostat_geospatial(output_class = "df", resolution = 60)

df60 %>%
  # reduce to germany
  filter(str_starts(NUTS_ID,"DE")) |>
  # plot shapes for each NUTS level (LEVL_CODE)
  ggplot(aes(x=long,y=lat,group=group)) +
  geom_polygon(fill=NA,color="black") +
  facet_wrap(~LEVL_CODE)


crimes1 <-
  read_csv("Crime_data_for_Task1.gz", show_col_types = FALSE) |>
  filter(TIME_PERIOD==2019,
         unit=="NR",
         freq=="A"
  ) |>
  filter(str_detect(iccs,pattern="^ICCS\\d{4}$")) |>
  mutate(
    iccs = case_match(iccs,
                      "ICCS0101" ~ "Intentional Homicide",
                      "ICCS02011" ~ "Assault",
                      "ICCS0401" ~ "Robbery",
                      "ICCS0501" ~ "Burglary",
                      "ICCS05012" ~ "Burglary of private residential premises",
                      "ICCS0502" ~ "Theft",
                      "ICCS050211" ~ "Theft of a motorized land vehicle"
    )
  )

plotDat <-
  df60 |>
  filter( str_starts(NUTS_ID,"DE"),
          LEVL_CODE == 2) |>
  nest(.by = NUTS_ID) |>
  right_join( crimes1,
              by=c("NUTS_ID"="geo")) |>
  unnest(data)


statDat <-
  plotDat |>
  group_by(NUTS_ID) |>
  summarize(long = mean(long),
            lat = mean(lat),
            group = first(group),
            OBS_VALUE = first(OBS_VALUE))

plotDat |>
  ggplot(aes(x=long,y=lat,group=group, fill=(OBS_VALUE))) +
  geom_polygon(color="black") +
  # log-based color gradient
  scale_fill_gradient(high="red",low="yellow",trans = "log2",
                      breaks = 2^modelr::seq_range(log2(plotDat$OBS_VALUE),5),
                      labels = floor(2^modelr::seq_range(log2(plotDat$OBS_VALUE),5))
                      )+
  facet_wrap(~iccs) +
  labs(fill="Cases in 2019",
       x=NULL, y=NULL) +
  theme(
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    legend.position = 'bottom'
  )


###############  task 2 ##################

crimes2 <- read_csv("Crime_data_for_Task2.gz") |>
  pivot_wider(names_from=unit, values_from = OBS_VALUE, names_prefix = "cases_")
poverty <- read_csv("At-risk-of-poverty rate.gz")
income <- read_csv("Income of households.gz")

library(gganimate)
library(ggrepel)
crimes2 |>
  left_join( income, by=c( "geo", "TIME_PERIOD")) |>
  rename(income = OBS_VALUE) |>
  left_join( poverty,  by=c( "geo", "TIME_PERIOD")) |>
  rename(poverty = OBS_VALUE,
         year = TIME_PERIOD) |>
  select(iccs, geo, year, income, poverty, starts_with("cases")) |>
  drop_na() |>
  filter(str_detect(iccs,pattern="^ICCS\\d{4}$")) |>
  mutate(
    iccs = case_match(iccs,
                      "ICCS0101" ~ "Intentional Homicide",
                      "ICCS02011" ~ "Assault",
                      "ICCS0401" ~ "Robbery",
                      "ICCS0501" ~ "Burglary",
                      "ICCS05012" ~ "Burglary of private residential premises",
                      "ICCS0502" ~ "Theft",
                      "ICCS050211" ~ "Theft of a motorized land vehicle"
    )
  ) |>
  # filter(year>=2020) |>
  ggplot(aes(x=income, y=cases_P_HTHAB, size=cases_NR, col=poverty)) +
  geom_point( alpha=0.4) +
  geom_text_repel(aes(label = geo),size = 2, col="darkgrey") +
  scale_color_gradient(high="red",low="yellow")+
  facet_wrap(~iccs, scales = "free_y") +
  labs(x ="Income", y = "Cases per 100,000 inhabitants")+
  theme_light()+
  # gganimate specific bits:
  labs(title = 'Year: {frame_time}') +
  transition_time(as.integer(year)) +
  # labs(title = 'Year: {closest_state}') +
  # transition_states(as.integer(year)) +
  ease_aes('linear')




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


crimes <-
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
  right_join( crimes,
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





library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

"adult-depression.csv" |>
  read_csv() ->
  data

data |>
  group_by(Year, Strata) |>
  mutate( AnnualFreq = Frequency / sum(Frequency)) |>
  select(Year, Strata, `Strata Name`, Frequency, AnnualFreq) |>
  # filter( Strata %in% c("Education")) |>
  filter( Strata %in% c("Education","Race-Ethnicity","Age")) |>
  ggplot(aes(x=Year,y=AnnualFreq, colour=`Strata Name`, shape=Strata)) +
  # labs( colour="C", shape="C") + # not working since different labels
  guides(shape=F)+
  geom_line()+
  geom_point() +
  facet_wrap(vars(Strata)
             , nrow=1
             , scales = "free"
             )
# so far no straight idea how to split/join the legend information per facet

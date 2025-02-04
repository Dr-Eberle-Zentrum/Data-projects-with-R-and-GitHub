

library(tidyverse)

# set wd to script file location using rstudio api
rstudioapi::getSourceEditorContext()$path |>
  dirname() |>
  setwd()

library(readxl)

"wows_playerbase_data.CSV" |>
  read_delim(
    delim = ";"
    , na = c("-", "- ")
    , trim_ws = T
    , locale = locale(encoding="latin1")) |>
  mutate( Battles = str_remove_all(Battles, "\\s") %>% as.numeric()) |>
  mutate( WinRate = str_remove_all(`Win rate`, "[\\s%]") %>% as.numeric()) |>
  mutate( AvgDamage = str_remove_all(`Avg. damage`, "\\s") %>% as.numeric()) |>
  select(-c(`Win rate`, `Avg. damage`)) |>
  filter(Type != "Submarine") |>
  filter(Type != "Aircraft Carrier") |>
  filter(between(Tier,3,10)) |>
  filter(Battles >= 200000) |>
  group_by(Nation,Tier,Type) |>
  slice_max(Battles, n=1, with_ties = F) |>
  # drop tiers with too few ships
  ungroup() |>
  group_by(Nation,Tier) |>
  filter(n() >= 3) |>
  ungroup() |>
  arrange(Nation, Tier, Type) |>
  # competition
  group_by(Tier, Type) |>
  arrange(Tier,Type,Battles) |>
  # compute numbers of battles won with this ship
  mutate( GroupsWon = rank(Battles)-1) |>
  ungroup() |>
  # get overall statistics per nation and tier
  arrange(Nation, Tier) |>
  group_by(Nation, Tier ) |>
  summarize( SumGroupsWon = sum(GroupsWon)) |>
  # get overall sum per nation
  mutate( CumSumGroupsWon = cumsum(SumGroupsWon),
          OverallWins = sum(SumGroupsWon)) |>
  ungroup() |>
  ggplot( aes(x=factor(Nation) |> fct_reorder(OverallWins), y=SumGroupsWon)) +
  coord_flip()+
  geom_bar(aes( fill=factor(Tier) |> fct_reorder(-Tier)), stat="identity") +
  labs(fill="Tier")+
  # add overall value above bars
  geom_text(data=.%>% distinct(Nation,OverallWins), aes(label=OverallWins, y=OverallWins), hjust=-0.5, size=3)+
  # add values per tier within bars
  geom_text(aes(y= CumSumGroupsWon-(SumGroupsWon/2),
                label=ifelse(SumGroupsWon>0,str_c("T",Tier," = ",SumGroupsWon),"")
                ), size=2, angle=90) +
  labs(
    y = "Groups won per nation and tier",
    x = NULL,
    title = "World of Warships Statistics"
  )


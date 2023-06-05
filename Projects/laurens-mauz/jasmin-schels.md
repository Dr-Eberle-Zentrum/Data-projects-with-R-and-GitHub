library(maps) map(‘world’, fill = FALSE, col = 1:100)

deaths2 &lt;-
read\_csv(“<https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv>”)

cases &lt;-
read\_csv(“<https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv>”)

daten &lt;- list() daten\[“Death”\] &lt;- deaths2 %&gt;%
dplyr::filter(`Country/Region` %in% c(“US”, “Germany”, “Italy”, “China”,
“Korea, South”, “New Zealand”, “Senegal”)) %&gt;%
select(matches(“[1]/.+/20$”))

daten\[“Case”\] &lt;- cases %&gt;% dplyr::filter(`Country/Region` %in%
c(“US”, “Germany”, “Italy”, “China”, “Korea, South”, “New Zealand”,
“Senegal”)) %&gt;% select(matches(“[2]/.+/20$”)) %&gt;% select(“2/1/20”,
“4/30/20”)

daten\[“Country”\] &lt;- cases %&gt;% dplyr::filter(`Country/Region`
%in% c(“US”, “Germany”, “Italy”, “China”, “Korea, South”, “New Zealand”,
“Senegal”))

bind\_rows(daten)

[1] 234

[2] 234

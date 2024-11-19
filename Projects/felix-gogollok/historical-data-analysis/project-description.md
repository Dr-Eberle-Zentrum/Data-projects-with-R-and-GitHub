## Analysis of historical data regarding genocides

The main goal of this project is to use the given data (in the **data**
folder) to determine the percentage of the population that was killed in
each of the five genocides (sub-divided by backgroud of the victims) and
to calculate the efficiency of killing in the respective genocide by
comparing the number of victims of all five genocides we have data on in
a certain time period. The result should be a plot detailing the
efficiency of genocidal killing in development over time on the right
side (highlight the different genocides by color and, based on the total
number of persons killed in relation to the general population of the
corresponding country, by size of the elements used in the left graph;
it should also show all given backgrounds of the victims) and another
plot situated on the left side showing the percentage of the local and
the world population killed in each genocide in the corresponding time
period in the respective country.

## About the data sources

The data used in this project was obtained from the statistical data
repository Statista and supplemented with data from historical sources.
The data from Statista is available with the University Licence of the
UB Tuebingen and \[can be downloaded from the website\]
(<https://de.statista.com/login/campus>\]. It is available in German in
the XLS format and was translated to English, converted to CSV and
slightly modified for use in this project.

### Citation for the original data data sources is as follows:

-   United States Holocaust Memorial Museum. (4. Februar, 2019).
    Opferzahlen der durch das nationalsozialistische Regime und seiner
    Verbündeten von 1933 bis 1945 ermordeten Zivilisten und
    Kriegsgefangenen \[Graph\]. In Statista. Zugriff am 19. November
    2024, von
    <https://de.statista.com/statistik/daten/studie/1110101/umfrage/gesamtanzahl-der-nationalsozialistischen-opfer/>

-   bpb. (28. Januar, 2016). Zahl der Einwohner in Deutschland\* in den
    Jahren 1871 bis 2010 (in Millionen) \[Graph\]. In Statista. Zugriff
    am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1059315/umfrage/zahl-der-einwohner-in-deutschland/>

-   bpb. (9. Juli, 2020). Opferzahlen beim Massaker von Srebrenica im
    Juli 1995 \[Graph\]. In Statista. Zugriff am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1258860/umfrage/opferzahlen-beim-massaker-von-srebrenica/>

-   UN DESA. (11. Juli, 2024). Bosnien und Herzegowina:
    Gesamtbevölkerung von 1950 bis 2023 und Prognosen¹ bis 2050 (in
    Millionen Einwohner) \[Graph\]. In Statista. Zugriff am 19. November
    2024, von
    <https://de.statista.com/statistik/daten/studie/383927/umfrage/gesamtbevoelkerung-von-bosnien-und-herzegowina/>

-   Aktion Deutschland Hilft. (7. April, 2014). Opfer während des
    Völkermords in Ruanda vom April bis zum Juli 1994 \[Graph\]. In
    Statista. Zugriff am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1258669/umfrage/opfer-waehrend-des-voelkermords-in-ruanda/>

-   Aktion Deutschland Hilft. (7. April, 2014). Anteile der Bevölkerung
    der Ethnien in Ruanda während des Völkermords von April bis Juli
    1994 \[Graph\]. In Statista. Zugriff am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1257641/umfrage/einwohner-nach-ethnie-in-ruanda-waehrend-des-voelkermords/>

-   UN DESA. (11. Juli, 2024). Ruanda: Gesamtbevölkerung von 1950 bis
    2023 und Prognosen¹ bis 2050 (in Millionen Einwohner) \[Graph\]. In
    Statista. Zugriff am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/412436/umfrage/gesamtbevoelkerung-von-ruanda/>

-   ZDF. (28. Mai, 2021). Afrikanische Todesopfer des Völkermordes an
    den Herero und Nama durch die deutsche Schutztruppe in den Jahren
    1904 bis 1908 \[Graph\]. In Statista. Zugriff am 19. November 2024,
    von
    <https://de.statista.com/statistik/daten/studie/1095603/umfrage/afrikanische-todesopfer-des-voelkermordes-an-den-herero-und-nama/>

-   bpb. (17. Juli, 2015). Afrikanische Todesopfer des
    Maji-Maji-Aufstandes vom 20. Juli 1905 bis zum 18. Februar 1907 im
    Verhältnis zur Gesamtbevölkerung \[Graph\]. In Statista. Zugriff
    am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1095570/umfrage/afrikanische-todesopfer-des-maji-maji-aufstandes/>

-   DigiZeitschriften. (1. Januar, 2019). Geschätzte Einwohnerzahl der
    Kolonien (“Schutzgebiete”) des Deutschen Kaiserreiches im Jahr 1910
    (in 1.000) \[Graph\]. In Statista. Zugriff am 19. November 2024, von
    <https://de.statista.com/statistik/daten/studie/1092309/umfrage/einwohnerzahl-der-kolonien-des-deutschen-kaiserreiches/>

## Important notice for solving this project

For the total population regarding the Herero-and-Nama-Genocide, use the
line labeled “Deutsch-Südwestafrika” and for the total population
regarding the Maji-Maji-Uprising, use the line labeled
“Deutsch-Ostafrika” from the
population\_german-colonies\_1910.csv-dataset respectively (we do not
have this data for the years 1904-1909). For the
rwanda\_victims.csv-dataset, use the
rwanda\_victims\_ethnicity.csv-dataset to include the ethnic background
of the victims in the resulting graph.

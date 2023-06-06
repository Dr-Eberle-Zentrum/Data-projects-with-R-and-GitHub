---
editor_options: 
  markdown: 
    wrap: 72
---

# Power Plants in Germany

Nowadays the focus in energy production is on renewable energies
e.g. solar or wind. Those renewable energies can be sourced on a very
small scale, but historically energy production in Germany is
centralized in big power plants. Over the years, different kind of power
plants from coal to natural gas to nuclear have been created in an
effort to satisfy the ever growing appetite for more and more energy.

## Goal of the project

The idea of this project is to explore the current energy production in
large power plants (\> 100 MW) in Germany. There are regional
differences, differences in the sizes of the plants depending on the
energy source and also different historic development phases / ages.

The data set is made available by the national environmental agency:
[UBA](https://www.umweltbundesamt.de/dokument/datenbank-kraftwerke-in-deutschland)

and can be downloaded as a .xls file directly here:
[DATA](kraftwerke_de_ab_100_mw_0.xls)

The first task is to create a tidy data table. You need to format some
parts of the table for this!

## Data Table - Power Plants in Germany over 100 MW in the year 2022

| Kraftwerksname             | Betreiber                                           | Bundesland | Standort-PLZ | Kraftwerksstandort | Elektrische Bruttoleistung MW | Fernwärme-leistung MW | Inbetriebnahme ggf. Ertüchtigung | Anlagenart | Primärenergieträger |
|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
| Albatros                   | EnBW Albatros GmbH & Co. KG / Enbridge Inc.         | Offshore   |              | Nordsee            | 112,0                         |                       | 2019                             | WEA        | Wind O              |
| Albbruck-Dogern / Rhein    | Rheinkraftwerk Albbruck-Dogern AG / RWE Vertrieb AG | BW         | 79774        | Albbruck           | 108,9                         |                       | 1933 / 2009 2020                 | LWK        | Wasser              |
| Altbach/Deizisau GT A-C, E | EnBW Kraftwerke AG                                  | BW         | 73776        | Altbach            | 305,0                         |                       | 1971-1997                        | GT         | Erdgas              |
| Altbach/Deizisau HKW 1     | EnBW Kraftwerke AG                                  | BW         | 73776        | Altbach            | 476,0                         | 280,0                 | 1985 2006                        | HKW        | Steinkohle          |

## Visualisazion ideas

-   Identify historic eras for energy sources (coal, water, renewable)
-   Which energy source is the most centralized / which one is
    geographically decentralized? (e.g. regarding number of sites per
    Bundesland or density)
-   Group the energy sources by renewable vs. fossil types and analyze
    them regarding size or Bundesland
-   Challenge: Create a map in R (you will need more packages) and color
    the Bundeslaender by percentage of total renewable energy production
    in large power plants (\> 100 MW)

Looking forward to see your solutions!

Best, Paul!

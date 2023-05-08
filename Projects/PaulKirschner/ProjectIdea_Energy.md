# Power Plants in Germany

Nowadays the focus in energy production is on renewable energies
e.g. solar or wind. Those renewable energies can be sourced on a very
small scale, but historically energy production in Germany is
centralized in big power plants. Over the years, different kind of power
plants from coal to natural gas to nuclear have been created in an
effort to satisfy the ever growing appetite for more and more energy.

## Goal of the project

The idea of this project is to explore the current energy production in
large power plants (&gt; 100 MW) in Germany. There are regional
differences, differences in the sizes of the plants depending on the
energy source and also different historic development phases / ages.

The data set is made available by the national environmental agency:
![UBA](https://www.umweltbundesamt.de/dokument/datenbank-kraftwerke-in-deutschland)

and can be downloaded as a .xls file directly here:
![DATA](https://www.umweltbundesamt.de/sites/default/files/medien/372/dokumente/kraftwerke_de_ab_100_mw_0.xls)

The first task is to create a tidy .csv data table, which should look
something like the following.

## Data Table - Power Plants in Germany over 100 MW in the year 2022

<table>
<colgroup>
<col style="width: 11%" />
<col style="width: 20%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 7%" />
<col style="width: 12%" />
<col style="width: 9%" />
<col style="width: 14%" />
<col style="width: 4%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr class="header">
<th>Kraftwerksname</th>
<th>Betreiber</th>
<th>Bundesland</th>
<th>Standort-PLZ</th>
<th>Kraftwerksstandort</th>
<th>Elektrische Bruttoleistung (MW)</th>
<th>Fernwärme-leistung (MW)</th>
<th>Inbetriebnahme (ggf. Ertüchtigung)</th>
<th>Anlagenart</th>
<th>Primärenergieträger</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Albatros</td>
<td>EnBW Albatros GmbH &amp; Co. KG / Enbridge Inc.</td>
<td>Offshore</td>
<td></td>
<td>Nordsee</td>
<td>112,0</td>
<td></td>
<td>2019</td>
<td>WEA</td>
<td>Wind (O)</td>
</tr>
<tr class="even">
<td>Albbruck-Dogern / Rhein</td>
<td>Rheinkraftwerk Albbruck-Dogern AG / RWE Vertrieb AG</td>
<td>BW</td>
<td>79774</td>
<td>Albbruck</td>
<td>108,9</td>
<td></td>
<td>1933 / 2009 (2020)</td>
<td>LWK</td>
<td>Wasser</td>
</tr>
<tr class="odd">
<td>Altbach/Deizisau GT A-C, E</td>
<td>EnBW Kraftwerke AG</td>
<td>BW</td>
<td>73776</td>
<td>Altbach</td>
<td>305,0</td>
<td></td>
<td>1971-1997</td>
<td>GT</td>
<td>Erdgas</td>
</tr>
<tr class="even">
<td>Altbach/Deizisau HKW 1</td>
<td>EnBW Kraftwerke AG</td>
<td>BW</td>
<td>73776</td>
<td>Altbach</td>
<td>476,0</td>
<td>280,0</td>
<td>1985 (2006)</td>
<td>HKW</td>
<td>Steinkohle</td>
</tr>
</tbody>
</table>

## Visualisazion ideas

-   Identify historic eras for energy sources (coal, water, renewable)
-   Which energy source is the most centralized / which one is
    geographically decentralized?
-   Group the energy sources by renewable vs. fossil types and analyze
    them regarding size or Bundesland
-   Challenge: Create a map in R (you will need more packages) and color
    the Bundeslaender by percentage of total renewable energy production
    in large power plants (&gt; 100 MW)

Looking forward to see your solutions!

Best, Paul!

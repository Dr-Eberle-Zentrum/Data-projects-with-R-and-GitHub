# Phase 1 - Drafting a project

The idea of the data project is to extract and process some nutrient
data of various food and drinks. I am interested in the composition with
respect to macro- and micronutrients. In the end, a sum of nutrients
should be represented by several plots showing the distribution of
nutrients for the consumed food every day.

On the same hand, a csv file should be created to store the processed
data and consumption information from every day.

The aim of the project is to work with the data provided, process the
data and create a result file that can be used later to show the
nutrient composition of your daily meals.

## Data Set

The Swiss Food Composition Database provided by the state of Swizzerland
is used for the project. It is a database consisting of over 1000
different food and drinks and the nutrient composition of these.

### Data Preview

<table>
<colgroup>
<col style="width: 38%" />
<col style="width: 3%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 13%" />
<col style="width: 2%" />
<col style="width: 9%" />
<col style="width: 8%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">X1</th>
<th style="text-align: left;">X2</th>
<th style="text-align: left;">X3</th>
<th style="text-align: left;">X4</th>
<th style="text-align: left;">X5</th>
<th style="text-align: left;">X6</th>
<th style="text-align: left;">X7</th>
<th style="text-align: left;">X8</th>
<th style="text-align: left;">X9</th>
<th style="text-align: left;">X10</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Schweizer Nährwertdatenbank – Generische
Lebensmittel V6.5 (27.06.2023)</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Korrigierte Version vom 17.08.2023
(Korrektur: Nährstoff “Zink”, Lebensmittel 13420 “Bier,
alkoholfrei”)</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">ID</td>
<td style="text-align: left;">ID V 4.0</td>
<td style="text-align: left;">ID SwissFIR</td>
<td style="text-align: left;">Name</td>
<td style="text-align: left;">Synonyme</td>
<td style="text-align: left;">Kategorie</td>
<td style="text-align: left;">Dichte</td>
<td style="text-align: left;">Bezugseinheit</td>
<td style="text-align: left;">Energie, Kilojoule (kJ)</td>
<td style="text-align: left;">Herleitung des Wertes</td>
</tr>
<tr class="even">
<td style="text-align: left;">10533</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Agar Agar</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Verschiedenes/Gelier- und Bindemittel</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">pro 100g essbarer Anteil</td>
<td style="text-align: left;">641</td>
<td style="text-align: left;">Automatisierte Berechnung</td>
</tr>
<tr class="odd">
<td style="text-align: left;">10536</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">Agavensirup</td>
<td style="text-align: left;">Agavendicksaft</td>
<td style="text-align: left;">Süssigkeiten/Zucker und Süssstoffe</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">pro 100g essbarer Anteil</td>
<td style="text-align: left;">1240</td>
<td style="text-align: left;">Automatisierte Berechnung</td>
</tr>
</tbody>
</table>

Entries of the data table are shown for the first ten out of 129
columns.

The complete data set is provided by and available at [The Swiss Food
Composition
Database](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fnaehrwertdaten.ch%2Fwp-content%2Fuploads%2F2023%2F08%2FSchweizer_Nahrwertdatenbank.xlsx&wdOrigin=BROWSELINK).

## Visualisation goals:

The data should be represented as various pie charts and histograms
showing the total uptake of micro- and macronutrients with respect to
numerous consumed food and drinks. Besides that, the progress in meeting
ones daily demand of nutrient should be displayed.

I want to create a dynamic pie plot that shows the composition of
consumed food and drinks with respect to macro- and micronutrients.
Ideally, both are represented individually within one pie chart in a
manner that at the edge of the circle, the respective progress with
respect to the demand is shown.

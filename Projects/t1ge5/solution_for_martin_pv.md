## 1. Import

Alle CSV-Dateien aus allen Zip-Dateien in `Projects/martin-raden/PV`
wurden eingelesen und zu einer Tabelle zusammengefügt: **251 Zeilen**
aus **8 Dateien**, die den Zeitraum 31.12.2024 bis 31.08.2025 abdecken.

## 2. Datenintegrität

### 2.1 Ist jeder Datensatz vollständig?

Es gibt **0 fehlende Werte** in den 5 Datenspalten, daher sind **0 von
251 Zeilen** unvollständig.

Fehlende Werte werden nicht ergänzt, da jede Zeile einer Tagesmessung
entspricht und erfundene Werte die Ergebnisse verfälschen würde.

### 2.2 Gibt es doppelte Einträge?

Die Dateien decken überlappende Zeiträume ab (zum Beispiel endet eine
Datei am 31.01. und die nächste beginnt am 28.01.), daher kann dasselbe
Datum in zwei Dateien vorkommen.

**9 Datumswerte** kommen mehrfach vor (18 Zeilen, siehe unten). Der
Eintrag mit dem höheren PV-Ertrag wird behalten, daher werden **9 Zeilen
entfernt**.

Beispielhafte doppelte Einträge:

<table>
<thead>
<tr>
<th style="text-align: left;">Datum</th>
<th style="text-align: left;">Datei</th>
<th style="text-align: right;">PV Ertrag [kWh]</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">28.01.2025</td>
<td style="text-align: left;">2024-12-31_2025-01-31_127120425.csv</td>
<td style="text-align: right;">6.96</td>
</tr>
<tr>
<td style="text-align: left;">28.01.2025</td>
<td style="text-align: left;">2025-01-28_2025-02-28_127120425.csv</td>
<td style="text-align: right;">6.96</td>
</tr>
</tbody>
</table>

### 2.3 Nur das Jahr 2025

Entfernte Zeilen, weil sie nicht aus 2025 stammen: **1**.

### 2.4 Ergebnis

Von **251 importierten Zeilen** wurden 10 entfernt. Die bereinigten
Daten (`pv_2025`) enthalten **241 Tagesdatensätze** vom 01.01.2025 bis
zum 31.08.2025.

## 3. Datenaufbereitung

Vorschau der ersten Zeilen von `pv_2025`:

<table>
<colgroup>
<col style="width: 7%" />
<col style="width: 14%" />
<col style="width: 10%" />
<col style="width: 11%" />
<col style="width: 10%" />
<col style="width: 13%" />
<col style="width: 14%" />
<col style="width: 17%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Datum</th>
<th style="text-align: right;">Netzeinspeisung [kWh]</th>
<th style="text-align: right;">Netzbezug [kWh]</th>
<th style="text-align: right;">Speicherung [kWh]</th>
<th style="text-align: right;">PV Ertrag [kWh]</th>
<th style="text-align: right;">Eigenverbrauch [kWh]</th>
<th style="text-align: right;">Gesamtverbrauch [kWh]</th>
<th style="text-align: right;">Eigenverbrauchsanteil [%]</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">01.01.2025</td>
<td style="text-align: right;">13.19</td>
<td style="text-align: right;">0.62</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: right;">14.34</td>
<td style="text-align: right;">0.16</td>
<td style="text-align: right;">0.78</td>
<td style="text-align: right;">20.51</td>
</tr>
<tr>
<td style="text-align: left;">02.01.2025</td>
<td style="text-align: right;">0.12</td>
<td style="text-align: right;">1.18</td>
<td style="text-align: right;">1.43</td>
<td style="text-align: right;">1.91</td>
<td style="text-align: right;">0.36</td>
<td style="text-align: right;">1.54</td>
<td style="text-align: right;">23.38</td>
</tr>
<tr>
<td style="text-align: left;">03.01.2025</td>
<td style="text-align: right;">2.89</td>
<td style="text-align: right;">0.92</td>
<td style="text-align: right;">6.45</td>
<td style="text-align: right;">10.27</td>
<td style="text-align: right;">0.93</td>
<td style="text-align: right;">1.85</td>
<td style="text-align: right;">50.27</td>
</tr>
<tr>
<td style="text-align: left;">04.01.2025</td>
<td style="text-align: right;">7.09</td>
<td style="text-align: right;">0.70</td>
<td style="text-align: right;">4.09</td>
<td style="text-align: right;">13.17</td>
<td style="text-align: right;">1.99</td>
<td style="text-align: right;">2.69</td>
<td style="text-align: right;">73.98</td>
</tr>
<tr>
<td style="text-align: left;">05.01.2025</td>
<td style="text-align: right;">0.13</td>
<td style="text-align: right;">1.21</td>
<td style="text-align: right;">4.35</td>
<td style="text-align: right;">5.05</td>
<td style="text-align: right;">0.57</td>
<td style="text-align: right;">1.78</td>
<td style="text-align: right;">32.02</td>
</tr>
</tbody>
</table>

**Hinweis: An 15 von 241 Tagen ist der berechnete Eigenverbrauch
negativ.** An diesen Tagen sind Netzeinspeisung und Speicherung zusammen
größer als der PV Ertrag. Das macht nicht so viel Sinn, da der
Eigenverbrauch nicht negativ sein kann?

Für die weiteren Berechnungen werden diese Daten erstmal nicht entfernt,
da sie in den Daten vorkommen.

<table>
<colgroup>
<col style="width: 9%" />
<col style="width: 14%" />
<col style="width: 19%" />
<col style="width: 15%" />
<col style="width: 18%" />
<col style="width: 22%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Datum</th>
<th style="text-align: right;">PV Ertrag [kWh]</th>
<th style="text-align: right;">Netzeinspeisung [kWh]</th>
<th style="text-align: right;">Speicherung [kWh]</th>
<th style="text-align: right;">Eigenverbrauch [kWh]</th>
<th style="text-align: right;">Eigenverbrauchsanteil [%]</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">04.03.2025</td>
<td style="text-align: right;">34.25</td>
<td style="text-align: right;">33.64</td>
<td style="text-align: right;">0.77</td>
<td style="text-align: right;">-0.16</td>
<td style="text-align: right;">-44.44</td>
</tr>
<tr>
<td style="text-align: left;">14.03.2025</td>
<td style="text-align: right;">6.84</td>
<td style="text-align: right;">12.53</td>
<td style="text-align: right;">3.28</td>
<td style="text-align: right;">-8.97</td>
<td style="text-align: right;">114.41</td>
</tr>
<tr>
<td style="text-align: left;">20.03.2025</td>
<td style="text-align: right;">33.01</td>
<td style="text-align: right;">30.12</td>
<td style="text-align: right;">3.26</td>
<td style="text-align: right;">-0.37</td>
<td style="text-align: right;">-112.12</td>
</tr>
</tbody>
</table>

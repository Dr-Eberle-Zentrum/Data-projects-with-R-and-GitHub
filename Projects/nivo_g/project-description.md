# Hintergrund und Ziel

Weil ich Tennis spiele, möchte ich etwas mit Tennisdaten machen. Mich
interessiert vor allem, ob der Gewinner eines Matches normalerweise mehr
Asse schlägt als der Verlierer (vielleicht motiviert mich ja das
Ergebnis mehr an meinen Aufschlägen zu üben). Ich würde auch gerne
wissen, ob der Belag einen Unterschied macht wie viele Asse geschlagen
werden können (ich habe da so meine eigenen Ideen und möchte wissen ob
die bestätigt werden).

Dafür sollen ATP-Einzelmatches aus den Jahren 2023 und 2024 verwendet
werden. In den Daten stehen die Statistiken der Gewinner und Verlierer
in unterschiedlichen Spalten,es fehlen aber teilweise Werte, weshalb die
Daten zunächst bereinigt und umstrukturiert werden müssen.

# Fragestellungen

1.  Schlagen die Gewinner im Durchschnitt mehr Asse als die Verlierer?
2.  Gibt es auf Hartplatz, Sand und Rasen unterschiedlich viele Asse?
3.  Wie unterscheiden sich die Assquoten von Gewinnern und Verlierern
    auf den verschiedenen Belägen?

# Datensatz

Die Daten stammen ursprünglich von **Jeff Sackmann / Tennis Abstract**
und sind über ein
[GitHub-Archiv](https://github.com/farhadGithub/tennis-atp-data)
verfügbar.

- **Download 2023:**
  [atp\_matches\_2023.csv](https://raw.githubusercontent.com/farhadGithub/tennis-atp-data/main/data/raw/atp_matches_2023.csv)
- **Download 2024:**
  [atp\_matches\_2024.csv](https://raw.githubusercontent.com/farhadGithub/tennis-atp-data/main/data/raw/atp_matches_2024.csv)
- **Format:** Zwei CSV-Dateien mit jeweils 49 Spalten
- **Umfang:** 2.986 Matches aus 2023 und 3.076 aus 2024, insgesamt 6.062
  Matches
- **Lizenz:** CC BY-NC-SA 4.0

Jede Zeile enthält die Daten eines Matches.

Die relevanten Spalten sind:

- `surface`: Belag (`Hard`, `Clay`, `Grass`)
- `winner_name`, `loser_name`: Namen der Spieler
- `w_ace`, `l_ace`: Anzahl der Asse von Gewinner und Verlierer
- `w_svpt`, `l_svpt`: Anzahl der Aufschlagpunkte von Gewinner und
  Verlierer
- `score`: Ergebnis des Matches

## Beispiel aus den Rohdaten

Die erste Datenzeile aus dem Jahr 2024 mit den relevanten Spalten:

<table>
<colgroup>
<col style="width: 17%" />
<col style="width: 17%" />
<col style="width: 10%" />
<col style="width: 21%" />
<col style="width: 16%" />
<col style="width: 8%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">tourney_name</th>
<th style="text-align: right;">tourney_date</th>
<th style="text-align: left;">surface</th>
<th style="text-align: left;">winner_name</th>
<th style="text-align: left;">loser_name</th>
<th style="text-align: right;">w_ace</th>
<th style="text-align: right;">l_ace</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Brisbane</td>
<td style="text-align: right;">20240101</td>
<td style="text-align: left;">Hard</td>
<td style="text-align: left;">Grigor Dimitrov</td>
<td style="text-align: left;">Holger Rune</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">9</td>
</tr>
</tbody>
</table>

# Ziele der Datenaufbereitung

1.  Die beiden CSV-Dateien einlesen und zu einer Tabelle zusammenführen.

2.  Die Daten auf fehlende Werte überprüfen. Matches ohne benötigte
    Angaben oder mit nicht regulärem Ende sollen von der Auswertung
    ausgeschlossen werden.

3.  Die Gewinner- und Verliererstatistiken in eine Tabelle bringen. Es
    soll für jeden Spieler eine eigene Zeile mit seinen Statistiken und
    dem Ergebnis (Sieg oder Niederlage) geben.

4.  Für jeden Spieler die Assquote berechnen:

    `Assquote = Asse / Aufschlagpunkte * 100`

5.  Die Daten nach Belag und Sieg/Niederlage gruppieren und die
    durchschnittliche Anzahl der Asse sowie die durchschnittlichen
    Assquoten berechnen.

# Geplante Visualisierungen

1.  **Balkendiagramm:** Durchschnittliche Anzahl der Asse von Gewinnern
    und Verlierern auf Hartplatz, Sand und Rasen. Eine zusätzliche Linie
    soll die durchschnittliche Anzahl der Asse pro Spieler und Match
    über alle drei Beläge zeigen.

2.  **Balkendiagramm:** Durchschnittliche Assquote von Gewinnern und
    Verlierern auf den drei Belägen.

3.  **Kreisdiagramme:** Für jeden Belag darstellen, welcher Anteil aller
    Aufschlagspunkte Asse waren (also die Assquote).

**Quellenangabe:** Jeff Sackmann / Tennis Abstract: *ATP Tennis
Rankings, Results, and Stats*.
<https://github.com/farhadGithub/tennis-atp-data> (Zugriff am
10.11.2026), CC BY-NC-SA 4.0.

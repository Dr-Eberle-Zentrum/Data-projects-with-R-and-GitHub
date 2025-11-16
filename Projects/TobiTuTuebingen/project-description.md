# Projekt Idee

Wir möchten uns anschauen, wie der Ausbau der Windkraft in
Baden-Württemberg in den letzten Jahren vorangekommen ist.

[Datenquelle
LUBW](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/TobiTuTuebingen/WindenergieBW.csv)

Wichtig: Auf der Website nur downloaden, nicht schon filtern! Das machen
wir mit R!

------------------------------------------------------------------------

## Introduction
Der Windkraftausbau ist entscheidend um die Energie zum Erfolg zu führen. Daher 
möchten wir uns anschauen, wie der Windkraftausbau in Baden-Württemberg in deine 
letzten Jahren vorangekommen ist. Ziel des Projekts ist zum einen die Anzahl der 
neu in Betrieb genommene Leistung und die Anzahl der neuen Windräder pro Jahr 
darzustellen. Außerdem möchten wir herausfinden, ob es eine Korrelation zwischen 
der Höhe des Windrades, der Rotorblattgröße, dem Steueraufkommen pro Landkreis, 
und der Leistung gibt.

------------------------------------------------------------------------

## Questions

* Welche Gemeinden und Landkreise haben die höchste Anzahl an installierten Windräder und Windradleistung?
* Wie hoch profitieren diese Gemeinden finanziell?
* Wie hat sich der Ausbau in den letzten Jahren entwickelt? Wie viele Windräder wurden in welchen Jahr genehmigt und errichtet? 

------------------------------------------------------------------------

## Data manipulation goals

* Data cleaning: Bitte fürhen Sie folgende Schritte durch, nachdem die CSV in R
importiert wurde: 
  * Tabellenspalten umbennen
  * Die Spalten "Typbezeichnung", "Stand der Daten" und "Herkunft der Daten" sollen gelöscht werden
* Data manipulation
  * In der Spalte "Status" sind alle stillgelegten Windräder mit "Stillgelegt"
  gekennzeichnet, die entsprechenden Zeilen sollen gelöscht werden.
  * Wir möchten folgende neue Spalten anlegen um die jährliche Leistung zu berechnen: 
    * neue Spalte mit Betriebsdauer: Dazu bedarf es das aktuellen Datum (31.10.2025)
    sowie aus die Spalte Inbetriebnahmedatum. Die Betriebsdauer ist die Differenz
    von Aktuellen Datum minus dem Inbetriebnahmedatum geteilt durch 365 um eine
    jährliche Dauer zu erhalten.
    * Kapazitätsfaktor (= Auslastung), dieser Wert gibt Auskunft, wie stark der Wind weht
    und wieviel Strom dadurch wirklich erzeugt werden kann. Wir berechnen diesen Faktor
    mit der Spalte Nabenhöhe. Windräder unter 100 m kriegen den Kapazitätsfaktor
    0.2, 100 m bis 150 m den Faktor 0.25 und Windräder über 150 m einen Faktor von 0.3.
    Diese Faktoren sollen in einer neuen Spalten aufgeführt sein.
    * Die Gesamtenergie ist eine neue Spalte mit folgender Formel:
    Gesamtenergie (MWh) = Generatorleistung (MW) * Kapazitätsfaktor * Betriebsdauer (Jahre)
    * Steueraufkommen mit folgender Formel berechenbar:
    Steueraufkommen = Gesamtenergie (MWh) * 1ct/MWh die Einheit ist dann Cent
 * Jährliches Wachstum in Inbetriebnahmen:
   * Mithilfe der Spalte Inbetriebnahme, gruppieren wir die Windräder, je nach Jahr
   in denen Sie in Betrieb gegangen sind


------------------------------------------------------------------------

## Visualization goals

### Hauptziele:

Linechart:
* x-Achse: Zeit in Jahren
* y-Achse: jährlich in Betrieb genommene Anzahl der Windräder, diese Linie in 
grün
* Titel: Jährlicher Zubau an Windrädern in BW

Korrelogram:
* Wir möchten die Korrelation zwischen dem Steueraufkommen pro Windrad, der Rotorblattgröße,
der Windradhöhe und der Gesamtleistung gibt.
* Wir berechnen erst, ob diese Korrelationen statistische signifikant sind, mit 
dem Spearman-Index. Erstelle einen neuen Dataframe mit den Steueraufkommen, Rotorblattgröße,
Windradhöhe und Gesamtleistung. Mit cor.test(dataframe$Spalte, method = "spear")
kriegen wir heraus, ob die Korrelation signifikant ist. Der p-Wert sollte kleiner als
0.05 sein, dann ist die Korrelation siginifikant. Der zweite Wert, der spearman's 
rho schwankt zwischen -1 und +1, Werte nahe null zeigen eine schwache Korrelation, 
nahe -1 eine stark negative Korrelation, und +1 eine stark positive Korrelation.
* Wir laden das Package corrplot
* 

### Wer noch Lust und Laune hat:

Wenn noch Lust und Zeit besteht: 

- Anlagenzahl/Leistunskapazität/Steueraufkommen:
  - pro Landkreis als Bar Chart, nur die 10 größten
- corrlegram <https://r-graph-gallery.com/correlogram.html>:
  - Höhe, Rotorblatt, Steueraufkommen, Windstärke, Ertrag
- wer weiß, vlt. sogar eine hexbin map:
  <https://r-graph-gallery.com/hexbin-map.html>

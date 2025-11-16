# Projekt Idee

Wir möchten uns anschauen, wie der Ausbau der Windkraft in
Baden-Württemberg in den letzten Jahren vorangekommen ist.

[Datenquelle
LUBW](Projects/TobiTuTuebingen/Bestand Windenergieanlagen 2025-11-16.csv)

Wichtig: Auf der Website nur downloaden, nicht schon filtern! Das machen
wir mit R!

------------------------------------------------------------------------

## Introduction
Der Windkraftausbau ist entscheidend um die Energie zum Erfolg zu führen. Daher 
möchten wir uns anschauen, wie der Windkraftausbau in Baden-Württemberg in deine 
letzten Jahren vorangekommen ist. Ziel des Projekts ist zum einen die Anzahl der 
neu in Betrieb genommene Leistung und die Anzahl der neuen Windräder pro Jahr 
darzustellen. Außerdem möchten wir herausfinden, ob es eine Korrelation zwischen 
der Höhe des Windrades, der Rotorblattgröße, dem Steueraufkommen im jeweiligen 
Landkreis, und der Leistung gibt.

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
  * Die Spalten "Typbezeichnung", "Stand der Daten" und "Herkunft der Daten"
  soll gelöscht werden
* Data manipulation
  * In der Spalte "Status" sind alle stillgelegten Windräder mit "Stillgelegt"
  gekennzeichnet, die entsprechenden Zeilen sollen gelöscht werden.
  * Gemeinden zusammenfassen -> welches sind die Gemeinde mit den meisten Windrädern,
  welches sind die Gemeinden mit der größten Leistung?
  * auf Landkreisebene ginge das auch
  * Wir möchten folgende neue Spalten anlegen um die täglichen Leistung zu berechnen: 
    * neue Spalte mit Betriebsdauer. Dazu bedarf es 
    * da braucht man noch grob zusätzliche Werte wie Kapazitätsfaktor (= Auslastung),
    typischerweise 0.25-0.3 bei durchschnittlichen Standort, Zeitraum ist Tage,
    Zieleinheit ist dann MW/a
    * Das ganze in Geld umrechnen: Einspeiseerlös mit etwa 10ct pro kW/a = 100€ 
    pro MW
    * Bei einer angenommen Steuersatz von 2% wie hoch ist das Einkommen der Gemeinden?
    Welche sind die best verdienenden Gemeinden?
    * Bar charts draus machen, 
  * Noch so ein bissle Jahre vergleichen
    * Jahre mit dem stärksten Zubau / geringsten Zubau
    * Line Chart, Zubau pro Jahr -> Wachstumstrends
  * bisschen fieser: Je nach Standort ist auch die Windstärke anders, das wirkt sich auf den Kapazitätsfaktor aus. Abhängig vom jeweiligen Landkreis bzw. von Landkreisklassen lässt sich der Kapazitätsfaktor anpassen. Auch höhere Windräder haben einen höheren Kapazitätsfaktor. Falls das Projekt noch Raum bietet und noch nicht zu ausführlich ist, würde ich hier noch Vorgaben nennen.


------------------------------------------------------------------------

## Visualization goals

### Hauptziele:

Linechart:
* x-Achse: Zeit in Jahren
* 1. y-Achse: jährlich in Betrieb genommene Leistung, diese Linie in blau
* 2. y-Achse: jährlich in Betrieb genommene Anzahl der Windräder, diese Linie in 
grün
* Titel: Jährlicher Zubau an Leistung und Windradanzahl in BW

Korrelogram:
*

### Wer noch Lust und Laune hat:

Wenn noch Lust und Zeit besteht: 

- Anlagenzahl/Leistunskapazität/Steueraufkommen:
  - pro Landkreis als Bar Chart, nur die 10 größten
- corrlegram <https://r-graph-gallery.com/correlogram.html>:
  - Höhe, Rotorblatt, Steueraufkommen, Windstärke, Ertrag
- wer weiß, vlt. sogar eine hexbin map:
  <https://r-graph-gallery.com/hexbin-map.html>

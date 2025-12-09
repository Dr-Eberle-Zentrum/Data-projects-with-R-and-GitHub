# Projekt: Data Wrangling im Jena Experiment (GEO-87)

<figure>
<img src="Images/Jena1.jpg" alt="Das Jena Experiment" />
<figcaption aria-hidden="true">Das Jena Experiment</figcaption>
</figure>

## 1. Einleitung & Kontext

Dieses Projekt basiert auf Daten, die während der **GEO-87 Exkursion zum
Jena Experiment** (September 2025) erhoben wurden. Das Jena Experiment
ist ein langfristiges Biodiversitätsprojekt, das die Wechselwirkungen
zwischen Pflanzenvielfalt und Ökosystemprozessen untersucht.

Unser Fokus lag auf der Beziehung zwischen der **pflanzlichen
Biodiversität** (Artenreichtum und funktionelle Gruppen) und zentralen
**Bodenfunktionen**. Dafür haben wir Bodenproben entnommen, um folgende
Parameter zu bestimmen:

-   **Bodenwassergehalt (SWC)**
-   **Mineralischer Stickstoff (Nmin)**, spezifisch Nitrat
    (*N**O*<sub>3</sub><sup>−</sup>) und Ammonium
    (*N**H*<sub>4</sub><sup>+</sup>)

### Das Ziel dieses Projekts

Der Schwerpunkt liegt auf **Data Wrangling**: Wir nehmen die “rohen”
Labordaten von 2025, reinigen sie, berechnen sinnvolle Einheiten (mg/kg
Nmin) und verknüpfen sie mit dem Versuchsdesign. Zusätzlich werden wir
die sauberen Daten visualisieren und einen Vergleich mit dem Datensatz
des Vorjahres (2024) ziehen.

<figure>
<img src="Images/Jena2.jpg" alt="Die GEO-87 Exkursionsgruppe" />
<figcaption aria-hidden="true">Die GEO-87 Exkursionsgruppe</figcaption>
</figure>

## 2. Leitfragen & Hypothesen

Unsere Analyse wird von folgenden Fragen geleitet, wobei der Vergleich
zum Vorjahr eine zentrale Rolle spielt:

1.  **Hypothese 1 (Diversität):** Variiert der Boden-Nmin (Gesamt-Nmin,
    *N**O*<sub>3</sub><sup>−</sup>, *N**H*<sub>4</sub><sup>+</sup>)
    signifikant mit der ausgesäten Artenvielfalt (`sowndiv`)?
2.  **Hypothese 2 (Funktionelle Gruppen):** Hat das Vorhandensein
    bestimmter funktioneller Gruppen, insbesondere Leguminosen
    (`p_legume`), einen Einfluss auf die Nmin-Konzentrationen?
3.  **Vergleichsfrage:** Unterscheiden sich die Nmin-Konzentrationen von
    2025 statistisch oder visuell von den Ergebnissen aus 2024?

## 3. Die Datensätze (“Dirty Data”)

Wir arbeiten mit vier Dateien. Die Daten liegen teilweise im Rohformat
vor und müssen bereinigt werden.

-   **1. 2025 Rohdaten Labor (`data_jena_2025.xlsx`):** Dies ist unser
    primärer **“Dirty Dataset”**. Er enthält die Rohgewichte aus der
    SWC- und Nmin-Aufarbeitung (Glasgewichte, Einwaagen etc.).

    -   *Wrangling Issues:* Enthält fehlende Werte (z.B. B3A15, B3A18)
        und problematische Einträge (z.B. bei B2A22 wurden versehentlich
        “zwei Gläser” notiert -&gt; hier muss eine Entscheidung
        getroffen werden!).

-   **2. 2025 Nmin Konzentrationen (`2025_Nmin_Jena.xlsx`):** Enthält
    die Rohdaten des Photometers in **mg/l**.

    -   *Wrangling Issues:* Diese Werte müssen in **mg/kg** Trockenboden
        umgerechnet werden. Viele *N**H*<sub>4</sub><sup>+</sup>-Werte
        sind negativ (unter der Nachweisgrenze) und müssen behandelt
        werden (z.B. Setzen auf 0).

-   **3. Plot Metadaten (`Plot information.xlsx`):** Ein “sauberer”
    Metadaten-Satz. Er verknüpft jeden `plotcode` mit den
    experimentellen Variablen wie `sowndiv` (gesäte Diversität) und
    `leg` (Leguminosen vorhanden ja/nein).

-   **4. 2024 Vergleichsdaten (`Results 2024.xlsx`):** Enthält die
    bereits fertig prozessierten Daten des Vorjahres.

    -   Das Blatt `Nmin_Div` dient als **Vorlage (Target Schema)** für
        unsere 2025er Datenstruktur.
    -   Das Blatt `Concentrations` enthält implizit die
        Umrechnungsfaktoren, falls benötigt.

## 4. Data Wrangling Roadmap

Ziel ist es, die 2025er Rohdaten in einen “Tidy Data Frame” zu
überführen, der exakt so aussieht wie das `Nmin_Div` Blatt aus 2024.

### Schritt 1: Berechnung des Bodenwassergehalts (SWC) 2025

1.  Lade die Labordaten (`data_jena_2025.xlsx`).
2.  Behandle fehlende Daten und **Duplikate/Fehler**:
    -   *Tipp für B2A22:* Wenn zwei Messwerte für einen Plot vorliegen,
        berechne den Mittelwert, um mit einem einzigen Wert
        weiterzuarbeiten.
3.  Berechne das Trockengewicht der SWC-Probe (`dry_soil_swc_g`):
    `dry_soil_swc_g = (dry soil + glass [g]) - (glass weight [g])`
4.  Berechne den SWC (als Fraktion):
    `swc = (wet soil [g] - dry_soil_swc_g) / dry_soil_swc_g`

### Schritt 2: Berechnung Nmin in mg/kg

1.  Berechne mit dem `swc` aus Schritt 1 das Trockengewicht der
    *Nmin-Einwaage*: `dry_soil_nmin_g = (Nmin wet soil [g]) / (1 + swc)`
2.  Lade die Photometer-Daten (`2025_Nmin_Jena.xlsx`).
3.  Bereinige negative *N**H*<sub>4</sub><sup>+</sup>-Werte (Setzen auf
    0 oder `NA`).
4.  Rechne **mg/l** in **mg/kg** um. Der Extraktionsfaktor beträgt 50
    (basierend auf 50ml Extraktionsmittel).
    -   `NO3_mg_kg = (NO3-N [mg/l] * 50) / dry_soil_nmin_g`
    -   `NH4_mg_kg = (NH4-N [mg/l] * 50) / dry_soil_nmin_g`
    -   `Nmin_mg_kg = NO3_mg_kg + NH4_mg_kg`

### Schritt 3: Zusammenfügen und Exportieren

1.  Verbinde (`join`) die berechneten Nmin-Werte mit den Metadaten
    (`Plot information.xlsx`) über den `plotcode`.
2.  Lade die sauberen 2024er Daten (`Results 2024.xlsx`).
3.  Kombiniere beide Datensätze (2024 & 2025) in einen langen Data
    Frame. Füge eine Spalte `Year` hinzu.
4.  **Export:** Schreibe eine **neue Excel-Datei**
    `Jena_Nmin_Combined.xlsx`.
    -   Diese soll zwei Tabellenblätter enthalten: eines namens “2024”
        und eines namens “2025”.
    -   Die Spalte `Year` soll in den einzelnen Blättern *nicht*
        enthalten sein (da durch den Blattnamen impliziert), aber im
        R-Objekt für die Analyse vorhanden bleiben.

## 5. Visualisierung

Wir wollen die Ergebnisse explorativ darstellen. Erstelle folgende
Grafiken mit `ggplot2`:

**Grafik 1: Reproduktion (Nur 2025 Daten)** Erstelle einen Scatterplot:
\* x-Achse: Logarithmierte Diversität (`log2(sowndiv)`) \* y-Achse:
Logarithmiertes Nmin (`log(Nmin)`) \* Farbe: Leguminosen vorhanden
(ja/nein) \* *Ziel:* Sieh dir zum Vergleich die Abbildung aus dem
Vorjahr an (siehe Moodle/Material). Deine Grafik sollte stilistisch
ähnlich aussehen.

**Grafik 2: Der Jahresvergleich (2024 vs. 2025)** Untersuchen wir, ob
sich die Nmin-Werte generell verändert haben. \* Erstelle einen
**Boxplot** (oder Violin-Plot). \* x-Achse: `Year` (als Faktor) \*
y-Achse: `Nmin_mg_kg` \* Nutze `facet_wrap`, um Leguminosen-Plots von
Nicht-Leguminosen-Plots getrennt darzustellen. \* *Frage:* Sind die
Nmin-Werte 2025 generell höher oder niedriger als 2024?

------------------------------------------------------------------------

## 6. Optional: Challenges für Fortgeschrittene

Dieser Teil ist optional für Studierende mit Vorkenntnissen in Statistik
oder Lust auf “Dirty Data Hell”.

### Bonus A: Der “Miese” Import

Im File `Results 2024.xlsx` gibt es ein Blatt `Concentrations`. Dies
sind die Rohdaten des Vorjahres, aber extrem schlecht formatiert
(falsche Header, Metadaten in den ersten Zeilen etc.). \* **Aufgabe:**
Versuche, dieses Blatt sauber einzulesen, ohne händisch im Excel etwas
zu löschen. Extrahiere die Spalten für Nitrat und Ammonium und
vergleiche sie mit den sauberen Daten.

### Bonus B: Statistische Analyse (ANOVA)

Überprüfe deine visuellen Befunde statistisch mittels Linear
Mixed-Effects Models (LMM). \* Modell für 2025:
`logNmin ~ sowndiv * legume + (1 | Block)` \* Vergleichsmodell:
`logNmin ~ sowndiv * legume * Year + (1 | Block)` \* Nutze `lmer()` aus
dem `lme4` Paket und interpretiere den Output der `anova()`. Gibt es
eine signifikante Interaktion zwischen Jahr und Diversität?

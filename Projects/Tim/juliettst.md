**Spaltenerklärung der LUBW:**

-   id: Schlüssel für Bundesland, Naturraum, Kreis oder Gemeinde name
-   Bezeichnung typ: Bundesland, Naturraum, Kreis oder Gemeinde
-   Kalenderjahr, Jahreszeiten oder Monate jahr: Jahr
-   temperatur\_heisse\_tage: Anzahl Heißer Tage (Tmax ≥ 30 °C)
-   temperatur\_frosttage: Anzahl Frosttage (Tmin ≤ 0 °C)
-   temperatur\_tropennaechte: Anzahl Tropennächte (Tmin ≥ 20 °C)
-   temperatur\_mittelwert: Temperatur (°C)
-   temperatur\_heizgradtage: Heizgradtage (Kelvin x Tage)
-   temperatur\_kuehlgradtage: Kühlgradtage (Kelvin x Tage)
-   niederschlag\_summe: Niederschlagssumme (Millimeter)
-   starkniederschlag\_20mm\_tage: Anzahl Tage mit N ≥ 20 mm
-   trockenperiode\_tage\_maximum: Dauer der längsten Trockenperiode mit
    Tagen &lt; 1 mm

# Solutions

-   Wie veränderte sich die Temperatur im zeitlichen Verlauf?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-3-1.png)

-   Wie verändert sich die Temperatur im Jahreszeitlichen Verlauf, über
    den gesamten Messzeitraum?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-4-1.png)

-   Wie verhalten sich die Niederschlagsmengen in Kombination mit den
    Heißen Tagen?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ## 
    ## Korrelation Niederschlag - Heiße Tage: 0.506

-   Wie entwickeln sich die Heißtage und Frost im laufe der Zeit und
    Sasional?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Saisonale Trenddiagramme, alle Saisons in einem Diagramm

![](juliettst_files/figure-markdown_strict/unnamed-chunk-7-1.png)

-   Wie sieht der Mittelwert im Jahr 2023 aus?

<!--# Mittelwert von was?  -->

![](juliettst_files/figure-markdown_strict/unnamed-chunk-8-1.png)

Darstellung mithilfe einer Heatmap

-   Wie häufig treten Trockenperioden auf und wie lange dauern diese an?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-9-1.png)

Heatmap, Barplot

-   Gibt es einen Zusammenhang zwischen Tropennächten und Trockentagen?

<!--# Da es keine Tropennächte gibts, checke ich überhaupt nicht was da gemacht sein sollte -->

![](juliettst_files/figure-markdown_strict/unnamed-chunk-10-1.png)![](juliettst_files/figure-markdown_strict/unnamed-chunk-10-2.png)

Korrelationsmatrix und Scatterplot, gerne auch andere Dimensionen

-   Wie häufig gab es jährlich mehr als 5 Frosttage/Heißtage im Jahr?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-11-1.png)![](juliettst_files/figure-markdown_strict/unnamed-chunk-11-2.png)![](juliettst_files/figure-markdown_strict/unnamed-chunk-11-3.png)

Threshold Exceedance Plots

-   Hat die Anzahl an Starknierderschlägen über die Jahre zugenommen?
    Wenn ja, wie viele Starkniederschläge gab es und wie verteilen sich
    diese über das Jahr?

![](juliettst_files/figure-markdown_strict/unnamed-chunk-12-1.png)![](juliettst_files/figure-markdown_strict/unnamed-chunk-12-2.png)

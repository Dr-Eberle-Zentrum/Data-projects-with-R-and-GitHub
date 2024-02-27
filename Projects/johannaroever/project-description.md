# Topic

During the Roman Empire grave stelae across the empire show similarities
but can differ depending on the exact area they were used in. This can
be the case because of local traditions and influences from other
regions.

Here the focus should be on the stelae from Cyprus which were
categorized and dated by the archaeologist Pogiatzi.The provided
[CSV](StelaeCyprus.csv) was assembled by me(J. Röver) from the data
described in Pogiatzi’s book:

E. Pogiatzi, Die Grabreliefs auf Zypern von der archaischen bis zur
römischen Zeit, Peleus 23 (Diss. Albert-Ludwigs-Universität Freiburg
2002, Möhnesee-Wamel 2003)

In some cases the data can be uncertain or incomplete because stelae
were found and/or excavated without modern archaeological methods. (For
the actual interpretation it’s also important to be aware that usually
not 100% of the artifacts are known and excavated.)

\#Goal The project should be the creation of plots to show how some of
the stelaes’ attributes might correlate with each other. The first few
of 124 observations are these:

    ##   catNo         epoch type
    ## 1     1 cypro-archaic   1a
    ## 2     2 cypro-archaic   1a
    ## 3     3 cypro-archaic   1a
    ## 4     4 cypro-archaic   1a
    ## 5     5 cypro-archaic   1a
    ## 6     6 cypro-archaic   1a
    ##                                                       typeDesc typeCertain
    ## 1 Grave stelae with guard animals, with two antithetical lions           1
    ## 2 Grave stelae with guard animals, with two antithetical lions           1
    ## 3 Grave stelae with guard animals, with two antithetical lions           1
    ## 4 Grave stelae with guard animals, with two antithetical lions           1
    ## 5 Grave stelae with guard animals, with two antithetical lions           1
    ## 6 Grave stelae with guard animals, with two antithetical lions           1
    ##   location  locationType paintedSurface              material
    ## 1  Amathus         grave                local white limestone
    ## 2  unknown       unknown                local white limestone
    ## 3  unknown       unknown                local white limestone
    ## 4  Amathus not specified                local white limestone
    ## 5 Athienou not specified                local white limestone
    ## 6   Golgoi not specified                local white limestone

## Intermediates

These could include information like this which could then be shown as
plot instead: ![Stele types per region](steleTypeRegion.png)

Attributes to plot together to see potential correlations, so mostly
it’s about how often certain attribute values occur together:

-   *epoch - type*: How long is each type used? Are there overlaps?
-   *epoch - type - material*: Are there any changes in the material
    that go along with the epoch and type?
-   *epoch - type - painted(true/false)*: Are stelae only painted in
    certain epochs or depending on their type?
-   *epoch - location* (only if found in situ, location accuracy might
    have to be discussed): Which locations are stelae found at in the
    different epochs?
-   *epoch - locationType* (only if found in situ, data might not be
    inconclusive because of many unknown): Were certain types of
    location used more during certain epochs?

# Topic

During the Roman Empire grave reliefs across the empire show
similarities but can differ depending on the exact area they were used
in. This can be the case because of local traditions and influences from
other regions.  
Here the focus should be on the stelae from Cyprus which were
categorized and dated by the archaeologist Pogiatzi.The provided
[CSV](StelaeCyprus.csv) was assembled by me (J. Roever) from the data
described in Pogiatzi’s book:

E. Pogiatzi, Die Grabreliefs auf Zypern von der archaischen bis zur
roemischen Zeit, Peleus 23 (Diss. Albert-Ludwigs-Universitaet Freiburg
2002, Moehnesee-Wamel 2003)

The analysed attributes are:

-   *catNo*: number given to the stele in Pogiatzi’s catalogue
-   *epoch*: the epoch to which Pogiatzi dated the stele
-   *type*: the type identified in Pogiatzi’s classification
-   *typeDesc*: description of the type
-   *typeCertain*: indicator whether the type could be identified
    certainly or not, the latter usually due to only fragmentary
    conservation
-   *location*: where the stele was found
-   *locationType*: in which context the stele was found
-   *paintedSurface*: description of painted areas
-   *material*: the material the stele is made of

In some cases the data can be uncertain or incomplete because grave
reliefs as well as other artifacts were found and/or excavated without
modern archaeological methods. (For further interpretation it is also
important to be aware that usually not 100% of the artifacts are known
and excavated.)

# Goal

The project should be the creation of plots to show how some of the
attributes of the stelae might correlate with each other. The first few
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

Attributes to plot together to see potential correlations, usually with
how often certain attribute values occur together:

-   *epoch - type*: How long is each type used? Are there overlaps?
-   *epoch - type - material*: Are there any changes in the material
    that go along with the epoch and type?
-   *epoch - type - painted(true/false)*: Are stelae only painted in
    certain epochs or depending on their type?
-   (*epoch - location* (only if found in situ[1], location accuracy
    might have to be discussed): Which locations are stelae found at in
    the different epochs?)
-   (*epoch - locationType* (only if found in situ, data might not be
    inconclusive because of many unknown): Were certain types of
    location used more during certain epochs?)

The last two can be excluded for the time being. Because of the
incomplete data the results might not be coherent enough for
interpretation.

## Intermediates

In some cases the attribute values need to be made more consistent
within the range they should reflect. To include the location in plots
it might be enough to use the name of the ancient site, especially for
cases in which the grave relief was only found near the site or similar.
Similar the range of materials might be condensed to the values of local
limestone, (local?) hard limestone and imported marble.

It might be useful to prepare information like this before creating the
actual plot:

<figure>
<img src="steleTypeRegion.PNG" alt="Stele types per region" />
<figcaption aria-hidden="true">Stele types per region</figcaption>
</figure>

## Visualisation

-   When depicting the types inclusion of a legend for the description
    of the types

[1] in situ: at the place it was originally used in ancient time

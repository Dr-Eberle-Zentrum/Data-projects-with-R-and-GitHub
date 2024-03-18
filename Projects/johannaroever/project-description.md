# Visualisation for grave stelae from Cyprus during the Roman Empire

During the Roman Empire grave reliefs across the empire show
similarities but can differ depending on the exact area they were used
in. This can be the case because of local traditions and influences from
other regions.  
Here the focus should be on the stelae from Cyprus which were
categorized and dated by the archaeologist Pogiatzi.The provided
[CSV](StelaeCyprus.csv) was assembled by me (J. Roever) from the data
described in Pogiatzi’s book:  
*E. Pogiatzi, Die Grabreliefs auf Zypern von der archaischen bis zur
roemischen Zeit, Peleus 23 (Diss. Albert-Ludwigs-Universitaet Freiburg
2002, Moehnesee-Wamel 2003)*

This is one example of the reliefs, from the julian-claudian era:
<figure>
<img src="exampleStele.PNG" alt="Example stele, Pogiatzi 2002 Cat.No.44" width=30%/>
<figcaption aria-hidden="true">
Example stele, julian-claudian era, Pogiatzi 2002 Cat.-No. 44
</figcaption>
</figure>

# Data

The analysed attributes are:

-   `catNo`: number given to the stele in Pogiatzi’s catalogue
-   `epoch`: the epoch to which Pogiatzi dated the stele
-   `type`: the type identified in Pogiatzi’s classification
-   `typeDesc`: description of the type
-   `typeCertain`: indicator whether the type could be identified
    certainly or not, the latter usually due to only fragmentary
    conservation
-   `location`: where the stele was found
-   `locationType`: in which context the stele was found
-   `paintedSurface`: description of painted areas
-   `material`: the material the stele is made of

The chronological order for `epoch` is: *cypro-archaic, cypro-classical,
hellenistic, julian-claudian, early\_imperial, flavian, antonine*

In some cases the data can be uncertain or incomplete because grave
reliefs as well as other artifacts were found and/or excavated without
modern archaeological methods. (For further interpretation it is also
important to be aware that usually not 100% of the artifacts are known
and excavated.)

The data describes the stelae by attributes which might correlate with
each other. The first few of 124 observations are shown here:

<table style="width:100%;">
<colgroup>
<col style="width: 3%" />
<col style="width: 8%" />
<col style="width: 3%" />
<col style="width: 38%" />
<col style="width: 7%" />
<col style="width: 5%" />
<col style="width: 8%" />
<col style="width: 9%" />
<col style="width: 13%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">catNo</th>
<th style="text-align: left;">epoch</th>
<th style="text-align: left;">type</th>
<th style="text-align: left;">typeDesc</th>
<th style="text-align: right;">typeCertain</th>
<th style="text-align: left;">location</th>
<th style="text-align: left;">locationType</th>
<th style="text-align: left;">paintedSurface</th>
<th style="text-align: left;">material</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">1</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Amathus</td>
<td style="text-align: left;">grave</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
<tr class="even">
<td style="text-align: right;">2</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">unknown</td>
<td style="text-align: left;">unknown</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
<tr class="odd">
<td style="text-align: right;">3</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">unknown</td>
<td style="text-align: left;">unknown</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
<tr class="even">
<td style="text-align: right;">4</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Amathus</td>
<td style="text-align: left;">not specified</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
<tr class="odd">
<td style="text-align: right;">5</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Athienou</td>
<td style="text-align: left;">not specified</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
<tr class="even">
<td style="text-align: right;">6</td>
<td style="text-align: left;">cypro-archaic</td>
<td style="text-align: left;">1a</td>
<td style="text-align: left;">Grave stelae with guard animals, with two
antithetical lions</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">Golgoi</td>
<td style="text-align: left;">not specified</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">local white limestone</td>
</tr>
</tbody>
</table>

# Goals

## Data Modification

1.  All values of *unknown* and *undefined* are to be replaced with `NA`
    for easier handling in R. The values of *not specified* should be
    kept.
2.  In `epoch` the value *antoninisch* should be replaced by *antonine*
    for using a consistent language.
3.  In the column `type`some values still include a “?” which should be
    deleted, since the information it was meant to convey is written in
    `typeCertain`.
4.  For the stelae with the `catNo` = *98* and *99* the value of `type`
    has to be changed to *6*.
5.  The values in `typeCertain` are to be replaced for easier handling
    in R: *0* to *FALSE*, *1* to *TRUE*.
6.  The column `location` has to be reviewed for only containing the
    values of the general regions, while more specific information can
    be deleted:
    -   *Amathus, Golgoi, Idalion, Kition, Marion/Paphos, Salamis,
        Soloi, Tamassos*
    -   All *unknown* in this column can be converted to *Cyprus*.
    -   All values which include “(?)” can be converted to *Cyprus*.
    -   If the current value already includes one of the region names,
        shorten it to only that. This appies to values which include
        “near”, “bei”
    -   The value of the observation of `catNo`=*12* which says
        “probably Idalion” should be changed to *Cyprus*.
    -   Other:
        -   region of Limassol –&gt; Amathus
        -   Limassol –&gt; Amathus
        -   Mathikoloni –&gt; Amathus  
        -   Athienou –&gt; Golgoi
        -   Melousha –&gt; Golgoi
        -   Pergamon –&gt; Golgoi  
        -   Alambra (Larnaca) –&gt; Kition
        -   Pano Arodes –&gt; Marion
        -   Polis –&gt; Marion  
        -   Kotschines (neighbourhood of Lysi) –&gt; Salamis
        -   north of Lysi, district Famagusta –&gt; Salamis  
        -   Ambelia, near Morphou –&gt; Soloi  
        -   Pera (Asproji) –&gt; Tamassos
7.  For easier handling of `material`the values should just be reduced
    to either *limestone* or *marble*.

## Visualisation

To get a better view of the data for answering certain questions, some
of the attributes should be shown in tables as well as in plots using
`ggplot2`.

### 1. Stacked bar plot epoch - type

To answer the question which types (including the sub-types) are used
per epoch:

1.  Create a table to show the amounts of each type per epoch.
2.  Create a stacked bar plot to show the correlation `epoch - type`:

-   `epoch` is the variable on the x-axis
-   For the order to show `epoch` in follow the chronological order
    given in the [data description](#Data).
-   The amounts of each `type` should be shown with the number added to
    each part of the stack.
-   The order to show `type` in should be following the stages in
    alphanumeric order.
-   Add a legend to display the `typeDescription` on the side of the
    diagram.

When only the general type is given  
The stelae without defined values in `type` should still be counted and
shown as “undefined” for each epoch. The column `typeCertain` can be
ignored for this. If the type is marked as uncertain count it for the
type given in `type`.

This should be done similar to the following example table and diagram
showing the stele types per region:
<figure>
<img src="steleTypeRegion.PNG" alt="Table: Stele types per region" width=50%/>
<figcaption aria-hidden="true">
Example table: Stele types per region
</figcaption>
</figure>
<figure>
<img src="exampleDiagram.PNG" alt="Diagram: Stele types per region" width=50%/>
<figcaption aria-hidden="true">
Example diagram: Stele types per region
</figcaption>
</figure>

### 2. Stacked bar plot type - material

Similar to above, to answer the question which materials are used in the
different types:

1.  Create a table to show the amounts of each material per type.
2.  Create a stacked bar plot to show the correlation `type - material`:

-   `type` is the variable on the x-axis
-   The amounts of each `material` should be shown with the number added
    to each part of the stack.
-   The order to show `type` in should be following the stages in
    alphanumeric order.
-   Add a legend to display the `typeDescription` on the side of the
    diagram.

### 3. Optional: Scatterplot epoch - type - material

The goal of this is to visualise if and when there are there any changes
in the material that go along with the epoch and type:

Create a <s>scatterplot</s> to show the correlations between
`epoch - type - material`. A scatterplot might only work for this with
some tweaks, e.g. using jittering. Maybe another type of plot would be
more useful, feel free to make suggestions.

-   `epoch` on the x-axis, for the order to show `epoch` in follow the
    chronological order given in the [data description](#Data).
-   `type` on the y-axis
-   Use the marker `color` to display the material and include the
    legend for this.
-   Optional: Add a correlation line.

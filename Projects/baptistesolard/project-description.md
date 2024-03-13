# Coloured Glass Beads in the Early Middle Ages

## Project description

In the early Middle Ages, coloured glass beads were a very common type
of female ornament.

<img src="Beads_Sasse1989.png" id="id" class="class"
style="width:40.0%;height:40.0%" />  
*Example of early Medieval glass beads (from Sasse 1998).*

Up until today, many of these glass beads were found in female grave of
the early Middle Ages all over Europe. However, very few locations of
production sites were discovered unitl now. One of them is Zürich,
Switzerland, where not only coloured glass beads can be found, but also
ceramic vessels with coloured glassy attachments in them, suggesting a
local production of the pigments destined for beadmaking.

<img src="RV_Heck2000.png" id="id" class="class"
style="width:40.0%;height:40.0%" />  
*Example of ceramic with a yellow glassy attachment inside found in
Schleitheim, Switzerland (from Heck 2000).*

------------------------------------------------------------------------

## Data sets

The archaeologists who excavated the site gave me two CSV files
containing information about the all finds associated with
glassmaking.  
The main `Inventory` table is… let’s say quite hard to navigate without
modifications.

### Table 1: Inventory

The first CSV table
([Inventory\_Glassworkshop.csv](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/baptistesolard/Inventory_Glassworkshop.csv))
is the inventory of the archaeological finds associated with
glassmaking.  
Here is an extract of the `Inventory` table:

<table>
<colgroup>
<col style="width: 4%" />
<col style="width: 11%" />
<col style="width: 19%" />
<col style="width: 7%" />
<col style="width: 6%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 9%" />
<col style="width: 8%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">Obj</th>
<th style="text-align: left;">Field</th>
<th style="text-align: left;">POS</th>
<th style="text-align: right;">Context</th>
<th style="text-align: left;">Number</th>
<th style="text-align: left;">Phase</th>
<th style="text-align: right;">HollowGlass</th>
<th style="text-align: right;">FlatGlass</th>
<th style="text-align: right;">Splitter</th>
<th style="text-align: right;">GlassChunk</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">44</td>
<td style="text-align: left;">J</td>
<td style="text-align: left;">17-19 und Gräberfeld</td>
<td style="text-align: right;">249</td>
<td style="text-align: left;">xx1</td>
<td style="text-align: left;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr class="even">
<td style="text-align: right;">851</td>
<td style="text-align: left;">Pl.Fl 43-46</td>
<td style="text-align: left;">557</td>
<td style="text-align: right;">466</td>
<td style="text-align: left;">201</td>
<td style="text-align: left;">Pink - R</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1030</td>
<td style="text-align: left;">14</td>
<td style="text-align: left;">335</td>
<td style="text-align: right;">297</td>
<td style="text-align: left;">xx1</td>
<td style="text-align: left;">Oberer Silt</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr class="even">
<td style="text-align: right;">1030</td>
<td style="text-align: left;">8</td>
<td style="text-align: left;">655</td>
<td style="text-align: right;">359</td>
<td style="text-align: left;">xx1</td>
<td style="text-align: left;">Pink - R</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1030</td>
<td style="text-align: left;">13</td>
<td style="text-align: left;">365</td>
<td style="text-align: right;">399</td>
<td style="text-align: left;">201</td>
<td style="text-align: left;">Pink - R</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
<tr class="even">
<td style="text-align: right;">1030</td>
<td style="text-align: left;">10</td>
<td style="text-align: left;">633</td>
<td style="text-align: right;">441</td>
<td style="text-align: left;">201</td>
<td style="text-align: left;">Pink - R</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
<td style="text-align: right;">NA</td>
</tr>
</tbody>
</table>

-   The first 4 columns contain the serial number of each object

    -   `Obj`, `Field`, `POS`, and `Context` refer to the exact
        localisation of the finds and is connected with the map of the
        excavation site.

    -   `Number` is the actual number of the object. The numbers are
        always reintialised for each context, meaning that the unique
        identifier of each object can be obtained by combining
        `Context.Number`. For instance, in row 2, the unique identifier
        would be “466.201”.  
        When the object number was missing, I filled it with `xx1`,
        `xx2`, etc. to at least have something.

-   The `Phase` column gives the name of the soil layer in which the
    objects were found.

-   All the other column represent the different object types. If
    individual objects belong to one type, there is a 1 in the
    corresponding column (except columns 20–23, see below). In some
    case, the colours of the glass objects are also indicated.

    -   `HollowGlass`, `FlatGlass`, `Splitter`s, `GlassChunk`s, and
        `Droplet`s are remains made of transparent glass.

    -   `Slag`s are by-product of glassmaking.

    -   `Tessera`e are square pieces of mosaic, usually made of glass.

    -   Glass `Rod`s small pieces of cane or stick made of glass.
        `Rod_molten`, `Rod_polychrome`, `Rod_length`, and `Rod_dm` are
        the characteristics of the said rods: if they are molten or
        polychrome (those are yes/no columns), and their length and
        diameter (in cm).

    -   `Pontil` are pontil glass. A pontil glass is a piece of glass
        which bears marks of tool use (very interesting when studying
        the production process of said glass objects!).

    -   `OGW` = opaque glass waste are piece of coloured glass, probably
        fallen off during the production of the objects, or which shapes
        are unrecognisable.

    -   The colour of the `Bead`s are not given in this table. They can
        be found in Table 2.

    -   `RV` = reaction vessels. These are ceramic fragments, which have
        some glassy attachment on them. The pigments and glass were
        produced in these vessels, so they are of very interesting for
        studying the production process. The glassy attachments in these
        RVs are also coloured, but unfortunately the information was not
        recorded in the inventory data tables…

    -   `OvenPiece` are … oven pieces, in which the glass was made. Or
        at least they remains of some pyrotechnological installation,
        which should be connected to glassmaking.

    -   `Miscellaneous` is self-explanatory: these are objects that do
        not belong to any of the above-mentioned categories.

### Table 2: Glass beads

The second CSV table
([GlassBeads.csv](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/baptistesolard/GlassBeads.csv))
records the characteristics of each glass bead, including their
colour.  
Here is an extract of the table:

<table style="width:100%;">
<colgroup>
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 12%" />
<col style="width: 5%" />
<col style="width: 11%" />
<col style="width: 19%" />
<col style="width: 16%" />
<col style="width: 3%" />
<col style="width: 1%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: right;">Obj</th>
<th style="text-align: right;">Field</th>
<th style="text-align: right;">POS</th>
<th style="text-align: right;">Context</th>
<th style="text-align: right;">Number</th>
<th style="text-align: left;">Phase</th>
<th style="text-align: right;">TypeNumber</th>
<th style="text-align: left;">Type</th>
<th style="text-align: left;">Colour</th>
<th style="text-align: left;">Form</th>
<th style="text-align: right;">Length</th>
<th style="text-align: right;">Dm</th>
<th style="text-align: right;">HoleSize</th>
<th style="text-align: left;">IronOxide</th>
<th style="text-align: left;">Broken</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">458</td>
<td style="text-align: right;">312</td>
<td style="text-align: right;">201</td>
<td style="text-align: left;">Pit house - Backfilling</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">double-conical, small</td>
<td style="text-align: left;">green</td>
<td style="text-align: left;">double-conical</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">2.0</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">n</td>
</tr>
<tr class="even">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">458</td>
<td style="text-align: right;">312</td>
<td style="text-align: right;">202</td>
<td style="text-align: left;">Pit house - Backfilling</td>
<td style="text-align: right;">15</td>
<td style="text-align: left;">winding marks</td>
<td style="text-align: left;">red</td>
<td style="text-align: left;">asymmetrically pressed spherical</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">2.5</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">n</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">18</td>
<td style="text-align: right;">1460</td>
<td style="text-align: right;">858</td>
<td style="text-align: right;">201</td>
<td style="text-align: left;">Upper silt</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">double-conical, big</td>
<td style="text-align: left;">blue</td>
<td style="text-align: left;">double-conical</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">3.0</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">n</td>
</tr>
<tr class="even">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">1072</td>
<td style="text-align: right;">1000</td>
<td style="text-align: right;">202</td>
<td style="text-align: left;">Pink - layer in situ</td>
<td style="text-align: right;">4</td>
<td style="text-align: left;">ring-shaped</td>
<td style="text-align: left;">green</td>
<td style="text-align: left;">pressed barrel-shaped/ring</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">16</td>
<td style="text-align: right;">6.0</td>
<td style="text-align: left;">n</td>
<td style="text-align: left;">y</td>
</tr>
<tr class="odd">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">1724</td>
<td style="text-align: right;">1056</td>
<td style="text-align: right;">201</td>
<td style="text-align: left;">Pink - layer in situ</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">polychrome</td>
<td style="text-align: left;">yellow, decor slightly translucent
red</td>
<td style="text-align: left;">ring-shaped</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">4.0</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">n</td>
</tr>
<tr class="even">
<td style="text-align: right;">1052</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">1731</td>
<td style="text-align: right;">1111</td>
<td style="text-align: right;">201</td>
<td style="text-align: left;">Pink - layer in situ</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">cylindrical</td>
<td style="text-align: left;">red</td>
<td style="text-align: left;">cylindrical</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">3.0</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">n</td>
</tr>
</tbody>
</table>

-   The first 5 columns again contain the serial number and phase of
    each object, as in Table 1.

-   `TypeNumber` represent the type of the beads. These numbers
    correspond to specific types described in the literature.

-   `Type` describes the type of each bead in words.

-   `Colour` gives the colour of each bead. Some of them are polychrome
    and the secondary/decoration colour(s) are given here as well, which
    make a categorisation in R (via `group_by()` for instance) hard to
    make.

-   `Form` describes in words the shape/form of the beads.

-   `Length`, `Dm`, and `HoleSize` give the metric characteristics of
    each bead (in cm): length, diameter, and size of the tread hole.
    Some beads have missing parameters because they could not be
    measured (brocken beads) or simply were not measured yet.

-   `IronOxide` is a yes/no column giving the presence or not of traces
    of iron oxide attached to the beads. These traces of iron oxide are
    remains of the metal rod/stick used to produce the beads.

-   `Broken` is another yes/no column indicating if the bead is broken
    or not.

------------------------------------------------------------------------

## Objectives: Modification of the data tables

### Table 1

Table 1 (`Inventory`) should be modified:

1.  Add a column `SampleID` which gives an unique identifiers for each
    object and place this column after `Number`.  
    This should be done by combining `Context` and `Number` with `.` as
    separator to obtain `Context.Number`.

2.  Remove the extra characteristics from the glass rods (columns 20–23)
    and store them in a new table dedicated to rods called `Rods` (like
    the one with beads). Be careful to keep at least `SampleID` with it,
    so we can still use the information later.

3.  Transpose the table so that the object type and colour information
    are given in 2 new columns: `Type` and `Colour`. If no colour
    information was given, simply leave it as `NA`.  
    According to Martin, this could be done with `pivot_longer()`.

4.  The colour information for the beads can be taken from `Beads`
    (after `SampleID` is added to that table) using a `join()` function
    (see the different `join()` functions
    [here](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/issues/212)).  
    ⚠️ One problem here: not all the beads in `Beads` are in
    `Inventory`, and vice versa. To tackle this, I would suggest this
    method:

    1.  first do the modification on `Beads` as described below (Table
        2, point 1 and 2)
    2.  `select()` only the columns `SampleID` and `Colour`
    3.  create a column `Type` with `"bead"` as value for all rows
    4.  `full_join()` with `Inventory` This should ensure that all beads
        in `Beads` are added to `Inventory` with their respective colour
        and with always `"bead"` as value in `Type`.

### Table 2

Table 2 (`Beads`) should also be modified:

1.  Like in the `Inventory` table, add a column `SampleID` which gives
    an unique identifiers for each object. Place this column after
    `Number`.

2.  Since `Colour` also gives additional colours for the polychrome
    beads, this column needs to be separated into 2: `Colour` and
    `Decor` (probably using the `separate()` function). At best, the
    word `"decor"` should also be removed from the description in column
    `Decor`.  
    Example: in row 5, we would get `Colour[5] = "yellow"` and
    `Decor[5] = "slightly translucent red"`.

3.  The yes/no columns (`IronOxide` and `Broken`) could be modified to
    contain actual booleans instead, by replacing `y` by `TRUE` and `n`
    by `FALSE`.

4.  As mentioned above, not all beads recorded in `Inventory` are in
    `Beads`. To add them, we need to do another `full_join()` with the
    following steps:

    1.  first do the `full_join()` described above (Table 1, point 4)
    2.  using `Inventory`, `filter()` for beads and `select()` the
        columns `SampleID` and `Colour`
    3.  `full_join()` with `Beads`

### New table: Rods

In the new table `Rods` extracted from the `Inventory` table recording
the characteristics of the rods, the names for the columns can be
changed to remove `Rod_` in them since this is not needed anymore. The
columns should be called `Molten`, `Polychrome`, `Length`, and `Dm`.

The colours of the rods could also be added to this table by extracting
the information from the `Inventory` table.

The yes/no columns (`Molten` and `Polychrome`) could be modified to
contain actual booleans instead, by replacing `y` by `TRUE` and `n` by
`FALSE`.

------------------------------------------------------------------------

## Visualisation

### Colour distribution

From the `Inventory` table, an histogram of the `Colour` distribution
for the `Rod`s, `Bead`s, and `OGW`s can be created. One histogram per
object type, and one combining all types.

Here is an example of how it should look like:  
<img src="HistogramExample.png" id="id" class="class"
style="width:40.0%;height:40.0%" />

### Distribution vs. Volume

It is interesting to know how many beads and rods there is per colours,
but I already observed with the pictures taken from the samples that
yellow beads for instance tend to be smaller than the red ones, although
there are more yellow beads than red.  
Therefore, it would also be interesting to plot an histogram of the
volume represented by each colour for the `Beads` and `Rods` since we
have the information for most of them. Obviously, not all beads and rods
have the same shape, so it is hard to calculate their volume, but we can
make a rough approximation, considering them as cylinders.  
After creating a new column `Volume = pi * (Dm)^2 * Length` in both
`Beads` and `Rods`, we can now plot a new histogram of `Volume` per
`Colour` for both.  
As an additional information, the number of beads and rods excluded from
the volume calculation because of missing information could be given.

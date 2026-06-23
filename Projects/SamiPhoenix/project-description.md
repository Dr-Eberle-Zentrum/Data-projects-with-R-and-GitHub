The IUCN (International Union for Conservation of Nature) and their “Red
List of Threatened Species” aim to draw attention to, and keep track of,
how non-human life on earth is faring.

To this end they assess various species and how their populations are
developing over time, sorting them into categories, doubtless you’ve
seen some of these categories before, like `Threatened` or even
`Extinct`.

The table you will be working on only covers a small part of the Red
Lists scope, namely it provides the number of species from every class
and how they are classified according to the red list. (There is also
Kingdom data but we will get to that.)

Now `Species` you’ve all heard before, it is the smallest unit in the
taxonomy of life, defined by members of a species being able to produce
offspring which itself is able to produce offspring.

`Class` and `Kingdom` might feel more foreign to you, but it just comes
down to larger umbrellas of life. A Class contains many Species each

-   There are also more so-called Taxonomic Ranks in between but we
    don’t care about those here.

And a `Kingdom` contains many `Classes` itself, `Kingdom` being one of
the highest ranks. One Kingdom for example is `Animalia` which includes
all animals. Or `Plantae` which includes all plants.

-   Again there are more intermediary steps between `Kingdom` and
    `Class`.

# Tasks:

## 1. Data import and wrangling

### a) Import csv into R

I have placed the `.csv` in my `/dependencies` folder, you can import it
from there.

<table style="width:100%;">
<caption>After importing the table should look like this:</caption>
<colgroup>
<col style="width: 8%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 10%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 19%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 16%" />
<col style="width: 3%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 2%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Name</th>
<th style="text-align: right;">EX</th>
<th style="text-align: right;">EW</th>
<th style="text-align: right;">Subtotal (EX+EW)</th>
<th style="text-align: right;">CR(PE)</th>
<th style="text-align: right;">CR(PEW)</th>
<th style="text-align: right;">Subtotal (EX+EW+ CR(PE)+CR(PEW))</th>
<th style="text-align: right;">CR</th>
<th style="text-align: right;">EN</th>
<th style="text-align: right;">VU</th>
<th style="text-align: right;">Subtotal (threatened spp.)</th>
<th style="text-align: right;">LR/cd</th>
<th style="text-align: right;">NT or LR/nt</th>
<th style="text-align: right;">LC or LR/lc</th>
<th style="text-align: right;">DD</th>
<th style="text-align: right;">Total</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">ACTINOPTERYGII</td>
<td style="text-align: right;">90</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">101</td>
<td style="text-align: right;">143</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">252</td>
<td style="text-align: right;">777</td>
<td style="text-align: right;">1359</td>
<td style="text-align: right;">1502</td>
<td style="text-align: right;">3638</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">890</td>
<td style="text-align: right;">17851</td>
<td style="text-align: right;">5236</td>
<td style="text-align: right;">27716</td>
</tr>
<tr>
<td style="text-align: left;">AMPHIBIA</td>
<td style="text-align: right;">37</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">39</td>
<td style="text-align: right;">187</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">227</td>
<td style="text-align: right;">825</td>
<td style="text-align: right;">1291</td>
<td style="text-align: right;">814</td>
<td style="text-align: right;">2930</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">453</td>
<td style="text-align: right;">3733</td>
<td style="text-align: right;">896</td>
<td style="text-align: right;">8051</td>
</tr>
<tr>
<td style="text-align: left;">ANTHOZOA</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">246</td>
<td style="text-align: right;">58</td>
<td style="text-align: right;">336</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">24</td>
<td style="text-align: right;">431</td>
<td style="text-align: right;">147</td>
<td style="text-align: right;">938</td>
</tr>
<tr>
<td style="text-align: left;">ARACHNIDA</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">27</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">36</td>
<td style="text-align: right;">121</td>
<td style="text-align: right;">165</td>
<td style="text-align: right;">104</td>
<td style="text-align: right;">390</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">52</td>
<td style="text-align: right;">488</td>
<td style="text-align: right;">114</td>
<td style="text-align: right;">1053</td>
</tr>
</tbody>
</table>

### b) Visit the Website

[IUCN Red List](https://www.iucnredlist.org/statistics)

Check out the table and the legend below, familiarize yourself with the
column names and what categories they belong to.

### c) Add Kingdom data

On the website you will see that they also have data on which Kingdom
the various Classes belong to, we want to add this data
semi-automatically.

-   Manually note the different Kingdoms and in what order they appear
    in the online table.

-   Use `lag()` and/or `fill()` alongside the fact that the table is
    ordered lexicographically by Class-name within each Kingdom to
    automatically find the boundaries between the different Kingdoms.

-   Add the Kingdom information in a new column named `Kingdom`

## 2. Data Manipulation

### a) Remove unwanted columns

The legend on the website also explains that `Possibly Extinct` and
`Possibly Extinct in the Wild` are not classifications from the IUCN, as
such take them out of your table. Then also remove the column
`Subtotal (EX+EW+ CR(PE)+CR(PEW))`.

### c) Simplify columns

I dislike the following categories:

-   `LR/cd - Lower Risk/conservation dependent`

-   `NT - Near Threatened (includes LR/nt - Lower Risk/near threatened)`

I want you to restructure them by integrating them into one singular new
column, which is made up of the sum of both. Call this column
`Near Threatened` and remove the old ones.

### d) Make column names readable

The website also has an explanation of the column names at the bottom,
look them up and replace the column names with the easier to read full
names of the categories, shorten in a way where:

-   The columns should at the end all have names that are in line with
    `Near Threatened`.

-   They remain unique.

## 3. Data Visualisation

### a) Create relative amount table

Before you start visualizing, create a separate table. In this table,
each of the columns, except the `Total` column, contain the percent of
the `Total` they make up row-wise.

-   So if in the old table, a row contains a `Total` of 200 and an `EX`
    of 8, the new table would say 4 in the `EX` column.

-   The `Total` column should always display 100

-   Also give the column names an update so it says `<ColumnName> [%]`

### b) Visualize difference between Kingdoms

We want to compare the different Kingdoms, especially if they have been
affected to different extends:

To this end, create a bar plot as in the picture, one bar per Kingdom.
Exclude any Kingdoms that have a total of less than 1000 Species from
the plot.

The y-Axis contains the percent of species in that `Kingdom` that fall
into various categories colored as in the picture. The categories are:

-   Extinct: `EX` or `EW`

-   Affected: `CR`, `EN` or `VU`

-   Unaffected or no data: Rest

Make sure you find better labels and names for the Legend and the Axis
labels.

![](dependencies/Plot2.png)

### c) Visualize most and least affected Classes

Next we are interested in the most and least affected Classes, as well
as which `Kingdom` they belong to:

Affected here is defined as the “Percent of at least Critically
Endangered Species in a given Class”

Create a bar-plot that contains (from left to right):

-   The 10 most affected Classes, ordered from most to least.

-   Three dots like in the provided picture.

-   the 10 least affected Classes, ordered from most to least

Make sure to also:

-   Color the bars according to the Classes’ `Kingdom` and place a
    legend that explains the colors.

-   Label every bar with the appropriate `name` of the Class and make
    sure it looks good (you might want to use diagonal labels or other
    tricks)

![](dependencies/Plot1.png)

## What this project is about

In this project, we will look at the playerbase data of the Game “World
of Warships”. The goal is to find out which Nation is the most popular
by taking the total amount of battles played per ship into account.

### About the Data

You will be provided with the data in the form of a xlsx file, called
“wows\_playerbase\_data.xlsx”. This data has been provided by  
[wows-numbers.com](https://wows-numbers.com/ships/).  
Inside, you can find every single currently released Ship with its
respective Tier, Shiptype and Nation attached.  
\[The xlsx format has been chosen to stop the columns from being
formatted into a date\]

Additionally, each ship has columns that show the amount of total games
played per ship, together with its win rate, average damage and some
more additional data.

#### There are **13 Nations**:

-   Europe
-   Commonwealth
-   The Netherlands
-   Italy
-   U.S.A.
-   Pan-Asia
-   France
-   U.S.S.R.
-   Germany
-   U.K.
-   Japan
-   Spain
-   Pan-America

#### There are **5 Ship Types**:

-   Destroyer
-   Cruiser
-   Battleship
-   Aircraft Carrier
-   Submarine

#### In total there are **11 Tiers**.

------------------------------------------------------------------------

## The Contest

To determine which Nation is the most popular, we will look at the data
for each Nation, Ship type and Tier.

The contest will introduce a simple point system that will keep track of
its popularity.

Each nation will form groups for every tier, containing one ship of
every ship type. The ships of these groups will be the ones that have
the highest amount of battles in its tier.

#### Restrictions:

-   **Spain, Pan-America, Pan-Asia, The Netherlands, Commonwealth and
    Europe will be excluded** from this contest, since they do not have
    a competitor for every shiptype in every tier.

-   **Submarines and Aircraft carriers will be excluded from this
    contest** due to the fact, that they are not available for every
    nation and Tier.

-   **Ships below Tier 3** are banned since some nations are lacking
    battleships and destroyers.

-   **Ships of Tier 11**, also known as “Superships”, **are also
    banned**, since they divert from the normal flow of progression in
    this game and are not designed to be played often by the average
    player

-   **Ships below 200 000 battles** will be excluded, since they are
    either too new or not popular enough to be considered.

------------------------------------------------------------------------

#### A group example for tier 3:

##### **Japan**:

<table>
<thead>
<tr class="header">
<th>Shiptype</th>
<th>Tier</th>
<th>Shipname</th>
<th>Battles</th>
<th>Winrate</th>
<th>Average Damage</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Battleship</td>
<td>3</td>
<td>Kawachi</td>
<td>2541886</td>
<td>49.55 %</td>
<td>20 099</td>
<td></td>
</tr>
<tr class="even">
<td>Cruiser</td>
<td>3</td>
<td>Tenryu</td>
<td>2969168</td>
<td>48.7 %</td>
<td>18 313</td>
<td></td>
</tr>
<tr class="odd">
<td>Destroyer</td>
<td>3</td>
<td>Wakatake</td>
<td>2136183</td>
<td>48.54 %</td>
<td>15 793</td>
<td></td>
</tr>
</tbody>
</table>

##### **U.S.A**:

<table>
<thead>
<tr class="header">
<th>Shiptype</th>
<th>Tier</th>
<th>Shipname</th>
<th>Battles</th>
<th>Winrate</th>
<th>Average Damage</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Battleship</td>
<td>3</td>
<td>South Carolina</td>
<td>3800000</td>
<td>48.69 %</td>
<td>21 182</td>
<td></td>
</tr>
<tr class="even">
<td>Cruiser</td>
<td>3</td>
<td>St. Louis</td>
<td>5954447</td>
<td>51.29 %</td>
<td>21 945</td>
<td></td>
</tr>
<tr class="odd">
<td>Destroyer</td>
<td>3</td>
<td>Wickes</td>
<td>2392688</td>
<td>47.53 %</td>
<td>14 077</td>
<td></td>
</tr>
</tbody>
</table>

In this example we can see that the U.S.A. has the most played battles
with every single ship type at Tier 3 compared to Japan.

So the U.S.A. would actually get **all 3 Points** in this stage of the
contest. This of course can change, once we bring in the other competing
Nations.

------------------------------------------------------------------------

## Optional Bonus Points:

Should there be a need to break a tie in points, the following bonus
points can be awarded:

-   **Winrate Bonus**: The Nation with the highest average winrate of
    each type at tier 10 will get an additional point.
-   **Damage Bonus**: The Nation with the highest accumulated average
    damage from tier 8 to 10 will get an additional point.

------------------------------------------------------------------------

#### Results:

In the end the points should be accumulated and by Tier 10 the **Top 3
most popular nations** should be determined. The most unpopular nation
should also be highlighted. This can either be portrayed by showing the
final results with **a table** or **a plot** that keeps track of the
**points on the y-axis** for each nation and the **tiers on the x-axis**
in any nice looking form.

------------------------------------------------------------------------

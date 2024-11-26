### About the Game

World of Warships is a naval warfare game in which two teams, consisting
of 12 players each, fight against each other in various gamemodes. Here
they are competing over map control, utilizing different ship types,
each with their strengths and weaknesses.  
  
**Battleships** for example excel due to their high armor and firepower,
while their speed, maneuverability and rate of fire are on the lower
end.  
**Destroyers** on the other hand are fast and nimble and are also able
to use torpedoes to deal damage. This is assisted by their high
concealment due to their smaller size, allowing them to get closer to
enemies unseen, but carry a huge risk to get destroyed early due to
their lacking armor and health points.  
**Cruisers** are considered to be somewhere in the middle of the pack,
where they have a good balance of everything, but still stand out due to
their ability to provide utility to the team in the form of radar, which
can reveal enemy ships in a certain radius, or hydroacoustic search,
which can detect incoming torpedoes in the water early.  
  
Different **Nations** are represented in this game with their historical
ships.  
Each nation brings with it their own strengths and weaknesses that alter
the playstyles of each shiptype between the nations. One nation might
focus more on survivability and firepower in order to become a hard
hitting and hard to get rid of thorn in the enemies eye, while another
might bring along more speed and concealment to utilize torpedoes
better.  
  
**Tiers** are used to represent the power level of each ship. Usually
with the player climbing the tiers, they will receive newer and more
advanced ships, each nation built or planned during their times.  
In the games, players will be matched for a battle with ships of the
same tier, to ensure a fair fight.  

## What this project is about

In this project, we will look at the playerbase data.  
Given the structure the game provides with the combination of shiptypes
and nations, we will try to figure out which nation and its attempt to
create its unique playstyle is the most popular among the playerbase.  
To do this, we will be taking the total amount of battles played per
ship into account and try to define a way to keep track of the
popularity as the Tiers increase.

### About the Data

You will be provided with the data in the form of a csv file, called
[“wows\_playerbase\_data.csv”](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/shad-lad-flad/wows_playerbase_data.CSV).
This data has been provided by  
[wows-numbers.com](https://wows-numbers.com/ships/).  
Inside, you can find every single currently released Ship with its
respective Tier, Shiptype and Nation attached.  
Additionally, each ship has columns that show the amount of total games
played per ship, together with its win rate, average damage and some
more additional data.  
What you will also notice is that some columns could not handle the
transfer into the file, so you will have to correct them if you choose
to use them. The correct values can always be checked from the source.  
  

------------------------------------------------------------------------

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
  

#### Groups:

The contest will introduce a simple point system that will keep track of
its popularity as we progress through the tiers. To do this, we will be
creating groups that have the following characteristics:  

-   The group has to contain at least one ship of every ship type. Due
    to the limitations introduced later, a group will contain a maximum
    of 3 ships per tier.
-   Aside from the name and tier, the group has to at least contain the
    columns “Battles”, “Winrate” and “Average Damage”.
-   Per shiptype, the group has to contain the one ship with the highest
    amount of battles.

This needs to be done for **every nation** and for **every tier** of the
contest.  
The groups themselves are not necessary to be visualized. They only
provide a framework that will contain relevant information to help you
compare in the later steps.  

#### Note:

Not every nation has a full lineup of ships for every type. So there
will be cleanup necessary. The “Restrictions” in the document will
describe closer how to handle this.

------------------------------------------------------------------------

#### Restrictions:

-   **Submarines are excluded from the contest** due to the fact, that
    they are not available for every nation, only apear once every two
    tiers and are still relatively new to the game.

-   **Aircraft carriers will be excluded from this contest** because not
    every nation has access to them and unlike other ship types, they
    also only appear every two tiers.

-   **Ships below Tier 3** are banned since this is considered to be the
    tutorial stage of the game and not designed to be played for an
    extensive period of time.

-   **Ships of Tier 11**, also known as “Superships”, **are also
    banned**, since they divert from the normal flow of progression in
    this game and are not designed to be played often by the average
    player

-   **Ships below 200 000 battles** will be excluded, since they are
    either too new or not popular enough to be considered.  

-   A nation is only **qualified** for the comparison in the tier if
    they have **at least 2 out of 3 ship types** present. If they do not
    meet this requirement, they will be **excluded** from the comparison
    **in that tier** but may compete in the next one.  

------------------------------------------------------------------------

#### The points:

After you have prepared a group for every nation in its tier, you will
need to compare the values per ship type.  
**Every ship type** has a chance to win **a point** for their nation.
This means that there will be **3 points** to be awarded **per tier**.

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
    damage from tier 8 to 10, using all ships within the groups, will
    get an additional point.

------------------------------------------------------------------------

## Optional Point modifier:

Should there be a scenario, where a nation is so overwhelmingly popular,
that they horde each and every point like a dragon hordes gold, a point
modifier can be introduced. The modifier looks as follows:  

-   during the comparison of each group, the **top 3** “amount of
    battles” **will now be considered** for **each ship type** in the
    tier.
-   The placement will determine the multiplier for the points:
    -   1st place: 3x (3 x 3 points in total per tier)
    -   2nd place: 2x (3 x 2 points in total per tier)
    -   3rd place: 1x (3 x 1 point in total per tier)

this will give some nations a chance to be compete against those that
have been present since the release of the game.  
So in the end, there are 18 points available per tier

------------------------------------------------------------------------

#### Results:

In the end the points should be accumulated and by Tier 10 the **Top 3
most popular nations** should be determined. The most unpopular nation
should also be visibly highlighted, even if their points are at 0.  
  
An example of a possible graph is provided
[here.](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/main/Projects/shad-lad-flad/wows_contest_graph_example.png)  
  
The idea of the graph is to not only track the amount of points, but
also to keep track of the point progression per tier within the graph.  
The nations should be ordered by their final point count in descending
order.  
Your final representation can vary, but should contain the same
information.  
  

Good luck!

------------------------------------------------------------------------

## General Topic:

For my data project I would like to analyze the U.S Martial Art’s
Promotion “UFC”  
(or perhaps even the sport of MMA as a whole) from a statistical
standpoint.  
As this is a topic which generates vast amounts of data, there are
endless possibilities  
for graphs, analyses and perhaps even predictions.  

Other than some “nice-to-know” hypothesis question like  
“Is there a negative correlation between the success of a fighter and
the GDP of his home country ?” the most interesting question would of
course be whether we can successfully predict the winners of future
fights.  
Since this a very “chaotic” sport which is generally considered very
unpredictable, but on the other hand generates a ton of data, it is
almost like asking:  
**“Who will win: Chaos or Order ?”**  

## The Data:

The foundation for this project will be provided by [this
dataset](https://www.kaggle.com/datasets/aminealibi/ufc-fights-fighters-and-events-dataset/data).  
Not only does it come with an MIT-License, meaning we are free to do
with it as we please,  
but we also get the option to work with completly raw data, straight
from the scraper!  
There are 5 datasets included in this package:

-   **The Events**

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 36%" />
<col style="width: 18%" />
<col style="width: 28%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Event_Id</th>
<th style="text-align: left;">Name</th>
<th style="text-align: left;">Date</th>
<th style="text-align: left;">Location</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">5efaaf313b652dd7</td>
<td style="text-align: left;">UFC Fight Night: Lopes vs. Silva</td>
<td style="text-align: left;">September 13, 2025</td>
<td style="text-align: left;">San Antonio, Texas, USA</td>
</tr>
<tr>
<td style="text-align: left;">6e380a4d73ab4f0e</td>
<td style="text-align: left;">UFC Fight Night: Imavov vs. Borralho</td>
<td style="text-align: left;">September 06, 2025</td>
<td style="text-align: left;">Paris, Ile-de-France, France</td>
</tr>
<tr>
<td style="text-align: left;">754968e325d6f60d</td>
<td style="text-align: left;">UFC Fight Night: Walker vs. Zhang</td>
<td style="text-align: left;">August 23, 2025</td>
<td style="text-align: left;">Shanghai, Hebei, China</td>
</tr>
</tbody>
</table>

-   **The Fighters**

<table style="width:100%;">
<colgroup>
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 17%" />
<col style="width: 9%" />
<col style="width: 11%" />
<col style="width: 7%" />
<col style="width: 11%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">First</th>
<th style="text-align: left;">Last</th>
<th style="text-align: left;">Nickname</th>
<th style="text-align: left;">Ht.</th>
<th style="text-align: left;">Wt.</th>
<th style="text-align: left;">Reach</th>
<th style="text-align: left;">Stance</th>
<th style="text-align: right;">W</th>
<th style="text-align: right;">L</th>
<th style="text-align: right;">D</th>
<th style="text-align: left;">Belt</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Tom</td>
<td style="text-align: left;">Aaron</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">–</td>
<td style="text-align: left;">155 lbs.</td>
<td style="text-align: left;">–</td>
<td style="text-align: left;">NA</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">FALSE</td>
</tr>
<tr>
<td style="text-align: left;">Danny</td>
<td style="text-align: left;">Abbadi</td>
<td style="text-align: left;">The Assassin</td>
<td style="text-align: left;">5’ 11”</td>
<td style="text-align: left;">155 lbs.</td>
<td style="text-align: left;">–</td>
<td style="text-align: left;">Orthodox</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">FALSE</td>
</tr>
<tr>
<td style="text-align: left;">Nariman</td>
<td style="text-align: left;">Abbasov</td>
<td style="text-align: left;">Bayraktar</td>
<td style="text-align: left;">5’ 8”</td>
<td style="text-align: left;">155 lbs.</td>
<td style="text-align: left;">66.0”</td>
<td style="text-align: left;">Orthodox</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">FALSE</td>
</tr>
</tbody>
</table>

-   **The fights**

<!-- -->

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

<table>
<colgroup>
<col style="width: 9%" />
<col style="width: 11%" />
<col style="width: 8%" />
<col style="width: 7%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 3%" />
<col style="width: 6%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Fight_Id</th>
<th style="text-align: left;">Win/No Contest/Draw</th>
<th style="text-align: left;">Fighter_1</th>
<th style="text-align: left;">Fighter_2</th>
<th style="text-align: right;">KD_1</th>
<th style="text-align: right;">KD_2</th>
<th style="text-align: right;">STR_1</th>
<th style="text-align: right;">STR_2</th>
<th style="text-align: right;">TD_1</th>
<th style="text-align: right;">TD_2</th>
<th style="text-align: right;">SUB_1</th>
<th style="text-align: right;">SUB_2</th>
<th style="text-align: left;">Weight_Class</th>
<th style="text-align: left;">Method</th>
<th style="text-align: right;">Round</th>
<th style="text-align: left;">Fight_Time</th>
<th style="text-align: left;">Event_Id</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">de1a3734be60e6a1</td>
<td style="text-align: left;">win</td>
<td style="text-align: left;">Diego Lopes</td>
<td style="text-align: left;">Jean Silva</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">74</td>
<td style="text-align: right;">43</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">Featherweight</td>
<td style="text-align: left;">KO/TKO Punches</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">04:48:00</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
<tr>
<td style="text-align: left;">944b929130b23c2a</td>
<td style="text-align: left;">win</td>
<td style="text-align: left;">David Martinez</td>
<td style="text-align: left;">Rob Font</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">62</td>
<td style="text-align: right;">49</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">Bantamweight</td>
<td style="text-align: left;">U-DEC</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">05:00:00</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
<tr>
<td style="text-align: left;">7cbfeba85f86d1bf</td>
<td style="text-align: left;">win</td>
<td style="text-align: left;">Rafa Garcia</td>
<td style="text-align: left;">Jared Gordon</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">91</td>
<td style="text-align: right;">65</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">Lightweight</td>
<td style="text-align: left;">KO/TKO Elbows</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">02:27:00</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
</tbody>
</table>

-   **Details on the fights**

<table>
<colgroup>
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 14%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Fight_Id</th>
<th style="text-align: left;">Result_1</th>
<th style="text-align: left;">Result_2</th>
<th style="text-align: left;">Time Format</th>
<th style="text-align: left;">Referee</th>
<th style="text-align: left;">Method Details</th>
<th style="text-align: right;">Kd_1</th>
<th style="text-align: right;">Kd_2</th>
<th style="text-align: left;">Sig. Str._1</th>
<th style="text-align: left;">Sig. Str._2</th>
<th style="text-align: left;">Sig. Str. %_1</th>
<th style="text-align: left;">Sig. Str. %_2</th>
<th style="text-align: left;">Total Str._1</th>
<th style="text-align: left;">Total Str._2</th>
<th style="text-align: left;">Td_1</th>
<th style="text-align: left;">Td_2</th>
<th style="text-align: left;">Td %_1</th>
<th style="text-align: left;">Td %_2</th>
<th style="text-align: right;">Sub. Att_1</th>
<th style="text-align: right;">Sub. Att_2</th>
<th style="text-align: right;">Rev._1</th>
<th style="text-align: right;">Rev._2</th>
<th style="text-align: left;">Ctrl_1</th>
<th style="text-align: left;">Ctrl_2</th>
<th style="text-align: left;">Head_1</th>
<th style="text-align: left;">Head_2</th>
<th style="text-align: left;">Body_1</th>
<th style="text-align: left;">Body_2</th>
<th style="text-align: left;">Leg_1</th>
<th style="text-align: left;">Leg_2</th>
<th style="text-align: left;">Distance_1</th>
<th style="text-align: left;">Distance_2</th>
<th style="text-align: left;">Clinch_1</th>
<th style="text-align: left;">Clinch_2</th>
<th style="text-align: left;">Ground_1</th>
<th style="text-align: left;">Ground_2</th>
<th style="text-align: left;">Event_Id</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">de1a3734be60e6a1</td>
<td style="text-align: left;">W</td>
<td style="text-align: left;">L</td>
<td style="text-align: left;">5 Rnd (5-5-5-5-5)</td>
<td style="text-align: left;">Mike Beltran</td>
<td style="text-align: left;">Punches to Head On Ground</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">74 of 135</td>
<td style="text-align: left;">43 of 91</td>
<td style="text-align: left;">54%</td>
<td style="text-align: left;">47%</td>
<td style="text-align: left;">86 of 154</td>
<td style="text-align: left;">43 of 91</td>
<td style="text-align: left;">3 of 4</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">75%</td>
<td style="text-align: left;">—</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2:40</td>
<td style="text-align: left;">0:03</td>
<td style="text-align: left;">63 of 118</td>
<td style="text-align: left;">26 of 67</td>
<td style="text-align: left;">1 of 1</td>
<td style="text-align: left;">10 of 17</td>
<td style="text-align: left;">10 of 16</td>
<td style="text-align: left;">7 of 7</td>
<td style="text-align: left;">31 of 65</td>
<td style="text-align: left;">42 of 90</td>
<td style="text-align: left;">1 of 2</td>
<td style="text-align: left;">1 of 1</td>
<td style="text-align: left;">42 of 68</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
<tr>
<td style="text-align: left;">944b929130b23c2a</td>
<td style="text-align: left;">L</td>
<td style="text-align: left;">W</td>
<td style="text-align: left;">3 Rnd (5-5-5)</td>
<td style="text-align: left;">Dan Miragliotta</td>
<td style="text-align: left;">Chris Lee28 - 29.Sal D’amato28 -
29.Junichiro Kamijo28 - 29.</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">49 of 158</td>
<td style="text-align: left;">62 of 155</td>
<td style="text-align: left;">31%</td>
<td style="text-align: left;">40%</td>
<td style="text-align: left;">49 of 158</td>
<td style="text-align: left;">115 of 210</td>
<td style="text-align: left;">0 of 5</td>
<td style="text-align: left;">0 of 2</td>
<td style="text-align: left;">0%</td>
<td style="text-align: left;">0%</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">0:59</td>
<td style="text-align: left;">0:33</td>
<td style="text-align: left;">40 of 138</td>
<td style="text-align: left;">33 of 115</td>
<td style="text-align: left;">7 of 17</td>
<td style="text-align: left;">10 of 16</td>
<td style="text-align: left;">2 of 3</td>
<td style="text-align: left;">19 of 24</td>
<td style="text-align: left;">49 of 158</td>
<td style="text-align: left;">62 of 155</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
<tr>
<td style="text-align: left;">7cbfeba85f86d1bf</td>
<td style="text-align: left;">W</td>
<td style="text-align: left;">L</td>
<td style="text-align: left;">3 Rnd (5-5-5)</td>
<td style="text-align: left;">Kerry Hatley</td>
<td style="text-align: left;">Elbows to Head From Side Control</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">91 of 162</td>
<td style="text-align: left;">65 of 186</td>
<td style="text-align: left;">56%</td>
<td style="text-align: left;">34%</td>
<td style="text-align: left;">107 of 179</td>
<td style="text-align: left;">80 of 201</td>
<td style="text-align: left;">2 of 3</td>
<td style="text-align: left;">1 of 3</td>
<td style="text-align: left;">66%</td>
<td style="text-align: left;">33%</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;">2:01</td>
<td style="text-align: left;">0:09</td>
<td style="text-align: left;">74 of 144</td>
<td style="text-align: left;">55 of 171</td>
<td style="text-align: left;">7 of 7</td>
<td style="text-align: left;">8 of 13</td>
<td style="text-align: left;">10 of 11</td>
<td style="text-align: left;">2 of 2</td>
<td style="text-align: left;">70 of 137</td>
<td style="text-align: left;">65 of 186</td>
<td style="text-align: left;">10 of 11</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">11 of 14</td>
<td style="text-align: left;">0 of 0</td>
<td style="text-align: left;">5efaaf313b652dd7</td>
</tr>
</tbody>
</table>

-   Even more details on the fights  

## Manipulation Goals:

The first step will lie in merging the dataframes together. You can
merge “fights” and events via ´event\_id´ Other than the cleaning we
have to do, the first step will be to add additional variables of
interest. For the first chart  

## Visualization Goals

**W/L-Ratio for the Top 10:**

-   Create a barchart in which you visualize the Win/Lose-Ratio of the
    Top 10 fighters, compared to the means of their weight division.
    Meaning you will have 20 bars in the chart in total, 2 for each
    weight division: One for the best fighter in the country and one
    next to it with the mean W/L-Ratio of that weightclass. Choose a
    color for each bar-pair and put the Fighter / weightclass name on
    the x-Axis. Add a legend if you want. Note:
    [This](https://www.ufc.com/news/understanding-ufc-weight-classes-and-weigh-ins)
    might help you.

**Do long arms really help you win fights ?:**

-   Create a scatterplot in which you put the height-to-reach ratio of a
    fighter on the x-Axis and his W/L-Ration on the y-Axis. Add a line
    which indicates a general trend. Color and name extreme outliers (if
    there are any)

**Events by location:**

-   Use the “maps” package in combination with ggplot to create a nice
    chart that shows which countries most UFC-Events have taken place in
    by coloring the respective country. Afterwards do the same for just
    the United States, meaning group by state. Don’t forget to add a
    legend that tells you which color symbolizes what number.

**How do fights usually end ?:**

-   Create a horizontal bar chart which shows how many fight ended in a
    certain way, meaning either  
    KO / TKO, Submission, Doctor Stoppage, Decision, Draw or
    Disqualification

**Expansion of the sport:**

-   Create a simple linechart which shows the number of events on the
    y-Axis and the year on the x-Axis to visualize the growth of the UFC
    and MMA as a sport!

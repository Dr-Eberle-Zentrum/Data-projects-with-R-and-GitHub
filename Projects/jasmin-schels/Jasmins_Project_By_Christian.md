# Project Solution of Jasmin’s ‘Bye Bye Birdie’ Project

First we need to load the data set and take the variables of interest
into a working data set. Since the Data Set is organized in Losses, a
higher positive number means that that species experienced higher losses
and vice versa.To make it more clear, I flipped the values, so that
positive values now mean a gain in population instead of a loss and
rounded the values to full values. Now, mean, SD and median values
represent the gains/losses of that specific species across Europe.

    ## Warning: Paket 'stringr' wurde unter R Version 4.3.0 erstellt

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the ]8;;http://conflicted.r-lib.org/conflicted package]8;; to force all conflicts to become errors

    ##   [1] 0.9961543 0.9645488 1.0180385 1.0720973 0.9888308 1.0001834 1.0290858
    ##   [8] 1.0568908 1.0078788 0.9891875 1.0244488 0.9863606 1.0163254 0.9988304
    ##  [15] 1.0000098 1.0283046 1.0261195 1.0134761 1.0182806 1.0370341 0.9843303
    ##  [22] 1.0057441 1.0282196 1.0556738 1.0482663 1.0563649 1.0878586 1.0003707
    ##  [29] 1.0020276 1.0010807 0.9488439 0.9299673 1.0631476 1.0443360 1.0011813
    ##  [36] 1.0117534 1.0022922 0.9821403 0.9927905 0.9914045 1.0089497 0.9595362
    ##  [43] 1.0106611 0.9889799 1.0470380 1.0558973 1.0067582 1.0190885 0.9915631
    ##  [50] 0.9826846 0.9721957 1.0061697 1.0000202 0.9790102 0.9989297 0.9829172
    ##  [57] 1.0269855 0.9905344 1.0305836 1.0012643 1.0547408 1.0183036 1.0179287
    ##  [64] 0.9832754 1.0086046 1.0024900 1.0419163 1.0159185 1.0760851 1.0032933
    ##  [71] 0.9953892 1.0548263 0.9596992 1.0100398 1.0127176 1.0060225 0.9871935
    ##  [78] 1.0011531 1.0447666 1.0509830 1.0374687 0.9951679 0.9980034 0.9922455
    ##  [85] 1.0396699 1.0033310 0.9598001 1.0250787 1.0002431 0.9795960 1.0343569
    ##  [92] 1.0121109 1.0011978 0.9942484 1.0139906 1.0138896 0.9935432 0.9705498
    ##  [99] 1.0120138 1.0123321 1.0128686 0.9585101 1.0033394 0.9963387 0.9970658
    ## [106] 1.0332676 1.0112028 1.0213042 0.9848968 1.0028226 1.0012243 1.0124314
    ## [113] 0.9800035 1.1065344 1.0653374 1.0282001 1.0054943 1.0000981 1.0010958
    ## [120] 1.0014887 1.0132563 0.9999457 1.0016760 1.0418709 0.9823519 0.9996260
    ## [127] 0.9886381 1.0108227 0.9896312 1.0079964 1.0053997 0.9872734 0.9828380
    ## [134] 0.9624705 1.0071713 1.1545787 1.0003969 1.0660560 0.9989063 1.0007292
    ## [141] 0.9973759 0.9995947 0.9814658 0.9916773 0.9986109 0.9903733 0.9681750
    ## [148] 0.9953955 0.9911940 1.0012891 1.0019172 0.9516940 0.9753489 1.0062400
    ## [155] 1.0167434 1.0092433 1.0114511 1.0020580 0.9923590 0.9969049 1.0004146
    ## [162] 1.0006269 1.0469116 1.0114597 1.0007072 1.0265200 0.9970961 1.0003920
    ## [169] 1.0013923 1.0222400 1.0082018 0.9992017 1.0202810 0.9934760 0.9895112
    ## [176] 1.0104426 1.0027210 1.0055997 1.0003123 1.0087074 0.9956245 0.9790176
    ## [183] 1.0463792 0.9995699 1.0008745 0.9908834 0.9753586 1.0024134 0.9905075
    ## [190] 1.0146546 1.0484016 1.0060908 1.0046707 0.9897630 0.9889589 1.0231821
    ## [197] 1.0111152 1.0304746 1.0066975 0.9975323 1.0040368 1.0226334 0.9946282
    ## [204] 0.9972585 0.9953716 1.0518534 1.0454265 0.9962010 1.0116360 0.9973837
    ## [211] 0.9927184 0.9722994 0.9972239 0.9879406 0.9842193 0.9755823 0.9805663
    ## [218] 1.0095075 0.9853879 0.9553116 1.0484086 1.0005288 1.0666847 1.0007215
    ## [225] 1.0620994 1.0052848 0.9940001 0.9956228 1.0078776 0.9978993 1.0010773
    ## [232] 0.9934792 0.9980986 0.9864624 1.0327208 0.9720535 1.0224812 0.9933656
    ## [239] 0.9935590 0.9850746 1.0175838 1.0135855 0.9800506 1.0089452 1.0231523
    ## [246] 0.9744708 0.9971810 0.9850112 0.9944681 0.9888554 1.0164574 0.9966042
    ## [253] 0.9962283 1.0182187 0.9762055 1.0100640 1.0017219 0.9916486 0.9979089
    ## [260] 0.9947582 1.0057945 1.0163567 1.0185666 0.9898503 0.9693677 1.0090202
    ## [267] 1.0100398 0.9970205 0.9599807 0.9750759 0.9626966 0.9755654 0.9994479
    ## [274] 0.9954546 1.0272417 0.9673440 0.9948170 0.9655623 1.0141308 0.9860725
    ## [281] 0.9926189 0.9987868 1.0002772 1.0118706 0.9954117 1.0134755 0.9973167
    ## [288] 0.9998528 1.0148738 0.9936558 0.9904632 1.0020675 0.9973930 1.0235031
    ## [295] 0.9902150 0.9797177 1.0135099 0.9718599 0.9902242 0.9593386 0.9830215
    ## [302] 0.9982619 0.9934399 0.9771111 0.9875281 1.0082612 0.9661271 0.9992931
    ## [309] 1.0177436 1.0094631 0.9937996 0.9960769 1.0002776 0.9974161 0.9840451
    ## [316] 1.0012195 0.9960754 1.0223619 0.9974950 0.9957190 1.0342939 0.9856366
    ## [323] 1.0062211 0.9939759 0.9966979 0.9652503 1.0139884 1.0005677 0.9823820
    ## [330] 0.9713888 1.0041397 1.0184015 1.0088332 0.9838761 1.0044174 0.9925535
    ## [337] 1.0066010 0.9902598 0.9971123 1.0076285 1.0021815 1.0017326 1.0183007
    ## [344] 0.9519585 0.9807677 0.9992056 1.0017666 1.0135278 0.9909484 1.0071203
    ## [351] 0.9864429 0.9867590 0.9816614 0.9977305 1.0003821 0.9855385 0.9819839
    ## [358] 0.9973041 1.0018767 1.0004504 1.0005207 0.9778347 1.0168507 0.9982501
    ## [365] 0.9756691 1.0229197 1.0075593 1.0128213 0.9802128 1.0095203 0.9877036
    ## [372] 1.0132114 1.0277397 1.0067056 1.0037422 1.0072260 0.9997471 0.9806326

<table>
<colgroup>
<col style="width: 14%" />
<col style="width: 22%" />
<col style="width: 8%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 21%" />
<col style="width: 18%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">species</th>
<th style="text-align: left;">common_name</th>
<th style="text-align: right;">Loss_mean</th>
<th style="text-align: right;">Loss_sd</th>
<th style="text-align: right;">Loss_med</th>
<th style="text-align: right;">total_proportional_change</th>
<th style="text-align: right;">annual rate of change</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Bubo scandiacus</td>
<td style="text-align: left;">Snowy Owl</td>
<td style="text-align: right;">1.3</td>
<td style="text-align: right;">-11.6</td>
<td style="text-align: right;">-0.2</td>
<td style="text-align: right;">0.867</td>
<td style="text-align: right;">0.996</td>
</tr>
<tr class="even">
<td style="text-align: left;">Xenus cinereus</td>
<td style="text-align: left;">Terek Sandpiper</td>
<td style="text-align: right;">-34.7</td>
<td style="text-align: right;">-5.1</td>
<td style="text-align: right;">-34.4</td>
<td style="text-align: right;">0.263</td>
<td style="text-align: right;">0.965</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Anser erythropus</td>
<td style="text-align: left;">Lesser White-fronted Goose</td>
<td style="text-align: right;">21.1</td>
<td style="text-align: right;">-7.4</td>
<td style="text-align: right;">20.5</td>
<td style="text-align: right;">1.938</td>
<td style="text-align: right;">1.018</td>
</tr>
<tr class="even">
<td style="text-align: left;">Apus affinis</td>
<td style="text-align: left;">Little Swift</td>
<td style="text-align: right;">96.8</td>
<td style="text-align: right;">-46.1</td>
<td style="text-align: right;">88.7</td>
<td style="text-align: right;">13.142</td>
<td style="text-align: right;">1.072</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Clanga clanga</td>
<td style="text-align: left;">Greater Spotted Eagle</td>
<td style="text-align: right;">-17.9</td>
<td style="text-align: right;">-51.1</td>
<td style="text-align: right;">-21.4</td>
<td style="text-align: right;">0.660</td>
<td style="text-align: right;">0.989</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fulica cristata</td>
<td style="text-align: left;">Red-knobbed Coot</td>
<td style="text-align: right;">1.4</td>
<td style="text-align: right;">-13.2</td>
<td style="text-align: right;">0.7</td>
<td style="text-align: right;">1.007</td>
<td style="text-align: right;">1.000</td>
</tr>
</tbody>
</table>

Now with the working Data Set, the next step would be to implement the
“other” category. In the graph you provided, the cutoff was at these two
species: - Cyanistes caeruleus - Passer montanus

We want to summarize every species, that has a lower/higher mean value
than these two species, into a “other” category. To accomplish this, we
have to create a new variable, that copies the name of the species if it
is outside the range specified, or changes its name to “other”.

    ## [1] 19141749

    ## [1] -29831444

    ## Warning: Unknown or uninitialised column: `category_name`.

    ## Warning: Unknown or uninitialised column: `category_species`.

    ## [1] "mean(test2$Loss_mean)\nmean(test2$Loss_med)\nnrow(test2)"

    ## [1] "mean(test3$Loss_mean)\nmean(test3$Loss_med)\nnrow(test3)"

<table>
<thead>
<tr class="header">
<th style="text-align: right;">Loss_mean</th>
<th style="text-align: right;">Loss_med</th>
<th style="text-align: left;">category_name</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">-280.8</td>
<td style="text-align: right;">-281.3</td>
<td style="text-align: left;">other species; N = 163</td>
</tr>
<tr class="even">
<td style="text-align: right;">118.7</td>
<td style="text-align: right;">114.4</td>
<td style="text-align: left;">other species; N = 198</td>
</tr>
<tr class="odd">
<td style="text-align: right;">-98.2</td>
<td style="text-align: right;">-97.0</td>
<td style="text-align: left;">Yellow Wagtail</td>
</tr>
<tr class="even">
<td style="text-align: right;">-29.8</td>
<td style="text-align: right;">-29.7</td>
<td style="text-align: left;">Eurasian Tree Sparrow</td>
</tr>
<tr class="odd">
<td style="text-align: right;">-33.8</td>
<td style="text-align: right;">-33.7</td>
<td style="text-align: left;">Eurasian Linnet</td>
</tr>
<tr class="even">
<td style="text-align: right;">-35.1</td>
<td style="text-align: right;">-34.9</td>
<td style="text-align: left;">European Serin</td>
</tr>
<tr class="odd">
<td style="text-align: right;">21.4</td>
<td style="text-align: right;">21.3</td>
<td style="text-align: left;">Common Woodpigeon</td>
</tr>
<tr class="even">
<td style="text-align: right;">-75.1</td>
<td style="text-align: right;">-74.6</td>
<td style="text-align: left;">Common Starling</td>
</tr>
<tr class="odd">
<td style="text-align: right;">29.7</td>
<td style="text-align: right;">29.4</td>
<td style="text-align: left;">Common Chiffchaff</td>
</tr>
<tr class="even">
<td style="text-align: right;">23.6</td>
<td style="text-align: right;">22.7</td>
<td style="text-align: left;">European Goldfinch</td>
</tr>
<tr class="odd">
<td style="text-align: right;">-68.1</td>
<td style="text-align: right;">-68.0</td>
<td style="text-align: left;">Eurasian Skylark</td>
</tr>
<tr class="even">
<td style="text-align: right;">19.1</td>
<td style="text-align: right;">19.0</td>
<td style="text-align: left;">Blue Tit</td>
</tr>
<tr class="odd">
<td style="text-align: right;">-36.9</td>
<td style="text-align: right;">-36.9</td>
<td style="text-align: left;">Willow Warbler</td>
</tr>
<tr class="even">
<td style="text-align: right;">28.8</td>
<td style="text-align: right;">28.2</td>
<td style="text-align: left;">Winter Wren</td>
</tr>
<tr class="odd">
<td style="text-align: right;">55.2</td>
<td style="text-align: right;">54.9</td>
<td style="text-align: left;">Blackcap</td>
</tr>
<tr class="even">
<td style="text-align: right;">22.2</td>
<td style="text-align: right;">21.9</td>
<td style="text-align: left;">European Robin</td>
</tr>
<tr class="odd">
<td style="text-align: right;">29.5</td>
<td style="text-align: right;">29.2</td>
<td style="text-align: left;">Eurasian Blackbird</td>
</tr>
<tr class="even">
<td style="text-align: right;">-247.3</td>
<td style="text-align: right;">-246.7</td>
<td style="text-align: left;">House Sparrow</td>
</tr>
</tbody>
</table>

With the data frame assembled, now we can tackle the visualization.

![](Jasmins_Project_By_Christian_files/figure-markdown_strict/unnamed-chunk-3-1.png)

final markdown notes: no code, only important graphs, tables (use
knitr::kable(df\[\], caption=“xy”)), focus on visualizations

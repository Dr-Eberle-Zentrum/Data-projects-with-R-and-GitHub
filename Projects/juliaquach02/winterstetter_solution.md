## **Identifying dead cells**

------------------------------------------------------------------------

The project focused on identifying dying tumor cells in a treatment and
a control group. In order to identify dying tumor cells, the criteria
was applied that the intensity of the cell is below 40% of its initial
intensity. For each time point I calculated the relative intensity
compared to the initial intensity. Based on this calculation I defined a
Dummy Variable that indicates whether the cell is alive. Please see an
example of this approach below:

<table style="width:100%;">
<colgroup>
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 16%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">Time Point</th>
<th style="text-align: center;">Cell.ID</th>
<th style="text-align: center;">Initial Intensity</th>
<th style="text-align: center;">Current Intensity</th>
<th style="text-align: center;">Relative Intensity</th>
<th style="text-align: center;">Alive</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;">0</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">1</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="even">
<td style="text-align: center;">1</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">75</td>
<td style="text-align: center;">0.75</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="odd">
<td style="text-align: center;">2</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">60</td>
<td style="text-align: center;">0.6</td>
<td style="text-align: center;">1</td>
</tr>
<tr class="even">
<td style="text-align: center;">3</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">35</td>
<td style="text-align: center;">0.35</td>
<td style="text-align: center;">0</td>
</tr>
<tr class="odd">
<td style="text-align: center;">4</td>
<td style="text-align: center;">0</td>
<td style="text-align: center;">100</td>
<td style="text-align: center;">25</td>
<td style="text-align: center;">0.25</td>
<td style="text-align: center;">0</td>
</tr>
</tbody>
</table>

Afterwards I calculated the average value of this dummy variable. As
soon as this variable was once 0 (at some point the cell died), the mean
will also be below 1. Thus, I identified the cells that died in each
repsective group.

You can see that in the *treatment group* only one cell (250) died at
one point, while in the *control group* five cells died.

<table>
<thead>
<tr class="header">
<th style="text-align: left;">group</th>
<th style="text-align: right;">Cell.ID</th>
<th style="text-align: right;">rel_intensity_above_40</th>
<th style="text-align: right;">total_alive</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">treated</td>
<td style="text-align: right;">250</td>
<td style="text-align: right;">0.6970149</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">untreated</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0.9992775</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">untreated</td>
<td style="text-align: right;">75</td>
<td style="text-align: right;">0.9979592</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">untreated</td>
<td style="text-align: right;">207</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">untreated</td>
<td style="text-align: right;">221</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">untreated</td>
<td style="text-align: right;">232</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

## **Visualization of the population**

------------------------------------------------------------------------

![](winterstetter_solution_files/figure-markdown_strict/unnamed-chunk-3-1.png)
You can see that only a small amount of cells died completely die during
the time of observation.

    all_cells_new <- all_cells %>% group_by(group, Time.point)  %>% dplyr::count(current_alive) %>% plyr::rename(c("n" = "no_alive")) %>%
      subset(current_alive == 1, select = c("group", "Time.point", "no_alive"))

    all_cells_count <- all_cells %>% group_by(Time.point) %>% dplyr::count(group) %>% plyr::rename(c("n" = "no_group"))

    all_cells_merge <- merge(all_cells_new, all_cells_count, by = c("group", "Time.point"))

    all_cells_merge %>% group_by(group, Time.point) %>% mutate(rel_alive_group = no_alive/no_group) %>%
      ggplot(aes(x = Time.point, y = rel_alive_group, col = group)) + geom_line() + labs(x = "Point in time", y = "Relative amount of cells alive") + ylim(c(0.75,1)) + geom_hline(yintercept = 0.75, col = "red") + annotate("text", label = "75% of population alive", x = 2200, y = 0.76, col = "red") + theme_bw()

![](winterstetter_solution_files/figure-markdown_strict/unnamed-chunk-4-1.png)

    ?geom_label

    ## starte den http Server für die Hilfe fertig

It is notable that

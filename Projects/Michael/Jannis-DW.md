# Solution for Michael’s Project “Demographic Shift in Germany”

## Task 1: Analysis of Reasons for the low Fertility Rate

### 1.1

Task: Calculate Correlation between relationship satisfaction and
intention to have children in the next 3 years.

Solution: There is a positive correlation between relationship
satisfaction and intention to have children in the next 3 years.

    ## [1] 0.1555075

    ## [1] 0.1458812

### 1.2

Task: Create a Heatmap to visualize the correlation between relationship
satisfaction and intention to have children in the next 3 years.

![](Jannis-DW_files/figure-markdown_strict/HeatMap-1.png)

### 1.3

Task: Interpretation: Why do you think that people who are satisfied
with their relationship the most are seemingly less likely to get
children in the near future?

Solution: I think the effect is due to happy couples not wanting to
change any of their current situation since they are allready fulfilled.
Maybe the unhappier families simply are unhappy because they want t0
have children but do not have any yet and will be happier as soon as
they have children.

### 1.4

Task: What statistical problems do we run into?

Solution: Histogram to get an overview of data: We have the statistical
problem that most people see themselves as very happy or do not want to
answer the question. This leads to a very skewed distribution of the
data and makes it hard to find a correlation between the two variables.

![](Jannis-DW_files/figure-markdown_strict/histogram-1.png)

### 1.5

Task: Correllation between relationship satisfaction and fertility
intentions with control of age.

Answer: The correlation between sat3 and frt69 with control of age is
0.08, which is a weak positive correlation. This means that there is a
weak positive relationship between relationship satisfaction and
intention to have children in the next 3 years, even when controlling
for age.

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1104294 1.232921e-16  8.305721 5591  1 pearson

### 1.6

Task: Correllation between relationship satisfaction and fertility
intentions with control of age, number of children and relationship
duration

    ##    estimate      p.value statistic    n gp  Method
    ## 1 0.1057409 1.774588e-14  7.687956 5232  3 pearson

### Task 2

Task: Check for differences in the perception of what a good
relationship looks like.

Answer: People in former West Germany have more conservative viewpoints
on thei relationships.
<table class="table table-striped table-hover table-condensed" style="width: auto !important; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:right;">
east
</th>
<th style="text-align:right;">
mean\_val1i3
</th>
<th style="text-align:right;">
mean\_val1i5
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
-7
</td>
<td style="text-align:right;">
1.781250
</td>
<td style="text-align:right;">
2.069444
</td>
</tr>
<tr>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
2.334725
</td>
<td style="text-align:right;">
2.323553
</td>
</tr>
<tr>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
2.135884
</td>
<td style="text-align:right;">
1.853245
</td>
</tr>
</tbody>
</table>

## Task 2.2

Task: Create a violin plot, summarizing the differences of East and West
Germany in one plot by using faceting.

    ## <theme> List of 144
    ##  $ line                            : <ggplot2::element_line>
    ##   ..@ colour       : chr "black"
    ##   ..@ linewidth    : num 0.5
    ##   ..@ linetype     : num 1
    ##   ..@ lineend      : chr "butt"
    ##   ..@ linejoin     : chr "round"
    ##   ..@ arrow        : logi FALSE
    ##   ..@ arrow.fill   : chr "black"
    ##   ..@ inherit.blank: logi TRUE
    ##  $ rect                            : <ggplot2::element_rect>
    ##   ..@ fill         : chr "white"
    ##   ..@ colour       : chr "black"
    ##   ..@ linewidth    : num 0.5
    ##   ..@ linetype     : num 1
    ##   ..@ linejoin     : chr "round"
    ##   ..@ inherit.blank: logi TRUE
    ##  $ text                            : <ggplot2::element_text>
    ##   ..@ family       : chr ""
    ##   ..@ face         : chr "plain"
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : chr "black"
    ##   ..@ size         : num 11
    ##   ..@ hjust        : num 0.5
    ##   ..@ vjust        : num 0.5
    ##   ..@ angle        : num 0
    ##   ..@ lineheight   : num 0.9
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 0
    ##   ..@ debug        : logi FALSE
    ##   ..@ inherit.blank: logi TRUE
    ##  $ title                           : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : NULL
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ point                           : <ggplot2::element_point>
    ##   ..@ colour       : chr "black"
    ##   ..@ shape        : num 19
    ##   ..@ size         : num 1.5
    ##   ..@ fill         : chr "white"
    ##   ..@ stroke       : num 0.5
    ##   ..@ inherit.blank: logi TRUE
    ##  $ polygon                         : <ggplot2::element_polygon>
    ##   ..@ fill         : chr "white"
    ##   ..@ colour       : chr "black"
    ##   ..@ linewidth    : num 0.5
    ##   ..@ linetype     : num 1
    ##   ..@ linejoin     : chr "round"
    ##   ..@ inherit.blank: logi TRUE
    ##  $ geom                            : <ggplot2::element_geom>
    ##   ..@ ink        : chr "black"
    ##   ..@ paper      : chr "white"
    ##   ..@ accent     : chr "#3366FF"
    ##   ..@ linewidth  : num 0.5
    ##   ..@ borderwidth: num 0.5
    ##   ..@ linetype   : int 1
    ##   ..@ bordertype : int 1
    ##   ..@ family     : chr ""
    ##   ..@ fontsize   : num 3.87
    ##   ..@ pointsize  : num 1.5
    ##   ..@ pointshape : num 19
    ##   ..@ colour     : NULL
    ##   ..@ fill       : NULL
    ##  $ spacing                         : 'simpleUnit' num 5.5points
    ##   ..- attr(*, "unit")= int 8
    ##  $ margins                         : <ggplot2::margin> num [1:4] 5.5 5.5 5.5 5.5
    ##  $ aspect.ratio                    : NULL
    ##  $ axis.title                      : NULL
    ##  $ axis.title.x                    : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : num 1
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 2.75 0 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.title.x.top                : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : num 0
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 0 2.75 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.title.x.bottom             : NULL
    ##  $ axis.title.y                    : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : num 1
    ##   ..@ angle        : num 90
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 2.75 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.title.y.left               : NULL
    ##  $ axis.title.y.right              : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : num 1
    ##   ..@ angle        : num -90
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 2.75
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text                       : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : chr "#4D4D4DFF"
    ##   ..@ size         : 'rel' num 0.8
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : NULL
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.x                     : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : num 1
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 2.2 0 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.x.top                 : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 0 4.95 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.x.bottom              : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 4.95 0 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.y                     : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : num 1
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 2.2 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.y.left                : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 4.95 0 0
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.y.right               : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 0 0 4.95
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.text.theta                 : NULL
    ##  $ axis.text.r                     : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : num 0.5
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : <ggplot2::margin> num [1:4] 0 2.2 0 2.2
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ axis.ticks                      : <ggplot2::element_blank>
    ##  $ axis.ticks.x                    : NULL
    ##  $ axis.ticks.x.top                : NULL
    ##  $ axis.ticks.x.bottom             : NULL
    ##  $ axis.ticks.y                    : NULL
    ##  $ axis.ticks.y.left               : NULL
    ##  $ axis.ticks.y.right              : NULL
    ##  $ axis.ticks.theta                : NULL
    ##  $ axis.ticks.r                    : NULL
    ##  $ axis.minor.ticks.x.top          : NULL
    ##  $ axis.minor.ticks.x.bottom       : NULL
    ##  $ axis.minor.ticks.y.left         : NULL
    ##  $ axis.minor.ticks.y.right        : NULL
    ##  $ axis.minor.ticks.theta          : NULL
    ##  $ axis.minor.ticks.r              : NULL
    ##  $ axis.ticks.length               : 'rel' num 0.5
    ##  $ axis.ticks.length.x             : NULL
    ##  $ axis.ticks.length.x.top         : NULL
    ##  $ axis.ticks.length.x.bottom      : NULL
    ##  $ axis.ticks.length.y             : NULL
    ##  $ axis.ticks.length.y.left        : NULL
    ##  $ axis.ticks.length.y.right       : NULL
    ##  $ axis.ticks.length.theta         : NULL
    ##  $ axis.ticks.length.r             : NULL
    ##  $ axis.minor.ticks.length         : 'rel' num 0.75
    ##  $ axis.minor.ticks.length.x       : NULL
    ##  $ axis.minor.ticks.length.x.top   : NULL
    ##  $ axis.minor.ticks.length.x.bottom: NULL
    ##  $ axis.minor.ticks.length.y       : NULL
    ##  $ axis.minor.ticks.length.y.left  : NULL
    ##  $ axis.minor.ticks.length.y.right : NULL
    ##  $ axis.minor.ticks.length.theta   : NULL
    ##  $ axis.minor.ticks.length.r       : NULL
    ##  $ axis.line                       : <ggplot2::element_blank>
    ##  $ axis.line.x                     : NULL
    ##  $ axis.line.x.top                 : NULL
    ##  $ axis.line.x.bottom              : NULL
    ##  $ axis.line.y                     : NULL
    ##  $ axis.line.y.left                : NULL
    ##  $ axis.line.y.right               : NULL
    ##  $ axis.line.theta                 : NULL
    ##  $ axis.line.r                     : NULL
    ##  $ legend.background               : <ggplot2::element_blank>
    ##  $ legend.margin                   : NULL
    ##  $ legend.spacing                  : 'rel' num 2
    ##  $ legend.spacing.x                : NULL
    ##  $ legend.spacing.y                : NULL
    ##  $ legend.key                      : <ggplot2::element_blank>
    ##  $ legend.key.size                 : 'simpleUnit' num 1.2lines
    ##   ..- attr(*, "unit")= int 3
    ##  $ legend.key.height               : NULL
    ##  $ legend.key.width                : NULL
    ##  $ legend.key.spacing              : NULL
    ##  $ legend.key.spacing.x            : NULL
    ##  $ legend.key.spacing.y            : NULL
    ##  $ legend.key.justification        : NULL
    ##  $ legend.frame                    : NULL
    ##  $ legend.ticks                    : NULL
    ##  $ legend.ticks.length             : 'rel' num 0.2
    ##  $ legend.axis.line                : NULL
    ##  $ legend.text                     : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : 'rel' num 0.8
    ##   ..@ hjust        : NULL
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : NULL
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ legend.text.position            : NULL
    ##  $ legend.title                    : <ggplot2::element_text>
    ##   ..@ family       : NULL
    ##   ..@ face         : NULL
    ##   ..@ italic       : chr NA
    ##   ..@ fontweight   : num NA
    ##   ..@ fontwidth    : num NA
    ##   ..@ colour       : NULL
    ##   ..@ size         : NULL
    ##   ..@ hjust        : num 0
    ##   ..@ vjust        : NULL
    ##   ..@ angle        : NULL
    ##   ..@ lineheight   : NULL
    ##   ..@ margin       : NULL
    ##   ..@ debug        : NULL
    ##   ..@ inherit.blank: logi TRUE
    ##  $ legend.title.position           : NULL
    ##  $ legend.position                 : chr "right"
    ##  $ legend.position.inside          : NULL
    ##  $ legend.direction                : NULL
    ##  $ legend.byrow                    : NULL
    ##  $ legend.justification            : chr "center"
    ##  $ legend.justification.top        : NULL
    ##  $ legend.justification.bottom     : NULL
    ##  $ legend.justification.left       : NULL
    ##  $ legend.justification.right      : NULL
    ##  $ legend.justification.inside     : NULL
    ##   [list output truncated]
    ##  @ complete: logi TRUE
    ##  @ validate: logi TRUE

![](Jannis-DW_files/figure-markdown_strict/ViolinPlot-1.png)


# Goal of the project

The goal of the project is to display the top ten formula one drivers in
the range of the years 2000-2020. “Top” in this case is for simplicity
defined as the count of the races that a driver won over the years. The
chart should also contain the information in which year the driver drove
for which constructor, his nationality and how many races he won in that
special year. A driver won a race, if his position is 1. You do not have
to consider the number, rank, grid or points of a driver in a specific
race.

The data for this project can be taken from
(<https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020>),
but it is also in the zip-folder archive.zip. There are many tables that
are not necessary for the project, only a few of them are, which can be
connected over the IDs.

The chart should look something like this (and be interactive):
![](image.png)

The box shows a tooltip, meaning, if one hovers over the bar at a
specific place, the tooltip with the information shows up. For this, the
package [plotly](https://plotly.com/r/) might be useful.

# Visualizaion priorities (high to low)

-   bar chart with x-axis and y-axis as displayed above
-   tooltip (when hovering over the bar, show the name and the
    nationality of the driver)
-   bar colored according to the constructor the driver raced in the
    corresponding year and add the information to the tooltip
-   bar separated according to years (does not have to be visible, only
    important for the tooltip)
-   formula one font type

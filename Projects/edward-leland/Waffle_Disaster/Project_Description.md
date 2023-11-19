## Coffee With a Smile

![](panic.jpg) <br> “The sooner restaurants, grocery and corner stores,
or banks can reopen, the sooner local economies will start generating
revenue again—signalling a stronger recovery for that community.”

—*Craig Fugate*, former FEMA Administrator

<br>

Welcome to America! Where guns are cheap and healthcare costs an arm and
a leg. In an attempt to confirm the world’s stereotypes of my country,
the Federal Emergency Management Agency (FEMA), decided to use the
status of a 24/7 breakfast food chain as a metric for the severity of
hurricane damage.

Waffle House, praise be its golden name, has a business plan that would
horrify most Germans. As said before, it is open 24 hours a day 7 days a
week and that means 24 hours every day, 7 days in all weeks. Waffle
house doesn’t close for any holiday and whether its 3PM on a Wednesday
or 3AM on Christmas, you can find cheap food and unlimited coffee at
rock bottom prices. Every American has, at one point or another, washed
up under the sickly glow of Waffle house’s incandescent lights. Usually
at some ungodly hour of the night, so deliriously drunk or horrendously
hungover that it seems a miracle that the staff can transform your
guttural grunts and a sweaty fistful of crumpled bills into the ambrosia
that is the All Star Special.

So why did FEMA decide to use the opening status of Waffle Houses as a
metric for the severity of hurricanes in the Southern USA? They don’t
believe in not selling waffles unless it is physically impossible to
keep the store open. There is a three tiered status evaluation for any
given waffle house:

Green: Open as normal.

Yellow: Limited Operation/Opening Hours.

Red: Closed.

The reason FEMA took an interest in this company in particular is that
Waffle Houses have their own cooking fuel supplies and don’t need
electricity to make their food. During the Houston Floods only two out
of thirty two Waffle Houses closed while the rest cooked on sometimes
without lights, air conditioning, or refrigeration.

In effect, if you’re in a place where a Waffle House is in Yellow mode,
you’re likely the survivor of a recent natural disaster. If you’re in a
Red mode area you’re probably dead or might as well be because you can’t
enjoy bottomless coffee for only a buck twenty five.

![](menu.png)

## Good Food, Good Value, and Great Plots

We are going to make our own Waffle House Index by using data from the
internet plus a bit of imagination as there is no large scale natural
disaster currently happening in my homeland.

First you will need to use the code below to generate the Waffle House
Master List:

    library(rvest)
    library(dplyr)
    library(tidyr)

    url <- "https://locations.wafflehouse.com" 

    page <- read_html(url)
    store_data <- 
      page |> 
      html_element("script#__NEXT_DATA__") |> 
      html_text() |> 
      jsonlite::fromJSON() |>
      purrr::pluck("props", "pageProps", "locations") |>
      unnest(addressLines) |>
      unnest(custom) |> 
      as_tibble()

If this code scares you don’t worry! You do not have to change, edit, or
understand what the hell it’s doing. It’s doing a task called web
scraping which I had no idea how to build in R so I stole it from [this
Stack Exchange
post](https://stackoverflow.com/questions/76940122/rvest-scrape-all-values-from-website-by-specific-class)
since the old wafflehouseindex.us website was disabled by the Trump
appointed fun hating FEMA director. Web scraping is when you use a
program to access a webpage and fetch the HTML data back. That’s what
the first few lines of code do and the rest is basically ripping apart
the nested HTML and making everything fit nicely into a big tibble.

Your first task is to take this data and use it in conjunction with the
usmap package to map out the locations of Waffle Houses in the USA:

![](basic.png)

Next we are going to simulate a natural disaster by choosing a center
point and defining different radii for our Yellow and Red zones. Using
this information you will need to determine which Waffle Houses are
within the different zones and display them correctly. Once you have
everything working you should be able to change the radii and move the
disaster zone around the plot just by changing a few variable values in
your code.

![](dis1.png) ![](dis2.png) If you want to extend the project you could
mess around with making the plot interactive by using plotly to show
information on individual Waffle Houses when you mouse over them.

## All the Way Priorities

-   Use the included code to scrape the data set from Waffle House’s
    website.

-   Use the usmap package to create a plot of the states that have
    Waffle Houses.

-   Figure out how to plot the Waffle House locations on the map.

-   Create a radial disaster zone, centered on a longitude, latitude
    coordinate pair with Closed, Limited Menu, and Open bands

-   Make the bands color coded with Closed = Red, Limited Menu = Yellow,
    and Open = Green.

-   Check your code by changing the coordinates of the center of the
    disaster zone and seeing if the plot updates correctly. Also try
    changing the different band radii.

## Upgrade to Large Extra Reading for only 50 cents more!

-   [FEMA post on the Waffle House
    Index](https://www.fema.gov/blog/its-little-piece-normal)

-   [Waffle House Report on the
    Index](https://www.wafflehouse.com/how-to-measure-a-storms-fury-one-breakfast-at-a-time/)

-   [WayBackMachine Archived FEMA Waffle House Index
    Page](https://web.archive.org/web/20200401201227/https://wafflehouseindex.us/)

-   [Houston Flooding with Waffle House
    Information](https://www.npr.org/sections/thetwo-way/2017/08/29/547079242/keep-it-simple-and-stay-open-the-waffle-house-storm-menu)

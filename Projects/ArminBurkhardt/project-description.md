# Stock and Index data

Financial markets are highly complex systems that are influenced by many
factors. Both stocks (pieces of ownership for individual companies) and
ETFs/Indices (a sort of aggregation of multiple stocks/companies) are
represented and traded on these markets. Nowadays, some combination of
stocks and ETFs (which pretty much track indices) make up the long term
investments of many people. In this project, you will take a closer look
at the historical data of a few stocks and some indices in which they
are included, analyzing their performance and the relationship between
them. How closely do you think stock and index prices correlate?

## Data

The data was downloaded from Yahoo Finance using the following python
code:

    import yfinance as yf

    tickers = ["AAPL", "NVDA", "AMZN", "LMT", "V"]

    indices = ["^GSPC", "^IXIC"] # aka S&P 500 and NASDAQ

    data = yf.download(tickers + indices, interval="60m", period="2y")

    data.to_csv("stock_data.csv")

The following is a sample from `stock_data.csv`:

<table>
<caption>Sample of the stock data</caption>
<colgroup>
<col style="width: 4%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 2%" />
<col style="width: 2%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
<col style="width: 1%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Price</th>
<th style="text-align: left;">Close</th>
<th style="text-align: left;">Close.1</th>
<th style="text-align: left;">Close.2</th>
<th style="text-align: left;">Close.3</th>
<th style="text-align: left;">Close.4</th>
<th style="text-align: left;">Close.5</th>
<th style="text-align: left;">Close.6</th>
<th style="text-align: left;">High</th>
<th style="text-align: left;">High.1</th>
<th style="text-align: left;">High.2</th>
<th style="text-align: left;">High.3</th>
<th style="text-align: left;">High.4</th>
<th style="text-align: left;">High.5</th>
<th style="text-align: left;">High.6</th>
<th style="text-align: left;">Low</th>
<th style="text-align: left;">Low.1</th>
<th style="text-align: left;">Low.2</th>
<th style="text-align: left;">Low.3</th>
<th style="text-align: left;">Low.4</th>
<th style="text-align: left;">Low.5</th>
<th style="text-align: left;">Low.6</th>
<th style="text-align: left;">Open</th>
<th style="text-align: left;">Open.1</th>
<th style="text-align: left;">Open.2</th>
<th style="text-align: left;">Open.3</th>
<th style="text-align: left;">Open.4</th>
<th style="text-align: left;">Open.5</th>
<th style="text-align: left;">Open.6</th>
<th style="text-align: left;">Volume</th>
<th style="text-align: left;">Volume.1</th>
<th style="text-align: left;">Volume.2</th>
<th style="text-align: left;">Volume.3</th>
<th style="text-align: left;">Volume.4</th>
<th style="text-align: left;">Volume.5</th>
<th style="text-align: left;">Volume.6</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Ticker</td>
<td style="text-align: left;">AAPL</td>
<td style="text-align: left;">AMZN</td>
<td style="text-align: left;">LMT</td>
<td style="text-align: left;">NVDA</td>
<td style="text-align: left;">V</td>
<td style="text-align: left;">^GSPC</td>
<td style="text-align: left;">^IXIC</td>
<td style="text-align: left;">AAPL</td>
<td style="text-align: left;">AMZN</td>
<td style="text-align: left;">LMT</td>
<td style="text-align: left;">NVDA</td>
<td style="text-align: left;">V</td>
<td style="text-align: left;">^GSPC</td>
<td style="text-align: left;">^IXIC</td>
<td style="text-align: left;">AAPL</td>
<td style="text-align: left;">AMZN</td>
<td style="text-align: left;">LMT</td>
<td style="text-align: left;">NVDA</td>
<td style="text-align: left;">V</td>
<td style="text-align: left;">^GSPC</td>
<td style="text-align: left;">^IXIC</td>
<td style="text-align: left;">AAPL</td>
<td style="text-align: left;">AMZN</td>
<td style="text-align: left;">LMT</td>
<td style="text-align: left;">NVDA</td>
<td style="text-align: left;">V</td>
<td style="text-align: left;">^GSPC</td>
<td style="text-align: left;">^IXIC</td>
<td style="text-align: left;">AAPL</td>
<td style="text-align: left;">AMZN</td>
<td style="text-align: left;">LMT</td>
<td style="text-align: left;">NVDA</td>
<td style="text-align: left;">V</td>
<td style="text-align: left;">^GSPC</td>
<td style="text-align: left;">^IXIC</td>
</tr>
<tr>
<td style="text-align: left;">Datetime</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">2024-02-21 14:30:00+00:00</td>
<td style="text-align: left;">182.55999755859375</td>
<td style="text-align: left;">168.01980590820312</td>
<td style="text-align: left;">427.1400146484375</td>
<td style="text-align: left;">67.91200256347656</td>
<td style="text-align: left;">275.2300109863281</td>
<td style="text-align: left;">4963.7099609375</td>
<td style="text-align: left;">15536.0576171875</td>
<td style="text-align: left;">182.8887939453125</td>
<td style="text-align: left;">170.22999572753906</td>
<td style="text-align: left;">427.5</td>
<td style="text-align: left;">68.88800048828125</td>
<td style="text-align: left;">275.5899963378906</td>
<td style="text-align: left;">4970.10009765625</td>
<td style="text-align: left;">15577.2021484375</td>
<td style="text-align: left;">181.55499267578125</td>
<td style="text-align: left;">167.63499450683594</td>
<td style="text-align: left;">424.3699951171875</td>
<td style="text-align: left;">67.70001220703125</td>
<td style="text-align: left;">273.5299987792969</td>
<td style="text-align: left;">4958.33984375</td>
<td style="text-align: left;">15520.466796875</td>
<td style="text-align: left;">181.60000610351562</td>
<td style="text-align: left;">169.1999969482422</td>
<td style="text-align: left;">426.2099914550781</td>
<td style="text-align: left;">68.0</td>
<td style="text-align: left;">274.6300048828125</td>
<td style="text-align: left;">4963.02978515625</td>
<td style="text-align: left;">15533.3994140625</td>
<td style="text-align: left;">9104336</td>
<td style="text-align: left;">15381626</td>
<td style="text-align: left;">130776</td>
<td style="text-align: left;">13298661</td>
<td style="text-align: left;">777888</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
</tr>
<tr>
<td style="text-align: left;">2024-02-21 15:30:00+00:00</td>
<td style="text-align: left;">182.15499877929688</td>
<td style="text-align: left;">168.3800048828125</td>
<td style="text-align: left;">427.5111999511719</td>
<td style="text-align: left;">68.07099914550781</td>
<td style="text-align: left;">276.1099853515625</td>
<td style="text-align: left;">4967.9501953125</td>
<td style="text-align: left;">15550.259765625</td>
<td style="text-align: left;">182.64999389648438</td>
<td style="text-align: left;">168.6999969482422</td>
<td style="text-align: left;">428.2200012207031</td>
<td style="text-align: left;">68.33499908447266</td>
<td style="text-align: left;">276.1700134277344</td>
<td style="text-align: left;">4972.7998046875</td>
<td style="text-align: left;">15571.2099609375</td>
<td style="text-align: left;">182.07000732421875</td>
<td style="text-align: left;">167.59500122070312</td>
<td style="text-align: left;">426.7149963378906</td>
<td style="text-align: left;">67.76599884033203</td>
<td style="text-align: left;">275.0899963378906</td>
<td style="text-align: left;">4959.919921875</td>
<td style="text-align: left;">15519.681640625</td>
<td style="text-align: left;">182.55999755859375</td>
<td style="text-align: left;">168.02000427246094</td>
<td style="text-align: left;">427.1499938964844</td>
<td style="text-align: left;">67.91200256347656</td>
<td style="text-align: left;">275.2049865722656</td>
<td style="text-align: left;">4963.68017578125</td>
<td style="text-align: left;">15535.73046875</td>
<td style="text-align: left;">4359759</td>
<td style="text-align: left;">4724713</td>
<td style="text-align: left;">128386</td>
<td style="text-align: left;">5318878</td>
<td style="text-align: left;">470207</td>
<td style="text-align: left;">255577595</td>
<td style="text-align: left;">533987000</td>
</tr>
<tr>
<td style="text-align: left;">2024-02-21 16:30:00+00:00</td>
<td style="text-align: left;">181.38999938964844</td>
<td style="text-align: left;">167.7301025390625</td>
<td style="text-align: left;">427.125</td>
<td style="text-align: left;">67.13029479980469</td>
<td style="text-align: left;">275.3699951171875</td>
<td style="text-align: left;">4960.419921875</td>
<td style="text-align: left;">15505.1494140625</td>
<td style="text-align: left;">182.3300018310547</td>
<td style="text-align: left;">168.6300048828125</td>
<td style="text-align: left;">427.9599914550781</td>
<td style="text-align: left;">68.20800018310547</td>
<td style="text-align: left;">276.1199951171875</td>
<td style="text-align: left;">4970.419921875</td>
<td style="text-align: left;">15561.0615234375</td>
<td style="text-align: left;">181.36000061035156</td>
<td style="text-align: left;">167.55999755859375</td>
<td style="text-align: left;">426.9501037597656</td>
<td style="text-align: left;">66.61299896240234</td>
<td style="text-align: left;">275.2699890136719</td>
<td style="text-align: left;">4958.3798828125</td>
<td style="text-align: left;">15495.9833984375</td>
<td style="text-align: left;">182.14999389648438</td>
<td style="text-align: left;">168.38999938964844</td>
<td style="text-align: left;">427.510009765625</td>
<td style="text-align: left;">68.08100128173828</td>
<td style="text-align: left;">276.1099853515625</td>
<td style="text-align: left;">4967.89990234375</td>
<td style="text-align: left;">15551.0341796875</td>
<td style="text-align: left;">3729837</td>
<td style="text-align: left;">3750105</td>
<td style="text-align: left;">55144</td>
<td style="text-align: left;">7946663</td>
<td style="text-align: left;">226068</td>
<td style="text-align: left;">217414563</td>
<td style="text-align: left;">435763000</td>
</tr>
</tbody>
</table>

Effectively, the data is unreadable in this form, as all stocks and
indices are combined in this dataset.

### Explanation of the data

The data contains hourly historical price data over the past 2 years for
the following stocks:

-   Apple (AAPL) \[Second most valuable company in the world as of right
    now\]
-   Nvidia (NVDA) \[Most valuable company in the world\]
-   Amazon (AMZN) \[Among the most valuable tech companies in the
    world\]
-   Lockheed Martin (LMT) \[One of the biggest defense companies in the
    world\]
-   Visa (V) \[One of the biggest payment processing companies in the
    world\]

And the following indices:

-   S&P 500 (^GSPC) \[Well known index, includes the 500 biggest US
    companies\]
-   NASDAQ (^IXIC) \[Another well known index, includes companies
    (mostly in tech) that are listed on the NASDAQ stock exchange\]

The columns in the dataset are:

-   `Datetime`: the date and time of each price data point
-   For each Symbol (stock or index), there are 5 columns (not in this
    order):
    -   `Open`: the price at the beginning of the hour
    -   `High`: the highest price during this hour
    -   `Low`: the lowest price during this hour
    -   `Close`: the price at the end of the hour
    -   `Volume`: the trading volume during the hour (how many shares
        were traded)

For example, the first row says `Price, Close, Close, ...` and the
second says `Ticker, AAPL, AMZN, ...` This means that the first `Close`
column corresponds to `AAPL`, the second `Close` column corresponds to
`AMZN`, and so on. `yfinance` unfortunately exports the data with this
multi-row header.

## Tasks, Questions & Visualizations

### 1. **Data reading & cleaning**

In its current state, the data is impossible to work with. - **Reading
the data**: The file should be read twice, once to generate sensible
column names from the multi-row header and once to read the data itself
(ignoring the headers. For this, `read_csv` features the argument
`skip`).

    Make sure all data types are as expected (eg. `Datetime` should be a datetime object, `Open` should be a number, ...)

-   **Formatting**: Pivot this dataframe to get a dataframe with the
    following columns:

    -   `Datetime`
    -   `Symbol`
    -   `Type` (Factor with two levels: `Stock` and `Index`)
    -   `Open`
    -   `High`
    -   `Low`
    -   `Close`
    -   `Volume`

    This should result in one very tidy table.

-   **Aggregation**: To make plotting the data simpler, create a new
    dataframe where the data is aggregated from hourly to daily data.

    > the new `Open` should be the `Open` of the first hour of the day
    >
    > the new `Close` should be the `Close` of the last hour of the day
    >
    > the new `High` should be the maximum `High` of all hours of the
    > day
    >
    > the new `Low` should be the minimum `Low` of all hours of the day
    >
    > the new `Volume` should be the sum of all hourly volumes of the
    > day

### 2. **Visualization**

-   **Price**: Use `ggplot2`s facetting and `geom_line` to plot the
    daily price of all stocks and indices over time. You can use `Open`
    or `Close` for this.

-   **Volume**: Either in the same plots as above or in a new plot, plot
    the trading volume of all stocks and indices over time as barplots
    (`geom_bar`).

-   **Optional: Candlesticks**: Instead of using a line chart to plot
    the price, use candlesticks (eg. using `geom_boxplot` or
    `geom_segment` and `geom_rect`) to represent the daily price data
    for all stocks. (see below for an example)

    > The top of the body is the open price, the bottom of the body is
    > the close price, and the wicks are the high and low prices.
    >
    > A candlestick is red if the price decreased during the day, and
    > green if it increased.

![](https://cdn.britannica.com/13/237813-050-0CA3E424/candlestick-chart-definition.jpg)

Ideally, the final chart for a single stock might look something like
this (stock price as candlesticks and trading volume as a barplot in the
same plot):
![](https://static.tradingview.com/static/bundles/advanced-chart-tablet.5609abc2debf5bc5dfa4.jpg)

### 3. **Pattern analysis & correlation**

For this part we will go back to hourly data, as we want to analyze
patterns throughout the day.

-   Compute the percentage change in price (between `Open` or `Close`)
    for each hour (compared to the previous hour) for all stocks and
    indices. This will be used in the following tasks.

-   **Price Movements/Volatility**: At which hour of the day do prices
    across all stocks & indices move/change the most? (In this case:
    When is the percentage change between the `Open` price and the
    `Close` price the highest on average?)

    > Visualize the average price movement per hour of the day here (eg.
    > using a bar plot).

-   **Correlation**: Take a look at how closely stock and index prices
    follow each other. Are they correlated?

    -   **Visualization**: Plot all stock prices against the S&P 500
        price to visually inspect their correlation (line or point
        plot). Its up to you whether you use individual facets per stock
        or plot all in one plot. Do they (stocks and the index) seem to
        move together?

    -   **Optional: Quantification**: Quantify the correlation between
        stock and index price changes (percentage changes from above) by
        calculating the correlation coefficient. R has a built-in
        function for this, called `cor` (check `?cor`, usage hint:
        `cor(df$stock_change, df$index_change)`). You can do this for
        each stock/S&P 500 pair and plot the results to see which stock
        correlates the most with the S&P 500.

    *About `cor`: By default `cor` calculates the Pearson correlation
    coefficient, which measures the linear relationship between the two
    inputs. The resulting value is between -1 and 1, where -1 means a
    strong negative correlation, 0 means no correlation, and 1 means a
    strong positive correlation. This is all the knowledge you
    realistically need here, if you want to know more about the usage,
    check `?cor` and if you want to know more about the math behind it,
    check
    [this](https://en.wikipedia.org/wiki/Pearson_correlation_coefficient).*

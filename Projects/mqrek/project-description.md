# Project Descriptions

## Plot 1: NVIDIA Stock Analysis

### Introduction
In this project, we aim to analyze the stock performance of NVIDIA Corporation (NASDAQ: NVDA) over time.

### Data Set
We obtained the stock data from Yahoo Finance (https://finance.yahoo.com/quote/NVDA/history). This dataset contains historical stock information, including the date and closing price.

### Data Manipulation Goals
1. Convert the 'Date' column to a proper date format.
2. Calculate monthly closing values from the dataset.

### Visualization Goals
Our goal is to create visualizations illustrating the monthly stock performance of NVIDIA. We aim to produce two plots:
1. Plot with a logarithmic scale.
2. Plot with a linear scale.

### Packages Used
We utilized the following R packages:
- `lubridate`: For handling date data effectively.
- `dplyr`: For data manipulation tasks.
- `ggplot2`: For creating visually appealing plots.
- `cowplot`: For arranging multiple plots.

![NVIDIA STOCK Analysis](NVDAStockChart.jpg)

## Plot 2: Average Weekly Performance Analysis

### Introduction
This project focuses on analyzing the average weekly performance of NVIDIA.

### Data Set
We utilized the same dataset from Yahoo Finance (https://finance.yahoo.com/quote/NVDA/history), containing historical stock information.

### Data Manipulation Goals
1. Convert the 'Date' column to a proper date format.
2. Group the data by week and year.
3. Calculate the average weekly performance.

### Visualization Goals
Our aim is to visualize the average weekly performance per year using a line plot.

### Packages Used
We employed the following R packages:
- `lubridate`: For handling date data efficiently.
- `dplyr`: For data manipulation tasks.
- `ggplot2`: For creating insightful visualizations.

![Average Weekly Performance Analysis of NVIDIA](WeeklyPerformanceNVDA.jpg)
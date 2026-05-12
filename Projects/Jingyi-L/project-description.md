Laptop Price Analysis
================
Jingyi Li
2026-05-12

### Topic:

**Wrangling and Analyzing Laptop Market Data**

### Introduction

The project focuses on the exploratory data analysis (EDA) and price
determinants of consumer laptops. Using a raw, uncleaned dataset
containing approximately 1,300 laptop entries, this study aims to
quantify how hardware specifications—such as CPU performance, RAM
capacity, storage technology, and brand equity—impact the market pricing
of portable computers.

### Questions & Hypotheses

1.  **Price Distribution**: What is the overall distribution of laptop
    prices in the dataset? Are there any significant outliers or
    clusters in the price data?
2.  **Hardware Specifications and Price**: How do different hardware
    specifications (e.g., CPU performance, RAM size, storage type)
    correlate with laptop prices? Which specifications are the most
    influential in determining the price?
3.  **Brand Influence**: Does the brand of the laptop have a significant
    impact on its price? Are certain brands consistently priced higher
    than others, and if so, why?

### Hypothesis:

I hypothesize that higher-end hardware specifications (e.g., faster
CPUs, larger RAM, SSD storage) and well-known brands will be associated
with higher laptop prices. And high-resolution display features (e.g.,
IPS panels and Retina displays) contribute more to price variance in the
Ultrabook segment than in the standard Notebook segment.

### Data Source

*Source:*
<https://www.kaggle.com/datasets/ehtishamsadiq/uncleaned-laptop-price-dataset>

The Uncleaned Laptop Price dataset is a collection of laptop product
listings scraped from an online e-commerce website. The dataset includes
information about various laptop models, such as their brand, screen
size, processor, memory, storage capacity, operating system, and price.
However, the dataset is uncleaned, meaning that it contains missing
values, inconsistent formatting, and other errors that need to be
addressed before the data can be used for analysis.

### Data Manipulation Goals

1.  **Data Cleaning**: Address missing values, correct inconsistent
    formatting, and remove any duplicate entries to ensure the dataset
    is accurate and reliable for analysis.
2.  **Data Transformation**: Normalize or standardize numerical features
    to facilitate comparison and improve the performance of any
    subsequent analysis.

### Visualization Goals

1.  **Price Distribution Visualization**: Create histograms and box
    plots to visualize the distribution of laptop prices and identify
    any outliers or clusters.
2.  **Correlation Analysis**: Use scatter plots and correlation matrices
    to explore the relationships between hardware.
3.  **Brand Price Comparison**: Generate bar charts or box plots to
    compare the average prices of laptops across different brands,
    highlighting any significant differences.

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

**Original source:**
<https://www.kaggle.com/datasets/ehtishamsadiq/uncleaned-laptop-price-dataset>

You can download the dataset directly using this link: [uncleaned laptop
price dataset (CSV)](data/laptopData.csv)

#### Dataset Overview

The Uncleaned Laptop Price dataset is a collection of laptop product
listings scraped from an online e-commerce website. The dataset includes
information about various laptop models, such as their brand, screen
size, processor, memory, storage capacity, operating system, and price.
However, the dataset is uncleaned, meaning that it contains missing
values, inconsistent formatting, and other errors that need to be
addressed before the data can be used for analysis.

<table class="table table-striped table-hover" style="font-size: 12px; margin-left: auto; margin-right: auto;">

<thead>

<tr>

<th style="text-align:left;">

Company
</th>

<th style="text-align:left;">

TypeName
</th>

<th style="text-align:left;">

Inches
</th>

<th style="text-align:left;">

ScreenResolution
</th>

<th style="text-align:left;">

Cpu
</th>

<th style="text-align:left;">

Ram
</th>

<th style="text-align:left;">

Memory
</th>

<th style="text-align:left;">

Gpu
</th>

<th style="text-align:left;">

OpSys
</th>

<th style="text-align:left;">

Weight
</th>

<th style="text-align:right;">

Price
</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Apple
</td>

<td style="text-align:left;">

Ultrabook
</td>

<td style="text-align:left;">

13.3
</td>

<td style="text-align:left;">

IPS Panel Retina Display 2560x1600
</td>

<td style="text-align:left;">

Intel Core i5 2.3GHz
</td>

<td style="text-align:left;">

8GB
</td>

<td style="text-align:left;">

128GB SSD
</td>

<td style="text-align:left;">

Intel Iris Plus Graphics 640
</td>

<td style="text-align:left;">

macOS
</td>

<td style="text-align:left;">

1.37kg
</td>

<td style="text-align:right;">

71378.68
</td>

</tr>

<tr>

<td style="text-align:left;">

Apple
</td>

<td style="text-align:left;">

Ultrabook
</td>

<td style="text-align:left;">

13.3
</td>

<td style="text-align:left;">

1440x900
</td>

<td style="text-align:left;">

Intel Core i5 1.8GHz
</td>

<td style="text-align:left;">

8GB
</td>

<td style="text-align:left;">

128GB Flash Storage
</td>

<td style="text-align:left;">

Intel HD Graphics 6000
</td>

<td style="text-align:left;">

macOS
</td>

<td style="text-align:left;">

1.34kg
</td>

<td style="text-align:right;">

47895.52
</td>

</tr>

<tr>

<td style="text-align:left;">

HP
</td>

<td style="text-align:left;">

Notebook
</td>

<td style="text-align:left;">

15.6
</td>

<td style="text-align:left;">

Full HD 1920x1080
</td>

<td style="text-align:left;">

Intel Core i5 7200U 2.5GHz
</td>

<td style="text-align:left;">

8GB
</td>

<td style="text-align:left;">

256GB SSD
</td>

<td style="text-align:left;">

Intel HD Graphics 620
</td>

<td style="text-align:left;">

No OS
</td>

<td style="text-align:left;">

1.86kg
</td>

<td style="text-align:right;">

30636.00
</td>

</tr>

<tr>

<td style="text-align:left;">

Apple
</td>

<td style="text-align:left;">

Ultrabook
</td>

<td style="text-align:left;">

15.4
</td>

<td style="text-align:left;">

IPS Panel Retina Display 2880x1800
</td>

<td style="text-align:left;">

Intel Core i7 2.7GHz
</td>

<td style="text-align:left;">

16GB
</td>

<td style="text-align:left;">

512GB SSD
</td>

<td style="text-align:left;">

AMD Radeon Pro 455
</td>

<td style="text-align:left;">

macOS
</td>

<td style="text-align:left;">

1.83kg
</td>

<td style="text-align:right;">

135195.34
</td>

</tr>

<tr>

<td style="text-align:left;">

Apple
</td>

<td style="text-align:left;">

Ultrabook
</td>

<td style="text-align:left;">

13.3
</td>

<td style="text-align:left;">

IPS Panel Retina Display 2560x1600
</td>

<td style="text-align:left;">

Intel Core i5 3.1GHz
</td>

<td style="text-align:left;">

8GB
</td>

<td style="text-align:left;">

256GB SSD
</td>

<td style="text-align:left;">

Intel Iris Plus Graphics 650
</td>

<td style="text-align:left;">

macOS
</td>

<td style="text-align:left;">

1.37kg
</td>

<td style="text-align:right;">

96095.81
</td>

</tr>

<tr>

<td style="text-align:left;">

Acer
</td>

<td style="text-align:left;">

Notebook
</td>

<td style="text-align:left;">

15.6
</td>

<td style="text-align:left;">

1366x768
</td>

<td style="text-align:left;">

AMD A9-Series 9420 3GHz
</td>

<td style="text-align:left;">

4GB
</td>

<td style="text-align:left;">

500GB HDD
</td>

<td style="text-align:left;">

AMD Radeon R5
</td>

<td style="text-align:left;">

Windows 10
</td>

<td style="text-align:left;">

2.1kg
</td>

<td style="text-align:right;">

21312.00
</td>

</tr>

</tbody>

</table>

#### Column Explanations

To ensure the description is self-contained, here is a short explanation
of the core columns I will analyze:

- Company: The brand of the laptop (e.g., Apple, HP, Acer, Asus).
- TypeName: The category of the laptop (e.g., Notebook, Ultrabook,
  Gaming, Netbook).
- Inches: The screen size in inches.
- ScreenResolution: Text describing the resolution and panel type (e.g.,
  IPS Panel Retina Display 2560x1600).
- Cpu: The processor specification, including brand, model, and clock
  speed (e.g., Intel Core i5 2.3GHz).
- Ram: The amount of memory (e.g., 8GB, 16GB).
- Memory: The storage technology and capacity (e.g., 128GB SSD, 1TB
  HDD).
- Gpu: The graphics card specification.
- OpSys: The operating system (e.g., macOS, Windows 10, No OS).
- Weight: The physical weight of the laptop (e.g., 1.37kg).
- Price: The price of the laptop (originally in Indian Rupee, INR).

### Data Manipulation Goals

1.  **Data Cleaning**: Address missing values, correct inconsistent
    formatting, and remove any duplicate entries to ensure the dataset
    is accurate and reliable for analysis.
2.  **Data Transformation**: Normalize or standardize numerical features
    to facilitate comparison and improve the performance of any
    subsequent analysis.

### Visualization Goals

Setting **Price** as the main variable, I will investigate the relations
between price and other hardware specifications and categorizations
through the following visualizations:

1.  **Price vs. Numeric Features (Scatter Plot)**
    - **Goal**: Investigate how continuous numerical variables like
      `Ram` (or extracted CPU clock speed, `Weight`) correlate with
      `Price`.
    - **Axes**: Set `Ram` , `CPU` or `Weight` (numerical) on the X-axis
      and `Price` on the Y-axis.
    - **Overplotting**: Apply semi-transparency to handle overlapping
      points, and overlay a shaded region or density contours using
      `ggdensity`or something else to observe where the bulk of the
      market lies.
2.  **Price vs. Categorical Features (Distribution Plot)**
    - **Goal**: Observe the price variance across discrete categories
      like `Company` (Brand) and `TypeName` (Laptop Type).
    - **Refinement (Violine over Boxplot)**: Instead of a simple bar
      chart or box plot, request a **Violine Plot** for each brand/type
      to show the full probability density and multi-modality of prices.
3.  **Price Distribution Overlap (Ridgeline Plot)**
    - **Goal**: Compare the overall price profile across the most common
      laptop types (`Notebook`, `Ultrabook`, `Gaming`).
    - **Specification**: Plot a baseline price histogram for the entire
      dataset, and overlay a **Ridgeline Plot** split by `TypeName`
      right on top, allowing an immediate visual comparison of price
      peaks between standard notebooks and premium segments.

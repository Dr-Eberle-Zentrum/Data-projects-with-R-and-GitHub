# Data Manipulation

## Data Import

- Remove empty rows with `drop_na()`
- Remove invalid symbols with `str_replace_all()`
- Remove the “GB” text extension from the Ram column and convert it to
  integer using `as.integer()`
- Remove the “kg” text extension from the Weight column and convert it
  to numeric using `as.double()`
- Extract the continuous numerical variable representing processor clock
  speed in GHz from the Cpu column using `str_extract()` and convert it
  to numeric using `as.double()`
- Create new columns (`is_IPS` and `is_Retina`) based on the presence of
  specific keywords in the ScreenResolution column using `str_detect()`
- Extract the pure pixel dimensions (Width and Height) from the
  ScreenResolution column using `str_extract()` and converts them to
  integer using `as.integer()` and stores them in separate columns
- Create a new column (`OpSys`) that groups categories into broader
  groups using `case_when()` and `str_detect()`

<table style="width:100%;">
<caption>Data after Manipulation</caption>
<colgroup>
<col style="width: 5%" />
<col style="width: 4%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 8%" />
<col style="width: 13%" />
<col style="width: 2%" />
<col style="width: 10%" />
<col style="width: 14%" />
<col style="width: 3%" />
<col style="width: 3%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 5%" />
<col style="width: 3%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Unnamed: 0</th>
<th style="text-align: left;">Company</th>
<th style="text-align: left;">TypeName</th>
<th style="text-align: left;">Inches</th>
<th style="text-align: left;">ScreenResolution</th>
<th style="text-align: left;">Cpu</th>
<th style="text-align: right;">Ram</th>
<th style="text-align: left;">Memory</th>
<th style="text-align: left;">Gpu</th>
<th style="text-align: left;">OpSys</th>
<th style="text-align: right;">Weight</th>
<th style="text-align: left;">Price</th>
<th style="text-align: right;">Cpu_clock</th>
<th style="text-align: left;">is_IPS</th>
<th style="text-align: left;">is_Retina</th>
<th style="text-align: right;">Width</th>
<th style="text-align: right;">Height</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">0</td>
<td style="text-align: left;">Apple</td>
<td style="text-align: left;">Ultrabook</td>
<td style="text-align: left;">13.3</td>
<td style="text-align: left;">2560x1600</td>
<td style="text-align: left;">Intel Core i5 2.3GHz</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">128GB SSD</td>
<td style="text-align: left;">Intel Iris Plus Graphics 640</td>
<td style="text-align: left;">macOS</td>
<td style="text-align: right;">1.37</td>
<td style="text-align: left;">71378.6832</td>
<td style="text-align: right;">2.3</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">2560</td>
<td style="text-align: right;">1600</td>
</tr>
<tr>
<td style="text-align: left;">1</td>
<td style="text-align: left;">Apple</td>
<td style="text-align: left;">Ultrabook</td>
<td style="text-align: left;">13.3</td>
<td style="text-align: left;">1440x900</td>
<td style="text-align: left;">Intel Core i5 1.8GHz</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">128GB Flash Storage</td>
<td style="text-align: left;">Intel HD Graphics 6000</td>
<td style="text-align: left;">macOS</td>
<td style="text-align: right;">1.34</td>
<td style="text-align: left;">47895.5232</td>
<td style="text-align: right;">1.8</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1440</td>
<td style="text-align: right;">900</td>
</tr>
<tr>
<td style="text-align: left;">2</td>
<td style="text-align: left;">HP</td>
<td style="text-align: left;">Notebook</td>
<td style="text-align: left;">15.6</td>
<td style="text-align: left;">1920x1080</td>
<td style="text-align: left;">Intel Core i5 7200U 2.5GHz</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">256GB SSD</td>
<td style="text-align: left;">Intel HD Graphics 620</td>
<td style="text-align: left;">Other</td>
<td style="text-align: right;">1.86</td>
<td style="text-align: left;">30636</td>
<td style="text-align: right;">2.5</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1920</td>
<td style="text-align: right;">1080</td>
</tr>
<tr>
<td style="text-align: left;">3</td>
<td style="text-align: left;">Apple</td>
<td style="text-align: left;">Ultrabook</td>
<td style="text-align: left;">15.4</td>
<td style="text-align: left;">2880x1800</td>
<td style="text-align: left;">Intel Core i7 2.7GHz</td>
<td style="text-align: right;">16</td>
<td style="text-align: left;">512GB SSD</td>
<td style="text-align: left;">AMD Radeon Pro 455</td>
<td style="text-align: left;">macOS</td>
<td style="text-align: right;">1.83</td>
<td style="text-align: left;">135195.336</td>
<td style="text-align: right;">2.7</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">2880</td>
<td style="text-align: right;">1800</td>
</tr>
<tr>
<td style="text-align: left;">4</td>
<td style="text-align: left;">Apple</td>
<td style="text-align: left;">Ultrabook</td>
<td style="text-align: left;">13.3</td>
<td style="text-align: left;">2560x1600</td>
<td style="text-align: left;">Intel Core i5 3.1GHz</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">256GB SSD</td>
<td style="text-align: left;">Intel Iris Plus Graphics 650</td>
<td style="text-align: left;">macOS</td>
<td style="text-align: right;">1.37</td>
<td style="text-align: left;">96095.808</td>
<td style="text-align: right;">3.1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">2560</td>
<td style="text-align: right;">1600</td>
</tr>
</tbody>
</table>

# Visualization

I’ll first convert the price to USD for better interpretability,
assuming an exchange rate of 1 USD = 83 INR.

## 1. Price vs. Numeric Features

Creating three scatter plots with density overlays to explore
relationships between:

- RAM vs. Price: how memory capacity correlates with cost
- CPU Clock Speed vs. Price: processor speed’s impact on pricing
- Weight vs. Price: physical weight’s relationship to price

### RAM & Price

![](emily-works_files/figure-markdown_strict/plot%20RAM-1.png)

### CPU & Price

![](emily-works_files/figure-markdown_strict/plot%20CPU-1.png)

### Weight & Price

![](emily-works_files/figure-markdown_strict/plot%20Weight-1.png)

## 2. Price vs. Categorical Features (Distribution Plot)

### By Company

![](emily-works_files/figure-markdown_strict/plot%20Company-1.png)

### By Laptop Type

![](emily-works_files/figure-markdown_strict/plot%20LaptopType-1.png)

## 3. Price Distribution Overlap

![](emily-works_files/figure-markdown_strict/ridgeline%20plot-1.png)

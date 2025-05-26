## Introduction into the topic

Salvador et al. (2023) published a research article on age-dependent
immune and lymphatic responses following spinal cord injury to better
understand the lifelong disabling effects that can result from such
severe injuries
[Publication](https://www.cell.com/neuron/fulltext/S0896-6273(23)00296-9?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0896627323002969%3Fshowall%3Dtrue#mmc2).

The study investigates how the immune and lymphatic systems respond to
spinal cord injuries in young and old mice. The researchers used a
technique called single-cell RNA sequencing to study the activity of
individual cells by measuring which genes are turned on in each cell
(scRNA-seq).

## Data

The data is publicly available on the Gene Expression Omnibus (GEO)
under the accession number GSE205038. The pre-analyzed data set
mmc4.xlsx is already provided on GitHub [Data
file](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/blob/4e680979e0d3a5a57912ffd151ef1e9acca38c20/Projects/lizzola/mmc4.xlsx).
To give you an idea how the data looks like:

<table style="width:100%;">
<colgroup>
<col style="width: 5%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 10%" />
<col style="width: 33%" />
<col style="width: 9%" />
<col style="width: 9%" />
<col style="width: 6%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">gene</th>
<th style="text-align: right;">logFC</th>
<th style="text-align: right;">p_adjust</th>
<th style="text-align: left;">ID</th>
<th style="text-align: left;">Description</th>
<th style="text-align: left;">GeneRatio</th>
<th style="text-align: left;">BgRatio</th>
<th style="text-align: right;">pvalue</th>
<th style="text-align: right;">p_adjust_2</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Lars2</td>
<td style="text-align: right;">1.705496</td>
<td style="text-align: right;">0</td>
<td style="text-align: left;"><a href="GO:0045766"
class="uri">GO:0045766</a></td>
<td style="text-align: left;">positive regulation of angiogenesis</td>
<td style="text-align: left;">11/109</td>
<td style="text-align: left;">188/23328</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3.2e-06</td>
</tr>
</tbody>
</table>

## Data manipulation

-   The excel data file contains multiple sheets, so the first task is
    to get familiar with the data file. Find the sheet “Aged vs Young
    Macrophages”.

-   Extract the sheet “Aged vs Young Macrophages” so that you can load
    it into R. It contains the differentially expressed genes (DEGs) and
    the GO terms for different time points (naïve, 3dpi, 7dpi, 14dpi).
    We are only interested in the naïve aged macrophages vs. naïve young
    macrophages comparison.

-   Create a new column called logFC\_high that is TRUE if logFC &gt; 2
    for a gene of “naïve aged macrophages vs. naïve young macrophages” ,
    and FALSE otherwise.

-   Filter the DEGs to include only those with p.adjust &lt; 0.05, and
    return the top 10 genes with the highest logFC. Please display the
    top 10 genes in a nice table.

-   Now, we will focus on the GO terms to get on rough idea what
    biological processes, but not single genes are upregulated. Filter
    the upregulated GO terms to include only those whose description
    contains keywords such as “angiogenesis”, “immune response”,
    “immunity”, “cytokine”, “vasculature”, “wound”, “inflammatory
    response”, “chemokine”, “lymphatic”, “lymphocyte”, “macrophage”,
    “monocyte”.

-   Remove the columns “BG\_Ratio”, “pvalue” and “ID”.

-   After the two steps you end up with the three columns “Description”,
    “GeneRatio”, and “p\_adjust\_2” that are of interest for the second
    visualization task.

## Data visualization

-   Create a volcano plot for all DEG genes. On the x-axis display
    log2FC for all genes and on the y-axis display –log10(adjusted
    p-value) (the negative log10 of the adjusted p-value) for all genes.
    Add a horizontal line at -log10(0.05) and a vertical line at logFC =
    2 and logFC = -2.
-   Color the points based on the logFC\_high status (TRUE or FALSE) and
    label the points with the gene names.
-   Label the axes accordingly and add a title. I added a picture to
    make it easier to understand what a volcano plot is:
    ![](https://www.bioinformatics.com.cn/static/img/onlineplots_img/086_basic_3_color_volcano_plot.png)
-   Create a dot plot with GO terms on the y-axis sorted by descending
    GeneRatio on the x-axis.
-   Use a single-color gradient to indicate significance based on the
    adjusted p-value (non-significant terms in a lighter shade and vice
    versa).
-   Include a clear legend explaining the color intensity
    (significance).
-   If you can find the time: Present the GeneRatio as the size of the
    dots in the dotplot.

The data wrangling and the volcano plot will certainly take up a lot of
time. That’s why the dot plot is more for when you still have time to
spare.

I’m looking forward to your solutions! Good luck!

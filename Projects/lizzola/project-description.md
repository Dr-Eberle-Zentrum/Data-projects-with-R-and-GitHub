## Introduction into the topic

Salvador et al. (2023) published a research article on age-dependent
immune and lymphatic responses following spinal cord injury to better
understand the lifelong disabling effects that can result from such
severe injuries
[Publication](https://www.cell.com/neuron/fulltext/S0896-6273(23)00296-9?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0896627323002969%3Fshowall%3Dtrue#mmc2).

The study investigates how the immune and lymphatic systems respond to
spinal cord injuries in young and old mice. The researchers used a
technique called single-cell RNA sequencing (scRNA-seq) to analyze the
cells in the spinal cord after an injury (see Fig.1A
[Figure1A](https://www.cell.com/cms/10.1016/j.neuron.2023.04.011/asset/ccd951de-5213-4af4-8f55-92e3f4c342d5/main.assets/gr1_lrg.jpg).
They found that the immune response was different in young and old mice.
Additionally, they discovered that the lymphatic system, which helps
drain waste and transport immune cells, was also affected by age.

Single-cell RNA sequencing (scRNA-seq) is a method that allows
scientists to study the activity of individual cells by measuring which
genes are turned on in each cell - for example, when they respond to an
injury. In this study, the researchers used scRNA-seq to analyze the
immune and lymphatic responses in the spinal cord after an injury,
focusing on how these responses differ between young and old mice.

## Data

The data is publicly available on the Gene Expression Omnibus (GEO)
under the accession number GSE224123. The pre-analyzed data set
mmc4.xlsx is saved under the link in Excel files. [Data
file](https://www.cell.com/neuron/fulltext/S0896-6273(23)00296-9?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0896627323002969%3Fshowall%3Dtrue#mmc2).
The dataset includes information about the gene expression levels in
individual cells, as well as metadata about the samples, such as the age
of the mice and the time points after injury.

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

### Data manipulation

-   Create a new column called logFC\_high that is TRUE if logFC &gt; 2
    of naïve aged macrophages vs. naïve young macrophages , and FALSE
    otherwise.
-   Filter the DEGs to include only those with p.adjust &lt; 0.05, and
    return the top 10 genes with the highest logFC.
-   Filter the GO terms to include only those whose description contains
    keywords such as “angiogenesis”, “immune response”, or “cytokine”.

### Data visualization

-   Create a bar plot for the top 20 genes with logFC &gt; 2 and
    p.adjust &lt; 0.05. Put the genes on the y-axis. Label the axes
    accordingly and add a title.

-   Color the bars based on the logFC\_high status (TRUE or FALSE).

-   Assign each gene a corresponding GO term (e.g., from a previous
    analysis) and display it as an additional label on the plot (e.g.,
    as text above or beside the bars). Group the genes by their
    corresponding GO term and use different colors for each group.

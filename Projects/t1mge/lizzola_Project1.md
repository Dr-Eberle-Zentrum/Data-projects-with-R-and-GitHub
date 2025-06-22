## Data manipulation

Import the data

    library(dplyr)
    library(tidyr)
    library(tidyverse)
    library(kableExtra)
    library(knitr)
    library(fs)
    library(pheatmap)


    if (!is.null(current_input())) {
      rmd_dir <- path_dir(current_input())
    } else {
      rmd_dir <- getwd()
    }
    data <- read.csv(file.path(rmd_dir, "GSE273780_EukmRNAseq_counts.csv"), row.names = 1)
    head(data)

    ##         Row.names  G58   G52  G25   G84    G2  G60   G41   G36   G73   G79
    ## 1 ENSG00000000003   23     0   23     7    14   18    15     3     0    12
    ## 2 ENSG00000000005    0     0    0     0     0    0     0     0     0     0
    ## 3 ENSG00000000419  469   348  494   334   567  616   342   383   363   409
    ## 4 ENSG00000000457  196   198  403   202   382  166   240   168   124   244
    ## 5 ENSG00000000460   40    45   82    38    70   36    40    26    33    52
    ## 6 ENSG00000000938 9567 14297 8058 13908 10128 6291 14438 10547 10985 15057
    ##     G74   G90   G31   G46   G83   G89   G67   G28   G55   G26   G63   G69   G87
    ## 1     5     4    11    19     8     3     8    16    24    10    27    16     3
    ## 2     0     0     0     0     0     0     0     0     0     0     0     0     0
    ## 3   402   317   382   387   443   424   444   632   813   373  1247   375   290
    ## 4   245   137   205   193   313   236   297   270   559   295   455   179   191
    ## 5    73    21    29    29    66    68    68    54   119    60   107    40    60
    ## 6 17799 13046 11323 11466 12620 23353 15412 13253 15210 12301 19379 17768 19190
    ##     G48  G35   G42   G77   G38  G45   G32   G64   G80   G88   G11  G66   G54
    ## 1    16   23     4     5    16    6    14     4     7     3    34   15    15
    ## 2     0    0     0     0     0    0     0     0     0     0     0    0     0
    ## 3   387  443   345   470   555  399   480   557   418   298  1024  386   530
    ## 4   187  165   213   340   356  326   388   261   297   165   633  190   306
    ## 5    28   23    40    71    78   90    84    65    37    33   132   22    65
    ## 6 11581 7793 13080 29079 14459 9630 14931 12419 17088 18538 52130 9577 15986
    ##     G75   G30   G40  G78   G72   G59   G61   G9   G85   G81   G65  G12   G57
    ## 1     1     3    24    8     7    16    27   13     0    18    11    6     1
    ## 2     0     0     0    0     0     0     0    0     0     0     0    0     0
    ## 3   359   450   422  362   417   468   589  631   319   426   473  372   374
    ## 4   265   278   385  290   195   253   309  400   133   253   306  192   271
    ## 5    84    61    69   75    35    82    53   99    24    49    96   54    37
    ## 6 15436 13094 14061 9874 12515 11256 12136 8428 15919 14224 13083 8108 12489
    ##     G76  G44   G43   G34   G49   G50   G27   G68  G86   G62 hgnc_symbol
    ## 1     4   21    18     2    15     0     7     4   12    13      TSPAN6
    ## 2     0    0     0     0     0     0     0     0    0     0        TNMD
    ## 3   390  518   426   389   483   375   525   435  460   514        DPM1
    ## 4   251  327   309   153   317   246   281   329  194   272       SCYL3
    ## 5    38  110    92    26    47    64    58    47   48    53    C1orf112
    ## 6 16111 9555 11428 12809 10459 19620 13108 15107 7133 12090         FGR
    ##                                                                                      description
    ## 1                                              tetraspanin 6 [Source:HGNC Symbol;Acc:HGNC:11858]
    ## 2                                                tenomodulin [Source:HGNC Symbol;Acc:HGNC:17757]
    ## 3 dolichyl-phosphate mannosyltransferase subunit 1, catalytic [Source:HGNC Symbol;Acc:HGNC:3005]
    ## 4                                   SCY1 like pseudokinase 3 [Source:HGNC Symbol;Acc:HGNC:19285]
    ## 5                        chromosome 1 open reading frame 112 [Source:HGNC Symbol;Acc:HGNC:25565]
    ## 6              FGR proto-oncogene, Src family tyrosine kinase [Source:HGNC Symbol;Acc:HGNC:3697]
    ##   chromosome_name strand external_gene_name
    ## 1               X     -1             TSPAN6
    ## 2               X      1               TNMD
    ## 3              20     -1               DPM1
    ## 4               1     -1              SCYL3
    ## 5               1      1           C1orf112
    ## 6               1     -1                FGR

Filter out the count data of the following columns (G25, G26, G27, G30,
G9, G12, G32, G45). Rename the columns.

<table>
<thead>
<tr class="header">
<th>Sample</th>
<th>Week</th>
<th>Type</th>
<th>Replicate</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>G25</td>
<td>Week12</td>
<td>NW</td>
<td>1</td>
</tr>
<tr class="even">
<td>G26</td>
<td>Week12</td>
<td>NW</td>
<td>2</td>
</tr>
<tr class="odd">
<td>G27</td>
<td>Week12</td>
<td>OW</td>
<td>1</td>
</tr>
<tr class="even">
<td>G30</td>
<td>Week12</td>
<td>OW</td>
<td>2</td>
</tr>
<tr class="odd">
<td>G9</td>
<td>Week36</td>
<td>NW</td>
<td>1</td>
</tr>
<tr class="even">
<td>G12</td>
<td>Week36</td>
<td>NW</td>
<td>2</td>
</tr>
<tr class="odd">
<td>G32</td>
<td>Week36</td>
<td>OW</td>
<td>1</td>
</tr>
<tr class="even">
<td>G45</td>
<td>Week36</td>
<td>OW</td>
<td>2</td>
</tr>
</tbody>
</table>

    filtered_data <- data %>%
      select(Row.names, G25, G26, G27, G30, G9, G12, G32, G45) %>%
      rename(Gene = Row.names, 
             Week12_NW_1 = G25, 
             Week12_OW_1 = G26, 
             Week12_NW_2 = G27, 
             Week12_OW_2 = G30, 
             Week36_NW_1 = G9, 
             Week36_OW_1 = G12, 
             Week36_NW_2 = G32, 
             Week36_OW_2 = G45)

    long_data <- filtered_data %>%
      pivot_longer(-Gene, names_to = "Condition", values_to = "Count") %>%
      separate(Condition, into = c("Week", "Type", "Replicate"), sep = "_")

Normalize the data from counts to counts per million (add up all the
counts per sample and divide each sample by this, then multiply by
1.000.000). log2 transformation of the counts per million to make the
data more symmetric.

    log2_data <- long_data %>%
      group_by(Week, Type, Replicate) %>%
      mutate(
        Total = sum(Count, na.rm = TRUE),
        CPM = Count / Total * 1e6,
        CPM_log2 = log2(CPM + 1)
      ) %>%
      ungroup()

Drop any rows with blank names and count values between 0 and 2.

    log2_data_under_2 <- log2_data %>%
      filter(!is.na(Gene) & Gene != "") %>%
      rowwise() %>%
      filter(CPM_log2 >= 2) %>%
      ungroup()

Calculate the z-Value of each count in new columns by subtracting the
normalized count value by the mean of the column and divide by the
columns standard deviation. Calculate the variance of the log2
transformed counts by rows and put it in a new column.

    heatmap_data <- log2_data_under_2 %>%
      group_by(Week, Type, Replicate) %>%
      mutate(CPM_z = (CPM - mean(CPM, na.rm = TRUE)) / sd(CPM, na.rm = TRUE)) %>%
      ungroup() %>%
      group_by(Gene) %>%
      mutate(log2_CPM_variance = var(CPM_log2, na.rm = TRUE)) %>%
      ungroup()

## Data visualization

Rank all genes descendingly by variance. Keep only top 50
highest-variance genes for the heat map.

    top50_genes <- heatmap_data %>%
      distinct(Gene, log2_CPM_variance) %>%
      slice_max(log2_CPM_variance, n = 50) %>%
      pull(Gene)

    heatmap_matrix <- heatmap_data %>%
      filter(Gene %in% top50_genes) %>%
      select(Gene, Week, Type, Replicate, CPM_log2) %>%
      unite("Sample", Week, Type, Replicate, sep = "_") %>%
      pivot_wider(names_from = Sample, values_from = CPM_log2) %>%
      column_to_rownames("Gene") %>%
      as.matrix()

    heatmap_matrix <- heatmap_matrix[, c(
      "Week12_NW_1", "Week12_NW_2", "Week12_OW_1", "Week12_OW_2",
      "Week36_NW_1", "Week36_NW_2", "Week36_OW_1", "Week36_OW_2"
    )]

    colnames(heatmap_matrix) <- gsub("_", " ", colnames(heatmap_matrix))

    gaps <- seq(2, ncol(heatmap_matrix) - 1, by = 2)

    annotation_colors <- list(
      Week = c("Week12" = "coral", "Week36" = "lightgreen"),
      Type = c("NW" = "lightgoldenrod", "OW" = "lightyellow")
    )

    heatmap_matrix[is.na(heatmap_matrix)] <- 0

    png("heatmap.png", width = 1200, height = 1200)
    pheatmap(
      heatmap_matrix,
      cluster_rows = TRUE,
      cluster_cols = FALSE,
      annotation_colors = annotation_colors,
      annotation_col = data.frame(
        Week = factor(rep(c("Week12", "Week36"), each = 4)),
        Type = factor(rep(c("NW", "OW"), times = 4)),
        row.names = colnames(heatmap_matrix)
      ),
      scale = "column",
      color = colorRampPalette(c("royalblue1", "white", "pink3"))(100),
      main = "Heatmap of Top 50 Genes by Variance",
      fontsize_row = 5,
      fontsize_col = 10,
      angle_col = 45,
      border_color = "grey70",
      gaps_col = gaps
    )

![](lizzola_Project1_files/figure-markdown_strict/heatmap%20plot-1.png)

    dev.off()

    ## png 
    ##   3

<figure>
<img src="heatmap.png" alt="Heatmap Top 50 Genes" />
<figcaption aria-hidden="true">Heatmap Top 50 Genes</figcaption>
</figure>

#### Conclusion

The heatmap shows that gene expression of individual genes differs
between the two weight groups (Normal Weight and Overweight). The
variability within the replicates is also interesting. The expression
pattern change between weeks (Week 12 and Week 36) indicates that the
gene expression landscape is dynamic during pregnancy, although at first
glance the changes in gene expression between the two weight groups
appear to be similar. To conclude, gene expression is influenced by both
gestational age and maternal weight status.

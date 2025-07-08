## Load Libraries

    library(readxl)
    library(knitr)
    library(ggplot2)
    library(stringr)

## Data Manipulation

    # Read Excel file
    data <- read_excel("avym.xlsx")

    #  Set the first row as column names
    colnames(data) <- as.character(unlist(data[1, ]))

    # Remove the first row 
    data <- data[-1, ]

    # reset row numbers
    rownames(data) <- NULL

    # Add "(up)" to columns 6 to 11
    colnames(data)[6:11] <- paste0(colnames(data)[6:11], " (up)")

    # Add "(down)" to columns 13 to 18
    colnames(data)[13:18] <- paste0(colnames(data)[13:18], " (down)")

    # Drop columns after column 18
    data <- data[, 1:18]

    # Drop columns 4, 5, and 12
    data <- data[, -c(4, 5, 12)]

    # Separate into DEG and GO data frames
    DEG <- data[, 1:3]
    GO_terms <- data[, 4:15]

## Filter DEGs

    # Convert logFC column to numeric
    DEG$logFC <- as.numeric(DEG$logFC)

    # Create new column: TRUE if logFC > 2
    DEG$logFC_high <- DEG$logFC > 2

    # Ensure p.adjust is numeric
    DEG$p.adjust <- as.numeric(DEG$p.adjust)

    # Filter for significant DEGs
    DEG_filtered <- DEG[DEG$p.adjust < 0.05, ]

    # Get top 10 DEGs by logFC
    top10_DEGs <- DEG_filtered[order(-DEG_filtered$logFC), ][1:10, ]

    # Show table
    kable(top10_DEGs, caption = "Top 10 Upregulated DEGs (p.adjust < 0.05)", align = "c")

<table>
<caption>Top 10 Upregulated DEGs (p.adjust &lt; 0.05)</caption>
<thead>
<tr>
<th style="text-align: center;">gene</th>
<th style="text-align: center;">logFC</th>
<th style="text-align: center;">p.adjust</th>
<th style="text-align: center;">logFC_high</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">Acod1</td>
<td style="text-align: center;">4.919507</td>
<td style="text-align: center;">0.0041432</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Vegfa</td>
<td style="text-align: center;">3.464017</td>
<td style="text-align: center;">0.0000000</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Thbs1</td>
<td style="text-align: center;">3.369642</td>
<td style="text-align: center;">0.0039819</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Serpine1</td>
<td style="text-align: center;">3.197021</td>
<td style="text-align: center;">0.0000000</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">AA467197</td>
<td style="text-align: center;">3.112409</td>
<td style="text-align: center;">0.0000005</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Cst7</td>
<td style="text-align: center;">2.847473</td>
<td style="text-align: center;">0.0000000</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Flt1</td>
<td style="text-align: center;">2.698421</td>
<td style="text-align: center;">0.0000350</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">C3</td>
<td style="text-align: center;">2.566213</td>
<td style="text-align: center;">0.0000280</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Slc7a11</td>
<td style="text-align: center;">2.457346</td>
<td style="text-align: center;">0.0458777</td>
<td style="text-align: center;">TRUE</td>
</tr>
<tr>
<td style="text-align: center;">Acp5</td>
<td style="text-align: center;">2.441797</td>
<td style="text-align: center;">0.0000066</td>
<td style="text-align: center;">TRUE</td>
</tr>
</tbody>
</table>

## GO Term Filtering

    # Define keywords
    keywords <- c("angiogenesis", "immune response", "immunity", "cytokine", "vasculature",
                  "wound", "inflammatory response", "chemokine", "lymphatic",
                  "lymphocyte", "macrophage", "monocyte")

    # Collapse into regex pattern
    pattern <- paste(keywords, collapse = "|")

    # Filter GO terms (upregulated only)
    GO_up_filtered <- GO_terms[grepl(pattern, GO_terms$`Description (up)`, ignore.case = TRUE), ]

    # Remove "(down)" columns
    GO_up_filtered <- GO_up_filtered[, !grepl("\\(down\\)", colnames(GO_up_filtered))]

    # Remove unwanted columns
    cols_to_remove <- c("BgRatio (up)", "pvalue (up)", "ID (up)")
    GO_up_filtered <- GO_up_filtered[, !(colnames(GO_up_filtered) %in% cols_to_remove)]

    # Rename columns
    colnames(GO_up_filtered) <- c("Description", "GeneRatio", "p.adjust")

## Volcano Plot

    # Recalculate -log10(p.adjust)
    DEG$neg_log10_padj <- -log10(DEG$p.adjust)

    # Volcano plot
    ggplot(DEG, aes(x = logFC, y = neg_log10_padj)) +
      geom_point(aes(color = logFC_high), alpha = 0.7) +
      geom_vline(xintercept = c(-2, 2), linetype = "dashed", color = "gray40") +
      geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "gray40") +
      geom_text(aes(label = gene), check_overlap = TRUE, size = 3, vjust = -0.3) +
      labs(
        title = "Volcano Plot of DEG Genes",
        x = "log2 Fold Change",
        y = "-log10 Adjusted p-value",
        color = "logFC > 2"
      ) +
      theme_minimal()

![](thisishamed_files/figure-markdown_strict/unnamed-chunk-5-1.png)

## GO Dot Plot

    # Wrap long descriptions
    GO_dotplot <- GO_up_filtered
    GO_dotplot$Description <- str_wrap(GO_dotplot$Description, width = 40)

    # Convert GeneRatio to numeric
    GO_dotplot$GeneRatio <- sapply(strsplit(GO_dotplot$GeneRatio, "/"), function(x) as.numeric(x[1]) / as.numeric(x[2]))

    # Convert p.adjust to numeric
    GO_dotplot$p.adjust <- as.numeric(GO_dotplot$p.adjust)

    # Sort and select top 15
    top_n <- 15
    GO_dotplot_top <- GO_dotplot[order(GO_dotplot$GeneRatio, decreasing = TRUE), ][1:top_n, ]

    # Dot plot
    ggplot(GO_dotplot_top, aes(x = GeneRatio, y = reorder(Description, GeneRatio))) +
      geom_point(aes(size = GeneRatio, color = p.adjust)) +
      scale_color_gradient(low = "red", high = "lightgray", name = "Adjusted p-value") +
      labs(
        title = "Top 15 Upregulated GO Terms Dot Plot",
        x = "Gene Ratio",
        y = "GO Term Description"
      ) +
      theme_minimal() +
      coord_flip() +
      theme(
        axis.text.y = element_text(size = 10),
        legend.position = "right"
      )

![](thisishamed_files/figure-markdown_strict/unnamed-chunk-6-1.png)

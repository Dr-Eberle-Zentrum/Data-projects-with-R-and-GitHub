These are the samples, I have chosen for this task.

    ## 
    ## 
    ## Table: Selection of the samples
    ## 
    ## |sample | week | replicate | weight_status |
    ## |:------|:----:|:---------:|:-------------:|
    ## |G38    |  12  |     3     |      NW       |
    ## |G49    |  12  |     5     |      NW       |
    ## |G83    |  12  |     9     |      OW       |
    ## |G61    |  12  |     7     |      OW       |
    ## |G34    |  36  |     3     |      NW       |
    ## |G41    |  36  |     5     |      NW       |
    ## |G90    |  36  |     9     |      OW       |
    ## |G84    |  36  |     7     |      OW       |

## Code for the data adjustment

    count_data_sel <- count_data_all %>% 
      select(all_of(c("Row.names", sample_selection$sample))) %>%
      rename(gene_code = "Row.names") %>%
      rename_with(~ rename_cols[.x], .cols = sample_selection$sample) %>%
      pivot_longer(-gene_code, names_to = "sample", values_to = "count") %>%
      filter(!is.na(gene_code) & gene_code != "") %>%
      filter(count > 2) %>%
      group_by(sample) %>%
      mutate(counts_total = sum(count, na.rm = TRUE), 
             counts_norm = (count / counts_total) * 10**6,
             counts_norm_log2 = log2(counts_norm +1),
             z_value = scale(counts_norm)[, 1]
             ) %>%
      ungroup() %>%
      group_by(gene_code) %>%
      mutate(variance = var(counts_norm_log2, na.rm = TRUE)) %>%
      ungroup()

## Code for the Visualisation

    p <- heatmaply(
      heatmap_data,
      dendrogram = "row",                      
      xlab = "Sample", ylab = "Gene",
      main = "Gene Expression Z-scores",
      scale = "none",                          
      grid_color = "grey",
      grid_width = 0.00001,
      titleX = FALSE,
      branches_lwd = 0.3,
      label_names = c("Gene", "Sample", "Z-value"),
      fontsize_row = 11, fontsize_col = 15,
      labCol = colnames(heatmap_data),
      labRow = rownames(heatmap_data),
      colors = colorRampPalette(c("red", "white", "blue"))(256),
      limits = c(-max_abs, max_abs),
      col_side_colors = sample_info[colnames(heatmap_data), , drop = FALSE],
      #col_side_palette = annotation_colors,  ## i don't know, why this does not work
      heatmap_layers = list(
          theme(
          legend.text = element_text(size = 20),      
          legend.title = element_text(size = 22),
          legend.position = "bottom"
        )),
      plot_method = "plotly"
    )

## Visualisation

![](flomailiSolutiom_files/figure-markdown_strict/Heatmap_storage-1.png)
![](heatmap_static.png) <br> For the interactive heatmap, click
[here](heatmap_interactive.html). !HTML isnot rendered, so you won’t see
an interactive Map!

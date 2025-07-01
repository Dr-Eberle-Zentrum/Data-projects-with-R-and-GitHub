    if (!is.null(current_input())) {
      rmd_dir <- path_dir(current_input())
    } else {
      rmd_dir <- getwd()
    }

    count_data_all  <- read_csv("GSE273780_EukmRNAseq_counts.csv")

    sample_selection <- tibble(
      sample = c("G38", "G34", "G49", "G41", "G83", "G90", "G61", "G84"),
      week = rep(c(12,36), times = 4), 
      replicate = rep(c(3,5,9,7), each = 2),
      weight_status = rep(c("NW", "OW"), each = 4)
    )



    sample_table<-kable(sample_selection, caption = "Selection of the samples", align = "lccc")
    print(sample_table)

    ## 
    ## 
    ## Table: Selection of the samples
    ## 
    ## |sample | week | replicate | weight_status |
    ## |:------|:----:|:---------:|:-------------:|
    ## |G38    |  12  |     3     |      NW       |
    ## |G34    |  36  |     3     |      NW       |
    ## |G49    |  12  |     5     |      NW       |
    ## |G41    |  36  |     5     |      NW       |
    ## |G83    |  12  |     9     |      OW       |
    ## |G90    |  36  |     9     |      OW       |
    ## |G61    |  12  |     7     |      OW       |
    ## |G84    |  36  |     7     |      OW       |

    rename_cols <- setNames(
      paste0(
        "R", sample_selection$replicate, "_",
        sample_selection$weight_status, "_week", 
        sample_selection$week
      ),
      sample_selection$sample
    )

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

    top_genes <- count_data_sel %>%
      group_by(gene_code) %>%
      filter(n() == 8) %>%       # i just want to have complete sets, so i have no NA-values, because there were a few otherwise, maybe you could comment if thats ok or if i shall include all in my analysis
      ungroup() %>%
      distinct(gene_code, variance) %>%
      slice_max(variance, n = 50) 


    heatmap_data <- count_data_sel %>%
      filter(gene_code %in% top_genes$gene_code) %>%
      select(gene_code, sample, z_value) %>%
      pivot_wider(names_from = sample, values_from = z_value) %>%
      column_to_rownames(var = "gene_code") %>%
      as.matrix()



    max_abs <- max(abs(heatmap_data), na.rm = TRUE)

    sample_info <- sample_selection %>%
      mutate(sample_name = paste0("R", replicate, "_", weight_status, "_week", week)) %>%
      select(sample_name, weight_status, week) %>%
      mutate(weight_status = factor(weight_status), week = factor(week)) %>%
      column_to_rownames("sample_name") %>%
      as.data.frame()

    annotation_colors <- list(
      weight_status = c("NW" = "yellow", "OW" = "orange"),
      week = c("12" = "lightgrey", "36" = "darkgray")
    )


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
      fontsize_row = 5, fontsize_col = 8,
      labCol = colnames(heatmap_data),
      labRow = rownames(heatmap_data),
      colors = colorRampPalette(c("red", "white", "blue"))(256),
      limits = c(-max_abs, max_abs),
      col_side_colors = sample_info[colnames(heatmap_data), , drop = FALSE],
      #col_side_palette = annotation_colors,  ## i don't know, why this does not work
      heatmap_layers = theme(axis.line = element_blank())
    )

    saveWidget(p, "heatmap_interactive.html", selfcontained = TRUE)

    webshot::webshot("heatmap_interactive.html", "heatmap_static.png", vwidth = 1200, vheight = 1000)

![](flomailiSolutiom_files/figure-markdown_strict/Heatmap-1.png)
![](heatmap_static.png) <br> For the interactive heatmap, click
[here](heatmap_interactive.html).

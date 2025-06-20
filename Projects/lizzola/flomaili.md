    clean_transcript_data <- function(data, col_indices) {
      data %>%
        select(all_of(col_indices)) %>%
        {
          colnames(.) <- as.character(unlist(.[2, ]))
          .[-c(1, 2), ]
        }
    }


    transcript_data  %>% 
      clean_transcript_data(1:3) %>%
      rename(p_adjust = p.adjust) %>%
      mutate(p_adjust = as.double(p_adjust)) %>%
      mutate(logFC = as.numeric(logFC)) %>%
      filter(!if_all(everything(), is.na)) %>%
      mutate(logFC_high = if_else(logFC > 2 , TRUE, FALSE)) -> DEG_data


    DEG_data_t10 <- DEG_data %>%
      filter(p_adjust < 0.05) %>%      
      arrange(desc(logFC)) %>%        
      head(10) 
    ### kableExtra is for HTML output
    #DEG_data_t10 %>%
     # select(1:3) %>%
      #kable(
       # caption = "Top 10 Differentially Expressed Genes (p.adjust < 0.05)",
        #col.names = c("Gene Name", "LogFC", "P-value"),
    #    align = "lcc" 
     # ) %>%
    #  kable_styling(
    #    bootstrap_options = c("striped", "hover", "condensed"),
    #    full_width = FALSE
    #  ) %>%
     # add_header_above(c("Gene Information" = 1, "Expression Changes" = 2)) %>% 
     # footnote(
      #  general = "Filtered for p.adjust < 0.05 and ranked by highest logFC. LogFC > 0 indicates upregulation.",
       # footnote_as_chunk = TRUE
      #) 
    #####

    DEG_data_t10 %>%
      select(1:3) %>%
      kable(
        caption = "Top 10 Differentially Expressed Genes (p.adjust < 0.05)",
        col.names = c("Gene Name", "LogFC", "P-value"),
        align = "lcc"
      ) %>%
      print()

    ## 
    ## 
    ## Table: Top 10 Differentially Expressed Genes (p.adjust < 0.05)
    ## 
    ## |Gene Name |  LogFC   |  P-value  |
    ## |:---------|:--------:|:---------:|
    ## |Acod1     | 4.919507 | 0.0041432 |
    ## |Vegfa     | 3.464017 | 0.0000000 |
    ## |Thbs1     | 3.369642 | 0.0039819 |
    ## |Serpine1  | 3.197021 | 0.0000000 |
    ## |AA467197  | 3.112409 | 0.0000005 |
    ## |Cst7      | 2.847473 | 0.0000000 |
    ## |Flt1      | 2.698421 | 0.0000350 |
    ## |C3        | 2.566213 | 0.0000280 |
    ## |Slc7a11   | 2.457346 | 0.0458777 |
    ## |Acp5      | 2.441797 | 0.0000066 |

    terms_pattern <- c(
      "angiogenesis", "immune response", "immunity", "cytokine",
      "vasculature", "wound", "inflammatory response", "chemokine",
      "lymphatic", "lymphocyte", "macrophage", "monocyte"
    ) %>% 
      str_c(collapse = "|")



    GO_data_up <- transcript_data %>%
      clean_transcript_data(6:11) %>%
      rename(p_adjust_2 =p.adjust) %>%
      mutate(p_adjust_2 = as.double(p_adjust_2)) %>%
      separate(GeneRatio, into = c("num", "den"), sep = "/", convert = TRUE) %>%
      mutate(GeneRatio = as.double(num) / as.double(den)) %>%
      select( ID, Description,GeneRatio,p_adjust_2) %>%
      filter(!is.na(Description) & str_detect(Description, regex(terms_pattern, ignore_case = TRUE)))

It didn’ make sense to me to delete the ID column, because I need this
one for the second data visualisation task.

    title_plot1 <-"Differentially Expressed Genes in Young vs. Aged Macrophages"

    DEG_data %>%
      ggplot(aes(x=logFC, y=-log10(p_adjust))) +
      geom_point(aes(colour = logFC_high)) +
        geom_text_repel(aes(label = gene), max.overlaps = 30) +
      geom_hline(yintercept = -log10(0.05), linetype = "solid", color = "black") +
      geom_vline(xintercept = c(-2, 2), linetype = "solid", color = "black") +
      labs(title = title_plot1, x="log2FC") +
      scale_color_manual(values = c("TRUE" = "red", "FALSE" = "blue"),labels = c("TRUE" = "log2FC>2", "FALSE" = "log2FC<=2"),name = "logFC Status")+
      scale_x_continuous(limits=c(-5, 5), breaks = c(-4, -2, 0, 2, 4))

![](flomaili_files/figure-markdown_strict/Plot1-1.png) I didn’t add all
Gene names to the plot as the plot would be too cluttered.

    GO_data_up %>%
      mutate(ID=fct_reorder(ID, GeneRatio)) %>%
      ggplot(aes(GeneRatio, y=ID)) +
      geom_point(aes(color=p_adjust_2, size= GeneRatio)) +
       scale_color_gradient(
        low = "red", high = "lightgrey",
        name = "Adjusted p-value",
        guide = guide_colorbar(reverse = TRUE)  # darker = more significant
      ) +
      scale_size_continuous(name = "Gene Ratio") +
      labs(
        x = "Gene Ratio",
        y = "GO Term",
        title = "GO Term - Gene Ratio"
      ) +
      theme_minimal() +
      theme(
        legend.position = "right",
        axis.text.y = element_text(size = 10), axis.text.x = element_text(size = 10,angle = 90, vjust = 0.5, hjust = 1), plot.title = element_text(size = 20)
      )+
      coord_flip()

![](flomaili_files/figure-markdown_strict/Plot%202-1.png)

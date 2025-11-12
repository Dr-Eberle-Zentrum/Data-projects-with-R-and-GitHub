# Markdown is amazin, weil damit kann man zig output formate wählen und 
# mit unseren code zu erkären - Cheatsheets unter Help - Cheatsheets - RMarkdown
# Let us start: 
# Das mit zwischen den Strichen heißt YAML header 
# Dafür muss man ein Markdown Dokument öffnen
---
  title: "Diamond sizes"
  date: 2016-08-25
  output: html_document
---

# Chunks mit ``` for R code
```{r setup, include = FALSE}
  library(ggplot2)
  library(dplyr)
  
  smaller <- diamonds %>%
    filter(carat <= 2.5)
```  
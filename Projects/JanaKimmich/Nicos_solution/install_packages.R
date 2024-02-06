#install_packages

required_packages <- c("tidyverse", "shiny", "plotly", "usethis", "emo", "git2r","shinyFiles", "shinyalert")

new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]

if(length(new_packages) > 0) {
  install.packages(new_packages, dependencies = FALSE, repos = NULL) # <- repos = Null for shiy document, loding repo direkt from cran
}


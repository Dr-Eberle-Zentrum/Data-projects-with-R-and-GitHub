

library(tidyverse)
library(readxl)

# set working directory to source file location
library(this.path)
setwd(this.path::here())

dataPath <- "Datasets"
userName <- "Martin"  # with what name to sign the SOP

# read table information
tables <-
  # read files and combine rowwise
  str_c(dataPath, "/tables/table_",1:3,".csv") |>
  # read all tables
  map( read_csv, na = c("", "NA", "undefined"), col_types="c", guess_max=0 ) |>
  # join them (columnwise) into one using "#" to identify rows
  reduce( left_join, by=c("#")) |>
  rename(id = "#")

codebooks <-
  list.files(str_c(dataPath,"/codebooks"), full.names = T) |>
  map(read_xlsx, na = c("-")) |>
  map(rename, Section = 1, TableId = 2, String = 3, Image = 4) |>
  bind_rows(.id="Step") |>
  # cleanup
  mutate(
    Section = case_when(
      str_detect(Section,"^Arbeit.*") ~"Arbeitsschritt",
      str_detect(Section,"^Ablau.*") ~"Ablauf",
      str_detect(Section,"^Hilf*") ~"Hilfsmittel",
      .default = NA
    ) |>
      factor(levels=c("Arbeitsschritt","Ablauf","Hilfsmittel"), ordered =T)
    )

############  FOR EACH ID in tables  #########################

getHtmlForTable <- function( subtable ) {

  # get data of single table as a list
  tabData <-
    # tables |>
    # # use first row only for now  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # slice(1) |>
    subtable |>
    select(-c(matches("^Creat|Updat|if_")) ) |>
    as.list()
  # pivot_longer(-id, names_to = "item") |>
  # view()

  # header information
  htmlOut <- c( "\n",
                "<hr>",
                # TODO logo
                "<h1>Standard Operating Procedure: Manufacturing", "\n",
                "Article: ", tabData$Articel, if_else(is.na(tabData$Articel_coupl),"", str_c("/", tabData$Articel_coupl)),
                "<img src='Datasets/images/logo.png' width='100px' style='float:right'> ",
                "</h1>", "\n",
                "<hr>", "\n",

                # general information
                "\n",
                "<h2> Montage von Bauteil: ", tabData$Articel, if_else(is.na(tabData$Articel_coupl),"", str_c("/", tabData$Articel_coupl)), "</h2>\n",
                "<ul>",
                "<li> Vorbereiten des Arbeitsplatzes!","\n",
                "<li> Strukturierter Arbeitsablauf, um den Prozess sicherzustellen!","\n",
                "</ul>"
  )

  # generate table
  htmlOut <- c(htmlOut,
               "\n",
               "<table border='1'><tbody>",
               # )

               # FOR EACH CODEBOOK STEP
               codebooks |>
                 # filter( Step == 1) |>
                 group_by(Step,Section) |>
                 distinct(String,Image) |>
                 # collapse each cell of a step
                 mutate(html = str_c( if_else(is.na(String),"",String),
                                      if_else(is.na(Image),"",
                                              str_c("<br> <img src='Datasets/images/", Image, "' width='50px'> "))
                                      )) |>
                 summarize(
                   html_td = str_c("<td><ul><li>",
                                   na.omit(html) |> str_c( collapse = "\n<li>"),
                                   "</ul></td>")
                 ) |>
                 # collapse all three cells into a row of a step
                 summarize(
                   html_tr = str_c(
                     "\n<tr><td>Arbeitsschritt ",first(Step),"</td><td>Ablauf</td><td>Hilfsmittel</td></tr>\n",
                     "<tr>",
                     str_c(html_td,collapse="\n"),
                     "</tr>\n")
                 ) |>
                 # get all rows
                 pull(html_tr),

               "</tbody><table>"
  )

  # footnote information
  htmlOut <- c(htmlOut,
               "\n",
               format(Sys.Date()), " / ", userName
  )

  # output sanity
  htmlOut[is.na(htmlOut)] <- "NA"

  # combine all strings into one string HTML output and return
  return( htmlOut |> str_c(collapse = "") )

}

###############################################################
##  FINAL HTML OUTPUT GENERATION
###############################################################

# list of output strings to write
c("<html><body>\n",
  tables |>
    rowwise() |>
    group_split() |>
    map( getHtmlForTable ),
  "\n</body> </html>\n"
) |>
  # concatenate to one big string
  str_c(collapse = "") |>
  # write output
  writeLines( con = "martin.html" )


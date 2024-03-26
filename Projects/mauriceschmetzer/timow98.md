## Data Wrangling

First of all I wanted to make the data more uniformly - I guess it is
not really needed as you can just make a list by file type - still might
be handy. There is probably a more efficient way

    # Create new directory
    ifelse(!dir.exists("./Data/renamed"), dir.create("./Data/renamed"), FALSE)

    # Here is a list of files from the pdf directory
    pdflist <- list.files("./Data/PDF/",pattern="^FY\\d{2}\\D*\\.pdf$", full.names = TRUE)
    pdflongyear <- list.files("./Data/PDF/",pattern="^FY\\d{4}.*\\.pdf$", full.names = TRUE)

    # find years
    years <- str_extract(as.numeric(str_extract(pdflongyear, pattern ="\\d{4}")),pattern ="\\d{2}$")

    # rename the ones that have 4 year digits
    file.copy(from = pdflongyear, 
                to = paste0("./Data/renamed/","FY",years,"_Table_III.pdf"))

    crop <- str_extract(pdflist, pattern = "FY.*")
    file.copy(from = pdflist, 
                to = paste0("./Data/renamed/", crop))

    numbers <- str_extract(str_extract(list.files("./Data/renamed/", "\\.pdf$", full.names = TRUE),
                           str_extract(list.files("./Data/renamed/", "\\.pdf$", 
                                                              full.names = TRUE),
                                       "\\d{2}[^\\d]*")),"\\d{2}")

    renamedlist <- list.files("./Data/renamed/",pattern="\\.pdf$", full.names = TRUE)
    newname <- paste0("./Data/renamed/","FY", numbers, "_Table_III.pdf")

    for (i in seq_along(renamedlist)) {
      file.rename(from = renamedlist[i], to = newname[i])
    }

Then I wondered how to import the files. I failed at importing them from
pdf files, so excel it is. The following code imports all sheets from
all excel files.

    # Get list of filepaths
    xlsx_list <- list.files("./Data/Excel", pattern = "\\.xlsx$")
    xlsx_list <- paste0("./Data/Excel/", xlsx_list)
    xlsx_list <- unlist(xlsx_list)

    read_all_sheets <- function(files) {
      # iterate over files and get sheet names
      for (i in seq_along(files)) {
        sheet_names <- excel_sheets(files[i])
        
        # then interate over sheet names and read into df
        for (j in seq_along(sheet_names)) {
          df <- read_excel(files[i], sheet = sheet_names[j])
          # assign name (df+(year-1)+sheetnumber)
          assign(paste0("df",i-1, "_", j), df, envir = .GlobalEnv)
        }
      }
    }

    # call function to import all sheets from all excel files
    read_all_sheets(xlsx_list)

Not really sure if that is what I would need to go on, but I still
learnt a lot :D Next we could try to iterate over the dataframes to get
specific columns. Instead of storing the data in separate dfs, I could
probably also make a list.

Here I tried to import one dataset as a test - very inefficient code so
far but works as I intended

    # The column names for the imported dataset
    # sometimes there is an additional name - not yet sure what to do with that
    columnnames <- c("Foreign State",
                   "Immediate Relatives",
                   "Special Immigrants",
                   "Family Preference",
                   "Employment Preference",
                   #"Schedule A Worker",
                   "Diversity Immigrants",
                   "Total")

    # function to cut the dataframe and insert the column names
    cut_dataframe <- function(df) {
      # find row where column names are
      row_index <- grep("^*Foreign", df[[1]])
      
      # delete rows based on how many 
      if (length(row_index) == 0) {
        df <- df %>%
            rename_with(~columnnames)
        return(df)
      }else if(ncol(df)==8){
          df[8] <- NULL
          df <- df[(row_index[1]+1):nrow(df), ]
          df <- df %>%
            rename_with(~columnnames)
          return(df)
      }else if(ncol(df)==9){
          df[1:2] <- NULL
          df <- df[(row_index[1]+1):nrow(df), ]
          df <- df %>%
            rename_with(~columnnames)
          return(df)
      }else{
          df <- df[(row_index[1]+1):nrow(df), ]
          df <- df %>%
            rename_with(~columnnames)
          return(df)
      }
    }

    # unfinished
    df0_3 <- cut_dataframe(df0_3)

    knitr::kable(
      df0_3[1:10, ], 
      caption = "Table: df0_3"
    )

<table>
<caption>Table: df0_3</caption>
<colgroup>
<col style="width: 16%" />
<col style="width: 15%" />
<col style="width: 14%" />
<col style="width: 13%" />
<col style="width: 16%" />
<col style="width: 16%" />
<col style="width: 6%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Foreign State</th>
<th style="text-align: left;">Immediate Relatives</th>
<th style="text-align: left;">Special Immigrants</th>
<th style="text-align: left;">Family Preference</th>
<th style="text-align: left;">Employment Preference</th>
<th style="text-align: left;">Diversity Immigrants</th>
<th style="text-align: left;">Total</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Asia−Continued</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Syria</td>
<td style="text-align: left;">674</td>
<td style="text-align: left;">5</td>
<td style="text-align: left;">850</td>
<td style="text-align: left;">75</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">1,622</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Thailand</td>
<td style="text-align: left;">993</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">514</td>
<td style="text-align: left;">88</td>
<td style="text-align: left;">65</td>
<td style="text-align: left;">1,681</td>
</tr>
<tr class="even">
<td style="text-align: left;">United Arab Emirates</td>
<td style="text-align: left;">33</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">169</td>
<td style="text-align: left;">31</td>
<td style="text-align: left;">29</td>
<td style="text-align: left;">264</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Vietnam</td>
<td style="text-align: left;">6,938</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">9,776</td>
<td style="text-align: left;">49</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">17,813</td>
</tr>
<tr class="even">
<td style="text-align: left;">Yemen</td>
<td style="text-align: left;">1,376</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">409</td>
<td style="text-align: left;">25</td>
<td style="text-align: left;">28</td>
<td style="text-align: left;">1,839</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Region Total for Asia</td>
<td style="text-align: left;">65,434</td>
<td style="text-align: left;">457</td>
<td style="text-align: left;">78,848</td>
<td style="text-align: left;">12,023</td>
<td style="text-align: left;">4,958</td>
<td style="text-align: left;">162,772</td>
</tr>
<tr class="even">
<td style="text-align: left;">Europe</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Albania</td>
<td style="text-align: left;">331</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">247</td>
<td style="text-align: left;">22</td>
<td style="text-align: left;">3,398</td>
<td style="text-align: left;">3,998</td>
</tr>
<tr class="even">
<td style="text-align: left;">Andorra</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
</tr>
</tbody>
</table>

Table: df0\_3

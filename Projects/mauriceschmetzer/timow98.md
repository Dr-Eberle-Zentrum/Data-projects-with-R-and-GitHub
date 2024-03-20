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

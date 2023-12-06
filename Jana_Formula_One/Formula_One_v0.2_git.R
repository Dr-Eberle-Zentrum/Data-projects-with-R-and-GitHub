installed.packages()
library(purrr)
library(tidyverse)
library(plotly)
library(shiny)
library(tictoc)
getwd()

rm(list = ls())


############################

#EXPLANATION:
############
# Create a folder, were you can out all the csv dats of intrest in
# put yout local folder path in 'table_of_intrest' 
# the whole data wrangling preparation part for ggplot will done by the script !!!
#(at least i assume so, didnt came to the ggplot-part yet :D)
#############


# path to folder with data need to imported -> need to get fixed for git slice_drop_folder after branched right


#!!!! seems like it could be pretty hard, to use the actuall git/folder, due too it needs to downlod first,unzip,etc....

############!!!!!!

table_of_interest <- "Your [local folder], were you just push all csv data of intrest in"

##############!!!!

############################

# imports all csv files in a folder named under table_of_intrest <- call 'em slice_drop_folder or something like that later

auto_import_csv <- function(file_path){
  
  file_list <- list.files(path = file_path, pattern = "\\.csv$", full.names = TRUE)        #-> here we could change the auto import to other data type's 
  data_frames <- list()
  
  for (file in file_list) {
    df_name <- tools::file_path_sans_ext(basename(file))  # uses filename as dataframe
    data_frames[[df_name]] <- read.csv(file)
  }
  
  return(data_frames)
}
once_in_all_together <- auto_import_csv(table_of_interest)

###########################
# contains list of all tibbles                                 <- probably should remove it from enviroment this shit is fucking big !!!!!!!!!!!!!!!! rm(list = ls(once_in_all_together))
once_in_all_together
#
################
# now lets try to slice this big bastards to columns of intrest, best a single slice

big_slicer <- function(on_tibble_list){
  tibble_list_intrest_col <- sapply(on_tibble_list, function(on_each_tibble){
    
    # might be better to store searching patter outside of the function 4 better edit control
    
    select_columns_of_intrest <- select(on_each_tibble, matches("^(result|race|driver|constructor)Id$"), contains("name"), matches("nationality"), matches("wins"), matches("year")) # matches("points"), matches("^positionOrder$"), matches("rank"
    return(select_columns_of_intrest)
  })
  return(tibble_list_intrest_col)
}

slice_it <- big_slicer(once_in_all_together)

###########################
#
slice_it
#
# looks pretty dope ain't !? some more fine tuning and were done with the sorting
#
#
#####################
# next we need get rid of unecessary name & nationality columns

#slice_it$races <- slice_it$races[,setdiff(names(slice_it$races), "name")]
#slice_it$constructors <- slice_it$constructors[,setdiff(names(slice_it$constructors), "nationality")]

# works but aint that nice after that slice hammer -> go for an other one

slice_it$races <- slice_it$races %>%
  select(-name)

slice_it$constructors <- slice_it$constructors %>%
  select(-nationality)

finally_all_sorted <- slice_it

# ain't soo much more elegant, but okay...

#################
#
str(finally_all_sorted)
#
#################
# no we want to create an table as'The BIG PICTURE' by joining all variables into one

search_for_col_id <- "Id$" 

create_big_picture <- function(finally_all_sorted){
  do_big_picture <- finally_all_sorted$results
  for (kind_of_list in names(finally_all_sorted)){
    if (kind_of_list != "results") { # get sure 'results'table wont get joined into it self
      
      #match_columns <- colnames(finally_all_sorted[[kind_of_list]])[str_detect(colnames(finally_all_sorted[[kind_of_list]]), search_for_col_id)]
      
      match_columns <- grep(search_for_col_id, colnames(finally_all_sorted[[kind_of_list]]), value = TRUE, ignore.case = TRUE)
      do_big_picture <- do_big_picture%>%
        left_join(finally_all_sorted[[kind_of_list]], match_columns)
    }
  }
  return(do_big_picture)
}
big_picture <- create_big_picture(finally_all_sorted)



# this last step took quit longer than exspected 
#################
#but here it is, finally the 'Big Picture' i hope i can somehow magical do an fancy html graph of it, in the lasting hours
#otherwise it was just a waste of time to function up all the cleaning
#
big_picture
#
#################
# okay lets sort it, for faster understanding
#
#big_picture_sorted <-  big_picture%>%
#  select(resultId, raceId, year, driverId, forename, surname, wins, constructorId, name )
#
#big_picture_sorted
#
# -> piped it (down)
#######################
# now let's get us rid  off all the Id's in one version
# sadly we need the driverID for group_by or we already do it now?, ...
#...better do the wrangling bevor the removing iD !
# ->later -> done by reorder(select) in pipe (down)
################################
#
#  select(-matches("Id$")) <- might need it by time
#
###################
# now we have to take a look into the data..., luckily 'wins' already counts the total. -> needed the cumsum()-function
# so it should be simple done by group_by function over driverId and arrange desc wins -> yeah yeah that's what you thought....
# lets try....
# .... still sitting at this pipe_hammer.....
# don*t get my head around if it is useful to spend more time here to filter top 10 or doing it in visualization part, even if i'm thinking too
# put these filters interactiv anyways..... <-  okay got it, took my 5 min after writing this line xD
####################

# so far working, only put sorting behind and might get the top10 slice in

pipe_hammer <- big_picture %>% 
  filter(year %in%(2000:2020))%>%
  group_by(year, driverId) %>%
  filter(wins == max(wins))%>%
  slice(1)%>%
  ungroup()%>%
  group_by(driverId)%>%
  mutate(sum_wins_along = cumsum(wins[order(year)]))%>%
  arrange(desc(sum_wins_along))%>%
  ungroup()%>%
  filter(driverId %in% head(unique(driverId[order(sum_wins_along, decreasing = TRUE)]), 10)) %>%
  select(year, forename, surname, nationality, wins, sum_wins_along, name )%>%  #            -> to arrange columns of table in better way, won't be needed if not showing, could be just: select(contains("na(me|tionality)", "wins"), "year") 
  rename("constructor" = name)%>%
  mutate( year = as.factor(year), #                             -> might be a dumb idea to factorize year-number, let's see.......
          constructor = as.factor(constructor))

str(pipe_hammer)

# got damn this f*cker costs me a lot's of coffee, didn't exspected that one coming....
#
# and still not finished, rename and combine cloumns <- nope this seems to be done in the ggplot.labs/.legend/.title part
#
################################
#Probably wee need to make it tidy before we can use it for ggplot
#
# i guess we should also put labels to all these diffrent collumns before we pivot them long
#
pipe_hammer
#
##############################
# now lets factorize it,before pivot long
#fac_big_picture <- pipe_hammer%>%
#  mutate( year = as.factor(year), #                             -> might be a dumb idea to factorize year-number, let's see.......
#          nationality = as.factor(nationality),
#          constructor = as.factor(constructor))
#fac_big_picture
#
# -> piped it (up)
#
#############################
#now lets tidy it up by <dataTyp>
#
#do_fac_long_big_picture <- function(pipe_hammer){
#  int_col <- select(pipe_hammer, where(is.integer)) %>% names()
#  chr_col <- select(pipe_hammer, where(is.character)) %>% names()
#  fac-col <- select(pipe_hammer, where(is.integer)) %>% names()
#}
#
#?pivot_longer
#....
# daaang this already looks like it needs an fuction itself
#
# I think this
###################################
# probably should learn the logic of pivot_long first
#
#test1 <- pipe_hammer %>% #                                   -> think i can simple use it, if constructur as fac is not necesarry
#  pivot_longer(cols = matches(showMe[["character"]]), names_to = "NameType", values_to = "Name")%>%
#  pivot_longer(cols = all_of(showMe[["integer"]]), names_to = "countType", values_to = "Wins")%>%
#  pivot_longer(cols = all_of(showMe[["factor"]]), names_to = "factorType", values_to = "Wert")
#  
#test1
#
# could connect as simple version to Part No.1   -> (down)         
###################################
# splitted the task's up:

# Part No.1    

# identify unique <datatyp> in a Dataframe and generate a list of lists(datatyp) with column (names)

find_datayps_classes <- function(df){
  uniq_datatypes_in_df <- unique(sapply(df, class))        # stores vector of unique datatypes via typeof-func
  col_names_of_all_datatyp <- list()
  
  for (datatyp in uniq_datatypes_in_df) {
    col_name <- names(df)[sapply(df, class) == datatyp]
    col_names_of_all_datatyp[[datatyp]] <- col_name
  }
  return(col_names_of_all_datatyp)
}

# working so far, now get back to pivot part
##################################
showMe <- find_datayps_classes(pipe_hammer)
showMe
#############
##################################
# Part No.2    simple

# simple version becouse im getting bored and wanna finally git pull nd crab some food....
final_long_picture_simple <- pipe_hammer %>%
  pivot_longer(cols = matches(showMe[["character"]]), names_to = "NameType", values_to = "Name")%>%
  pivot_longer(cols = all_of(showMe[["integer"]]), names_to = "countType", values_to = "Wins")%>%
  pivot_longer(cols = all_of(showMe[["factor"]]), names_to = "factorType", values_to = "Wert")

########################################

final_long_picture_simple

#########################################
# Part No.2    auto

#...-> fuck i did it again... xD

# try out to get Part No.2 by function
# get the list of vectors into pivot-fct

pivot_all_at_once <- function(df,showMe){
  long_df <- df
  
  for (dataclass in names(showMe)) {
    columns <- showMe[[dataclass]]
    names_to <- paste0(substr(dataclass, 1, 8), "_typ")
    values_to <- paste0(substr(dataclass, 1, 3), "_wert")
    
    long_df <- long_df%>%
      pivot_longer(cols = all_of(columns), names_to = names_to, values_to = values_to )
  }
  return(long_df)
}

# daang its running, by time we could merge these party together, but...food.....
#################################################
final_long_picture <- pivot_all_at_once(pipe_hammer, showMe)
final_long_picture
########################################



##################################
#tryout:
##################################
#tyout No.3

# not doing what is should

pivot_col_by_datatyp_list <- function(df, col_names_of_all_datatyp ){
  single_pivot_steps <- list()
  
  for (typ_in_list in names(col_names_of_all_datatyp)) {
    
    #   
    columns <- col_names_of_all_datatyp[[typ_in_list]]
    
    single_pivot_steps <- df %>%
      pivot_longer(cols = all_of(columns), names_to = "Variable", values_to = "Value") %>%
      mutate(Datatype = typ_in_list)
    
    single_pivot_steps[[typ_in_list]] <- single_pivot_steps
    
  }
  result_df <- bind_rows(single_pivot_steps)
  
  return(result_df)
  
} 
is_it_it <- pivot_col_by_datatyp_list(pipe_hammer, showMe)
is_it_it
##################################
# Tryout >No.2
find_datayps_nd_pLong <- function(pipe_hammer){
  piv_long_by_type <- function(df, col_type){
    col_names <- select(df, where(col_type)) %>%
      names()
    if (length(col_names) > 0){
      df <- df%>%
        pivot_longer(cols = all_of(col_names), names_to = "key", values_to = "Wert", names_repair = TRUE)
    }
    return(df)
  }
  df <- piv_long_by_type(pipe_hammer, is.integer)
  df <- piv_long_by_type(df, is.character)
  df <- piv_long_by_type(df, is.factor)
  
  return(df)
}

final_picture_long <- find_datayps_nd_pLong(pipe_hammer)
################################################
# lets do a function and keep it pretty common 2 recycle l8-er , that search after difrent <dataTyp>
# Tryout No. 1
df <- pipe_hammer #                     -> 4 recycle

find_datayps_nd_pLong <- function(df){
  uniq_datatypes <- sapply(df, typeof)%>%        # stores vector of unique datatypes via typeof-func
    unique()
  dataTyp_listed <- vector("list", length = length(uniq_datatypes)) # With vector("list", i can option lengeth = n), wich i can't with list()
  for (i in seq_along(uniq_datatypes)) {
    dataTyp_listed[[i]] <- df%>%
      pivot_longer(cols = where(~typeof(.) == uniq_datatypes[[i]]), names_to = "Variable", values_to = "Werte")
  }
  return(dataTyp_listed)
}

long_big_picture <- find_datayps_nd_pLong(df)

# cant get my head around anymore, need to finish simpler version first......

############################         
# can we make the filters interactiv in html output ?
#ui <- fluidPage(
#  sliderInput("year_range", "Jahresbereich auswählen:", min = 2000, max = 2020, value = c(2000, 2020), step = 1),
#  numericInput("top_n", "Anzahl der Top-Driver auswählen:", value = 10, min = 1),
#  tableOutput("result_table")
#)
#
###->this is getting the pipe_hammer
#
#server <- function(input, output) {
#  output$result_table <- renderTable({
#    big_picture%>%...
#
# for:
#     - year ->  filter(year %in% seq(input$year_range[1], input$year_range[2])) %>%
#     - top 10 option -> filter(driverId %in% head(unique(driverId[order(sum_wins_along, decreasing = TRUE)]), input$top_n)) %>%
#
# })
#}
#
#shinyApp(ui, server)
#
#                      <- here me comes the question if it is useful to filter the data already here or put it in the visualisazion part ?!?!
#
##############################


#############################################
##not used
# can we now finally get rif of Id's?!
#-> piped it
#big_picture_clean <- big_picture_sorted %>%
#  select(-matches("Id$"))
#
#big_picture_clean
#############################################
#tryouts:
####################
#older

big_picture_of_intrest <- big_picture_sorted %>% # go later direkt to big_picture if solved sorting(summerize) issue
  filter(year %in%2019:2021)%>%
  group_by(driverId, year) %>%
  filter(wins == max(wins))%>%
  slice(1)%>%
  ungroup()%>%
  group_by(driverId)%>%
  mutate(sum_wins = sum(wins))%>%
  # summarise((across(everything())),
  # mutate(max_wins = max(wins)) %>%
  ungroup()%>%
  arrange(desc(sum_wins))
# group_by(driverId) %>%
#mutate(sum_wins = sum(max_wins))%>%
# arrange(desc(sum_wins))%>%
# ungroup()
view(big_picture_of_intrest)

############################
#not working proper <- something with the distinct part i guess

big_picture_of_intrest2 <- big_picture_sorted %>% # go later direkt to big_picture if solved sorting(summerize) issue
  filter(year %in%2000:2020)%>%
  group_by(driverId, year) %>%
  filter(wins == max(wins))%>%
  slice(1)%>%
  ungroup()%>%
  group_by(driverId)%>%
  mutate(sum_wins = cumsum(wins[order(year)]))%>%
  arrange(desc(sum_wins))%>%
  distinct(driverId, sum_wins) %>%
  top_n(10, wt = sum_wins)%>%
  ungroup()%>%
  
  # head(10)%>%
  select(-matches("Id$"))
view(big_picture_of_intrest2)

# fu*k we can't slice it down like that, we need additional informations -> solved
###########################

#Questions for martin:

###########################
#Why can't i do it in one step, can't i go up and down in datastructur like in folders? -> use map()-function
#
#only_columns_of_intrest <- slice_it$races
#  select(-name)%>%
#  slice_it$constructors%>%
#  select(-nationality)
#only_columns_of_intrest
#
#
############################
# Answer? <- check it by time
apply(my_file, store_file)


#instead

for ( i in my_file){
  store_file(i)
}
############################
# Take a closer look into that one aswell 

slice_it%>%
  map("constructors", ~select(-nationality))%>%
  map("races", ~select(-name))

?map         
only_columns_of_intrest
str(slice_it)

#######
# can we get the AI avatar-story into that one? i wanted to use for description?





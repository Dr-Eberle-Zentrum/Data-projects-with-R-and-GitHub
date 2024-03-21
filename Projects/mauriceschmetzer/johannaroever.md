# US Immigrant Visas Issued Project

## Project Assets

original information from the US Department of State:
<https://travel.state.gov/content/travel/en/legal/visa-law0/visa-statistics/annual-reports.html>

relevant data: *Table III: Immigrant Visas Issued (by Foreign State of
Chargeability or Place of Birth): Fiscal Year YYYY*

[Excel Files 2000 -
2023](https://github.com/Dr-Eberle-Zentrum/Data-projects-with-R-and-GitHub/tree/main/Projects/mauriceschmetzer/Data/Excel)

## Data Wrangling Goal

I would like to be able to extract the data from the PDF files
themselves without having to first import the data into Excel via Power
Query. Take a look at the function `pdf_text()` from the package
`pdftools`. If you cannot make it happen, then use the Excel files.
However, the priority is to be able to get the data from the pdf files!

    colnamesSet <- c("state", "immediateRel", "specialImm", "famPref", "employPref", "divImm", "total")

    # list taken from https://travel.state.gov/content/travel/en/us-visas/visa-information-resources/fees/visa-issuing-posts.html
    # modified in Excel and Notepad++ to get strings
    # (would be better to somehow use rworldmap::countrySynonyms or similar to check if a string is a country name)
    # INCOMPLETE, does not list every entry listed in the documents
    # some INCORRECT/CHANGED e.g. "United Kingdom" is "Great Britain and North Ireland" in the files
    listCountries <- tolower(c("Afghanistan","Albania","Algeria","Angola","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bolivia","Bosnia And Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burma","Burundi","Cabo Verde","Cambodia","Cameroon","Canada","Central African Republic","Chad","Chile","China","Colombia","Congo, Democratic Republic Of The","Congo, Republic Of The","Costa Rica","Cote D'ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia, The","Georgia","Germany","Ghana","Greece","Guatemala","Guinea","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Korea, South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Mongolia","Montenegro","Morocco","Mozambique","Namibia","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russia","Rwanda","Samoa","Saudi Arabia","Senegal","Serbia","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taipei, Taiwan (TAI/TAI)","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Trinidad And Tobago","Tunisia","Turkey","Turkmenistan","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","USUN","Uzbekistan","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"))

    pdfFile <- "https://travel.state.gov/content/dam/visas/Statistics/FY2000%20table%20III.pdf"
    #pdfFileGen <- "https://travel.state.gov/content/dam/visas/Statistics/FY20" +"\d\d"+ "%20table%20III.pdf"

    # convertPdf
    # loading the data as text from one pdf file
    pdfText <- pdf_text(pdfFile)
    allData <- data.frame()

    # for(i in 1:length(pdfText)){
      # currently worked on page
    i <- 3
      data <- str_split(pdfText[i], "\n")
      # take first element which equals the actual text
      data <- data[[1]] |> 
        # delete empty rows
        trimws()
    #####################################
      # TODO: delete rows at end of file after string containing "Grand Totals"
      #data <- data[-(str_detect("Grand Totals", data):data[length(data)])]
    #####################################
      
      # Idea: compare start of row with all values in ...countrySynonyms. return when true
      # (only textrows with country are needed, others not)
      # 1. get beginning strings of each row
      # 2. compare them to ...countrySynonyms
      # 3. use the indexes for reducing data to relevant rows
      # 
      # tmpIndex <- grep(pattern = "[:alpha:]+\\w{2, }", data)
      # 
      # TODELETE: this block is not needed since data can irectly be checked against listCountries
      # extract start of lines an compare
        # strList <- str_extract(pattern = "[:alpha:]+\\w{2,}", data)
        # strList <- strList[!is.na(strList)]
        # dataIndex <- list(rows = )
        # 
        # # Delete all non-country lines from strList 
        # for(i in 1:length(strList)){
        #   print(c(i, strList[i]))
        #   if(!all(str_detect(listCountries, strList[i]))){
        #     strList <- strList[-i]
        #   }
        # }
        # 
      # old/manual reducement to relevant rows
      # data <- data[ grep(strList[1], data) : grep(strList[length(strList)], data) ] 
      
      # keep rows from data when the start of the row equals one of the entries in listCountries)
      data <- data[tolower(str_extract(pattern = "[:alpha:]+\\w{2,}", data)) %in% listCountries]

      # turn into df with fixed number of columns, by dividing along the whitespaces between values
      data <- data.frame(str_split_fixed(data, " {2,}", 7))
      colnames(data) <- colnamesSet
      data$continent <- countrycode(sourcevar = data[, "state"], origin = "country.name", destination = "continent")

    head(data)

    ##      state immediateRel specialImm famPref employPref divImm    total continent
    ## 1    Syria          674          5     850         75     18    1,622      Asia
    ## 2 Thailand          993         21     514         88     65    1,681      Asia
    ## 3  Vietnam        6,938          2   9,776         49      0 17,813 1      Asia
    ## 4    Yemen        1,376          1     409         25     28    1,839      Asia
    ## 5  Albania          331          0     247         22  3,398    3,998    Europe
    ## 6  Armenia          151          0      22         13    290      476      Asia

## Tidy Data Format Goal

Below, you will find two pictures of the data (I used the country
Algeria and the fiscal year 2000 as an example. However, this applies to
every country and every fiscal year). The first picture shows the
original data provided by the Department of State. As you can see, the
data is in PDF format and is not tidy! I colored the relevant
information that I would like to extract in different colors:

-   Fiscal\_Year = Yellow
-   Country = Green
-   Continent = Red
-   Visa\_Type = Blue
-   Issued = Pink

<figure>
<img src="Original_Data_Format.png" alt="Goal Tidy Data Format" />
<figcaption aria-hidden="true">Goal Tidy Data Format</figcaption>
</figure>

The following picture shows how the final table should look like. Again,
I used the same colors to highlight how the data should be shown in tidy
format (The color of the values in both screenshots is pink but comes
across as if they have different colors so don’t be confused).

There should only be one single table in long format that has all the
information of every year for each country.

<figure>
<img src="Goal_Tidy_Data_Format.png" alt="Goal Tidy Data Format" />
<figcaption aria-hidden="true">Goal Tidy Data Format</figcaption>
</figure>

## Goal Data Visualization

Once the data is tidy, I would like to be able to visualize how many
visas were issued by country & visa category over time. For that
purpose, I would like to somehow define a specific country that I am
interested in (Maybe in a dashboard or simply a variable that I can
change) and generate a graph. This could look something like this:

![Goal Tidy Data Format](German_Historic_Immigrant_Visa_Graph.png)
Please create the above graph for the following countries:

-   Germany
-   China
-   Mexico
-   India

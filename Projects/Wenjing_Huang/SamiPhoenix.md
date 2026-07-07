    phone_ownership <- function(table){
      case_when(
        table$`Do you have a mobile phone?` == "No" ~ 0,
        table$`Is this mobile phone yours or do you share it ?` == "Shared" ~ 1,
        TRUE ~ 2
      )
    }


      # Reading Data
    data <-
      read_delim("2024-12-09_FALAH_Vanuatu_socialMediaUse_Zenodo_anonymized.csv",
                 delim = ";",
                 locale = locale(encoding = "Windows-1252")) %>% 
      
      # 1. Removing Columns with Text Answers:
      select(
        -`Which social media platform/site (Facebook, Instagram, Twitter, Tiktok, Snapchat) is your favourite to use for your health? And what do you like about it?`,
        -`For searching health information, which app, social media or website do you use ?`,
        -`For discussing health topics with other people online, which app, social media or website do you use ?`
      ) %>% 
      
      # 2. Merging Phone Ownership Columns:
      mutate(`mobile_phone ownership` = phone_ownership(.)) %>% 
      select(-`Do you have a mobile phone?`, -`Is this mobile phone yours or do you share it ?`) %>% 
      
      # 3. Simplifying Participant's Answers:
      mutate_all(funs(str_replace_all(., "Checked", "1"))) %>% 
      mutate_all(funs(str_replace_all(., "Unchecked", "0"))) %>%
      mutate_all(funs(str_replace_all(., "Yes", "1"))) %>% 
      mutate_all(funs(str_replace_all(., "No", "0"))) %>% 
      
      # Handling NA:
      replace(is.na(.), "0") %>% 

      # Simplifying Age
      mutate(`Age range` = case_when(
        str_detect(`Age range`, "Greater than or equal to 18") ~ ">= 18",
        str_detect(`Age range`, "Between 16 and 17 inclusive") ~ "16-17",
        str_detect(`Age range`, "Lower than or equal 15")      ~ "<= 15"
      )) %>% 
      mutate(Age_Sex = paste(`Age range`, Sex)) %>%
      
      # 2. Merging again
      mutate(Health_Platform = case_when(
        `Favourite platform/site for health: social media`  == 1 ~ "social media",
        `Favourite platform/site for health: search engine` == 1 ~ "search engine",
        `Favourite platform/site for health: unclear`       == 1 ~ "unclear",
        `Favourite platform/site for health: none`          == 1 ~ "none"
      )) %>% 
      mutate(HISB_Platform = case_when(
        `For searching health information: social media`    == 1 ~ "social media",
        `For searching health information: search engine`   == 1 ~ "search engine",
        `For searching health information: web site`        == 1 ~ "web site",
        `For searching health information: unclear`         == 1 ~ "unclear",
        `For searching health information: none`            == 1 ~ "none"
      )) %>% 
      mutate(Discussion_Platform = case_when(
        `For discussing: social media` == 1 ~ "social media",
        `For discussing: search engine` == 1 ~ "search engine",
        `For discussing: app` == 1 ~ "app",
        `For discussing: web site` == 1 ~ "web site",
        `For discussing: unclear` == 1 ~ "unclear",
        `For discussing: none` == 1 ~ "none"
      )) %>% 
      mutate(across(
        c(
          Health_Platform,
          HISB_Platform,
          Discussion_Platform
        ),
        ~ ifelse(
          `Do you use apps, social media or websites for your health?` == 0,
          "none",
          .
        )
      )) %>% 
      
      # 4. Renaming and combining
      rename(
        Age = `Age range`,
        Computer_Browsing =
          `When you are on the computer and/or tablet, what type of actions do you most often perform?   (choice=Searching for general information)`,
        Computer_Studying =
          `When you are on the computer and/or tablet, what type of actions do you most often perform?   (choice=Study or homeworks)`,
        Computer_Other =
          `When you are on the computer and/or tablet, what type of actions do you most often perform?   (choice=Other)`,
        Phone_Browsing =
          `When you are on your mobile phone, what type of actions do you perform most often?   (choice=Searching for general information)`,
        Phone_Studying =
          `When you are on your mobile phone, what type of actions do you perform most often?   (choice=Study or homeworks)`,
        Phone_Other =
          `When you are on your mobile phone, what type of actions do you perform most often?   (choice=Other)`
      ) %>% 
      mutate(Computer_Socializing = (
        as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Discussion by email or on the digital social networks with friends or family)`)
        + as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Watching your social network feed)`)
      )) %>% 
      mutate(Computer_Entertainment = (
        as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Listening to the music)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Playing games)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Viewing videos)`)
      )) %>% 
      mutate(Phone_Socializing = (
        as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Discussion by email or on the digital social networks with friends or family)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Watching your social network feed)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Telephone conversation)`)
      )) %>% 
      mutate(Phone_Entertainment = (
        as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Listening to the music)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Playing games)`) +
          as.numeric(`When you are on your mobile phone, what type of actions do you perform most often?   (choice=Viewing videos)`)
      )) %>% 
      mutate(HISB_Usage = (
        as.numeric(`For searching health information: social media`) +
        as.numeric(`For searching health information: search engine`) +
        as.numeric(`For searching health information: web site`)
      )) %>% 
      select(
        -(`Favourite platform/site for health: social media`:`For discussing: none`)
      ) %>%
      select(
        -starts_with("When"),
        -`Do you use apps, social media or websites for your health?`
      ) %>% 
      
      # Prep for Visualization
      # Drop NA in Age
      filter(!is.na(Age)) %>% 
      mutate(Age_Sex = as.factor(Age_Sex))
      

      
    # print with kable
    data |> 
      slice_head(n=20) |> 
      kableExtra::kable(format = "markdown", caption = "Cleaned Data for Analysis") 

<table style="width:100%;">
<caption>Cleaned Data for Analysis</caption>
<colgroup>
<col style="width: 4%" />
<col style="width: 1%" />
<col style="width: 2%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 2%" />
<col style="width: 5%" />
<col style="width: 4%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 3%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Participant</th>
<th style="text-align: left;">Sex</th>
<th style="text-align: left;">Age</th>
<th style="text-align: left;">Computer_Browsing</th>
<th style="text-align: left;">Computer_Studying</th>
<th style="text-align: left;">Computer_Other</th>
<th style="text-align: left;">Phone_Browsing</th>
<th style="text-align: left;">Phone_Studying</th>
<th style="text-align: left;">Phone_Other</th>
<th style="text-align: left;">mobile_phone ownership</th>
<th style="text-align: left;">Age_Sex</th>
<th style="text-align: left;">Health_Platform</th>
<th style="text-align: left;">HISB_Platform</th>
<th style="text-align: left;">Discussion_Platform</th>
<th style="text-align: right;">Computer_Socializing</th>
<th style="text-align: right;">Computer_Entertainment</th>
<th style="text-align: right;">Phone_Socializing</th>
<th style="text-align: right;">Phone_Entertainment</th>
<th style="text-align: right;">HISB_Usage</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">1</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">&lt;= 15 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">2</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">16-17 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">3</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">4</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">5</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">16-17 F</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">6</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">16-17 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">7</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&gt;= 18</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&gt;= 18 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">8</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">9</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">10</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">11</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">16-17 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">12</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">&lt;= 15 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">13</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">16-17 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">14</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">15</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">16</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">16-17 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">17</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">18</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">2</td>
<td style="text-align: left;">&lt;= 15 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">19</td>
<td style="text-align: left;">F</td>
<td style="text-align: left;">16-17</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">16-17 F</td>
<td style="text-align: left;">social media</td>
<td style="text-align: left;">search engine</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">20</td>
<td style="text-align: left;">M</td>
<td style="text-align: left;">&lt;= 15</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">0</td>
<td style="text-align: left;">1</td>
<td style="text-align: left;">&lt;= 15 M</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: left;">none</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

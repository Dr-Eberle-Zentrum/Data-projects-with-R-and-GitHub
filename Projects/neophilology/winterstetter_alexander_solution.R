# Project Daniel
rm()
library(ggplot2)
library(assertr)
library(tm)
library(SnowballC)
library(qdap)
library(stopwords)

setwd("C:\\Users\\alexa\\Documents\\01_Universität\\01_B. Sc. International Business Administration\\07_7. Semester\\05_Advanced Data Processing with R\\Peer_Projects\\Daniels_Project")
library(foreign)
herzog_data <- read.csv(file = "herzog.csv")
herzog_data$German.words <- as.character(herzog_data$German.words)
herzog_data_words <- data.frame(herzog_data$German.words)

single_string <- paste(herzog_data_words, sep = ",")

single_string <- gsub('"', '', single_string)
single_string <- gsub(",", "", single_string)
single_string <- gsub(",", "", single_string)
single_string <- gsub("  ", " ", single_string)


single_string_source <- VectorSource(single_string)
single_string_corpus <- VCorpus(single_string_source)
single_string_corpus <- tm_map(single_string_corpus, removePunctuation)
single_string_corpus <- tm_map(single_string_corpus, removeNumbers)
single_string_corpus <- tm_map(single_string_corpus, stripWhitespace)
single_string_corpus <- tm_map(single_string_corpus, removeWords, stopwords("de"))
single_string_corpus <- tm_map(single_string_corpus, removeWords, c("quot", "die", "ich", "sie", "mehr", "das", "heute", "es", "immer", "müssen"))
single_string_corpus <- tm_map(single_string_corpus, removeWords, c("in", "ja", "der"))
single_string_corpus <- tm_map(single_string_corpus, removeWords, a$WORD[1:7])


word_count <- freq_terms(single_string_corpus, 10000)

word_count <- arrange(word_count, desc(FREQ)) 

word_count_20 <- top_n(word_count, n = 25)

ggplot(word_count_20, aes(x = reorder(WORD, desc(FREQ)), y = FREQ)) + geom_col() +
  labs(x = "Word", y = "Word Frequency") + geom_hline(aes(yintercept = 0)) + theme_bw() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggtitle("Word Frequency of Roman Herzog speeches")
?reorder
?geom_hline       

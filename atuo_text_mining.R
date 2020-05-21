##### Automating text_mining.rmd script
### author: "Goutham"
### output: "auto_text_mining.R"

## require packages
options(warn=-1)
req.pack <-  c("tm", "stringr", "wordcloud")
req.pack <- lapply(req.pack, require, character.only = TRUE)

if(all(req.pack == "TRUE")){
  print("Packages load successful")
} else {print("Packages load unsuccessful")}

# get path and selected file
get.path <- getwd()
get.txt.files <- list.files(path = get.path, pattern = "*.txt")

print(paste("Current working directory: " ,get.path))
print(get.txt.files)

ask.input <- readline(prompt="Enter file name: ")
get.file <- paste(get.path, "/", ask.input, sep = "")

# load the selected file
o.jd <- readLines(get.file)

# text transformations
t.jd <- paste(o.jd, collapse = " ")
t.jd <- gsub(pattern = "\\W", replace = " ", t.jd)
t.jd <- tolower(t.jd)
t.jd <- removeWords(t.jd, stopwords("english"))
t.jd <- tm::stripWhitespace(t.jd)

# visualization - word cloud
s.jd <- str_split(t.jd, pattern = "\\s+")
s.jd <- unlist(s.jd)

pal2 <- brewer.pal(5,"Dark2")
plot <- wordcloud(s.jd, min.freq = 3, random.order = FALSE, scale = c(4,0.7), color = pal2, rot.per=.1)

# freq table
ta.jd <- sort(table(s.jd), decreasing = TRUE)
ta.jd <- as.data.frame(ta.jd)
names(ta.jd)[1] <- "Word"
ta.jd[ta.jd$Freq > 10, ] %>% View()


#####
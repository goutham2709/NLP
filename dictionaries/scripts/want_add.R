### Want_add

options(warn=-1)

want.words <- get(load(file = "want_words.RData"))
print(paste("Number of words currently: ", length(want.words)))
View(want.words)
ask.input <- readline(prompt="Enter words you want to add (separate by comma): ")
split.input <- strsplit(ask.input, split = ",")
split.input.ws <- unlist(lapply(split.input, trimws)) # trim white spaces
split.input.ws <- tolower(split.input.ws)


for (w in split.input.ws){
  if (!(w %in% want.words)) {
    want.words <- append(want.words, split.input.ws)
    print(paste(w, "added"))
  } else {print(paste(w, "already present"))}
}
print(paste("Number of words after adding: ", length(want.words)))

# want.words <- c()
save(want.words, file = "want_words.RData")

rm(list = ls())
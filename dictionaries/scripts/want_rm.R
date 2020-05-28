#### want_rm

want.words <- get(load(file = "want_words.RData"))
print(paste("Number of words currently: ", length(want.words)))
View(want.words)
ask.input <- readline(prompt="Enter words you want to remove (separate by comma): ")
split.input <- strsplit(ask.input, split = ",")
split.input.ws <- unlist(lapply(split.input, trimws)) # trim white spaces
split.input.ws <- tolower(split.input.ws)


for (w in split.input.ws){
  if (w %in% want.words) {
    want.words <- tm::removeWords(want.words, split.input.ws)
    want.words <- want.words[want.words != ""]
    print(paste(w, "removed"))
  } else {print(paste(w, "not present"))}
}
print(paste("Number of words after removing: ", length(want.words)))

save(want.words, file = "want_words.RData")

rm(list = ls())
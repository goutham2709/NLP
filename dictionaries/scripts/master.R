#### Script to add/remove words from want and don't want dictionaries

options(warn = -1)
rm(list = ls())

pick.dict <- readline(prompt = "Pick one: want_add or dont_add or want_rm or dont_rm: ")
if (pick.dict == "want_add") {
  source("want_add.R")  
}

if (pick.dict == "dont_add") {
  source("dont_add.R")
}

if (pick.dict == "want_rm"){
  source("want_rm.R")
}

if(pick.dict == "dont_rm"){
  source("dont_rm.R")
}

rm(list = ls())


source("hw07-Automating_Pipelines/Download_data.R")

source("hw07-Automating_Pipelines/Exploratory_analyses.R")

source("hw07-Automating_Pipelines/Statistical_analyses.R")

source("hw07-Automating_Pipelines/Generate_figures.R")

rmarkdown::render("hw07-Automating_Pipelines/Gapminder_report.Rmd")

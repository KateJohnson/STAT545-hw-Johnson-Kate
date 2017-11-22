library(shiny)
library(tidyverse)
library(knitr)
library(openssl)
library(DT)
library(stringr)
library(glue)

Server <- function(input, output) {
bcl_data <- read_csv("bcl-data.csv")

Filtered_bcl <- reactive({
      bcl_data %>%
        filter(Price >= input$priceIn[1],
         Price <= input$priceIn[2],
         Type == input$typeIn)
})

output$Hist_AlcCount <- renderPlot({
  Filtered_bcl() %>%
    ggplot() +
    aes(x=Alcohol_Content) +
    geom_histogram(aes(fill=..count..), binwidth = 5) + theme_bw() + 
    xlim(c(0,100)) + 
    xlab("Alcohol Content (%)") + ylab("Count") + labs(title="Histogram of Alcohol Content") +
    theme(plot.title = element_text(face="bold", size=16), axis.text=element_text(size=12), 
          axis.title = element_text(size=14), legend.position="none")
    })

output$CountText <- renderText({
  Filtered_bcl() %>% glue_data("We found {nrow(Filtered_bcl())} options for you!")
})

output$table_head <- DT::renderDataTable({
  Filtered_bcl()  %>%
    mutate_all(funs(tolower))
})
}

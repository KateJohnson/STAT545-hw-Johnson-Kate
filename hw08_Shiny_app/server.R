library(shiny)
library(tidyverse)
library(knitr)
library(openssl)

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
    geom_histogram(binwidth = 20) + theme_bw() + 
    xlab("Alcohol Content") + ylab("Number")
    })

output$table_head <- renderTable({
  Filtered_bcl()  %>%
    head()
})
}


ui <- fluidPage(
  
  #Application title
  titlePanel("My Liquor webpage"),
  
  sidebarPanel("This is my sidebar panel",
               
               img(src="wine.jpg", width="100%"),
               sliderInput("priceIn", "Price of booze", 
                           min=0, max=300, value=c(10,20), pre="CAD"),
               radioButtons("typeIn", "What kind of booze?", 
                            choices=c("BEER","SPIRITS","WINE"),
                                     selected="SPIRITS")
               ),
  
  mainPanel(plotOutput("Hist_AlcCount"),
            br(), br(),
            "The following table contains the three most expensive liquors:",
            tableOutput("table_head")
            )
)

ui <- fluidPage(
  
  #Application title
  titlePanel("My Liquor App"),
  
  sidebarPanel(img(src="wine.jpg", width="100%"),
               sliderInput("priceIn", "Price of Liquor", 
                           min=0, max=300, value=c(10,20), pre="CAD"),
               radioButtons("typeIn", "What kind of Liquor?", 
                            choices=c("BEER","SPIRITS","WINE"),
                                     selected="SPIRITS")
               ),
  
  mainPanel(plotOutput("Hist_AlcCount"),
            br(), br(),
            textOutput("CountText"),
            br(), br(),
            DT::dataTableOutput("table_head")
            )
)
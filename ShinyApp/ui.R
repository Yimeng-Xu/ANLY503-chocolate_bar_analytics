library(shiny)
cocoa <- read.csv('flavors_of_cocao_clean-united states.csv', stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Dark Chocolate Rating Distribution by Company Location"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "bins",
        "Number of bins:",
        min = 1,
        max = 50,
        value = 30
      ),
      selectInput("CompanyLocation", "Company Location:", choices = cocoa$Company.Location),
      hr(),
      helpText("Dark Chocolate Bar Data From flavorsofcocao.com")
    ),
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("HPlot")
    )
  )
  
)
)

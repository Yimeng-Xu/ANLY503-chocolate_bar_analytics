library(shiny)

cocoa <- read.csv('flavors_of_cocao_clean-united states.csv', stringsAsFactors = FALSE)
function(input, output, session) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    
    Rating <- cocoa[cocoa$Company.Location == input$CompanyLocation,]$Rating
    bins <- seq(min(cocoa$Rating), max(cocoa$Rating), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(Rating, breaks = bins, col = '#6d5947', border = 'white')
    
  })
}

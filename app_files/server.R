#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output) {
  ##create word cloud based on years chosen
  output$cloud <- renderPlot({
    filtered <- names %>% 
      filter(#sex %in% c(0,1),
             year >= input$yearInput[1],
             year <= input$yearInput[2]) %>% 
      group_by(Name) %>% 
      summarize(freq = sum(n))
    
  wordcloud(filtered$Name, filtered$freq, max.words = 15, scale=c(4,0.5),colors=brewer.pal(8, "Dark2"))
  })
  
})

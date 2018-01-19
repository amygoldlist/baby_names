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
      filter(Sex %in% gender_select(input$sexInput),
             year >= input$yearInput[1],
             year <= input$yearInput[2]) %>% 
      group_by(Name) %>% 
      summarize(freq = sum(n))
    
  wordcloud(filtered$Name, filtered$freq, max.words = 15, scale=c(2,0.8),colors=brewer.pal(8, "Dark2"))
  })
  
  ##create timeseries for chosen names
  output$time <- renderPlot({
    filter_2 <- names %>% 
      filter(Name %in% input$nameInput) %>% 
      group_by(Name, year) %>% 
      summarize(freq = sum(n))
    
    ggplot(filter_2,aes(x = year, y = freq, group = Name, colour=Name))+
      geom_line()+
      theme_bw()+
      ggtitle("Name Trends from 1915 to 2014")+
      ylab("Name Frequency")+
      xlab("Year")

    
  })
  
})



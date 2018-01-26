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
  
  
  
  ##Create wordcloud title
  output$cloudTitle <- renderText({
    if (input$yearInput[1]==input$yearInput[2]){
      paste("Popular names from", input$yearInput[1])
    }
    else{
      paste("Name trends from", input$yearInput[1], "to", input$yearInput[2])
      
    }
  })
  
  
  ##Create time series title
  output$timeTitle <- renderText({
    if (input$yearInput[1]==input$yearInput[2]){
      paste("Name comparison for", input$yearInput[1])
    }
    else{
      paste("Popular names from", input$yearInput[1], "to", input$yearInput[2])
      
    }
  })
  
  ##Build an interactive names list, based on gender
  output$nameList <- renderUI({
   names_list <- names %>% 
     filter(Sex %in% gender_select(input$sexInput)) %>% 
              pull(Name) %>% 
              unique() %>% 
              sort()
    
    selectizeInput(
      'nameInput', 'Select multiple names to compare their trends across time', 
      choices = names_list, 
      selected = c("CHARLIE", "SAMUEL"), 
      multiple = TRUE,
      options = list(maxItems = 20, placeholder = 'Please select a name') 
    )
  })
  
  
  ##create word cloud based on years chosen
  output$cloud <- renderPlot({
    filtered <- names %>% 
      filter(Sex %in% gender_select(input$sexInput),
             year >= input$yearInput[1],
             year <= input$yearInput[2]) %>% 
      group_by(Name) %>% 
      summarize(freq = sum(n))
    
  wordcloud(filtered$Name, filtered$freq, 
            max.words = input$numberInput, 
            scale=c(4,0.8),
            colors=brewer.pal(8, "Dark2"))
  })
  
  ##create timeseries for chosen names
  output$time <- renderPlot({
    filter_2 <- names %>% 
      filter(Sex %in% gender_select(input$sexInput),
             year >= input$yearInput[1],
             year <= input$yearInput[2]) %>%
      filter(Name %in% input$nameInput) %>% 
      group_by(Name, year) %>% 
      summarize(freq = sum(n))
    
    if (input$yearInput[1]!=input$yearInput[2]){
    ggplot(filter_2,aes(x = year, y = freq, group = Name, colour=Name))+
      geom_line()+
      theme_bw()+
      #ggtitle("Name Trends from ,input$yearInput[1] to input$yearInput[2]" )+  ####FIX!!!
      ylab("Name Frequency")+
      xlab("Year")#change scale!!!
    }
    
    else{ggplot(filter_2,aes(x = Name, y = freq, fill = Name))+
        geom_col()+
        theme_bw()+
        ylab("Name Frequency")+
        xlab("Names")
      
    }

  })
  
})



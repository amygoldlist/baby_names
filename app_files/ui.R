#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#




# Define UI 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Baby Name Explorer"),
  
   
  fluidRow(
    
    ##first panel
    column(5,
           wellPanel(
      ##subtitle
      h2("Create a custom word cloud of popular names for a time frame"),
      
      ## filter for sex
      radioButtons("sexInput", "Select the type of names you'd like to see in your word cloud", 
                   choices = c("All names", "Girl's names", "Boy's names"),
                   selected = "All names"),
      ##slider
      sliderInput("yearInput", "Use the slider to select a time range for the cloud", 1915, 2014, c(25, 40),step = 1, sep=""),
      
      sliderInput("numberInput", "Select the number of names to display in your cloud", 5,25, value =10, step =1),
      
      textOutput("cloudTitle"),
      
      plotOutput("cloud")
    )),
    
    # Show stuff
    column(7,
       ##trying something new
      
      h2("See trends of names over time"),
      
      h4("Start by selecting a name below to call up the menu, or start typing! Only names in the database are considered."),
      selectizeInput(
        'nameInput', 'You may select up to eight names at a time', choices = names_all, selected = c("CHARLES", "SAMUEL"), multiple = TRUE,
        options = list(maxItems = 8, placeholder = 'Please select a name')
      ),
      
      plotOutput("time"),
      
      h3("About the data"),
      
      h4("This dataset contains each name that was given to at least five babies in British Columbia from 1915 to 2014.")
      
    )
  )
))

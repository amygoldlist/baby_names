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
  
  # Sidebar  
  sidebarLayout(
    sidebarPanel(
      ##subtitle
      h4("Create a custom word cloud of popular names for a time frame"),
      
      ## filter for sex
      radioButtons("sexInput", "Select the type of names you'd like to see in your word cloud", 
                   choices = c("either", "girl", "boy"),
                   selected = "either"),
      ##slider
      sliderInput("yearInput", "Use the slider to select a time range for the cloud", 1915, 2015, c(25, 40),step = 1, sep=""),
      
      plotOutput("cloud")
    ),
    
    # Show stuff
    mainPanel(
       ##trying something new
      
      h4("See trends of names over time"),
      
      selectizeInput(
        'nameInput', 'Type in some names. (Only names which have been given to at least five BC babies are allowed).', choices = names_all, selected = c("AMY", "CHARLES", "SAMUEL", "WARREN"), multiple = TRUE,
        options = list(maxItems = 8, placeholder = 'Please select a name')
      ),
      
      plotOutput("time")
    )
  )
))

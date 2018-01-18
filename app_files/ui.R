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
      ## filter for sex
      checkboxGroupInput("sexInput", "Select one or more sexes", 
                   choices = c("female", "male"),
                   selected = c("female", "male") ),
      ##slider
      sliderInput("yearInput", "Years", 1915, 2015, c(25, 40),step = 1, sep="")
       
    ),
    
    # Show stuff
    mainPanel(
       plotOutput("cloud")
    )
  )
))

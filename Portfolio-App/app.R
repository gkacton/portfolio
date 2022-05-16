
# Load Libraries, etc. ----------------------------------------------------
library(shiny)
library(leaflet)
library(shinythemes)
source("maps.R")

# User interface ----
ui <- navbarPage(theme = shinytheme("journal"), 
                 "Grace Acton",
                 tabPanel("About Me",
                          h1("Hi, I'm Grace!")),
                 tabPanel("Work Experience and Courses"),
                 tabPanel("Blog"),
                 navbarMenu("Projects",
                            tabPanel("Seamstresses",
                                     h1("Promptitude and Fidelity"),
                                     h2("Professional Seamstresses in Early 19th-Century New England"),
                                     p("Begun during my time as a historical interpretation and research 
                                        intern at Old Sturbridge Village, this project explores the demographics and geographical 
                                        spread of professional seamstresses advertising in New England
                                        between 1790 and 1850. Through Leaflet maps and other data 
                                        visualizations, we can learn about the lives of New England's early
                                        women professionals."),
                                     h2("Presentation"),
                                     p("For more information and to view my presentation, click ", 
                                       a("here.", href = "https://github.com/gkacton/seamstresses")),
                                     h2("Example Maps"),
                                     h3("Seamstresses in Worcester"),
                                     h5("Data from the 1842 and 1844 Worcester City Directory"),
                                     leafletOutput("worcester"),
                                     h3("Seamstresses with Genealogy Information"),
                                     h5("Information gathered from birth, marriage, and death records, newspaper
                                          advertisements, and Census data."),
                                     leafletOutput("genealogy")
                                     ),
                            tabPanel("Lyme Disease"))
)

# Server logic ----
server <- function(input, output) {
  output$worcester <- renderLeaflet({
    worcester_map
  })
  output$genealogy <- renderLeaflet({
    genealogy_map
  })
}

# Run app ----
shinyApp(ui, server)
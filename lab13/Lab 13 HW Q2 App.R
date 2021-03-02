library("tidyverse")
library("shiny")
library("shinydashboard")
library("ggsci")
library("ggplot2")
library("gridExtra")


UC_admit <- readr::read_csv("data/UC_admit.csv")
UC_admit <- rename(UC_admit, AcademicYear = "Academic_Yr")

ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions"),
  dashboardSidebar(disable = T),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          selectInput("x", "Select Grouping Type", choices = c("Campus", "AcademicYear", "Category"), 
                      selected = "Campus"),
          hr(),
          helpText("Admissions data collected for the years 2010-2019 for each UC campus. More Information can be found on the University of California Information Center website: https://www.universityofcalifornia.edu/infocenter")
      ),
      box(
        plotOutput("plot", width = "600px", height = "500px")
      ) 
    )
  )
)

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    UC_admit %>% 
      ggplot(aes_string(x = input$x, y="FilteredCountFR", fill="Ethnicity"))+
      geom_col()+
      scale_fill_futurama(palette = "planetexpress") +
      theme_minimal(base_size = 18)+
      theme(axis.text.x = element_text(angle = 60, hjust = 1))+
      labs(title = "UC Admissions By Ethnicity",x=NULL,y="Number of Individuals")
  })
  
  
  session$onSessionEnded(stopApp)
}
shinyApp(ui, server)
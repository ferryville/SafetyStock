
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "Safety Stock Demo"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Main Demo", tabName = "demo", icon = icon("dashboard")),
      menuItem("Documentation", tabName = "documentation", icon = icon("th"))
    )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "demo",
              tags$div(
                tags$h1("Historical Track")
              ),
              fluidRow(
                dataTableOutput('mytable'),
                box(plotOutput("plot1", height = 250),
                    tags$p("Current Safety Stock value:"),
                    verbatimTextOutput("dynamic_value")
                ),
                
                
                box(
                  title = "Choose the desired service level",
                  sliderInput("slider", "Service Level:", 0.01, 1, 0.5)
                ),
                box(
                  title = "Choose the current Lead Time",
                  sliderInput("ldt", "Lead Time:", 1, 15, 5)
                )
              )
      ),
      
    
    # Boxes need to be put in a row (or column)
    tabItem(tabName = "documentation",
            h1("Explanation of the Demo"),
            tags$div(
              tags$h3("The Main idea"),
              tags$p("We have a set of sales for manufacturing goods. We would like based on those information, calculate the safety stocks needed. The safety stock is the quantity to have permanently to react to demand variability. The safety stock is linked to a notion of service level and is based on the production or procurement leadtimes of our goods"),
              tags$br(),
              tags$p("The demo aims to show the impact of the change of the service level and the Lead time on the calculation of the safety stock."),
              tags$p("The main formula I am using is: Safety Stock = Z x Sigma x Square root(Lead Time)"),
              tags$p("Z is the service level coefficient expressed as the qnorm of Service level in percentage"),
              tags$p("Sigma is the series standard deviation"),
              tags$p("Lead Time is the total procurement lead time"),
              tags$br(),
              tags$p("TThe safety stock is plotted on the sales plot in red line. When changing leadtimes or service level, you will see the red line changing and we will see the impact on safety stock level. When lowering the service level, the red line disappear because we do not need safety stocks. When putting the service level to 100% we go to infinite safety stock that is why the line is not appearinng. It stills appearing at 99%.")
              
            )
    )
    )
  )
)
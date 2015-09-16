library(shiny)

shinyUI(
    fluidPage(
        tags$head(includeScript("google-analytics.js")),
        titlePanel("Google Analytics: Dimensions & Metrics"),
        absolutePanel(style = "z-index: 1000", draggable = TRUE, fixed = TRUE, width = 280, height = 300,
                      top = "auto", left = "auto", right = 20, bottom = 20,
                      wellPanel(
                          checkboxGroupInput(inputId = "columns",
                                             label = "Columns to show:",
                                             choices = cn[!cn %in% selected])
                      )
        ),
        fluidRow(
            column(3,
                   selectInput(inputId = "group", label = "Group:",
                               choices = c("All", unique(ga$group)))
            ),
            column(3,
                   selectInput(inputId = "type", label = "Type:",
                               choices = c("All", unique(ga$type)))
            ),
            column(3,
                   selectInput(inputId = "status", label = "Status:",
                               choices = c("All", unique(ga$status)), selected = "PUBLIC")
            ),
            column(3,
                   selectInput(inputId = "segments", label = "Allowed in Segments:",
                               choices = c("All", unique(ga$allowed.in.segments)))
            )),
        fluidRow(
            DT::dataTableOutput(outputId = "table")
        )
    )
)

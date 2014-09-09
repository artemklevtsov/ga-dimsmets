library(shiny)

# Define the overall UI
shinyUI(
    fluidPage(
        tags$head(includeScript("google-analytics.js")),
        titlePanel("Google Analytics: Dimensions & Metrics"),
        absolutePanel(fixed = TRUE, draggable = TRUE, class = "modal",
                      top = "auto", left = "auto", right = 20, bottom = 20,
                      width = 300, height = 420,
                      wellPanel(
                          checkboxGroupInput(inputId = "columns", label = "Columns to show:",
                                             names(ga), selected = c("id", "uiName", "type", "description"))
                      )
        ),
        fluidRow(
            column(3,
                   selectInput(inputId = "group", label = "Group:",
                               c("All", unique(ga$group)))
            ),
            column(3,
                   selectInput(inputId = "type", label = "Type:",
                               c("All", unique(ga$type)))
            ),
            column(3,
                   selectInput(inputId = "status", label = "Status:",
                               c("All", unique(ga$status)))
            ),
            column(3,
                   selectInput(inputId = "allowedInSegments", label = "Allowed in Segments:",
                               c("All", unique(ga$allowedInSegments)))
            )),
        fluidRow(
            dataTableOutput(outputId = "table")
        ),
        fluidRow(
            span(paste("Data updated", format(file.info("ga.rds")$ctime, "%F")))
        )
    )
)

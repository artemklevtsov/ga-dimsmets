library(shiny)

ga <- readRDS("ga.rds")

# Define the overall UI
shinyUI(
    fluidPage(
        titlePanel("Google Analytics: Dimensions & Metrics"),
        absolutePanel(fixed = TRUE, draggable = TRUE, class = "modal",
                      top = "auto", left = "auto", right = 20, bottom = 20,
                      width = 300,
                      wellPanel(
                          checkboxGroupInput(inputId = "columns", label = "Columns to show:",
                                             names(ga), selected = c("group", "id", "uiName", "description", "type", "dataType", "status"))
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
            span(paste("Data updated", format(file.info(".RData")$ctime, "%F")))
        )
    )
)

library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

    # Filter data based on selections
    output$table <- renderDataTable({
        data <- ga
        if (input$group != "All") {
            data <- data[data$group == input$group,]
        }
        if (input$type != "All") {
            data <- data[data$type == input$type,]
        }
        if (input$status != "All") {
            data <- data[data$status == input$status,]
        }
        if (input$allowedInSegments != "All") {
            data <- data[data$allowedInSegments == input$allowedInSegments,]
        }
        data[, input$columns, drop = FALSE]
    }, options = list(iDisplayLength = 10))

})

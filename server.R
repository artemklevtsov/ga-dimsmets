library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

    # Filter ga based on selections
    output$table <- renderDataTable({
        if (input$group != "All") {
            ga <- ga[ga$group == input$group,]
        }
        if (input$type != "All") {
            ga <- ga[ga$type == input$type,]
        }
        if (input$status != "All") {
            ga <- ga[ga$status == input$status,]
        }
        if (input$allowedInSegments != "All") {
            ga <- ga[ga$allowedInSegments == input$allowedInSegments,]
        }
        ga[, input$columns, drop = FALSE]
    }, options = list(iDisplayLength = 10))

})

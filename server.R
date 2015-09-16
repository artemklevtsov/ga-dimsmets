library(shiny)

shinyServer(function(input, output) {

    output$table <- DT::renderDataTable({
        if (input$group != "All")
            ga <- ga[ga$group == input$group,]
        if (input$type != "All")
            ga <- ga[ga$type == input$type,]
        if (input$status != "All") {
            ga <- ga[ga$status == input$status,]
        }
        if (input$segments != "All")
            ga <- ga[ga$allowed.in.segments == input$segments,]
        if (!is.null(input$columns))
            selected <- c(selected, input$columns)
        ga[, selected, drop = FALSE]
    },
        rownames = FALSE,
        selection = "none", filter = "top", style = "bootstrap",
        extensions = c("FixedHeader", "Responsive"),
        options = list(
            autoWidth = TRUE, paging = FALSE, searchHighlight = TRUE
        )
    )
})

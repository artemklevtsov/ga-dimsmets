ga <- try(RGA::list_metadata("ga"), silent = TRUE)
if (inherits(ga, "try-error")) {
    ga <- RGA::ga
}

cn <- colnames(ga)
selected <- c("id", "ui.name", "type", "description")

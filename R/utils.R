#' Enable \code{shinytitle}
#'
#' @description
#' Add this function to the UI of a shiny application in order for you to be able to update the
#' browser title.
#'
#' @return A script tag that enables \code{shinytitle} to work within a shiny app.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     title = "Initial Title",
#'     use_shiny_title(),
#'     actionButton("button", "Click me for a new title"),
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$button, {
#'       change_window_title(session, "New Title")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @seealso \code{\link{change_window_title}} \code{\link{flashing_window_title}}
#'
#' @export
use_shiny_title <- function() {
  file <- system.file("srcjs", package = "shinytitle", mustWork = TRUE)
  shiny::addResourcePath("shinytitle", file)

  shiny::tags$head(shiny::tags$script(src = "shinytitle/title-change.js"))
}

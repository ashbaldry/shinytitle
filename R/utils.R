#' Enable \code{shinytitle}
#'
#' @description
#' Adding script to enable the ability to change the window title.
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
  shiny::tags$head(shiny::tags$script(src = "shinytitle/title-change.js"))
}

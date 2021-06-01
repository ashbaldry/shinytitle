#' Change Browser Title
#'
#' @param session The \code{session} object passed to function given to \code{shinyServer}.
#' Default is \code{getDefaultReactiveDomain()}.
#' @param title String to give the window title
#' @param inactive_only Logical, whether or not the title should only change if the tab is not
#' active. Default is set to \code{FALSE}
#' @param revert_on_focus Logical, should the title revert back to the original title when the tab is in
#' focus/active again? Only works when \code{inactive_only = TRUE}.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     title = "Initial Title",
#'     use_shiny_title(),
#'     actionButton("button", "Click me for a new title"),
#'     actionButton("button2", "Click me for a button when finished")
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$button, {
#'       change_window_title(session, "New Title")
#'     })
#'
#'     observeEvent(input$button2, {
#'       Sys.sleep(3)
#'       change_window_title(session, "Sleep Finished", inactive_only = TRUE)
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @export
change_window_title <- function(session = shiny::getDefaultReactiveDomain(),
                                title = "Ready!",
                                inactive_only = FALSE,
                                revert_on_focus = inactive_only) {
  if (!isTRUE(inactive_only)) revert_on_focus <- FALSE

  settings <- list(title = title, inactive = inactive_only, revert_focus = revert_on_focus)
  session$sendCustomMessage("updateWindowTitle", settings)
}

#' Create Flashing Browser Title
#'
#' @param session The \code{session} object passed to function given to \code{shinyServer}.
#' Default is \code{getDefaultReactiveDomain()}.
#' @param title String to give the window title.
#' @param inactive_only Logical, whether or not the title should only change if the tab is not
#' active. Default is set to \code{FALSE}.
#' @param revert_on_focus Logical, should the title revert back to the original title when the tab is in
#' focus/active again? Only works when \code{inactive_only = TRUE}.
#' @param revert_on_mousemove Logical, should the title revert back to the original title when tthe mouse
#' is moved in the tab? Default is set to \code{TRUE}.
#' @param interval Time (in milliseconds) to flip between the original title and the new title.
#' @param duration Time (in milliseconds) to stop flashing the title. 0 (the default) means it will
#' flash indefinitely.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     title = "Initial Title",
#'     use_shiny_title(),
#'     actionButton("button", "Click me for a 10 second flashing title"),
#'     actionButton("button2", "Click me for a delayed flashing button")
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$button, {
#'       flashing_window_title(
#'         session, "--- Flash ---", revert_on_mousemove = FALSE, duration = 10000
#'       )
#'     })
#'
#'     observeEvent(input$button2, {
#'       Sys.sleep(3)
#'       flashing_window_title(
#'         session, "Please Come Back", inactive_only = TRUE, interval = 1000
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @export
flashing_window_title <- function(session = shiny::getDefaultReactiveDomain(),
                                  title = "Ready!",
                                  inactive_only = FALSE,
                                  revert_on_focus = inactive_only,
                                  revert_on_mousemove = TRUE,
                                  interval = 500, duration = 0) {
  if (!isTRUE(inactive_only)) revert <- FALSE

  settings <- list(
    title = title, inactive = inactive_only,
    revert_focus = revert_on_focus, revert_mouse = revert_on_mousemove,
    interval = interval, duration = duration
  )

  session$sendCustomMessage("flashWindowTitle", settings)
}

#' Create Busy Browser Title
#'
#' @param title String to give the window title.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- fluidPage(
#'     title = "Initial Title",
#'     use_shiny_title(),
#'     busy_window_title("Sleeping..."),
#'     actionButton("button", "Click me for a 5 second busy title")
#'   )
#'
#'   server <- function(input, output, session) {
#'     observeEvent(input$button, Sys.sleep(5))
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @export
busy_window_title <- function(title = "Running...") {
  shiny::span(class = "shiny-busy-title", `data-title` = title)
}

#' Run shinytitle Example
#'
#' @description
#' Launch one of the examples contained in the \code{shinytitle} package:
#'
#' \itemize{
#' \item{toggle}{An example showing the effects of simple change to the title and flashing title}
#' \item{busy}{An example of when the title changes when the shiny app is busy running calculations}
#' }
#'
#' @param example Choose between \code{toggle} and \code{busy}
#' @param ... other arguments sent to \code{\link[shiny]{runApp}}
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   run_shinytitle_example()
#' }
#'
#' @export
run_shinytitle_example <- function(example = c("toggle", "busy"), ...) {
  example <- match.arg(example)
  app_file <- system.file("examples", example, package = "shinytitle")
  shiny::runApp(app_file, ...)
}

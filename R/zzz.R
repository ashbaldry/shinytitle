.onLoad <- function(libname, pkgname) {
  file <- system.file("srcjs", package = "shinytitle", mustWork = TRUE)
  shiny::addResourcePath("shinytitle", file)
}

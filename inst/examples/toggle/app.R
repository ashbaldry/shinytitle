  library(shiny)
  library(shinytitle)

  ui <- fluidPage(
    title = "shinytitle Example",
    use_shiny_title(),
    inputPanel(
      actionButton("button", "Click me for a flashing title"),
      actionButton("button2", "Click me for a button when finished")
    )
  )

  server <- function(input, output, session) {
    observeEvent(input$button, {
      change_window_title(session, "Yes")
      flashing_window_title(session, "No", interval = 250, duration = 10000, revert_on_mousemove = FALSE)
      change_window_title(session, "shinytitle Example")
    })

    observeEvent(input$button2, {
      Sys.sleep(3)
      change_window_title(session, "Sleep Finished", inactive_only = TRUE)
    })
  }

  shinyApp(ui, server)

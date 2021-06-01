library(shiny)
library(shinytitle)

ui <- fluidPage(
  title = "shinytitle Example",
  use_shiny_title(),
  busy_window_title(),
  inputPanel(actionButton("button2", "Sleep and Plot Generation")),
  plotOutput("plt")
)

server <- function(input, output, session) {
  plt <- eventReactive(input$button2, {
    Sys.sleep(3)
    plot(mtcars$cyl, mtcars$disp)
  })

  output$plt <- renderPlot(plt())
}

shinyApp(ui, server)

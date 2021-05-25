# `shinytitle` - Window Title Change in Shiny

The goal of `shinytitle` is to manipulate the window title when running a shiny application.

## Installation

```r
devtools::install_github("ashbaldry/shinytitle")
```

Currently there are two functions:

- `change_window_title`: Make a single change to the window title
- `flashing_window_title`: Make the window title flash between the current title and a temporary second title

Both functions have the ability to be changed only when the tab is not the active tab. `flashing_window_title` has some extra features, 
such as a maximum duration of the flashing and being able to stop when the mouse moves.

## Example
```r
library(shiny)
library(shinytitle)
  
ui <- fluidPage(
  title = "Initial Title",
  use_shiny_title(),
  actionButton("button", "Click me for a flashing title"),
  actionButton("button2", "Click me for a new title after a 3 second wait")
)
  
server <- function(input, output, session) {
  observeEvent(input$button, {
    flashing_window_title(session, "--- Flashing Title ---", duration = 10000)
  })
    
  observeEvent(input$button2, {
    Sys.sleep(3)
    change_window_title(session, "Sleep Finished", inactive_only = TRUE)
  })
}
  
shinyApp(ui, server)
```

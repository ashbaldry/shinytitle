context("Busy Window Title")

test_that("busy_window_title() is a shiny object", {
  window_tag <- busy_window_title("Busy...")

  expect_s3_class(window_tag, "shiny.tag")
  expect_true(grepl("shiny-busy-title", window_tag$attribs$class))
  expect_type(window_tag$attribs[["data-title"]], "character")
})

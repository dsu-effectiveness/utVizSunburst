test_that("parse_js_colors expects 'rgb(123, 234, 0)' strings", {
  expect_error(parse_js_colors("#121212"))
  expect_error(parse_js_colors(rgb(123, 12, 1)))
})

skip_if_not_installed("patrick")
patrick::with_parameters_test_that("parse_js_colors can convert color-strings to hex-strings",
  {
    expect_equal(
      parse_js_colors(input),
      expected
    )
  },
  .cases = patrick::cases(
    empty = list(input = character(0), expected = character(0)),
    all_zero = list(input = "rgb(0, 0, 0)", expected = "#000000"),
    just_red = list(input = "rgb(255, 0, 0)", expected = "#FF0000"),
    just_green = list(input = "rgb(0, 255, 0)", expected = "#00FF00"),
    just_blue = list(input = "rgb(0, 0, 255)", expected = "#0000FF"),
    multiple_colors = list(
      input = c("rgb(255, 0, 0)", "rgb(0, 255, 0)"), expected = c("#FF0000", "#00FF00")
    )
  )
)

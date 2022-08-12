#' Create a HTML sunburst plot for displaying admissions and retention data
#'
#' @param   data   Data-frame.
#' @param   width,height   The initial size of the visualization
#' @param   elementId   Identifier for the HTML element into which the visualization will be added.
#'
#' @export

sunburst = function(data, width = NULL, height = NULL, elementId = NULL) {
  # forward options using x
  x = list(
    data = data,
    steps = colnames(data)[-1]
  )

  # Ensures that javascript receives a row-oriented view of 'data'
  attr(x, "TOJSON_ARGS") = list(dataframe = "rows") # nolint: object_name_linter.

  # create widget
  htmlwidgets::createWidget(
    name = "sunburst",
    x,
    width = width,
    height = height,
    package = "utVizSunburst",
    elementId = elementId
  )
}

#' Shiny bindings for sunburst
#'
#' Output and render functions for using sunburst within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a sunburst
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name sunburst-shiny
#'
#' @export
sunburstOutput = function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "sunburst", width, height, package = "utVizSunburst")
}

#' @rdname sunburst-shiny
#' @export
renderSunburst = function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr = substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sunburstOutput, env, quoted = TRUE)
}

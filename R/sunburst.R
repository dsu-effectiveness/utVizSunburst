#' Create a HTML sunburst plot for displaying admissions and retention data
#'
#' @param   data   Data-frame. This should have one row per observation (student).
#' @param   steps   Character. Subset of the columns of the data-frame. These correspond to the
#'   rings of the sunburst chart. The first entry of steps is the inner-most ring of the chart.
#' @param   palette   Character. A vector of colors that determines the color of each sector in the
#'   inner-most ring of the sunburst chart. The sectors are colored from largest to smallest.
#' @param   color_overrides   List of lists. Each sublist should have a 'color' entry (containing
#'   any valid R color) and should have at least one of 'group' and 'name'. To specify a color for
#'   a ring of the Sunburst chart, provide a 'group' entry. To specify a color for a named sector
#'   of a ring, provide a 'name' entry. The 'group' will be a column name in \code{data} and the
#'   'name' will be one of the levels within a column of \code{data}. Since a given name may be
#'   present in different columns, you can specify both a group and a name to be more explicit.
#' @param   width,height   The initial size of the visualization
#' @param   elementId   Identifier for the HTML element into which the visualization will be added.
#'
#' @export

sunburst = function(data,
                    steps,
                    palette = NULL,
                    color_overrides = NULL,
                    width = NULL,
                    height = NULL,
                    elementId = NULL) {
  if (!all(steps %in% colnames(data)) || any(duplicated(steps))) {
    stop("steps should be unique and be a subset of colnames(data)")
  }

  x = list(
    data = data[steps],
    steps = steps
  )

  if (!is.null(palette)) {
    x$palette = gplots::col2hex(palette)
  }
  if (!is.null(color_overrides)) {
    x$colorOverrides = encode_color_overrides(color_overrides)
  }

  # Ensure that javascript receives:
  # - a row-oriented view of 'data'
  # - where length-1 vectors (e.g., a single value for 'steps') haven't been converted to scalars

  # nolint start: object_name_linter.
  attr(x, "TOJSON_ARGS") = list(
    # nolint end
    dataframe = "rows",
    auto_unbox = FALSE
  )

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

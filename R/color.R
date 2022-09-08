#' Ensure color-override definitions contain hex-coded color strings
#'
#' @param   x   list of lists. Each entry must have a `color` entry, and may have a `name` or
#'   `group` entry. The `color` may be a named R color, an \code{rgb()} value or a hex string.
#' @return   A list of lists. The output will be identical to the input, except that any `color`
#'   entry will have been converted to a hex string.

encode_color_overrides = function(x) {
  convert_color = function(z) {
    z$color = gplots::col2hex(z$color)
    z
  }
  Map(convert_color, x)
}

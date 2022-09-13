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

#' Converts the string `"rgb(10, 20, 30)"` to a hexstring for the corresponding color
#'
#' When colors are sent from JavaScript to R, they are received as strings of the form
#' `"rgb(x, y, z)"`, rather than as calls to the R \code{rgb()} function. Hence the need to parse a
#' color string that can be used within R.
#'
#' @param   x   Character vector. The contents of this vector must be of the form
#'   \code{"rgb(0, 100, 255)"}.
#' @return   A character vector of the same length as \code{x}. Containing hexstrings that define
#'   the same colors.

parse_js_colors = function(x) {
  if (is.null(x) || length(x) == 0) {
    return(character(0))
  }

  regex = r"(rgb\(([[:digit:]]+), ([[:digit:]]+), ([[:digit:]]+)\))"
  stopifnot(all(stringr::str_detect(x, regex)))

  matches = stringr::str_match(x, regex)
  rgb_values = matches[, 2:4, drop = FALSE]
  class(rgb_values) = "numeric"

  rgb(rgb_values[, 1], rgb_values[, 2], rgb_values[, 3], maxColorValue = 255)
}

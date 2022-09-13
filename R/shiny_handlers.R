#' Get the shiny input-handler code for use on the JS side of a shiny app
#'
#' @param   inputId   the shiny input ID into which any event-driven data will be injected.
#' @param   type   the type of data that is to be extracted from the Sunburst widget. Choices are:
#'
#' * "path_data" - extracts a data.frame of "group", "name", "value" and "percentage" values
#' associated with a sunburst path.
#' * "set_to_null" - sets the value of \code{input[[inputId]]} to NULL.
#'
#' @return a \code{JS_EVAL} object that can be used as the mouseover_handler or mouseout_handler in
#'   the sunburst() function.
#' @export

get_shiny_input_handler = function(inputId, type = c("path_data", "set_to_null")) {
  type = match.arg(type)

  handler_code = list(
    path_data = paste0(
      "function(event, data, pathArray) {",
      "  Shiny.setInputValue('", inputId, ":utVizSunburst.pathConverter', pathArray);",
      "}"
    ),
    set_to_null = paste0(
      "function(event, data, pathArray) {",
      "  Shiny.setInputValue('", inputId, "', null);",
      "}"
    )
  )

  htmlwidgets::JS(handler_code[[type]])
}

#' Convert the data derived from a path on a sunburst sector to a data.frame.
#'
#' @param   x   The data obtained from the JavaScript Sunburst visualization for a moused-over path.
#'   This should already have been transformed with \code{jsonlite::fromJSON} and be a list of
#'   lists.
#' @param   session,inputname   shiny session and input-name for the element.  Not used.
#'
#' @return   A data.frame with columns 'group', 'name', 'value' and 'percentage'. This contains a
#'   row for each ring of the Sunburst diagram (up to the ring that the mouse is hovering over).

convert_path_data = function(x, session, inputname) {
  rlang::check_installed("purrr")

  df = purrr::map_dfr(x, as.data.frame)
  df[c("group", "name", "value", "percentage")]
}

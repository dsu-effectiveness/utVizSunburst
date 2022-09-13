.onLoad = function(libname, pkgname) {
  # nolint start: commented_code_linter.
  #
  # Use this handler to convert data from Sunburst mouse-over events to a data.frame
  # For example, by creating a mouseover_handler argument for the sunburst() function.
  # `htmlwidgets::JS(r"(function(event, data, pathArray){
  #   Shiny.setInputValue("my_input_element:utVizSunburst.pathConverter", pathArray)
  # })")`
  #
  # nolint end
  shiny::registerInputHandler("utVizSunburst.pathConverter", convert_path_data, force = TRUE)
}

data(admissions, package = "utVizSunburst")

mouseover_handler = get_shiny_input_handler(inputId = "sunburst_sector_data", type = "path_data")

server = function(input, output, session) {
  steps = reactive({
    c("college", "student_type", "outcome")
  })

  sunburst_object = reactive({
    sunburst(
      admissions,
      steps = steps(),
      palette = "black",
      mouseover_handler = mouseover_handler,
      height = "100%",
      width = "100%"
    )
  })

  output$my_sunburst = renderSunburst(
    sunburst_object()
  )

  # Note that input$sunburst_sector_data is defined in the mouseover_handler not in the ui.R
  sector_data = eventReactive(input$sunburst_sector_data, {
    input$sunburst_sector_data
  })

  output$sector_data = renderTable({
    sector_data()
  })
}

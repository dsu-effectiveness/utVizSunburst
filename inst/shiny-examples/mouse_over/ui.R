library("shiny")

sidebar = function() {
  sidebarPanel(
    h2("Mouse-over a sector of the sunburst chart to see the raw data")
  )
}

main_body = function() {
  mainPanel(
    sunburstOutput("my_sunburst"),
    tableOutput("sector_data")
  )
}

ui = fluidPage(
  titlePanel("Using Sunburst charts inside a shiny app"),
  sidebarLayout(
    sidebar(),
    main_body()
  )
)

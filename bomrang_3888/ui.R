shinyUI(fluidPage(
    titlePanel("Weather"),
    sidebarLayout(
        sidebarPanel(
            shiny::textInput(inputId = "location",
                             label = "Put a location here!",
                             value = "Sydney airport")
        ),
        mainPanel(
            shiny::plotOutput(outputId = "wind_plot"),
            shiny::plotOutput(outputId = "temp_plot")
        )
    )
))

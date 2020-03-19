shinyUI(fluidPage(
    titlePanel("Weather"),
    sidebarLayout(
        sidebarPanel(
            shiny::textInput(inputId = "location",
                             label = "Put a location here!",
                             value = "Sydney airport"),
            actionButton(inputId = "button",
                         label = "Fetch data and plot")
        ),
        mainPanel(
            shiny::plotOutput(outputId = "wind_plot"),
            shiny::plotOutput(outputId = "temp_plot")
        )
    )
))

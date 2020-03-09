shinyUI(fluidPage(
    titlePanel("Weather"),
    sidebarLayout(
        sidebarPanel(
            shiny::textInput(inputId = "location",
                             label = "Put a location here!",
                             value = "Hobart")
        ),
        mainPanel(
            shiny::plotOutput("temp_plot"),
            shiny::plotOutput("wind_plot")
        )
    )
))

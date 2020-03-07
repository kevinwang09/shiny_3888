shinyUI(fluidPage(

    # Application title
    titlePanel("Cats and dogs"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            # Input: Select a file ----
            textInput(inputId = "url", 
                      label = "Enter URL")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DT::dataTableOutput(outputId = "pred_table")
        )
    )
))

library(shiny)
library(bomrang)
library(tidyverse)

shinyServer(function(input, output) {
    output$temp_plot = renderPlot({
        weather = get_current_weather(input$location)
        
        weather %>% 
            ggplot(aes(x = local_date_time_full,
                       y = apparent_t)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Apparent Temp (Celcius)")
    })
})

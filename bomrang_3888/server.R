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
    
    output$wind_plot = renderPlot({
        melbourne_weather = get_current_weather("Melbourne")
        
        melbourne_weather %>% 
            ggplot(aes(x = local_date_time_full,
                       y = wind_spd_kmh)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Wind (km/h)")
    })
})

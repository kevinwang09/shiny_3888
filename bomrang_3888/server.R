library(shiny)
library(bomrang)
library(tidyverse)
library(forecast)

shinyServer(function(input, output) {
    
    fetch_data = reactive({
        weather = get_current_weather(input$location)
        return(weather)
    })
    
    output$temp_plot = renderPlot({
        fetch_data() %>% 
            ggplot(aes(x = local_date_time_full,
                       y = apparent_t)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Apparent Temp (Celcius)")
    })
    
    output$wind_plot = renderPlot({
        fetch_data() %>% 
            ggplot(aes(x = local_date_time_full,
                       y = wind_spd_kmh)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Wind (km/h)")
    })
    
    output$ccf_plot = renderPlot({
        ggCcf(fetch_data()$wind_spd_kmh, fetch_data()$apparent_t)
    })
})

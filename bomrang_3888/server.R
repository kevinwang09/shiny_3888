library(shiny)
library(bomrang)
library(tidyverse)
library(forecast)

shinyServer(function(input, output) {
    
    # fetch_data = reactive({
    #     weather = get_current_weather(input$location)
    #     return(weather)
    # })
    
    fetch_data = eventReactive(input$button, {
        # validate(
        #     need(input$location, 'Choose a location!')
        # )
        weather = get_current_weather(input$location)
        return(weather)
    })
    
    obs = observe({
        print(
            paste0(input$location, " is fun!")
        )
    })
    
    output$wind_plot = renderPlot({
        fetch_data() %>% 
            ggplot(aes(x = local_date_time_full,
                       y = wind_spd_kmh)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Wind (km/h)")
    })
    
    output$temp_plot = renderPlot({
        fetch_data() %>% 
            ggplot(aes(x = local_date_time_full,
                       y = apparent_t)) +
            geom_path() +
            labs(x = "Time", 
                 y = "Apparent Temp (Celcius)")
    })
    
})

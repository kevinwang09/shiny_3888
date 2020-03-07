shinyServer(function(input, output) {
    output$pred_table = renderDataTable(
        pred_cats_dogs(model = model, file_name = paste0(getwd(), "tmp.jpg"))
    )
})

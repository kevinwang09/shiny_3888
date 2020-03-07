shinyServer(function(input, output) {
    tmp_file = shiny::reactive({
        download.file("https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3.jpg",
                      destfile = paste0(getwd(), "tmp.jpg"))
        paste0(getwd(), "tmp.jpg")
    })
    
    output$pred_table = renderDataTable(
        pred_cats_dogs(model = model, file_name = tmp_file())
    )
})

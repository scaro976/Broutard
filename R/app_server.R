#' @import shiny
#' @import rhandsontable
app_server <- function(input, output,session) {

  nalim <- reactive({input$n_alim})
  nphase <- reactive({input$n_phase})

  output$tableAlim <- rhandsontable_alim(nalim)

  output$tableGmq <- rhandsontable_GMQ(nalim,nphase)

  output$tablePhases <- rhandsontable_phase(nphase)

  output$tableViande <- rhandsontable_viande(nphase)

  tablePhases <- reactive({
    hot_to_r(input$tablePhases)
  })

  tableGMQ <- reactive({
    hot_to_r(input$tableGmq)
  })

  tableAlim <- reactive({
    hot_to_r(input$tableAlim)
  })

  tableViande <- reactive({
    hot_to_r(input$tableViande)
  })


  output$regime1 <- renderUI({
    regimUI("regim_1",nalim,nphase)
  })

  output$regime2 <- renderUI({
    regimUI("regim_2",nalim,nphase)
  })

  data_regime1 <- reactive({callModule(regim,"regim_1",nphase)})

  data_regime2 <- reactive({callModule(regim,"regim_2",nphase)})

  tableCroissance1 <- reactive({
    dataframe_croissance(njour=input$JC,tableGMQ(),tablePhases(),input$PI, data_regime1()$alim(), data_regime1()$qte(),tableAlim(), tableViande())
  })

  output$tableCroiss1 <- renderDataTable({
    tableCroissance1()
  })

  tableCroissance2 <- reactive({
    dataframe_croissance(njour=input$JC,tableGMQ(),tablePhases(),input$PI, data_regime2()$alim(), data_regime2()$qte(),tableAlim(), tableViande())
  })

  output$tableCroiss2 <- renderDataTable({
    tableCroissance2()
  })

  output$plot1 <- renderPlot({
    plotRegime(tableCroissance1())
  })

  output$plot2 <- renderPlot({
    plotRegime(tableCroissance2())
  })


  output$comparaison <- renderPlot({
    plot_compare(tableCroissance1(),tableCroissance2())
  })


}

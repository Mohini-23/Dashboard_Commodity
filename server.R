# Server
server = function(input, output, session) {
  
  #Structure
  output$structure = renderPrint(
    #structure
    data %>% 
      str()
  )
  #Summary
  output$summary = renderPrint(
    #Summary
    data %>% 
      summary()
    
  )
  #Data Table
  output$dataT = renderDataTable({
    datatable(data, options = list(scrollX = TRUE))
  })
  #stacked Histogram
  output$histplot = renderPlotly({# Histogram
    histogram <- data %>% 
      plot_ly() %>% 
      add_histogram(~get(input$var1)) %>% 
      layout(xaxis = list(title = input$var1))
    
    # Boxplot
    boxplot <- data %>% 
      plot_ly() %>% 
      add_boxplot(~get(input$var1)) %>% 
      layout(yaxis = list(showticklables = F))
    
    # Stacking plots using subplot
    subplot_list <- list(boxplot, histogram)  # Make sure to use a list
    
    # Create subplot
    subplot <- subplot(subplot_list, nrows = 2, shareX = TRUE) %>% 
      hide_legend() %>% 
      layout("Distribution Chart - Histogram and Boxplot",
             yaxis = list(title = "Frequency"))
    
  })
  output$bar <- renderPlotly({
    data %>% 
      plot_ly() %>% 
      add_bars(x=~State, y=~get(input$var1)) %>% 
      layout(title = paste("Commodity wise Export Data for", input$var1),
             xaxis = list(title = "COMMODITY"),
             yaxis = list(title = paste(input$var1, "Export Data") ))
  })
  output$CR = renderPrint( summary(model_Commodity_Data))
  output$CCS = renderPrint( summary(model_CCS))
  output$CON = renderPrint( summary(model_CON))
  output$PAR = renderPrint( summary(model_PAR))
  output$PCS = renderPrint( summary(model_PCS))
  output$PCV = renderPrint( summary(model_PCV))
}

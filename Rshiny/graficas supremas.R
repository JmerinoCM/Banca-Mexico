
  ########################### Grafica bubble brecha de genero ##################################
  
  output$gr_bubble_estatal <-renderHighchart({
  
    base_bubble <- base_BUBBLE_estatal %>% 
                   filter(info_year      ==input$year_estatal) %>% 
                   filter(info_trimestre ==input$trim_estatal) %>% 
                   filter(info_estado  %in%input$estado_estatal) %>%
                   # filter(info_region  %in%input$region_estatal) %>%
                   filter(variable %in% input$variable_estatal) %>% # | variable %in% input$variable_estatal_2 | )
                  filter(etiqueta %in% input$etiqueta_estatal)
    
    uwu <-  base_bubble %>%
         hchart("packedbubble", hcaes(value=value,name=variable,group=info_estado,color=etiqueta),
                   dataLabels = list(
                     enabled = TRUE,
                     format = paste('{point.name} <br> {point.etiqueta}'),
 
                     style = list(
                       textOutline = "none",
                       #$color = "#000000",
                       fontWeight = "normal"
                     )
                   )
                   ) %>% 
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = "") %>%
      hc_legend(align = "left") %>%
      hc_plotOptions(
        packedbubble = list(
          minSize = '5px',
          maxSize = '90px',
          layoutAlgorithm = list(
            gravitationalConstant =  0.05,
            bubblePadding = 10,
            splitSeries = TRUE,
            seriesInteraction = FALSE,
            dragBetweenSeries = FALSE,
            maxIterations = 500
          )
        )
      )%>%
      hc_tooltip(
        useHTML = TRUE,
        borderWidth = 2, 
        headerFormat = "<b>{point.key}</b>",
        pointFormat = paste0( "<br>", "<b>{point.variable}</b>", "<br>", "<b>{point.etiqueta}</b>", "<br>", "<b>Valor:</b> {point.value}")

      )  %>%
      hc_caption(
        text = "Fuente: Comisión Nacional Bancaria y de Valores") %>%
      hc_exporting(enabled = TRUE)
    uwu
    
  })
  
  
  ########################### Grafica bubble uso, tenencia e infraestructura ##################################
  
  
  output$gr_bubble_estatal_1 <-renderHighchart({
    
    base_bubble <- base_BUBBLE_estatal_1 %>% 
      filter(info_year      ==input$year_estatal_1) %>% 
      filter(info_trimestre ==input$trim_estatal_1) %>% 
      filter(info_estado  %in%input$estado_estatal_1) %>%
      filter(variable %in% input$variable_estatal_1) %>% 
      filter(etiqueta %in% input$etiqueta_estatal_1) 
    
    uwu <-  base_bubble %>%
      hchart("packedbubble", hcaes(value=value,name=variable,group=info_estado,color=etiqueta),
             dataLabels = list(
               enabled = TRUE,
               format = paste('{point.name} <br> {point.etiqueta}'),
            
               style = list(
                 textOutline = "none",
                
                 fontWeight = "normal"
               )
             )
      ) %>% 
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = "") %>%
      hc_legend(align = "left") %>%
      hc_plotOptions(
        packedbubble = list(
          minSize = '5px',
          maxSize = '90px',
          layoutAlgorithm = list(
            gravitationalConstant =  0.05,
            bubblePadding = 10,
            splitSeries = TRUE,
            seriesInteraction = FALSE,
            dragBetweenSeries = FALSE,
            maxIterations = 500
          )
        )
      )%>%
      hc_tooltip(
        useHTML = TRUE,
        borderWidth = 2, 
        headerFormat = "<b>{point.key}</b>",
        pointFormat = paste0( "<br>", "<b>{point.variable}</b>", "<br>", "<b>{point.etiqueta}</b>", "<br>", "<b>Valor:</b> {point.value}")
       
      )  %>%
      hc_caption(
        text = "Fuente: Comisión Nacional Bancaria y de Valores") %>%
      hc_exporting(enabled = TRUE)
    uwu
    
  })
  
  
  


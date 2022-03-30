
  output$TconsumC_pie<-renderHighchart({
    
    TconsumC <- inclusioncredito %>% filter(Year==input$picker_year_1c) %>% filter(dia==input$picker_day_1c) %>% filter(mes==input$picker_month_1c) %>% filter(Tarjeta%in%input$picker_tarj_1c) 
    
    lista=c(input$picker_rubros_1c)
    
    
    TconsumC2 <-  TconsumC %>%  filter(Rubros%in%lista)
    TconsumC2$Monto <- as.numeric( TconsumC2$Monto)
    TconsumC2$Rubros <- as.character( TconsumC2$Rubros) 
    
    ######################################             pie             ######################################
    
    owo <- hchart(TconsumC2,"pie",hcaes(x=Rubros,y=Monto, group = Fecha)) %>%
      hc_title(
        text =  paste("<b>","Consumo en tarjetas de ",unique(TconsumC2$Tarjeta),"</b>", collapse="y ","<br>")
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_tooltip(crosshairs = FALSE, borderWidth = 2, sort = TRUE, shared = TRUE, table = TRUE,
                 pointFormat = paste('<br> <b>Porcentaje: </b> {point.percentage:.1f}% <br> <b>Pesos mexicanos:</b> {point.Monto}',"<br>","<b>Fecha :</b> {point.Fecha}","<br>","<b>Tarjeta :</b> {point.Tarjeta}")
      ) %>%
      hc_add_theme(
        hc_evangelion()
      )%>% 
      hc_plotOptions(pie = list(marker = list(enabled = TRUE))
      )%>% 
      hc_caption(
        text = "Fuente: Banco de México")
  
    owo
    })
  
  #########################################stream######################################
  
  output$streamgraph_TconsumC <- renderHighchart({
    
    TconsumC <- inclusioncredito 
    
    lista=c(input$picker_rubros_1c)
    
    
    TconsumC3 <-  TconsumC %>%  filter(Rubros%in%lista) %>%
                                filter(Year>=input$slider2D_6c[1] & Year<=input$slider2D_6c[2]) %>% filter(dia%in%input$picker_day_6c) %>% filter(mes%in%input$picker_month_6c) %>% filter(Tarjeta%in%input$picker_tarj_1c) 
    
    TconsumC3$Monto  <- as.numeric(  TconsumC3$Monto) 
    TconsumC3$Rubros <- as.character(TconsumC3$Rubros)
    TconsumC3$Year   <- as.numeric(  TconsumC3$Year) 
    
    unu <- hchart(TconsumC3, "streamgraph", hcaes(x = Fecha, y = Monto, group = Rubros)) %>% 
      
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = paste("<b>","Consumo en tarjetas de ",unique(TconsumC3$Tarjeta),"</b>", collapse="y ","<br>")) %>%
      hc_legend(align = "left") %>%
      hc_yAxis_multiples(
        list(
          title = list(style = list(color = 'transparent')),
          labels = list(style = list(color = 'transparent')),
          gridLineDashStyle = 'transparent',
          gridLineWidth = 1,
          gridLineColor = 'transparent',
          lineColor = 'transparent',
          minorGridLineColor = 'transparent',
          tickColor = 'transparent',
          tickWidth = 2
        )
      )%>%
      hc_tooltip( useHTML = TRUE,crosshairs = TRUE, borderWidth = 2, sort = TRUE, shared = FALSE, table = FALSE,
                 pointFormat = paste('<br> {point.Rubros} <br> <b>Pesos mexicanos:</b> {point.Monto}',"<br>","<b>Tarjeta :</b> {point.Tarjeta}")
      )%>%
      hc_plotOptions(
        line =  list(stacking = "stream",marker = list(enabled = FALSE))
      ) %>% 
      hc_caption(
        text = "Fuente:Banco de México") %>%
      hc_exporting(enabled = TRUE) 
    
    unu
  })
  
  #########################################spline######################################
  
  
  output$line_TconsumC <- renderHighchart({
    
    TconsumC <- inclusioncredito 
    
    lista=c(input$picker_rubros_1c)
    
    
    TconsumC3 <-  TconsumC %>%  filter(Rubros%in%lista) %>%
      filter(Year>=input$slider2D_1c[1] & Year<=input$slider2D_1c[2]) %>% filter(dia%in%input$picker_day_2c) %>% filter(mes%in%input$picker_month_2c) %>% filter(Tarjeta%in%input$picker_tarj_1c) 
    
    TconsumC3$Monto  <- as.numeric(  TconsumC3$Monto) 
    TconsumC3$Rubros <- as.character(TconsumC3$Rubros)
    TconsumC3$Year   <- as.numeric(  TconsumC3$Year) 
    
    unu <- hchart(TconsumC3, "spline", hcaes(x = Fecha, y = Monto, group = Rubros)) %>% 
      
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = paste("<b>","Consumo en tarjetas de ",unique(TconsumC3$Tarjeta),"</b>", collapse="y ","<br>")) %>%
      hc_legend(align = "left") %>%
      hc_yAxis_multiples(
        list(title = list(text = "Pesos Mexicanos"))
      )%>%
      hc_tooltip(crosshairs = TRUE, borderWidth = 2, sort = TRUE, shared = FALSE, table = FALSE,
                 pointFormat = paste('<br> {point.Rubros} <br> <b>Pesos mexicanos:</b> {point.Monto}',"<br>","<b>Tarjeta :</b> {point.Tarjeta}")
      )%>%
      hc_plotOptions(
        line =  list(stacking = "normal",marker = list(enabled = FALSE))
      ) %>% 
      hc_caption(
        text = "Fuente:Banco de México") %>%
      hc_exporting(enabled = TRUE)
    
    unu
  })
  
#########################################barras######################################
  
  
  output$TconsumC_bar<-renderHighchart({
    
    
    lista=c(input$picker_rubros_1c)
    lista2=c(input$picker_year_1c_b)
    
    TconsumC_1 <- inclusioncredito %>% filter(Year%in%lista2)%>%  filter(dia%in%input$picker_day_3c) %>% filter(mes%in%input$picker_month_3c) %>% filter(Tarjeta%in%input$picker_tarj_1c) 
    
    
    
    TconsumC4 <-  TconsumC_1 %>%  filter(Rubros%in%lista)
    TconsumC4$Monto <- as.numeric( TconsumC4$Monto)
    TconsumC4$Rubros <- as.character( TconsumC4$Rubros)
    TconsumC4$Year   <- as.numeric(  TconsumC4$Year) 
    
     
    uwu <-  hchart(TconsumC4, "column", hcaes(x = Fecha, y = Monto, group = Rubros) ) %>% 
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = paste("<b>","Consumo en tarjetas de ",unique(TconsumC4$Tarjeta),"</b>", collapse="y ","<br>")) %>%
      hc_legend(align = "left") %>%
      hc_tooltip(crosshairs = TRUE, borderWidth = 2, sort = TRUE, shared = FALSE, table = FALSE,
                 pointFormat = paste('<br> {point.Rubros} <br> <b>Pesos mexicanos:</b> {point.Monto}',"<br>","<b>Tarjeta :</b> {point.Tarjeta}")
      )%>%
      hc_plotOptions(
        line = list(marker = list(enabled = FALSE))
      ) %>% 
      hc_yAxis_multiples(
        list(title = list(text = "Pesos Mexicanos"))
      )%>%
      hc_caption(
        text = "Fuente: Banco de México ") %>%
      hc_exporting(enabled = TRUE)
    uwu
  })
  
#########################################treemap######################################
  
  
  output$TconsumC_treemap<-renderHighchart({
    
    
    lista=c(input$picker_rubros_1c)
    lista2=c(input$picker_year_8c_b)
    
    TconsumC_1 <- inclusioncredito %>% filter(Year%in%lista2)%>%  filter(dia%in%input$picker_day_8c) %>% filter(mes%in%input$picker_month_8c) %>% filter(Tarjeta%in%input$picker_tarj_1c) 
    
    
    
    TconsumC4 <-  TconsumC_1 %>%  filter(Rubros%in%lista)
    TconsumC4$Monto <- as.numeric( TconsumC4$Monto)
    TconsumC4$Rubros <- as.character( TconsumC4$Rubros)
    TconsumC4$Year   <- as.numeric(  TconsumC4$Year) 
    
    
    uwu <-  hchart(TconsumC4, "treemap", hcaes(color = Monto, value = Monto, name = Rubros) ) %>% 
      hc_colorAxis(stops = color_stops(colors = viridis::plasma(10))) %>%
      hc_add_theme(hc_evangelion()) %>%
      hc_title(text = paste("<b>","Consumo en tarjetas de ",unique(TconsumC4$Tarjeta),"</b>", collapse="y ","<br>")) %>%
      hc_legend(align = "left") %>%
      hc_tooltip(crosshairs = F, borderWidth = 2, sort = TRUE, shared = FALSE, table = FALSE,
                 pointFormat = paste('<br> {point.Rubros} <br> <b>Pesos mexicanos:</b> {point.Monto}',"<br>","<b>Tarjeta :</b> {point.Tarjeta}")
      )%>%
      hc_plotOptions(
        line = list(marker = list(enabled = FALSE)),column = list(stacking = "normal")
      ) %>% 
      hc_yAxis_multiples(
        list(title = list(text = "Pesos Mexicanos"))
      )%>%
      hc_caption(
        text = "Fuente: Banco de México ") %>%
      hc_exporting(enabled = TRUE)
    uwu
  })
  
 
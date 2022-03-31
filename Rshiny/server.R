## Servidor
 
server <- function(input, output, session) { 
  
  hc_evangelion <- function(...) {
    theme <-
      hc_theme(colors = c("#9474c1", "#46bd4f", "#d94424", "#dddfe7", "#55a2b6", 
                          "#c71647", "#5e8ea4", "#955cab", "#55a2b6", "#ac3c64",
                          "#2b44a6", "#c23d64", "#28a690", "#5c526f", "#e0ca77",
                          "#ee974a", "#386fce", "#265352", "#d43d29", "#4c545b"), 
               chart = list(
                 backgroundColor = 'transparent',
                 style = list(
                   fontFamily = "Inconsolata",
                   font = '15pt "Inconsolata", Verdana, sans-serif',
                   color = "#3e5f8a" 
                 )
               ),
               title = list(
                 style = list(
                   color = "#3e5f8a"
                 ),
                 align = "left"
               ),
               subtitle = list(
                 style = list(
                   color = "#3e5f8a"
                 ),
                 align = "left"
               ),
               legend = list(
                 labels = list(style = list(color = "#3e5f8a")),
                 align = "right",
                 verticalAlign = "bottom",
                 itemStyle = list(
                   fontWeight = "normal",
                   fontSize =
                     "15px",
                   color = "#3e5f8a",
                   tickWidth = 100
                 )
               ),
               yrcy = list(
                 align = "right",
                 verticalAlign = "bottom",
                 itemStyle = list(
                   fontWeight = "normal",
                   fontSize = "20px",
                   color = "#efb810"
                 )
               )
               ,
               xAxis = list(
                 title = list(style = list(color = "#3e5f8a")),
                 labels = list(style = list(color = "#3e5f8a")),
                 gridLineDashStyle = "Dot",
                 gridLineWidth = 1,
                 gridLineColor = 'transparent',
                 lineColor = "#efb810",
                 minorGridLineColor = "#efb810",
                 tickColor = "#efb810",
                 tickWidth = 2),
               
               yAxis = list(
                 title = list(style = list(color = "#3e5f8a")),
                 labels = list(style = list(color = "#3e5f8a")),
                 gridLineDashStyle = "Dot",
                 gridLineWidth = 1,
                 gridLineColor = 'transparent',
                 lineColor = "#efb810",
                 minorGridLineColor = "#efb810",
                 tickColor = "#efb810",
                 tickWidth = 2
               ),
               caption = list(
                 style = list(
                   color = "#3e5f8a"
                 ),
                 align = "left"
               ),
               tooltip = list(
                 backgroundColor = 'rgba(0,0,0,.7)', 
                 style = list(
                   color = "#efb810",
                   fontSize = "15px"
                 )
               )
      )
    
    theme <- structure(theme, class = "hc_theme")
    
    if (length(list(...)) > 0) {
      theme <- hc_theme_merge(
        theme,
        hc_theme(...)
      )
    }
    
    theme
  }
  
  #Clusters#
  output$clusters_py<-renderHighchart({
    
    hc <- df_two %>% 
      hchart('scatter', hcaes(x = P1, y = P2, group = cluster)) %>%
      
      hc_yAxis(
        title = list(text = "P2")
      )%>%
      hc_xAxis(
        title = list(text = "P1")
      )%>%
      hc_title(
        text = "<b>Clusters Municipales</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  
  output$bar_bm<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = id_cbm.mean))%>%
      hc_yAxis(
        title = list(text = "Contratos")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Contratos promedio por cada 10,000 adultos de banca movil</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_bc<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = id_sbc.mean))%>%
      
      hc_yAxis(
        title = list(text = "Sucursales")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Sucursales promedio de banca comercial por cada 10,000 adultos</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_tpv<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = id_tpv.mean))%>%
      
      hc_yAxis(
        title = list(text = "TPV")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Terminales de punto de venta promedio por cada 10,000 adultos</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_e_tpv<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = id_e_tpv.mean))%>%
      
      hc_yAxis(
        title = list(text = "Establecimientos TPV")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Establecimientos con terminales de punto de venta promedio por cada 10,000 adultos</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_c_coaxial<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = c_coaxial.mean))%>%
      
      hc_yAxis(
        title = list(text = "Hogares")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Hogares con acceso a cable coaxial promedio</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_dsl<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = dsl.mean))%>%
      
      hc_yAxis(
        title = list(text = "Hogares")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Hogares con DSL promedio</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  output$bar_cred_w<-renderHighchart({
    
    hc <- clust_mean %>%
      hchart('column', hcaes(x = c, y = cred_w.mean))%>%
      
      hc_yAxis(
        title = list(text = "Créditos")
      )%>%
      hc_xAxis(
        title = list(text = "Cluster")
      )%>%
      hc_title(
        text = "<b>Créditos de bienestar promedio</b>"
      ) %>%
      hc_exporting(
        enabled=TRUE
      )%>%
      hc_add_theme(
        hc_evangelion()
      )
  })
  
  
  ############
  
  waiter_hide()


  source(file.path("graficas supremas.R"),  local = TRUE)$value
  
  
  source(file.path("101_con_cre.R"),  local = TRUE)$value
  
  
} 



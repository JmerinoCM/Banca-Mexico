
tagList( 
  useShinyjs(),  
  introjsUI(),   
  #Pantalla de carga ########
  useWaiter(), 
  waiterShowOnLoad(c(""), image = "https://i.pinimg.com/originals/0c/bf/2f/0cbf2f5c3fb37d033c0bc791ae196dbb.gif"), #,color = "#101010"),
  use_waiter(),
  
  ###################################################################
  navbarPage(id = "intabset",
             theme = bslib::bs_theme(version = 4, bootswatch = "sketchy", #"journal"
                                                     height=5,
                                                   bg = "#060d1e", #"#fffff2"
                                                   fg = "#FFFFFF" , #"#101010"
                                                   primary = "#efb810", #efb810
                                                     # bg = "#b3d087", #"#fffff2"
                                                     # fg = "#101010" , #"#101010"
                                                     # primary = "#efb810", #efb810
                                                     #secondary ="#c5d66f", #efb810
                                                     base_font = font_google("Prompt"),
                                                     code_font = font_google("JetBrains Mono"),
  ), 
          windowTitle = "Desafío Data México Terdashianos", 
           collapsible = TRUE, 
           header =
     
            tags$head(style = "position: relative", 
            tags$link(rel="shortcut icon", href="ghibli.ico"), 
            ),

    setBackgroundColor(
      color = c("#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",
                "#101010","#101010","#101010","#101010","#101010","#101010","#101010",

                "#efb810"),
      gradient = c("radial"),
      direction = "bottom"
    ),
  
  tabPanel( "Presentación",
            h1("Cambios en el uso e infraestructura bancaria y uso de banca movil", align = "center"),
            h2(HTML('<center><img src="dm.png" width="100"></center>')),
            h3("Aplicación web", align = "center"),
            
            br(""),
         h1("Equipo: Terdashians", align = "center"),
            br(""),
            h3("", align = "center"), 
            br(""),
            br(""),
            fluidRow(
              
              bs4Dash::box(h4(strong("Adrián Hernandez Noli"),align="center"),width = 4,
                           
                           br(),
                           a("adrian.noli@outlook.es", href = "mailto:adrian.noli@outlook.es"),align="center"),
              bs4Dash::box(h4(strong("Juan José Merino Zarco"),align="center"),width = 4,
                           
                           br(),
                           a("jmerino@colmex.mx", href = "mailto:jmerino@colmex.mx"), align="center"),
              
            ),
            
            br(""),
            h5(strong("Gracias"),align = "center"),
            
            chooseSliderSkin(skin= "Big"),
            setShadow(class = "dropdown-menu") ,
            setShadow(class = "highchart"),
            setShadow(class = "leaflet"),
            spsGoTop("up", right = "01%",  bottom= "01%", icon = icon("arrow-up"), color = "green")
            
      
            

  ),
  tabPanel("Consumo en Tarjetas",
            
            tabsetPanel(

            tabPanel("Consumo en Tarjetas",
                     fluidPage(

                       h1("Consumo en Tarjetas", align = 'center'),
                       br(""),  spsGoTop("up", right = "01%",  bottom= "01%", icon = icon("arrow-up"), color = "green"), #comando flecha que redirecciona hacia arriba
                       
                       
                       bs4Dash::box(title = "Montos operados a través de las tarjetas por:",closable = FALSE,collapsible = FALSE, 
                      
                       fluidRow(
                         
                         column(
                           pickerInput("picker_rubros_1c", "Rubros", choices=c(unique(inclusioncredito$Rubros)), selected = (unique(inclusioncredito$Rubros))[c(1:4)],
                                       options = list(`actions-box` = TRUE),multiple = TRUE), width=6
                         ),
                         column(
                           pickerInput("picker_tarj_1c", "Tipo de Tarjeta", choices=c(unique(inclusioncredito$Tarjeta)), selected = (unique(inclusioncredito$Tarjeta))[c(1)],
                                       options = list(`actions-box` = TRUE),multiple = F), width=6
                         )
                       ),width=12),
                       
                       br(""),
                       
                       fluidRow(
                         column(
                           bs4Dash::box(title = "Periodo",closable = FALSE,collapsible = FALSE, 
                                        fluidRow(
                                          column(
                                            sliderInput("slider2D_6c", label = "Rango años", sep="" , min = head((unique(inclusioncredito$Year)), n=1),
                                                        max = tail((unique(inclusioncredito$Year)), n=1), value = c(2019, 2021),step = 1,
                                                        animate =
                                                          animationOptions(interval = 300, loop = TRUE)), width=4),
                                          column(
                                            pickerInput("picker_month_6c", "Mes", choices=c(unique(inclusioncredito$mes)), selected = head((unique(inclusioncredito$mes)), n=1),
                                                        options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                          ),
                                          column(
                                            pickerInput("picker_day_6c", "Día", choices=c(unique(inclusioncredito$dia)), selected = head((unique(inclusioncredito$dia)), n=1),
                                                        options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                          )
                                        ),width=12),width=6),
                         
                         column(
                           fluidRow(highchartOutput("streamgraph_TconsumC")), width=6
                         )
                       ),
                      fluidRow(
                        column(
                       bs4Dash::box(title = "Periodo",closable = FALSE,collapsible = FALSE, 
                       fluidRow(
                         column(
                           sliderInput("slider2D_1c", label = "Rango años", sep="" , min = head((unique(inclusioncredito$Year)), n=1),
                                       max = tail((unique(inclusioncredito$Year)), n=1), value = c(2019, 2021),step = 1,
                                       animate =
                                         animationOptions(interval = 300, loop = TRUE)), width=4),
                         column(
                           pickerInput("picker_month_2c", "Mes", choices=c(unique(inclusioncredito$mes)), selected = head((unique(inclusioncredito$mes)), n=1),
                                       options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                         ),
                         column(
                           pickerInput("picker_day_2c", "Día", choices=c(unique(inclusioncredito$dia)), selected = head((unique(inclusioncredito$dia)), n=1),
                                       options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                         )
                       ),width=12),width=6),
                      
                         column(
                           fluidRow(highchartOutput("line_TconsumC")), width=6
                       )
                      ),
                      
                       br(""),
                       
                       fluidRow(
                      column(
                      bs4Dash::box(title = "Periodo",closable = FALSE,collapsible = FALSE,
                       fluidRow(

                         column(
                           pickerInput("picker_year_1c", "Año", choices=c(unique(inclusioncredito$Year)), selected = tail((unique(inclusioncredito$Year)), n=1),
                                       options = list(`actions-box` = FALSE),multiple = FALSE), width=4
                         ),
                         column(
                           pickerInput("picker_month_1c", "Mes", choices=c(unique(inclusioncredito$mes)), selected = head((unique(inclusioncredito$mes)), n=1),
                                       options = list(`actions-box` = FALSE),multiple = FALSE), width=4
                         ),
                         column(
                           pickerInput("picker_day_1c", "Día", choices=c(unique(inclusioncredito$dia)), selected = head((unique(inclusioncredito$dia)), n=1),
                                       options = list(`actions-box` = FALSE),multiple = FALSE), width=4
                         )


                       ),width=12),

                      width=6),


                      column(
                        fluidRow(highchartOutput("TconsumC_pie")),
                      width=6
                       )
                     ),

                     br(""),
                     br(""),
                     

                     fluidRow(
                       column(
                         bs4Dash::box(title = "Periodo",closable = FALSE,collapsible = FALSE,
                                      fluidRow(
                                        column(
                                          pickerInput("picker_year_1c_b", "Year", choices=c(unique(inclusioncredito$Year)), selected = tail((unique(inclusioncredito$Year)), n=1),
                                                      options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                        ),
                                        column(
                                          pickerInput("picker_month_3c", "Mes", choices=c(unique(inclusioncredito$mes)), selected = head((unique(inclusioncredito$mes)), n=1),
                                                      options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                        ),
                                        column(
                                          pickerInput("picker_day_3c", "Día", choices=c(unique(inclusioncredito$dia)), selected = head((unique(inclusioncredito$dia)), n=1),
                                                      options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                        )
                                      ),width=12),width=6
                       ),


                           column(
                             fluidRow(highchartOutput("TconsumC_bar")), width=6
                           )

                     ),
                     br(""),
                     br(""),
                     
                     
                     fluidRow(
                       column(
                         bs4Dash::box(title = "Periodo",closable = FALSE,collapsible = FALSE,
                                      fluidRow(
                                        column(
                                          pickerInput("picker_year_8c_b", "Year", choices=c(unique(inclusioncredito$Year)), selected = tail((unique(inclusioncredito$Year)), n=1),
                                                      options = list(`actions-box` = F),multiple = F), width=4
                                        ),
                                        column(
                                          pickerInput("picker_month_8c", "Mes", choices=c(unique(inclusioncredito$mes)), selected = head((unique(inclusioncredito$mes)), n=1),
                                                      options = list(`actions-box` = F),multiple = F), width=4
                                        ),
                                        column(
                                          pickerInput("picker_day_8c", "Día", choices=c(unique(inclusioncredito$dia)), selected = head((unique(inclusioncredito$dia)), n=1),
                                                      options = list(`actions-box` = F),multiple = F), width=4
                                        )
                                      ),width=12),width=6
                       ),
                       
                       
                       column(
                         fluidRow(highchartOutput("TconsumC_treemap")), width=6
                       )
                       
                     )
                     
                     
                     
                     
                     )


            )


            )
            
  ), 
  tabPanel("Inclusión y Género",    
           
            fluidPage(
                        
                        h1("Brecha de Género:", align = 'center'),
                        br(""),  spsGoTop("up", right = "01%",  bottom= "01%", icon = icon("arrow-up"), color = "green"), #comando flecha que redirecciona hacia arriba
                        
                        fluidRow(
                        column(
                        bs4Dash::box(title = "",closable = FALSE,collapsible = FALSE, 
                                     
                                     fluidRow(
                                       
                                       column(
                                         pickerInput("estado_estatal", "Estados", choices=c(unique(base_BUBBLE_estatal$info_estado)), selected = (unique(base_BUBBLE_estatal$info_estado))[c(1:4)],
                                                     options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                       ),
                                       column(
                                         pickerInput("variable_estatal", "Variable", choices=c(unique(base_BUBBLE_estatal$variable)), selected = (unique(base_BUBBLE_estatal$variable))[c(1)],
                                                     options = list(`actions-box` = TRUE),multiple = T), width=4
                                       ),
                                       column(
                                         pickerInput("etiqueta_estatal", "Aspecto", choices=c(unique(base_BUBBLE_estatal$etiqueta)), selected = (unique(base_BUBBLE_estatal$etiqueta))[c(1)],
                                                     options = list(`actions-box` = TRUE),multiple = T), width=4
                                       )
                                     ),width=12),width=9
                        ),
                          column(
                            bs4Dash::box(title = "Periódo",closable = FALSE,collapsible = FALSE, 
                                         fluidRow(
                                           column(
                                             pickerInput("year_estatal", "Año", choices=c(unique(base_BUBBLE_estatal$info_year )), selected = head((unique(base_BUBBLE_estatal$info_year )), n=1),
                                                         options = list(`actions-box` = F),multiple = F), width=6
                                           ),
                                           column(
                                             pickerInput("trim_estatal", "Trimestre", choices=c(unique(base_BUBBLE_estatal$info_trimestre)), selected = head((unique(base_BUBBLE_estatal$info_trimestre)), n=1),
                                                         options = list(`actions-box` = F),multiple = F), width=6
                                           ),

                                         ),width=12),width=3),
                          
                        
                        ),
                        br(""),
                        fluidRow(highchartOutput("gr_bubble_estatal",height = "100vh", width = "180vh"), width=12 , height=10)
                      ) ,
           br(""),
           br(""),
           fluidPage(

             h1("Uso, Tenencia e Infraestructura", align = 'center'),
             br(""),

             fluidRow(
               column(
                 bs4Dash::box(title = "",closable = FALSE,collapsible = FALSE,

                              fluidRow(

                                column(
                                  pickerInput("estado_estatal_1", "Estados", choices=c(unique(base_BUBBLE_estatal_1$info_estado)), selected = (unique(base_BUBBLE_estatal_1$info_estado))[c(1:4)],
                                              options = list(`actions-box` = TRUE),multiple = TRUE), width=4
                                ),
                                column(
                                  pickerInput("variable_estatal_1", "Variable", choices=c(unique(base_BUBBLE_estatal_1$variable)), selected = (unique(base_BUBBLE_estatal_1$variable))[c(1)],
                                              options = list(`actions-box` = TRUE),multiple = T), width=4
                                ),
                                column(
                                  pickerInput("etiqueta_estatal_1", "Aspecto", choices=c(unique(base_BUBBLE_estatal_1$etiqueta)), selected = (unique(base_BUBBLE_estatal_1$etiqueta))[c(1)],
                                              options = list(`actions-box` = TRUE),multiple = T), width=4
                                )
                              ),width=12),width=8
               ),
               column(
                 bs4Dash::box(title = "Periódo",closable = FALSE,collapsible = FALSE,
                              fluidRow(
                                column(
                                  pickerInput("year_estatal_1", "Año", choices=c(unique(base_BUBBLE_estatal_1$info_year )), selected = head((unique(base_BUBBLE_estatal_1$info_year )), n=1),
                                              options = list(`actions-box` = F),multiple = F), width=6
                                ),
                                column(
                                  pickerInput("trim_estatal_1", "Trimestre", choices=c(unique(base_BUBBLE_estatal_1$info_trimestre)), selected = head((unique(base_BUBBLE_estatal_1$info_trimestre)), n=1),
                                              options = list(`actions-box` = F),multiple = F), width=6
                                ),

                              ),width=12),width=3),


             ),
             br(""),
             fluidRow(highchartOutput("gr_bubble_estatal_1",height = "100vh", width = "180vh"), width=12 , height=10)
           )
  ),
  
  
          tabPanel("Clusters Municipales",
                   fluidRow(
                     column(5,
                            highchartOutput("clusters_py")
                     ),
                     column(7,
                            box(
                              title = "Clusters Municipales", status = "primary", width = 9, solidHeader = T,
                              h5("Para construir clusters se tomaron 7 variables, 4 demográficas; créditos de banca móvil (La principal),
                      sucursales de banca comercial, terminales de punto de venta y establecimientos con terminales
                      de punto de venta, estos para cada 10000 adultos. También se añadió información sobre 
                      infraestructura digital por municipio; hogares con acceso a cable coaxial para internet
                      y hogares con línea de abonado digital (DSL). Por último se consideró la cantidad
                      de créditos de bienestar, todo para el 2020. Para calcular los clusters primero se procesaron los datos 
                      obtenidos transformandolos a 2 dimensiones, lo que facilita el cálculo para los ordenadores y hace más sencila la
                      visualuzación de los clusters. Para los clusters se empleo el método K-means que funciona a base de Centroides")
                            )
                     )
                   ),
                   br(),
                   h4("Promedios en los municipios de cada cluster", align = "center"),
                   fluidRow(
                     highchartOutput("bar_bm")
                   ),
                   fluidRow(
                     column(4,
                            highchartOutput("bar_bc")
                     ),
                     column(4,
                            highchartOutput("bar_tpv")
                     ),
                     column(4,
                            highchartOutput("bar_e_tpv")
                     )
                   ),
                   fluidRow(
                     column(4,
                            highchartOutput("bar_c_coaxial")
                     ),
                     column(4,
                            highchartOutput("bar_dsl")
                     ),
                     column(4,
                            highchartOutput("bar_cred_w")
                     )
                   )
  ),

###END
)
)
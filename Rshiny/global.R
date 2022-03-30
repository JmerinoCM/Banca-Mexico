# rm(list = ls())
#######################################
# library(purrr)
library(viridisLite)
library(highcharter)
library(htmltools)
library(leaflet)      # libreria para graficar mapas interactivos
library(sf)           # manejo de informacion geografica 
library(viridis)      # paletas de colores
library(leaflet.providers)
library(bslib)
library(stringr)
library(lubridate)
###########################
library(tidyverse)
#library(dashboardthemes)
library(shinyWidgets)
library(plotly)
library(sf)
library(tmap)
library(haven)
library(viridis)
library(readxl)
library(RColorBrewer)
library(ggcorrplot)
library(htmlwidgets)
library(magrittr)
# Code to create ScotPHO's Shiny profile platform
# In this script include packages, functions, datasets and anyting that will be 
# used both by UI and server

############################.
##Packages ----
############################.
library(shiny)
library(shinyBS) #modals
library(dplyr) # data manipulation
library(ggplot2) #data visualization
library (DT) # for data tables
library(leaflet) #javascript maps
library(plotly) #interactive graphs
library(shinyWidgets) # for extra widgets
library(tibble) # rownames to column in techdoc
library(shinyBS) #modals
library(shinyjs)
library(shinydashboard) #for valuebox on techdoc tab
library(sp)

library(shinycssloaders) #for loading icons, see line below
# it uses github version devtools::install_github("andrewsali/shinycssloaders")
# This is to avoid issues with loading symbols behind charts and perhaps with bouncing of app
library(rmarkdown)
library(flextable) #for tech document table
library(webshot) #to download plotly charts
library(rintrojs) # for help intros
library(V8)
library("spsComps")
#######################################################
library(mapview)

library(bsplus)
library(waiter)
library(thematic)
library(bs4Dash)
###########################################################


library(doBy)
library(dplyr)
library(lubridate)

# As well as webshot phantomjs is needed l to download Plotly charts
# https://github.com/rstudio/shinyapps-package-dependencies/pull/180

if (is.null(suppressMessages(webshot:::find_phantom()))) {
  webshot::install_phantomjs()
}


library(shinydashboardPlus)

bordes <- list("1"=.001,"2"=.01,"3"=.1,"4"=.2,"5"=.5,"6"=1)

capas_maps  <- list("Esri.WorldTerrain"="Esri.WorldTerrain","CartoDB.DarkMatterNoLabels"="CartoDB.DarkMatterNoLabels","Stamen.TonerBackground"="Stamen.TonerBackground","CartoDB.PositronNoLabels"="CartoDB.PositronNoLabels","Stamen.Watercolor"="Stamen.Watercolor","CartoDB.DarkMatterOnlyLabels"="CartoDB.DarkMatterOnlyLabels","Sin bordes"="Wikimedia")
paletas_maps <- rbind("viridis","inferno","magma","plasma", "RdYlGn","Spectral","YlOrRd","BuGn","Greys")
jsfile <- "https://rawgit.com/rowanwins/leaflet-easyPrint/gh-pages/dist/bundle.js" 


base_suprema <- read_dta("www/base_suprema.dta")

base_suprema$inst <- gsub("_"," ",base_suprema$inst)

base_suprema  <- base_suprema[order(base_suprema$Bimestre),]
base_suprema  <- base_suprema[order(base_suprema$Year),]
base_suprema$Periodo <- paste0(base_suprema$Year,"b",base_suprema$Bimestre)

base_supremasem <- base_suprema %>% drop_na(Semestre)

base_suprema <- base_suprema %>% drop_na(Bimestre)




##############################################################################################

inclusion <- read_excel("www/cons_deb_banxico.xlsx")
inclusioncredito <- read_dta("www/consumo.dta")
inclusioncredito <- inclusioncredito[order(inclusioncredito$dia),]
inclusioncredito <- inclusioncredito[order(inclusioncredito$mes),]
inclusioncredito <- inclusioncredito[order(inclusioncredito$Year),]


##############################################################################################
##############################################################################################

base_BUBBLE_estatal <- read_dta("www/Bases Estatales.dta")
base_BUBBLE_estatal_1 <- read_dta("www/Bases Estatales_1.dta")




##############################################################################################
df <- read_excel("www/data_python.xlsx")
df_two <- read_excel("www/two_cluster.xlsx")


clust_mean <- summaryBy(id_cbm + id_sbc + id_tpv + id_e_tpv + c_coaxial + dsl + cred_w ~ c, FUN=mean, data=df)
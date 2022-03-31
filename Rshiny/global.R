
############################.
##Packages ----
############################.
library(shiny)
library(shinyBS) 
library(ggplot2)
library(plotly) 
library(shinyWidgets) 
library(tibble)
library(shinyBS) 
library(shinyjs)
library(shinydashboard) 
library(sp)

library(shinycssloaders) 
library(rmarkdown)
library(flextable) 
library(webshot)
library(rintrojs) 
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
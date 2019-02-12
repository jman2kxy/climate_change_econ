library(shiny)
library(shinydashboard)
library(dplyr)
library(reshape)
library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(qcc)
library(broom)
library(Metrics)
library(rsample)
library(modelr)
library(rio)
library(DT)
library(datasets)
library(haven)
library(raster)
library(rgdal)
library(plotly)
library(leaflet)
library(choroplethr)
library(choroplethrMaps)
library(shinythemes)
library(viridis)
library(shinyWidgets)





convert('data_csv/CO2/Atmospheric_CO2_and_13CO2_Exchange_with_the_Terres/merged_ice_core_yearly.csv','data/keelingCO2_merged_ice_core_yearly.rds')
convert('data_csv/CO2/LawDome_CO2/muere_data.csv','data/muereCO2_data.rds')
convert('data_csv/CO2/NO-nature_luthi/luthico2_start.csv','data/luthiCO2_data.rds')
convert('data_csv/temp/Marcott.temp.BP.csv','data/marcottTemp_data.rds')
convert('data_csv/temp/rhodes/rhodesTemp_post1770.csv','data/rhodesTemp_data.rds')
convert('data_csv/temp/temp_merged.csv', 'data/temp_merged_data.rds')
convert('data_csv/sea_level/lambeck_sl_ka.csv','data/lambeckGSL_data.rds')
convert('data_csv/sea_level/Kopp/kopp_gsl_ml21_CE_era.csv','data/koppGSL_data.rds')
convert('data_csv/sea_level/antarctica_mass.csv','data/antarc_data.rds')
convert('data_csv/sea_level/greenland_mass.csv','data/greenl_data.rds')
convert('data_csv/sea_level/sl_merged.csv','data/sl_merged_data.rds')
convert('data_csv/agri/crops.csv','data/crops.rds')
convert('data_csv/CCE_data/YES Quantifying_Vulnerability_to_Climate_Change/qntify_vulnerability_192.csv','data/quantify_vul.rds')
convert('data_csv/CCE_data/YES-Data for_Economic_social and_governance_192_countYries/readiness_ec_social_gov_192.csv', 'data/readiness_vul.rds')
convert('data_csv/CCE_data/DICE_model.csv', 'data/DICE_ouput.rds')
convert('data_csv/CO2/co2_kg_gdp.csv', 'data/CO2_kg_GDP.rds')
convert('data_csv/CO2/Co2_kt.csv', 'data/CO2_kt.rds')


co2_start <-  readRDS('data/luthiCO2_data.rds') 
co2_middle <- readRDS("data/muereCO2_data.rds")
co2_merged <- readRDS("data/keelingCO2_merged_ice_core_yearly.rds")
co2_kg_gdp <- readRDS('data/CO2_kg_GDP.rds')
temp_up2BP <- readRDS('data/marcottTemp_data.rds')
temp_post1770 <- readRDS('data/rhodesTemp_data.rds')
temp_merged <- readRDS('data/temp_merged_data.rds')
gsl_past  <- readRDS('data/lambeckGSL_data.rds')
gsl_recent <- readRDS('data/koppGSL_data.rds')
gsl_merged <- readRDS('data/sl_merged_data.rds')
agri <- readRDS('data/crops.rds')
quan_vul <- readRDS('data/quantify_vul.rds')
read_vul <- readRDS('data/readiness_vul.rds')
antarc_mass <- readRDS('data/antarc_data.rds')
greenl_mass <- readRDS('data/greenl_data.rds')
dice_model <- readRDS('data/DICE_ouput.rds')
co2_kt <- readRDS('data/CO2_kt.rds')

names(co2_kg_gdp) <- as.matrix(co2_kg_gdp[1, ])
co2_kg_gdp <- co2_kg_gdp[-1, ]
co2_kg_gdp[] <- lapply(co2_kg_gdp, function(x) type.convert(as.character(x)))

names(co2_kt) <- as.matrix(co2_kt[1, ])
co2_kt <- co2_kt[-1, ]
co2_kt[] <- lapply(co2_kt, function(x) type.convert(as.character(x)))






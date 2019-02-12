#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#



# Define server logic required to draw a histogram
server <- function(input, output) {

  
  
  output$CO2_year <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_1")["x"], "Year", color = "green", width =6
      
    )
  })
  
  
  
  
  output$CO2hov <- renderValueBox({
    
    valueBox(
      
       event_data("plotly_click", source = "source_1")["y"], "CO2 ppm", color = "green", width = 6
      
    )
  })
  
  
  
    
    
  
  output$CO2infomap <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "kg CO2 per $GDP", color = "yellow", width = 6
      
    )
  })  
  
  
  output$CO2_country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"], "Country", color = "yellow", width = 6
      
    )
  }) 
  
  
  
  output$tempval <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_2")["y"], "Degrees Celcius", color = "purple", width = 6
      
    )
  }) 
  
  
  
  output$tempyear <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_2")["x"], "Year", color = "purple", width = 6
      
    )
  }) 
  
  
  
  output$iceval <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_3")["y"], "GT", color = "purple", width = 6
      
    )
  }) 
  
  
  output$iceyear <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_3")["x"], "Year", color = "purple", width = 6
      
    )
  }) 
  
  
  
  output$slval <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_4")["y"], "m", color = "purple", width = 6
      
    )
  }) 
  
  
  output$slyear <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_4")["x"], "Year", color = "purple", width = 6
      
    )
  }) 
  
  
  output$sccyear <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_5")["x"], "Year", color = "purple", width = 6
      
    )
  }) 
  
  output$sccval <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click", source = "source_5")["y"], "$", color = "purple", width = 6
      
    )
  }) 
  
  
  output$a1val <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "%-Production Yield", color = "purple", width = 6
      
    )
  }) 
  
  
  output$a1country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"], "Country", color = "purple", width = 6
      
    )
  }) 
  
  output$a2val <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "%-Production Yield", color = "purple", width = 6
      
    )
  }) 
  
  output$a2country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"], "Country", color = "purple", width = 6
      
    )
  }) 
  
  
  output$b1val <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "%-Production Yield", color = "purple", width = 6
      
    )
  }) 
  
  
  output$b1country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"], "Country", color = "purple", width = 6
      
    )
  }) 
  
  
  output$b2val <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "%-Production Yield", color = "purple", width = 6
      
    )
  }) 
  
  
  output$b2country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"],  "Country",color = "purple", width = 6
      
    )
  }) 
  
  
  output$read_vul_val <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["z"], "Readiness/Vulnerability Rate", color = "purple", width = 6
      
    )
  }) 
  
  output$read_vul_country <- renderValueBox({
    
    valueBox(
      
      event_data("plotly_click")["key"], "Country", color = "purple", width = 6
      
    )
  }) 
  
  
  
  
  
  output$CO2Plot <- renderPlotly({

    dataSub <- 
     co2_merged %>%
      filter(Year >= as.numeric(input$co2_toggle[1]), 
             Year <= as.numeric(input$co2_toggle[2]))
    
  plot_ly(
      data = dataSub, 
      x = ~Year, 
      y = ~CO2_ppm, 
      mode = 'lines+markers',
      source ="source_1") %>%
    layout(
      title = "CO2 Concentration Through the Common Era",
      xaxis = list(title = "Year"),
      yaxis = list(title = "CO2 (ppm)")
    )
  
    
  })
   
  output$tempPlot <- renderPlotly({
    
    dataSub2 <-
      temp_merged %>%
      filter(Year >= as.numeric(input$temp_toggle[1]),
             Year <= as.numeric(input$temp_toggle[2]))
    
    plot_ly(
      data = dataSub2,
      x = ~Year,
      y = ~Temp,
      mode = 'lines+markers',
      source = "source_2") %>%
    layout(
      title = "Temperaure from 1770 - 2010",
      xaxis = list(title = "Year"),
      yaxis = list(title = "Temperature in C")
      
    )
  })
  
  
  
  output$slPlot <- renderPlotly({
    
    dataSub3 <-
      gsl_merged %>%
      filter(Year >= as.numeric(input$sl_toggle[1]),
             Year <= as.numeric(input$sl_toggle[2]))
    
    plot_ly(
      data = dataSub3,
      x = ~Year,
      y = ~sea_level,
      mode = 'lines+markers',
      source = "source_4") %>%
      layout(
        title = "Change in Global Sea Level in Common Era",
        xaxis = list(title = "Year"),
        yaxis = list(title = "Sea Level Rise (m)")
        
      )
    
  })
  
  
  output$antarcPlot <- renderPlotly({
    
    dataSub4 <-
      antarc_mass %>%
      filter(Time >= as.numeric(input$antarc_toggle[1]),
             Time <= as.numeric(input$antarc_toggle[2]))
    
    plot_ly(
      data = dataSub4,
      x = ~Time,
      y = ~mass_GT,
      mode = 'lines+markers',
      source = "source_3") %>%
      layout(
        title = "Change in the Mass of Antarctica Since 2002",
        xaxis = list(title = "Year"),
        yaxis = list(title = "Mass Change in Gigatonnes")
        
      )
    
  })

  
  output$sccPlot <- renderPlotly({
    
    dataSub5 <-
      dice_model %>%
      filter(Year >= as.numeric(input$scc_toggle[1]),
             Year <= as.numeric(input$scc_toggle[2]))
    
    plot_ly(
      data = dataSub5,
      x = ~Year,
      y = ~Social_Cost_of_Carbon_Optimal_Tax ,
      mode = 'lines+markers',
      source = "source_5") %>%
      layout(
        title = "The Projection of the Social Cost of Carbon to the Year 2200",
        xaxis = list(title = "Year"),
        yaxis = list(title = "Social Cost of Carbon in $")
        
      )
    
  })

 
 
 output$vul_econ_map2 <- renderPlotly ({

   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   
  
   p <- switch(input$p,
     
     
     economic = plot_geo(data = read_vul,
                 locationmode = "ISO-3") %>% 
     add_trace(z = read_vul[,"Economic"] , text = ~Country, locations = ~Country, color = read_vul[,"Economic"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
     ) %>%
     colorbar(title = "Economic") %>%
     layout(title = "Economic Readiness",
            geo = g),
     
     capacity =  plot_geo(data = read_vul,
                          locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Capacity"] , text = ~Country, locations = ~Country, color = read_vul[,"Capacity"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Capacity") %>%
       layout(title = "Adaptive Capacity Vulnerability",
              geo = g),
     
     exposure =  plot_geo(data = read_vul,
                          locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Exposure"] , text = ~Country, locations = ~Country, color = read_vul[,"Exposure"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Exposure") %>%
       layout(title = "Exposure Vulnerability",
              geo = g),
     
     sensitivity = plot_geo(data = read_vul,
                            locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Sensitivity"] , text = ~Country, locations = ~Country, color = read_vul[,"Sensitivity"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Sensitivity") %>%
       layout(title = "Sensitivity Vulnerability",
              geo = g),
     
     vulnerability = plot_geo(data = read_vul,
                              locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Vulnerability"] , text = ~Country, locations = ~Country, color = read_vul[,"Vulnerability"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Vulnerability") %>%
       layout(title = "Overall Vulnerability",
              geo = g),
     
     governance = plot_geo(data = read_vul,
                           locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Governance"] , text = ~Country, locations = ~Country, color = read_vul[,"Governance"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Governance") %>%
       layout(title = "Governance Readiness",
              geo = g),
     
     readiness = plot_geo(data = read_vul,
                          locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Readiness"] , text = ~Country, locations = ~Country, color = read_vul[,"Readiness"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Readiness") %>%
       layout(title = "Overall Readiness",
              geo = g),
     
     social = plot_geo(data = read_vul,
                       locationmode = "ISO-3") %>% 
       add_trace(z = read_vul[,"Social"] , text = ~Country, locations = ~Country, color = read_vul[,"Social"], colors = 'YlGnBu', marker = list(line = l), frame = ~Year, ids = ~Country, key = ~Country
       ) %>%
       colorbar(title = "Social") %>%
       layout(title = "Social Readiness",
              geo = g)
     
    
   )
   
   
 })
 
 
 output$grain_mapA1 <- renderPlotly ({
   
   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   q1 <-  switch(input$q1,
                
                A1FI_2020 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A1FI2020"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A1FI2020"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2020 %-Production Yield of Grain",
                         geo = g),
                
                
                A1FI_2050 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A1FI2050"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A1FI2050"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2050-% Production Yield of Grain",
                         geo = g),
                
                A1FI_2080 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A1FI2080"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A1FI2080"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2080-% Production Yield of Grain",
                         geo = g)
                
   )
   
 })
 
 
 output$grain_mapA2 <- renderPlotly ({
   
   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   q2 <-  switch(input$q2,
                
                A2A_2020 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A2A2020"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A2A2020"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2020 %-Production Yield of Grain",
                         geo = g),
                
                
                A2A_2050 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A2A2050"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A2A2050"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2050 %-Production Yield of Grain",
                         geo = g),
                
                
                A2A_2080 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"A2A2080"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"A2A2080"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2080 %-Production Yield of Grain",
                         geo = g)
   )
   
 })
 
 
 output$grain_mapB1 <- renderPlotly ({
   
   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   q3 <-  switch(input$q3,
                
                
                B1_2020 = plot_geo(data = agri,
                                     locationmode = "country names") %>% 
                  add_trace(z = agri[,"B1A2020"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B1A2020"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2020 %-Production Yield of Grain",
                         geo = g),
                
                
                B1_2050 = plot_geo(data = agri,
                                   locationmode = "country names") %>% 
                  add_trace(z = agri[,"B1A2050"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B1A2050"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2050 %-Production Yield of Grain",
                         geo = g),
                
                
                B1_2080 = plot_geo(data = agri,
                                   locationmode = "country names") %>% 
                  add_trace(z = agri[,"B1A2080"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B1A2080"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2080 %-Production Yield of Grain",
                         geo = g)
                
   )
   
 })
                
 output$grain_mapB2 <- renderPlotly ({
   
   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   q4 <-  switch(input$q4,
                
                B2_2020 = plot_geo(data = agri,
                                   locationmode = "country names") %>% 
                  add_trace(z = agri[,"B2B2020"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B2B2020"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2020 %-Production Yield of Grain",
                         geo = g),
                
                B2_2050 = plot_geo(data = agri,
                                   locationmode = "country names") %>% 
                  add_trace(z = agri[,"B2B2050"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B2B2050"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2050 %-Production Yield of Grain",
                         geo = g),
                
                B2_2080 = plot_geo(data = agri,
                                   locationmode = "country names") %>% 
                  add_trace(z = agri[,"B2B2080"] , text = ~COUNTRY, locations = ~COUNTRY, color = agri[,"B2B2080"], colors = 'YlGnBu', marker = list(line = l), key = ~COUNTRY
                  ) %>%
                  colorbar(title = "") %>%
                  layout(title = "2080 %-Production Yield of Grain",
                         geo = g)
   )
   
 })
 

 
 
 output$co2_map <- renderPlotly ({
   
   
   #give country borders
   l <- list(color = toRGB("grey"), width = 2)
   
   #specify map projection/options
   
   g <- list(
     projection = list(type = "equirectangular"),
     scope = "world"
     
   )
   
   q5 <-  switch(input$q5,
                 co2_1970 = plot_geo(data = co2_kg_gdp,
                                     locationmode = "country names") %>% 
                   add_trace(z = co2_kg_gdp[,"1970"] , text = ~Country_Name, locations = ~Country_Name, color = co2_kg_gdp[,"1970"], colors = 'YlGnBu', marker = list(line = l), key = ~Country_Name
                   ) %>%
                   colorbar(title = "") %>%
                   layout(title = "1970 CO2 emissions (kg per 2010 US$ of GDP)",
                          geo = g),
                 
                 
                 co2_1980 = plot_geo(data = co2_kg_gdp,
                                     locationmode = "country names") %>% 
                   add_trace(z = co2_kg_gdp[,"1980"] , text = ~Country_Name, locations = ~Country_Name, color = co2_kg_gdp[,"1980"], colors = 'YlGnBu', marker = list(line = l), key = ~Country_Name
                   ) %>%
                   colorbar(title = "") %>%
                   layout(title = "1980 CO2 emissions (kg per 2010 US$ of GDP)",
                          geo = g),
                 
                 
                 co2_1990 = plot_geo(data = co2_kg_gdp,
                                     locationmode = "country names") %>% 
                   add_trace(z = co2_kg_gdp[,"1990"] , text = ~Country_Name, locations = ~Country_Name, color = co2_kg_gdp[,"1990"], colors = 'YlGnBu', marker = list(line = l), key = ~Country_Name
                   ) %>%
                   colorbar(title = "") %>%
                   layout(title = "1990 CO2 emissions (kg per 2010 US$ of GDP)",
                          geo = g),
                 
                 
                 co2_2000 = plot_geo(data = co2_kg_gdp,
                                     locationmode = "country names") %>% 
                   add_trace(z = co2_kg_gdp[,"2000"] , text = ~Country_Name, locations = ~Country_Name, color = co2_kg_gdp[,"2000"], colors = 'YlGnBu', marker = list(line = l), key = ~Country_Name
                   ) %>%
                   colorbar(title = "") %>%
                   layout(title = "2000 CO2 emissions (kg per 2010 US$ of GDP)",
                          geo = g),
                 
                 
                 co2_2010 = plot_geo(data = co2_kg_gdp,
                                     locationmode = "country names") %>% 
                   add_trace(z = co2_kg_gdp[,"2010"] , text = ~Country_Name, locations = ~Country_Name, color = co2_kg_gdp[,"2010"], colors = 'YlGnBu', marker = list(line = l), key = ~Country_Name
                   ) %>%
                   colorbar(title = "") %>%
                   layout(title = "2010 CO2 emissions (kg per 2010 US$ of GDP)",
                          geo = g)
   )
   
 })
 
   

  
}

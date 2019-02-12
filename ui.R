#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#




ui <- dashboardPage(skin ="green",
  
 
  dashboardHeader(title = "Climate Change Economics"),
  

  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem("Charts", icon = icon("line-chart"),startExpanded = TRUE,
               menuSubItem("Carbon Dioxide Concentration", tabName = "CO2_data"),
               menuSubItem("Surface Temperature", tabName = "temp_data"),
               menuSubItem("Antarctica Ice Sheets", tabName = "a_ice_data"),
               menuSubItem("Sea Level Rise", tabName = "sl_data"),
               menuSubItem("Social Cost of Carbon", tabName = "scc_data")
               ),
      menuItem("Grain Production", icon = icon("leaf"),startExpanded = FALSE,
               menuSubItem("A1 Scenario", tabName = "A1_Scenario"),
               menuSubItem("A2 Scenario", tabName = "A2a_Scenario"),
               menuSubItem("B1 Scenario", tabName = "B1_Scenario"),
               menuSubItem("B2 Scenario", tabName = "B2_Scenario")
               ),
      menuItem("Nation Readiness/Vulnerability",icon = icon("flag"), tabName = "vul_data")
    )
    
    
  
  ),
    
    
    # Show a plot of the generated distribution
    dashboardBody(
      tabItems(
        tabItem(tabName = "CO2_data",
                box(width=12,
                
                  fluidRow(
                    
                    column(4, valueBoxOutput("CO2hov" ),
                    valueBoxOutput("CO2_year" )),
                    
                    
                    
                    column(4, sliderInput(inputId = "co2_toggle", 
                                  label = "Choose Range of Years", 
                                  min = min(co2_merged$Year), 
                                  max = max(co2_merged$Year), 
                                  value = c(min(co2_merged$Year),max(co2_merged$Year)),sep ="",
                                  ticks = TRUE))
                           
                          
                           ),
               
                plotlyOutput("CO2Plot")),
              
                hr(),  
        box(width=12,      
             fluidRow(
                
               column(6, valueBoxOutput("CO2infomap" ),
                      valueBoxOutput("CO2_country")),
               
                column(4, sliderTextInput("q5","Choose Year",
                                c("1970" = "co2_1970",
                                  "1980" = "co2_1980",
                                  "1990" = "co2_1990",
                                  "2000" = "co2_2000",
                                  "2010" = "co2_2010"),
                                animate = TRUE,
                                grid = TRUE))
                ),
                
                plotlyOutput("co2_map"))
                
                ),
        tabItem(tabName = "temp_data",
                
                box(width =12,
               fluidRow(
                 
                 column(4, valueBoxOutput("tempval"),
                        valueBoxOutput("tempyear")),
                 
                 column(4, sliderInput(inputId = "temp_toggle",
                                 label= "Choose Range",
                                 min = min(temp_merged$Year),
                                 max = max(temp_merged$Year),
                                 value = c(min(temp_merged$Year),max(temp_merged$Year)),sep ="",
                                 ticks= TRUE))
                 ),
               
               plotlyOutput("tempPlot"))
                ),
        tabItem(tabName = "sl_data",
            box(width = 12, 
              fluidRow(  
                
                column(4, valueBoxOutput("slval"),
                       valueBoxOutput("slyear")),
                
                column(4, sliderInput(inputId = "sl_toggle",
                            label= "Choose Range",
                            min = min(gsl_merged$Year),
                            max = max(gsl_merged$Year),
                            value = c(min(gsl_merged$Year),max(gsl_merged$Year)),sep ="",
                            ticks= TRUE))
                
                ),
                plotlyOutput("slPlot"))
                
                ),
        
        tabItem(tabName = "a_ice_data",
               box(width = 12 ,
                fluidRow(
                  
                  column(4, valueBoxOutput("iceval"),
                         valueBoxOutput("iceyear")),
                  
                  
                column(4, sliderInput(inputId = "antarc_toggle",
                            label= "Choose Range",
                            min = min(antarc_mass$Time),
                            max = max(antarc_mass$Time),
                            value = c(min(antarc_mass$Time),max(antarc_mass$Time)),sep ="",
                            ticks= TRUE))
                       ),
                plotlyOutput("antarcPlot"))
        ),
        
        
        tabItem(tabName = "scc_data",
              box( width = 12,
              fluidRow(
                
                column(6, valueBoxOutput("sccval"),
                       valueBoxOutput("sccyear")),
                
                column(4, sliderInput(inputId = "scc_toggle",
                            label= "Choose Range",
                            min = min(dice_model$Year),
                            max = max(dice_model$Year),
                            value = c(min(dice_model$Year),max(dice_model$Year)),sep ="",
                            ticks= TRUE))
                ),
                plotlyOutput("sccPlot")),
              box(
                h3("The social cost of carbon (SCC) is a measure, in dollars, of the long-term damage done by a ton of carbon dioxide in a given year."), br(),
                h3("SCC is a comprehensive estimate of climate change damages and includes changes in net agricultural productivity, human health, property damages from increased flood risk, and changes in energy system costs.")
              )
        ),
  
               
        tabItem(tabName = "A1_Scenario",
                
                
              box(width = 12,
                fluidRow(
                  
                  column(6, valueBoxOutput("a1val"),
                         valueBoxOutput("a1country")),
                  
        column(4, sliderTextInput("q1","Choose Year",
                        c("2020" = "A1FI_2020",
                          "2050" = "A1FI_2050",
                          "2080" = "A1FI_2080"),
                        animate = TRUE,
                        grid = TRUE))
        ),
        plotlyOutput("grain_mapA1")),
        box(
          h3("The A1 Scenario involves the largest increase in temperature of the scenarios.")
        )
        ),
                  
        tabItem(tabName = "A2a_Scenario",
                
              box(width = 12,
                fluidRow(
                  
                  column(6, valueBoxOutput("a2val"),
                         valueBoxOutput("a2country")),
                  
                 column(4, sliderTextInput("q2","Choose Year",
                                 c("2020" = "A2A_2020",
                                   "2050" = "A2A_2050",
                                   "2080" = "A2A_2080"),
                                 animate = TRUE,
                                 grid = TRUE))
                 ),
                 plotlyOutput("grain_mapA2")),
              box(
                h3("The A2 Scenario begins with a temperature increase like A1, then a slight decrease in temperature.")
              )
                ),
                  
        tabItem(tabName = "B1_Scenario",
               box(width = 12, 
                fluidRow(
                  
                  column(6, valueBoxOutput("b1val"),
                         valueBoxOutput("b1country")),
                  
                 column(4, sliderTextInput("q3","Choose Year",
                                 c("2020" = "B1_2020",
                                   "2050" = "B1_2050",
                                   "2080" = "B1_2080"),
                                 animate = TRUE,
                                 grid = TRUE))
                 ),
                 plotlyOutput("grain_mapB1")),
               box(
                 h3("The B1 Scenario involves the lowest temperature increase of all the scenarios.")
               )
                ),
                  
        tabItem(tabName = "B2_Scenario",
                box(width = 12,
                fluidRow(
                  
                  column(6, valueBoxOutput("b2val"),
                         valueBoxOutput("b2country")),
                  
                 column(4,sliderTextInput("q4","Choose Year",
                                 c("2020" = "B2_2020",
                                   "2050" = "B2_2050",
                                   "2080" = "B2_2080"),
                                 animate = TRUE,
                                 grid = TRUE))
                        ),
                 plotlyOutput("grain_mapB2")),
                box(
                  h3("The B2 Scenario begins with a temperature increase like B1, then a slight decrease in temperature.")
                )
                ),
                
        
        tabItem(tabName = "vul_data",
                
                box(width =12,
                fluidRow(
                  
                  column(6, valueBoxOutput("read_vul_val"),
                         valueBoxOutput("read_vul_country")),

                column(4,selectInput("p", "Select Variable",
                             c("Economic Readiness" ="economic",
                               "Social Readiness" = "social",
                               "Governance Readiness" = "governance",
                               "Overall Readiness" = "readiness",
                               "Adaptive Capacity Vulnerability" = "capacity",
                               "Exposure Vulnerability" = "exposure",
                               "Sensitivity Vulnerability" = "sensitivity",
                               "Overall Vulnerability" = "vulnerability"
                               )))
                            ),
                
                
               
                            
                plotlyOutput("vul_econ_map2")),
                
                box(width = 12,
                  h3("On 0-1 Mean Value Scale, a 1 represents high status of Vulnerability or Readiness."), br(),
                  h3("Using modeling output from Macquarie University that uses 45 indicators to build a linear relationship between climate change readiness for mitigation of  climate change vulnerability for each country."), br(),
                  
                  fluidRow(
                  column(4,img(src="read_vul3.png", height = 600, width = 600)),
                  column(4, img(src="read_vul1.png", height = 600, width = 600)),
                  column(4, img(src="read_vul2.png", height = 600, width = 600))
                  )
                  
                )
            
                )
      
      )
      
      
       
    )
  
)




# Packages
#install.packages(c("shiny", "shinydashboard", "dplyr", "DT", "readxl", "ggplot2", "plotly", "ggtext", "ggcorrplot", "reshape2"))
#library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(readxl)
library(ggplot2)
library(plotly)
library(ggtext)
library(ggcorrplot)
library(reshape2)

#Global 
#setwd("E:/RTSM/Dashboard/New folder")
data = read_excel("Dashboard_data.xls")
data = data[-29, ]
data = data[-38, ]
data = data[-37, ]
data <- mutate_all(data, funs(ifelse(. == "NA", NA, .)))

#Converting required columns to numeric
numeric_columns = c("Apr-13 (VALUE IN RS.CR.)","Apr-14 (VALUE IN RS.CR.)")  
data = data %>%
  mutate_at(vars(numeric_columns), as.numeric)


#structure
data %>% 
  str()

#Summary
data %>% 
  summary()



#Choices for input 
choices1 = data %>% 
  select(-'PRINCIPAL COMMODITIES') %>% 
  names()


#Assigning statenames
State = data[["PRINCIPAL COMMODITIES"]]

# Anova Tests


Y1 = data$`Nov-14 (VALUE IN RS.CR.)`
Y2 = data$`Dec-13 (VALUE IN RS.CR.)`
Y3 = data$`Dec-14 (VALUE IN RS.CR.)`


Commodity_data <- data.frame(
  Year = Year,
  Nov_14 = Y1,
  Dec_13	= Y2,
  Dec_14	= Y3
)
Commodity_data <- melt(Commodity_data, id.vars = "Year", variable.name = "Commodity", value.name = "Exports")

# Fit repeated measures ANOVA
model_Commodity_Data<- aov(Years ~ Commodity + Error(Year/Commodity), data = Commodity_data)

# arrest_data_long1 <- melt(arrest_data_CR, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_CR <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long1)


# #CCS
# CCS1 = data$`2019 - CCS`
# CCS2 = data$`2020 - CCS`
# CCS3 = data$`2021 - CCS`
# 
# 
# arrest_data_CCS <- data.frame(
#   State = State,
#   Arrests_2019 = CCS1,
#   Arrests_2020 = CCS2,
#   Arrests_2021 = CCS3
# )
# 
# arrest_data_long2 <- melt(arrest_data_CCS, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_CCS <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long2)
# 
# #CON
# CON1 = data$`2019 - CON`
# CON2 = data$`2020 - CON`
# CON3 = data$`2021 - CON`
# 
# 
# arrest_data_CON <- data.frame(
#   State = State,
#   Arrests_2019 = CON1,
#   Arrests_2020 = CON2,
#   Arrests_2021 = CON3
# )
# 
# arrest_data_long3 <- melt(arrest_data_CON, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_CON <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long3)
# 
# 
# #PAR
# PAR1 = data$`2019 - PAR`
# PAR2 = data$`2020 - PAR`
# PAR3 = data$`2021 - PAR`
# 
# 
# arrest_data_PAR <- data.frame(
#   State = State,
#   Arrests_2019 = PAR1,
#   Arrests_2020 = PAR2,
#   Arrests_2021 = PAR3
# )
# 
# arrest_data_long4 <- melt(arrest_data_PAR, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_PAR <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long4)
# 
# #PCS
# PCS1 = data$`2019 - PCS`
# PCS2 = data$`2020 - PCS`
# PCS3 = data$`2021 - PCS`
# 
# 
# arrest_data_PCS <- data.frame(
#   State = State,
#   Arrests_2019 = PCS1,
#   Arrests_2020 = PCS2,
#   Arrests_2021 = PCS3
# )
# 
# arrest_data_long5 <- melt(arrest_data_PCS, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_PCS <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long5)
# 
# #PCV
# PCV1 = data$`2019 - PCV`
# PCV2 = data$`2020 - PCV`
# PCV3 = data$`2021 - PCV`
# 
# 
# arrest_data_PCV <- data.frame(
#   State = State,
#   Arrests_2019 = PCV1,
#   Arrests_2020 = PCV2,
#   Arrests_2021 = PCV3
# )
# 
# arrest_data_long6 <- melt(arrest_data_PCV, id.vars = "State", variable.name = "Year", value.name = "Arrests")
# 
# # Fit repeated measures ANOVA
# model_PCV <- aov(Arrests ~ Year + Error(State / Year), data = arrest_data_long6)

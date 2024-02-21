# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Month-wise Export data for Principal Commodity",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "http://www.linkedin.com/in/mohiniswami2399", icon("linkedin"), "My Profile", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://github.com/Mohini-23/Dashboard_Commodity", icon("github"), "Source code and Report", target = "_blank"))
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "anova", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the COMMODITY", choices = choices1, selected = "SELECT")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("Welcome to the Monthly-Wise Export Data for Principal Commodity Dashboard – Introduction: Month-wise export data for principal commodities provides crucial insights into the dynamics of international trade. This data, which encompasses metrics such as volume, value, and destination markets, enables stakeholders to monitor economic trends, identify emerging opportunities, and formulate informed strategies. By analyzing export data on a month-to-month basis, policymakers, economists, businesses, and investors can adapt to changing market conditions, mitigate risks, and capitalize on growth prospects. Understanding the factors driving fluctuations in export performance enhances transparency, fosters market intelligence, and supports effective decision-making in an interconnected global economy.")),
                                column(width = 4, tags$br() ,
                                       tags$p("Abbrevations used are Months")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("data")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("Export Data Trend by Principal Commodity",value = "trends", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
      tabItem(tabName = "anova",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard compares different export data per commodity over months using test of Anova")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("Commodity", verbatimTextOutput("Commodity")),
                     tabPanel("CCS", verbatimTextOutput("CCS")),
                     tabPanel("CON", verbatimTextOutput("CON")),
                     tabPanel("PAR", verbatimTextOutput("PAR")),
                     tabPanel("PCS", verbatimTextOutput("PCS")),
                     tabPanel("PCV", verbatimTextOutput("PCV"))
    )
    
  )
)))

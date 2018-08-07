
#' @import shiny
#' @import shinydashboard
#' @import rhandsontable
app_ui <- function() {
  dashboardPage(
    dashboardHeader(title ="Calculateur Broutard"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Parametres", tabName = "param", icon = icon("dashboard")),
        menuItem("Optimisation", tabName = "optim", icon = icon("th"))
      )
    ),
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "param",
                fluidRow(
                      box(title = "Nombre de parametres", width=6,
                        numericInput("n_alim","Nombre d'aliments",value=3),
                        numericInput("n_phase","Nombre de phases de croissance", value=4)
                      ),
                      box(width=6, title = "GMQ (g/j) par phase et par aliment",
                        rHandsontableOutput("tableGmq")
                      )),
                fluidRow(
                      box(width=4, title = "Poids qui definissent les phases (kg)",
                        rHandsontableOutput("tablePhases")
                      ),
                      box(width=4, title = "Prix de la viande par phase (kg)",
                        rHandsontableOutput("tableViande")
                      ),
                      box(width=4, title = "Prix de l'aliment en euro/t",
                        rHandsontableOutput("tableAlim")
                      )
                )



        ),
        tabItem(tabName = "optim",
                fluidRow(
                  box(width=12,
                    numericInput("PI","Poids initial des veaux",value=50),
                    numericInput("JC","Jours de croissance",value=100),
                    tabBox(id="Regime1",title="Regime1",
                           tabPanel("Parametre",
                                    uiOutput("regime1")
                           ),
                           tabPanel("Table Croissance",
                                    dataTableOutput("tableCroiss1")),
                           tabPanel("Visual",
                                    # selectInput("choice1","Variable a afficher",choices = c("poids","valeur viande", "prix aliment"),multiple =T, selected ="poids"),
                                    plotOutput("plot1")
                           )
                    ),
                    tabBox(id="Regime2",title="Regime2",
                           tabPanel("Parametre",
                                    uiOutput("regime2")
                           ),
                           tabPanel("Table Croissance",
                                    dataTableOutput("tableCroiss2")),
                           tabPanel("Visual",
                                    # selectInput("choice2","Variable a afficher",choices = c("poids","valeur viande", "prix aliment"),multiple =T, selected ="poids"),
                                    plotOutput("plot2")
                           )
                    )
                  )
                ),
                fluidRow(
                  box(width=12,
                      plotOutput("comparaison")
                      )
                )
        )
      )
    )
  )
}

#' regimUI
#' UI part of the module that create the regim and visualisation
#'
#' @param nalim numeric, number of aliment
#' @param nphase numeric, number of phases
#' @import purrr
#' @import dplyr

library(purrr)
library(dplyr)
regimUI <- function(id,nalim,nphase){
  ns <- NS(id)

  tagList(
    map(1:nphase(),~ box(title=paste0("Phase ",.x),
                         selectInput(inputId=ns(paste0("alim",.x)),label="Aliment ",choices=LETTERS[1:nalim()],selected="A"),
                         numericInput(ns(paste0("qte",.x)),paste0("Quantite journaliere en kg"),value=4)
          )
        )
    )

}


#' regim
#' Server part of the module that create the regim and visualisation
#'
#' @param nalim numeric, number of aliment
#' @param nphase numeric, number of phases
#' @import purrr
#' @import dplyr
regim <- function(input, output, session,nphase){
  ns <- session$ns

  alim <- reactive({map_chr(1:nphase(),~input[[paste0("alim",.x)]])})
  qte <- reactive({map_dbl(1:nphase(),~input[[paste0("qte",.x)]])})

  return(list(alim = alim,qte= qte))
}

#' table GMQ
#' Creat the handsontable widget that contain the GMQ infos
#'
#' @param n_phase numeric, number of phase
#'
#' @import rhandsontable
rhandsontable_phase <- function(n_phase){
  renderRHandsontable({
    tranche <- round(500/n_phase(),0)
    tranches <- 1:n_phase()*tranche
    df <- data.frame(poids=tranches)
    row.names(df) <- paste0("Phase ",1:n_phase())
    rhandsontable(df, rowHeaderWidth=70) %>%
      hot_cols(colWidths = 100) %>%
      hot_rows(rowHeights = 30)
  })
}

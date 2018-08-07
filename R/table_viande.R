#' table_viande
#' Creat the handsontable widget that contain the beast price infos
#'
#'
#' @import rhandsontable
rhandsontable_viande <- function(nphase){
  renderRHandsontable({
    init_price <- rep(3,nphase())
    init_weight <- paste0("Phase ",1:nphase())
    df <- data.frame(prix_au_kilo = init_price)
    row.names(df) <- init_weight
    rhandsontable(df, rowHeaderWidth=70) %>%
      hot_cols(colWidths = 100) %>%
      hot_rows(rowHeights = 30)
  })
}

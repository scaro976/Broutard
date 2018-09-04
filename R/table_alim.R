#' table_alim
#' Creat the handsontable widget that contain the food price infos
#'
#'
#' @import rhandsontable
rhandsontable_alim <- function(n_alim,nom_alim){
  renderRHandsontable({
    init_price <- rep(250,n_alim())
    df <- data.frame(prix = init_price)
    row.names(df) <- paste0("Alim ",nom_alim())
    rhandsontable(df, rowHeaderWidth=70) %>%
      hot_cols(colWidths = 100) %>%
      hot_rows(rowHeights = 30)
  })
}

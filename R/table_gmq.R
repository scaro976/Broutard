#' table GMQ
#' Creat the handsontable widget that contain the GMQ infos
#'
#' @param n_alim numeric, number of aliment
#' @param n_phase numeric, number of phase
#'
#' @import rhandsontable
rhandsontable_GMQ <- function(n_alim, n_phase,nom_alim){
  renderRHandsontable({
    init_gmq <- rep(1500,n_phase()*n_alim())
    init_mat <- matrix(init_gmq,ncol= n_alim())
    df <- as.data.frame(init_mat)
    row.names(df) <- paste0("Phase ",1:n_phase())
    names(df) <- paste0("GMQ ",nom_alim())
    rhandsontable(df, rowHeaderWidth=70) %>%
      hot_cols(colWidths = 100) %>%
      hot_rows(rowHeights = 30)
  })
}

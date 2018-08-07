#' plotRegime
#' plot the variables of the tableCroiss dataframe
#'
#' @param tableCroiss dataframe containing the growing variables weigth and price of food
#' @param var variable to plot
#' @import tidyr
#' @import ggplot2
#'
plotRegime <- function(tableCroiss,var){
  tablToPlot <- gather(tableCroiss,key="Variable", value="Valeur_euros",-jour)
  plot <- ggplot(tablToPlot,aes(jour,Valeur_euros,color=Variable)) +
    geom_line()
  return(plot)
}

#' plot_compare
#' create a ggplot to compare the benefices of the differents regimes
#'
#' @param croiss1 dataframe of regime 1
#' @param croiss2 dataframe of regime 2
#' @import ggplot2
#' @import tidyr
#'
library(ggplot2)
library(tidyr)
plot_compare <- function(croiss1, croiss2){
  df <- data.frame(jour=croiss1$jour,regime1 = croiss1$benefice, regime2 = croiss2$benefice)
  df_plot <- gather(df,key= Regimes, value = Benefice,-jour)
  p <- ggplot(df_plot, aes(jour, Benefice, color= Regimes)) +
      geom_line()
  return(p)
}

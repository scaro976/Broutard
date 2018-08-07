#' Poids
#' calculate the weight of the beast for one day in particular you must loop on jour and phase
#'
#' @param njour the day when you want the weight
#' @param tableGmq dataframe that contain the gmq
#' @param tablePhases dataframe that contain the Phase
#' @param PI initial weight
dataframe_croissance <- function(njour,tableGmq,tablePhases,PI, Alim, Qte, tableAlim, tableViande){
  vec_poids <- rep(0,njour)
  vec_poids[1]<- PI
  vec_prix <- rep(0,njour)
  vec_valeur <- rep(0,njour)
  for (i in 2:njour){
    phase <- ifelse(vec_poids[i-1] >= max(tablePhases$poids), length(tablePhase$poids),which(tablePhases$poids == min(tablePhases$poids[vec_poids[i-1]<tablePhases$poids])))
    vec_poids[i] <- vec_poids[i-1]+tableGmq[phase,which(LETTERS==Alim[phase])]*0.001
    vec_prix[i] <- vec_prix[i-1]+Qte[phase]*tableAlim[which(LETTERS==Alim[phase]),1]*0.001
    vec_valeur[i-1] <- vec_poids[i-1]*tableViande[phase,1]
  }

  df <- data.frame(jour = 1:(njour-1), poids = vec_poids[-njour], cout_alim=vec_prix[-njour], valeur_viande = vec_valeur[-njour])
  df$benefice <- df$valeur_viande-df$cout_alim
  return(df)
}

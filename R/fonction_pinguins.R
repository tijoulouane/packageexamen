#' @title Filtrer le jeu de donnees penguins par espece
#'
#' @description Cette fonction conserve uniquement les lignes
#' correspondant a l'espece choisie.
#'
#' @param data Un data frame contenant les donnees penguins.
#' @param espece_choisie Une chaine de caracteres indiquant
#' l'espece a conserver.
#'
#' @return Un data frame filtre selon l'espece choisie.
#'
#' @importFrom dplyr filter
#' @export
filtrer_penguins <- function(data, espece_choisie) {
  dplyr::filter(data, espece == espece_choisie)
}



#' @title Calculer le poids moyen par espece
#'
#' @description Cette fonction calcule le poids moyen des manchots
#' pour chaque espece presente dans le jeu de donnees.
#'
#' @param data Un data frame contenant les donnees penguins.
#'
#' @return Un data frame contenant une ligne par espece
#' et le poids moyen associe.
#'
#' @importFrom dplyr group_by summarise
#' @importFrom stats na.omit
#' @export
moyenne_poids_espece <- function(data) {
  data |>
    dplyr::group_by(espece) |>
    dplyr::summarise(poids_moyen = mean(poids, na.rm = TRUE))
}


#' @title Representer la longueur maximale du bec par espece
#'
#' @description Cette fonction produit un graphique en barres
#' de la longueur maximale du bec des manchots pour chaque espece.
#'
#' @param data Un data frame contenant les donnees penguins.
#'
#' @return Un graphique ggplot2 representant la longueur maximale
#' du bec par espece.
#'
#' @importFrom dplyr group_by summarise
#' @importFrom ggplot2 ggplot aes geom_col labs
#' @export
graphique_longueur_bec_max <- function(data) {
  resume <- data |>
    dplyr::group_by(espece) |>
    dplyr::summarise(longueur_bec_max = max(longueur_bec, na.rm = TRUE))

  ggplot2::ggplot(resume, ggplot2::aes(x = espece, y = longueur_bec_max)) +
    ggplot2::geom_col() +
    ggplot2::labs(
      title = "Longueur maximale du bec par espece",
      x = "Espece",
      y = "Longueur maximale du bec")
}

utils::globalVariables(c("espece", "poids", "longueur_bec", "longueur_bec_max"))

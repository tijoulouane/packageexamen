## code to prepare `penguins` dataset goes here

#install.packages("palmerpenguins")
library(palmerpenguins)

data <- penguins
data <- na.omit(data)

# Renommer les variables

data <- data |>
  dplyr::rename(
    espece = species,
    ile = island,
    longueur_bec = bill_length_mm,
    profondeur_bec = bill_depth_mm,
    longueur_nageoire = flipper_length_mm,
    poids = body_mass_g,
    sexe = sex,
    annee = year
  )

# Bon type aux bonnes variables

data$espece <- as.factor(data$espece)
data$ile <- as.factor(data$ile)
data$sexe <- as.factor(data$sexe)

data$longueur_bec <- as.numeric(data$longueur_bec)
data$profondeur_bec <- as.numeric(data$profondeur_bec)

# Jeu de donnees utilise pour l'exercice

usethis::use_data(data, overwrite = TRUE)
# write.csv(data, "penguins.csv", row.names = FALSE)


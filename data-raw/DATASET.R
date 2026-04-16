#install.packages("palmerpenguins")
library(palmerpenguins)

data <- penguins

data <- na.omit(data)

data <- data |>
  dplyr::rename(
    espece = species,
    ile = island,
    longueur_bec = bill_length_mm,
    profondeur_bec = bill_depth_mm,
    longueur_nageoire = flipper_length_mm,
    poids = body_mass_g,
    sexe = sex,
    annee = year)

data$espece <- as.factor(data$espece)
data$ile  <- as.factor(data$ile)
data$sexe     <- as.factor(data$sexe)

data$longueur_bec <- as.numeric(data$longueur_bec)
data$profondeur_bec  <- as.numeric(data$profondeur_bec)

write.csv(data, "penguins.csv", row.names = FALSE)
usethis::use_data(penguins, overwrite = TRUE)


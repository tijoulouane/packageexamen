# test pour la première fonction

test_that("filtrer_penguins renvoie un tibble", {
  res <- filtrer_penguins(penguins, "Adelie")
  expect_s3_class(res, "tbl_df")
})

test_that("filtrer_penguins conserve uniquement l espece demandee", {
  res <- filtrer_penguins(penguins, "Adelie")
  expect_true(all(res$espece == "Adelie"))
})

test_that("filtrer_penguins renvoie 0 ligne pour une espece inconnue", {
  res <- filtrer_penguins(penguins, "lala")
  expect_equal(nrow(res), 0)
})


# Test pour la seconde fonction

test_that("moyenne_poids_espece renvoie un tibble", {
  res <- moyenne_poids_espece(penguins)
  expect_s3_class(res, "tbl_df")
})

test_that("moyenne_poids_espece renvoie une ligne par espece", {
  res <- moyenne_poids_espece(penguins)
  expect_equal(nrow(res), 3)
})

test_that("moyenne_poids_espece contient les bonnes especes", {
  res <- moyenne_poids_espece(penguins)
  expect_setequal(res$espece, c("Adelie", "Chinstrap", "Gentoo"))
})

test_that("moyenne_poids_espece renvoie une colonne numerique", {
  res <- moyenne_poids_espece(penguins)
  expect_type(res$poids_moyen, "double")
})

# Test fonction avec graphique

test_that("graphique_longueur_bec_max renvoie un objet ggplot", {
  res <- graphique_longueur_bec_max(penguins)
  expect_s3_class(res, "ggplot")
})

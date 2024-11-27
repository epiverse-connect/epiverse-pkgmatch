test_that("epi_embeddings data format", {

  epi_pkgs <- jsonlite::fromJSON("https://epiverse-connect.r-universe.dev/api/ls")

  # Not expect_setequal() because pkgmatch will ignore pkgs that do not parse
  expect_in(colnames(epi_embeddings$text_with_fns), epi_pkgs)
  expect_in(colnames(epi_embeddings$text_wo_fns), epi_pkgs)
  expect_in(colnames(epi_embeddings$code), epi_pkgs)

})

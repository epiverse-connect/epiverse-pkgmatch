# Test cases from https://github.com/epiverse-connect/epiverse-search/blob/main/design/test-cases.md

test_that("test queries return expected output", {

  # Simple cases
  expect_true(
    any(
      c("EpiNow2", "EpiEstim", "R0") %in%
      pkgmatch::pkgmatch_similar_pkgs(
        input = "Estimate the effective reproduction number",
        embeddings = epi_embeddings
      )$package[1:5]
    )
  )
  expect_true(
    any(
      c("odin", "pomp", "shinySIR") %in%
      pkgmatch::pkgmatch_similar_pkgs(
        input = "Build an SIR model",
        embeddings = epi_embeddings
      )$package[1:5]
    )
  )
  # expect_true(
  #   "epiCo" %in%
  #   pkgmatch::pkgmatch_similar_pkgs(
  #     input = "Build an endemic channel",
  #     embeddings = epi_embeddings
  #   )$package[1:3]
  # )
  expect_true(
    any(
      c("cfr", "coarseDataTools", "EpiNow2") %in%
      pkgmatch::pkgmatch_similar_pkgs(
        input = "Estimate the case fatality ratio of a new pathogen",
        embeddings = epi_embeddings
      )$package[1:5]
    )
  )
  # expect_true(
  #   "EpiNow2" %in%
  #   pkgmatch::pkgmatch_similar_pkgs(
  #     input = "Forecast new cases of Covid-19 in the next two weeks",
  #     embeddings = epi_embeddings
  #   )$package[1:5]
  # )

  # Complex cases
  expect_true(
    any(
      c("finalsize", "odin", "pomp") %in%
      pkgmatch::pkgmatch_similar_pkgs(
        input = "Determine the optimal way to distribute vaccine doses",
        embeddings = epi_embeddings
      )$package[1:5]
    )
  )
  expect_true(
    any(
      c("bpmodels", "modelSSE") %in%
      pkgmatch::pkgmatch_similar_pkgs(
        input = "Estimate the dispersion parameter of an outbreak",
        embeddings = epi_embeddings
      )$package[1:5]
    )
  )
})

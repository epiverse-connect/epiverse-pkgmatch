# Epiverse pkgmatch

<!-- badges: start -->
[![R-CMD-check](https://github.com/epiverse-connect/epiverse-pkgmatch/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/epiverse-connect/epiverse-pkgmatch/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This projects uses [rOpenSci's pkgmatch package](https://github.com/ropensci-review-tools/pkgmatch) and computes embeddings for the ecosystem of R packages in epidemiology.

## Install

To get the epidemiology embeddings, you can install this package with:

```r
remotes::install_github("epiverse-connect/epiverse-pkgmatch")
```

## Run plumber API

Once this package has been installed, you can run the plumber API with:

```r
library(plumber)
pr("plumber.R") %>%
  pr_run(port=8000)
```

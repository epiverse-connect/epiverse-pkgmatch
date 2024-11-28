## code to prepare `epi_bm25` dataset goes here

# download.file(
#   "https://epiverse-connect.r-universe.dev/api/snapshot/zip?types=src",
#   "universe-dump.zip"
# )
#
# unzip("universe-dump.zip")

source_tarballs <- fs::dir_ls("src/contrib", glob = "*.tar.gz")

names_without_version <- source_tarballs |>
  stringr::str_replace("_.*\\.tar\\.gz$", ".tar.gz")

fs::file_move(source_tarballs, names_without_version)

names(names_without_version) <- gsub(".*/([^/]*)\\.tar.gz$", "\\1", names_without_version)

# From https://github.com/ropensci-review-tools/pkgmatch/blob/main/data-raw/release-data-script.R
num_cores <- parallel::detectCores() - 2L
cl <- parallel::makeCluster(num_cores)
txt_with_fns <- pbapply::pblapply(
  names_without_version,
  function(p) pkgmatch:::get_pkg_text(p),
  cl = cl
)
parallel::stopCluster(cl)

txt_wo_fns <- pkgmatch:::rm_fns_from_pkg_txt(txt_with_fns)
idfs <- list(
  with_fns = pkgmatch:::bm25_idf(txt_with_fns),
  wo_fns = pkgmatch:::bm25_idf(txt_wo_fns)
)
token_lists <- list(
  with_fns = pkgmatch:::bm25_tokens_list(txt_with_fns),
  wo_fns = pkgmatch:::bm25_tokens_list(txt_wo_fns)
)
epi_bm25 <- list(idfs = idfs, token_lists = token_lists)

usethis::use_data(epi_bm25, overwrite = TRUE)

## code to prepare `epi_embeddings` dataset goes here

download.file(
  "https://epiverse-connect.r-universe.dev/api/snapshot/zip?types=src",
  "universe-dump.zip"
)

unzip("universe-dump.zip")

source_tarballs <- fs::dir_ls("src/contrib", glob = "*.tar.gz")

names_without_version <- source_tarballs |>
  stringr::str_replace("_.*\\.tar\\.gz$", ".tar.gz")

fs::file_move(source_tarballs, names_without_version)

epi_embeddings <- pkgmatch::pkgmatch_embeddings_from_pkgs(
  names_without_version
)

usethis::use_data(epi_embeddings, overwrite = TRUE)

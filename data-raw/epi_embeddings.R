## code to prepare `epi_embeddings` dataset goes here

download.file(
  "https://epiverse-connect.r-universe.dev/api/snapshot/zip?types=src",
  "universe-dump.zip"
)

unzip("universe-dump.zip")

epi_embeddings <- pkgmatch::pkgmatch_embeddings_from_pkgs(
  fs::dir_ls("src/contrib", glob = "*.tar.gz")
)

usethis::use_data(epi_embeddings, internal = TRUE, overwrite = TRUE)

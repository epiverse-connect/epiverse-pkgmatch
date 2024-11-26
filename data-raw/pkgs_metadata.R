## code to prepare `pkgs_metadata` dataset goes here

pkgs_metadata <- epiverse.scraper::get_pkgs_metadata("epiverse-connect")

usethis::use_data(pkgs_metadata, overwrite = TRUE)

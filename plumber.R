#* @param query The query to search for
#* @get /search
#* @serializer json
function(query) {

  # Sidestep pkgmatch feature of automatically assuming that single-words are
  # a package name by adding a trailing space
  if (!grepl(" ", query, fixed = TRUE)) {
    query <- paste0(query, " ")
  }

  matches <- pkgmatch::pkgmatch_similar_pkgs(
    input = query,
    embeddings = pkgmatch.epi::epi_embeddings
  )
  matches$relevance <- 1 / matches$rank # FIXME: use better function
  matches <- matches[, colnames(matches) != "rank"]

  matches <- merge(matches, pkgmatch.epi::pkgs_metadata)
  matches <- matches[order(matches$relevance, decreasing = TRUE), ]

  list(
    query = query,
    filter = "epiverse-connect",
    response = list(results = purrr::transpose(matches))
  )
}

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}

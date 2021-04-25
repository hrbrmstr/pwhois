#' Go WHOIS
#'
#' @param query WHOIS query
#' @param server leave `""` for the default
#' @export
whois_query <- function(query, server = "") {

  out <- .Call("R_whois_query", query, server, PACKAGE = "pwhois")

  jsonlite::fromJSON(out)

}
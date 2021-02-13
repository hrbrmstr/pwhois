open_socket <- possibly(socketConnection, "")
close_socket <- safely(close)

process_pwhois_response <- function(resp) {

  tmp <- stri_split_fixed(resp, ": ", simplify = TRUE)
  cols <- stri_replace_all_fixed(stri_trans_tolower(tmp[,1]), "-", "_")
  out <- as.data.frame(as.list(setNames(tmp[,2], cols)))

  if (hasName(out, "route_originated_ts")) {
    out[["route_originated_ts"]] <- anytime::anytime(as.numeric(out[["route_originated_ts"]]))
  }

  if (hasName(out, "cache_date")) {
    out[["cache_date"]] <- anytime::anytime(as.numeric(out[["cache_date"]]))
  }

  if (hasName(out, "latitude")) {
    out[["latitude"]] <- as.numeric(out[["latitude"]])
  }

  if (hasName(out, "longitude")) {
    out[["longitude"]] <- as.numeric(out[["latitude"]])
  }

  if (hasName(out, "modify_date")) {
    out[["modify_date"]] <- as.POSIXct(out[["modify_date"]], format = "%b %d %Y %H:%M:%S")
  }

  if (hasName(out, "create_date")) {
    out[["create_date"]] <- as.POSIXct(out[["create_date"]], format = "%b %d %Y %H:%M:%S")
  }

  if (hasName(out, "can_allocate")) {
    out[["can_allocate"]] <- as.logical(as.integer(out[["can_allocate"]]))
  }

  out

}
#' Turn a Prefix WhoIs server response into a data frame
#'
#' @param pwhois_raw_response the raw response from a call to [whois()]
#' @return data frame
#' @export
#' @examples
#' res <- whois("registry org-name=apple, inc") # 'registry' is only supported on pwhois
#' tidy_pwhois(res)
tidy_pwhois <- function(pwhois_raw_response) {

  if (any(grepl("Org-Record", pwhois_raw_response))) {

    starts <- which(grepl("Org-Record", pwhois_raw_response))
    ends <- c(starts[-1]-1, length(pwhois_raw_response))

    mapply(
      FUN = function(start, end) process_pwhois_response(pwhois_raw_response[start:end]),
      starts, ends, SIMPLIFY = FALSE
    ) -> out

    bind_rows(out)

  } else {
    process_pwhois_response(pwhois_raw_response)
  }

}

#' Turn a Team Cymru server response into a data frame
#'
#' @param cymru_raw_response the raw response from a call to [whois()]
#' @return data frame
#' @export
#' @examples
#' res <- whois('type=cymru 17.253.144.10') # 'type=cymru' is only supported on pwhois
#' tidy_pwhois(res)
tidy_cymru <- function(cymru_raw_response) {

  tmp <- stri_split_fixed(cymru_raw_response, "|", simplify = TRUE)
  tmp <- apply(tmp, c(1, 2), stri_trim_both)

  stri_replace_all_regex(
    stri_trans_tolower(tmp[1,]),
    "[ -]", " "
  ) -> cols

  set_names(
    as.data.frame(tmp[2:nrow(tmp),1:ncol(tmp), drop=FALSE]),
    cols
  )

}

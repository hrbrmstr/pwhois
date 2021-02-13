#' Issue a 'WHOIS' query and retrieve the response
#'
#' WHOIS (pronounced as the phrase "who is") is a query and response protocol
#' that is widely used for querying databases that store the registered users
#' or assignees of an Internet resource, such as a domain name, an IP address
#' block or an autonomous system, but is also used for a wider range of other
#' information. The protocol stores and delivers database content in a human-
#' readable format. The current iteration of the WHOIS protocol was drafted
#' by the Internet Society, and is documented in RFC 3912.
#'
#' The default server — `whois.pwhois.org` — is [The Prefix WhoIs Project](https://pwhois.org/)
#' WHOIS server which provides a whois-compatible client and server framework for
#' disclosing various up-to-date routing information. Instead of using
#' registrar-originated network information (which is often unspecific or
#' inaccurate), Prefix WhoIs uses the Internet's global routing table as
#' gleaned from a number of routing peers around the world. Other sources of
#' information, such as imported data from ARIN are also supported.
#'
#' The pwhois service supports special query types including:
#'
#' - `registry key=value`: you can search the pwhois database for any registry
#'    field. The ones available at the time of the date on
#'    this package are: "`Origin-AS`", "`Prefix"`, "`AS-Path"`,
#'    "`AS-Org-Name`", "`Org-Name`", "`Net-Name`", "`Cache-Date`",
#'    "`Latitude`", "`Longitude`", "`City"`, "`Region"` ,
#'    "`Country"` , and "`Country-Code`"
#' - `type=cymru`: The record(s) will be returned in
#'    [Team Cymru format](https://team-cymru.com/community-services/ip-asn-mapping/)
#'    and [tidy_cymru()] can be used to post-process the response.
#' - `type=rpsl`: The record(s) will be returned in
#'    [Routing Policy Specification Language](https://tools.ietf.org/html/rfc2650)
#'   (RPSL) format. A 'tidy' post-processor is on the TODO list. PRs are welcome.
#'
#' This function can also be used to query the
#' [Team Cymru WHOIS](https://team-cymru.com/community-services/ip-asn-mapping/)
#' server which supports various enhanced queries. See the link for more
#' information. [tidy_cymru()] can be used to post-process these responses.
#'
#' @param query &lt;chr> the text query to send to the destination whois `host`
#' @param host  &lt;chr> the WHOIS host to query; This defaults to
#'        [The Prefix WhoIs Project](https://pwhois.org/) WHOIS server
#'        (a.k.a. "pwhois") as it allows for more robust queries to be performed.
#' @param port  &lt;int> TCP port the `host` WHOIS server is running on;
#'        defaults to `43` (the standard WHOIS port)
#' @param timeout connection timeout; see [connections]
#' @return raw character response from the `host` WHOIS server. Use
#'         the built-in tidying functions to post-process the response.
#' @export
#' @examples
#' whois("registry org-name=apple, inc") # 'registry' is only supported on pwhois
#' whois('type=cymru 17.253.144.10') # 'type=cymru' is only supported on pwhois
#' whois('type=rpsl 17.253.144.10') # 'type=rpsl' is only supported on pwhois
#' whois('-v AS23028', "whois.cymru.com") # this only works with the Team Cymru WHOIS service
#' whois("17.253.144.10")
whois <- function(query, host = "whois.pwhois.org", port = 43L,
                  timeout = getOption("timeout")) {

  query <- as.character(query[1])
  host <- as.character(host[1])
  port <- as.integer(port[1])

  if (!endsWith(query, "\n")) query <- sprintf("%s\n", query)

  open_socket(
    host = host,
    port = port,
    blocking = TRUE,
    open = "r+",
    timeout = timeout
  ) -> con

  on.exit(close_socket(con))

  if (!inherits(con, "sockconn")) {
    warning(sprintf("Error opening connection to %s:%s", query, port))
    return(NA_character_)
  }

  cat(query, file = con)

  res <- readLines(con)

  res

}


[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/pwhois.svg?branch=master)](https://travis-ci.org/hrbrmstr/pwhois)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.5.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# pwhois

Issue ‘WHOIS’ Queries and Process Various ‘WHOIS’ Resoponses

## Description

WHOIS (pronounced as the phrase “who is”) is a query and response
protocol that is widely used for querying databases that store the
registered users or assignees of an Internet resource, such as a domain
name, an IP address block or an autonomous system, but is also used for
a wider range of other information. The protocol stores and delivers
database content in a human- readable format. The current iteration of
the WHOIS protocol was drafted by the Internet Society, and is
documented in RFC 3912. Tools are provided to issue query requests and
process query responses.

## What’s Inside The Tin

The following functions are implemented:

-   `tidy_cymru`: Turn a Team Cymru server response into a data frame
-   `tidy_pwhois`: Turn a Prefix WhoIs server response into a data frame
-   `whois`: Issue a ‘WHOIS’ query and retrieve the response

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/pwhois.git")
# or
remotes::install_gitlab("hrbrmstr/pwhois")
# or
remotes::install_bitbucket("hrbrmstr/pwhois")
# or
remotes::install_github("hrbrmstr/pwhois")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(pwhois)

# current version
packageVersion("pwhois")
## [1] '0.1.0'
```

A basic query:

``` {ex-01}
(res <- whois("17.253.144.10"))

str(tidy_pwhois(res), 1)
```

The Prefix WhoIs project supports some advanced queries including the
ability to search on any of their WHOIS registry fields:

``` r
(res <- whois("registry org-name=apple, inc"))
##   [1] "Org-Record: 0"                                   "Org-ID: GRNA"                                   
##   [3] "Org-Name: Green Apple, Inc."                     "Can-Allocate: 0"                                
##   [5] "Street-1: 5222 33rd Street SE"                   "City: Grand Rapids"                             
##   [7] "State: MI"                                       "Postal-Code: 49512-2070"                        
##   [9] "Country: US"                                     "Register-Date: 1997-12-19"                      
##  [11] "Update-Date: 2011-09-24"                         "Create-Date: Nov 23 2005 02:48:10"              
##  [13] "Modify-Date: Feb 13 2021 01:35:47"               "Admin-0-Handle: INE-ARIN"                       
##  [15] "NOC-0-Handle: INE-ARIN"                          "Abuse-0-Handle: INE-ARIN"                       
##  [17] "Tech-0-Handle: INE-ARIN"                         "Referral-Server: rwhois://rwhois.iserv.net:4321"
##  [19] "Comment: http://www.greenapple.com"              "Org-Record: 1"                                  
##  [21] "Org-ID: Network of Apple, Inc."                  "Org-Name: Network of Apple, Inc."               
##  [23] "Can-Allocate: 1"                                 "Register-Date: 2011-03-02"                      
##  [25] "Update-Date: 2011-03-02"                         "Create-Date: Mar 01 2011 13:07:13"              
##  [27] "Modify-Date: Mar 01 2011 13:07:13"               "Org-Record: 2"                                  
##  [29] "Org-ID: C03342993"                               "Org-Name: APPLE, INC - CORP PROJECT"            
##  [31] "Can-Allocate: 0"                                 "Street-1: 1 INFINITE LOOP # MS60"               
##  [33] "City: CUPERTINO"                                 "State: CA"                                      
##  [35] "Postal-Code: 95014-2083"                         "Country: US"                                    
##  [37] "Register-Date: 2013-03-14"                       "Update-Date: 2013-03-14"                        
##  [39] "Create-Date: May 30 2013 16:03:51"               "Modify-Date: Feb 13 2021 01:35:47"              
##  [41] "Org-Record: 3"                                   "Org-ID: C03342938"                              
##  [43] "Org-Name: APPLE, INC - CORP PROJECT"             "Can-Allocate: 0"                                
##  [45] "Street-1: 1 INFINITE LOOP # MS60"                "City: CUPERTINO"                                
##  [47] "State: CA"                                       "Postal-Code: 95014-2083"                        
##  [49] "Country: US"                                     "Register-Date: 2013-03-14"                      
##  [51] "Update-Date: 2013-03-14"                         "Create-Date: May 30 2013 16:03:51"              
##  [53] "Modify-Date: Feb 13 2021 01:35:47"               "Org-Record: 4"                                  
##  [55] "Org-ID: C03342954"                               "Org-Name: APPLE, INC - CORP PROJECT"            
##  [57] "Can-Allocate: 0"                                 "Street-1: 1 INFINITE LOOP # MS60"               
##  [59] "City: CUPERTINO"                                 "State: CA"                                      
##  [61] "Postal-Code: 95014-2083"                         "Country: US"                                    
##  [63] "Register-Date: 2013-03-14"                       "Update-Date: 2013-03-14"                        
##  [65] "Create-Date: May 30 2013 16:03:51"               "Modify-Date: Feb 13 2021 01:35:47"              
##  [67] "Org-Record: 5"                                   "Org-ID: Network of  Apple, Inc."                
##  [69] "Org-Name: Network of  Apple, Inc."               "Can-Allocate: 1"                                
##  [71] "Register-Date: 2013-05-31"                       "Update-Date: 2013-05-31"                        
##  [73] "Create-Date: May 30 2013 18:55:56"               "Modify-Date: May 30 2013 18:55:56"              
##  [75] "Org-Record: 6"                                   "Org-ID: C04676970"                              
##  [77] "Org-Name: APPLE, INC - CORP PROJECT"             "Can-Allocate: 0"                                
##  [79] "Street-1: 1 INFINITE LOOP # MS60"                "City: CUPERTINO"                                
##  [81] "State: CA"                                       "Postal-Code: 95014-2083"                        
##  [83] "Country: US"                                     "Register-Date: 2013-08-21"                      
##  [85] "Update-Date: 2013-08-21"                         "Create-Date: Aug 23 2013 02:32:19"              
##  [87] "Modify-Date: Feb 13 2021 01:35:47"               "Org-Record: 7"                                  
##  [89] "Org-ID: C04716251"                               "Org-Name: APPLE, INC - RETAIL PROJECT"          
##  [91] "Can-Allocate: 0"                                 "Street-1: 1500 POLARIS PKWY"                    
##  [93] "City: COLUMBUS"                                  "State: OH"                                      
##  [95] "Postal-Code: 43240"                              "Country: US"                                    
##  [97] "Register-Date: 2013-09-30"                       "Update-Date: 2013-09-30"                        
##  [99] "Create-Date: Oct 02 2013 01:52:33"               "Modify-Date: Mar 23 2015 08:01:17"              
## [101] "Org-Record: 8"                                   "Org-ID: Apple, Inc."                            
## [103] "Org-Name: Apple, Inc."                           "Can-Allocate: 1"                                
## [105] "Register-Date: 2014-10-19"                       "Update-Date: 2014-10-19"                        
## [107] "Create-Date: Oct 18 2014 05:49:09"               "Modify-Date: Oct 18 2014 05:49:09"              
## [109] "Org-Record: 9"                                   "Org-ID: C06092907"                              
## [111] "Org-Name: Apple, Inc IP - MRC"                   "Can-Allocate: 0"                                
## [113] "Street-1: 21625 Gresham Dr"                      "City: Ashburn"                                  
## [115] "State: VA"                                       "Postal-Code: 20147"                             
## [117] "Country: US"                                     "Register-Date: 2016-04-14"                      
## [119] "Update-Date: 2016-06-21"                         "Create-Date: Dec 13 2016 10:45:20"              
## [121] "Modify-Date: Feb 13 2021 01:35:47"               "Org-Record: 10"                                 
## [123] "Org-ID: C07098191"                               "Org-Name: APPLE, INC.-COLOCATION - APPLE, INC." 
## [125] "Can-Allocate: 0"                                 "Street-1: 340 CUMBERLAND AVE"                   
## [127] "City: PORTLAND"                                  "State: ME"                                      
## [129] "Postal-Code: 04101"                              "Country: US"                                    
## [131] "Register-Date: 2018-10-24"                       "Update-Date: 2018-10-24"                        
## [133] "Create-Date: Oct 26 2018 02:13:03"               "Modify-Date: Feb 13 2021 01:35:47"

tibble::as_tibble(tidy_pwhois(res))
## # A tibble: 11 x 19
##    org_record org_id org_name can_allocate street_1 city  state postal_code country register_date update_date
##    <chr>      <chr>  <chr>    <lgl>        <chr>    <chr> <chr> <chr>       <chr>   <chr>         <chr>      
##  1 0          GRNA   Green A… FALSE        5222 33… Gran… MI    49512-2070  US      1997-12-19    2011-09-24 
##  2 1          Netwo… Network… TRUE         <NA>     <NA>  <NA>  <NA>        <NA>    2011-03-02    2011-03-02 
##  3 2          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  4 3          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  5 4          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  6 5          Netwo… Network… TRUE         <NA>     <NA>  <NA>  <NA>        <NA>    2013-05-31    2013-05-31 
##  7 6          C0467… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-08-21    2013-08-21 
##  8 7          C0471… APPLE, … FALSE        1500 PO… COLU… OH    43240       US      2013-09-30    2013-09-30 
##  9 8          Apple… Apple, … TRUE         <NA>     <NA>  <NA>  <NA>        <NA>    2014-10-19    2014-10-19 
## 10 9          C0609… Apple, … FALSE        21625 G… Ashb… VA    20147       US      2016-04-14    2016-06-21 
## 11 10         C0709… APPLE, … FALSE        340 CUM… PORT… ME    04101       US      2018-10-24    2018-10-24 
## # … with 8 more variables: create_date <dttm>, modify_date <dttm>, admin_0_handle <chr>, noc_0_handle <chr>,
## #   abuse_0_handle <chr>, tech_0_handle <chr>, referral_server <chr>, comment <chr>
```

and can return results in different formats including Team Cymru tables:

``` r
(res <- whois('type=cymru 17.253.144.10'))
## [1] "AS      | IP               | ORG NAME                      | CC | NET NAME                         | AS ORG NAME"
## [2] "714     | 17.253.144.10    | Apple Inc.                    | US | APPLE-WWNET                      | Apple Inc."

str(tidy_cymru(res), 1)
## 'data.frame':    1 obs. of  6 variables:
##  $ as         : chr "714"
##  $ ip         : chr "17.253.144.10"
##  $ org name   : chr "Apple Inc."
##  $ cc         : chr "US"
##  $ net name   : chr "APPLE-WWNET"
##  $ as org name: chr "Apple Inc."
```

That `tidy_cymru()` function can be used on responses from the Team
Cymru WHOIS service as well:

``` r
(res <- whois('-v AS23028', "whois.cymru.com"))
## [1] "AS      | CC | Registry | Allocated  | AS Name"        "23028   | US | arin     | 2002-01-04 | TEAM-CYMRU, US"

str(tidy_cymru(res))
## 'data.frame':    1 obs. of  5 variables:
##  $ as       : chr "23028"
##  $ cc       : chr "US"
##  $ registry : chr "arin"
##  $ allocated: chr "2002-01-04"
##  $ as name  : chr "TEAM-CYMRU, US"
```

The Prefix WhoIs project can also return responses in Routing Policy
Specification Language (RPSL), but there is no ‘tidy’ function for this
format yet:

``` r
whois('type=rpsl 17.253.144.10') 
## [1] "Origin: AS714"                                       "Route: 17.253.144.0/21"                             
## [3] "Date: 20210213"                                      "AS-Org-Name: Apple Inc."                            
## [5] "Org-Name: Apple Inc."                                "Net-Name: APPLE-WWNET"                              
## [7] "Source: PWHOIS Server 208.74.248.120:43 at 20210213"
```

## pwhois Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines | (%) | \# Lines |  (%) |
|:-----|---------:|-----:|----:|-----:|------------:|----:|---------:|-----:|
| R    |        7 | 0.44 | 303 | 0.47 |         110 | 0.4 |      196 | 0.41 |
| Rmd  |        1 | 0.06 |  17 | 0.03 |          29 | 0.1 |       44 | 0.09 |
| SUM  |        8 | 0.50 | 320 | 0.50 |         139 | 0.5 |      240 | 0.50 |

clock Package Metrics for pwhois

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.

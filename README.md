---
output: rmarkdown::github_document
editor_options: 
  chunk_output_type: console
---


 [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
 [![Signed by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
 ![Signed commit %](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
  [![Linux build Status](https://travis-ci.org/hrbrmstr/pwhois.svg?branch=master)](https://travis-ci.org/hrbrmstr/pwhois)   
  ![Minimal R Version](https://img.shields.io/badge/R%3E%3D-3.5.0-blue.svg)
 ![License](https://img.shields.io/badge/License-MIT-blue.svg) 
 


# pwhois

Issue 'WHOIS' Queries and Process Various 'WHOIS' Resoponses

## Description

WHOIS (pronounced as the phrase "who is") is a query and response protocol
that is widely used for querying databases that store the registered users
or assignees of an Internet resource, such as a domain name, an IP address
block or an autonomous system, but is also used for a wider range of other
information. The protocol stores and delivers database content in a human-
readable format. The current iteration of the WHOIS protocol was drafted
by the Internet Society, and is documented in RFC 3912. Tools are provided
to issue query requests and process query responses.

## What's Inside The Tin

The following functions are implemented:

- `tidy_cymru`: Turn a Team Cymru server response into a data frame
- `tidy_pwhois`: Turn a Prefix WhoIs server response into a data frame
- `whois_query`: Go WHOIS
- `whois`: Issue a 'WHOIS' query and retrieve the response

## Installation

There is now a Golang dependency, which means you're better off doing:

```
git clone --recurse-submodules -j8 git@github.com:hrbrmstr/pwhois.git
```

and building from RStudio or the command line.

## Usage


```r
library(pwhois)

# current version
packageVersion("pwhois")
## [1] '0.1.0'
```

A basic query:

```{ex-01}
(res <- whois("17.253.144.10"))

str(tidy_pwhois(res), 1)
```

The Prefix WhoIs project supports some advanced queries including the ability to search on any of their WHOIS registry fields:


```r
(res <- whois("registry org-name=apple, inc"))
##   [1] "Org-Record: 0"                                   "Org-ID: GRNA"                                   
##   [3] "Org-Name: Green Apple, Inc."                     "Can-Allocate: 0"                                
##   [5] "Street-1: 5222 33rd Street SE"                   "City: Grand Rapids"                             
##   [7] "State: MI"                                       "Postal-Code: 49512-2070"                        
##   [9] "Country: US"                                     "Register-Date: 1997-12-19"                      
##  [11] "Update-Date: 2011-09-24"                         "Create-Date: Nov 23 2005 02:48:10"              
##  [13] "Modify-Date: Apr 24 2021 02:02:02"               "Admin-0-Handle: INE-ARIN"                       
##  [15] "NOC-0-Handle: INE-ARIN"                          "Abuse-0-Handle: INE-ARIN"                       
##  [17] "Tech-0-Handle: INE-ARIN"                         "Referral-Server: rwhois://rwhois.iserv.net:4321"
##  [19] "Comment: http://www.greenapple.com"              "Org-Record: 1"                                  
##  [21] "Org-ID: Network of Apple, Inc."                  "Org-Name: Network of Apple, Inc."               
##  [23] "Can-Allocate: 1"                                 "Country: IT"                                    
##  [25] "Register-Date: 2014-11-19"                       "Update-Date: 2015-05-26"                        
##  [27] "Create-Date: Mar 01 2011 13:07:13"               "Modify-Date: Apr 24 2021 00:01:35"              
##  [29] "NOC-0-Handle: EU-IBM-NIC-MNT"                    "Abuse-0-Handle: DUMY-RIPE"                      
##  [31] "Tech-0-Handle: DUMY-RIPE"                        "Org-Record: 2"                                  
##  [33] "Org-ID: C03342993"                               "Org-Name: APPLE, INC - CORP PROJECT"            
##  [35] "Can-Allocate: 0"                                 "Street-1: 1 INFINITE LOOP # MS60"               
##  [37] "City: CUPERTINO"                                 "State: CA"                                      
##  [39] "Postal-Code: 95014-2083"                         "Country: US"                                    
##  [41] "Register-Date: 2013-03-14"                       "Update-Date: 2013-03-14"                        
##  [43] "Create-Date: May 30 2013 16:03:51"               "Modify-Date: Apr 24 2021 02:02:02"              
##  [45] "Org-Record: 3"                                   "Org-ID: C03342938"                              
##  [47] "Org-Name: APPLE, INC - CORP PROJECT"             "Can-Allocate: 0"                                
##  [49] "Street-1: 1 INFINITE LOOP # MS60"                "City: CUPERTINO"                                
##  [51] "State: CA"                                       "Postal-Code: 95014-2083"                        
##  [53] "Country: US"                                     "Register-Date: 2013-03-14"                      
##  [55] "Update-Date: 2013-03-14"                         "Create-Date: May 30 2013 16:03:51"              
##  [57] "Modify-Date: Apr 24 2021 02:02:02"               "Org-Record: 4"                                  
##  [59] "Org-ID: C03342954"                               "Org-Name: APPLE, INC - CORP PROJECT"            
##  [61] "Can-Allocate: 0"                                 "Street-1: 1 INFINITE LOOP # MS60"               
##  [63] "City: CUPERTINO"                                 "State: CA"                                      
##  [65] "Postal-Code: 95014-2083"                         "Country: US"                                    
##  [67] "Register-Date: 2013-03-14"                       "Update-Date: 2013-03-14"                        
##  [69] "Create-Date: May 30 2013 16:03:51"               "Modify-Date: Apr 24 2021 02:02:02"              
##  [71] "Org-Record: 5"                                   "Org-ID: Network of  Apple, Inc."                
##  [73] "Org-Name: Network of  Apple, Inc."               "Can-Allocate: 1"                                
##  [75] "Register-Date: 2013-05-31"                       "Update-Date: 2013-05-31"                        
##  [77] "Create-Date: May 30 2013 18:55:56"               "Modify-Date: May 30 2013 18:55:56"              
##  [79] "Org-Record: 6"                                   "Org-ID: C04676970"                              
##  [81] "Org-Name: APPLE, INC - CORP PROJECT"             "Can-Allocate: 0"                                
##  [83] "Street-1: 1 INFINITE LOOP # MS60"                "City: CUPERTINO"                                
##  [85] "State: CA"                                       "Postal-Code: 95014-2083"                        
##  [87] "Country: US"                                     "Register-Date: 2013-08-21"                      
##  [89] "Update-Date: 2013-08-21"                         "Create-Date: Aug 23 2013 02:32:19"              
##  [91] "Modify-Date: Apr 24 2021 02:02:02"               "Org-Record: 7"                                  
##  [93] "Org-ID: C04716251"                               "Org-Name: APPLE, INC - RETAIL PROJECT"          
##  [95] "Can-Allocate: 0"                                 "Street-1: 1500 POLARIS PKWY"                    
##  [97] "City: COLUMBUS"                                  "State: OH"                                      
##  [99] "Postal-Code: 43240"                              "Country: US"                                    
## [101] "Register-Date: 2013-09-30"                       "Update-Date: 2013-09-30"                        
## [103] "Create-Date: Oct 02 2013 01:52:33"               "Modify-Date: Mar 23 2015 08:01:17"              
## [105] "Org-Record: 8"                                   "Org-ID: Apple, Inc."                            
## [107] "Org-Name: Apple, Inc."                           "Can-Allocate: 1"                                
## [109] "Country: US"                                     "Register-Date: 2016-05-19"                      
## [111] "Update-Date: 2016-05-19"                         "Create-Date: Oct 18 2014 05:49:09"              
## [113] "Modify-Date: Apr 24 2021 00:01:35"               "NOC-0-Handle: HRW-NOC"                          
## [115] "Abuse-0-Handle: DUMY-RIPE"                       "Tech-0-Handle: DUMY-RIPE"                       
## [117] "Org-Record: 9"                                   "Org-ID: C06092907"                              
## [119] "Org-Name: Apple, Inc IP - MRC"                   "Can-Allocate: 0"                                
## [121] "Street-1: 21625 Gresham Dr"                      "City: Ashburn"                                  
## [123] "State: VA"                                       "Postal-Code: 20147"                             
## [125] "Country: US"                                     "Register-Date: 2016-04-14"                      
## [127] "Update-Date: 2016-06-21"                         "Create-Date: Dec 13 2016 10:45:20"              
## [129] "Modify-Date: Apr 24 2021 02:02:02"               "Org-Record: 10"                                 
## [131] "Org-ID: C07098191"                               "Org-Name: APPLE, INC.-COLOCATION - APPLE, INC." 
## [133] "Can-Allocate: 0"                                 "Street-1: 340 CUMBERLAND AVE"                   
## [135] "City: PORTLAND"                                  "State: ME"                                      
## [137] "Postal-Code: 04101"                              "Country: US"                                    
## [139] "Register-Date: 2018-10-24"                       "Update-Date: 2018-10-24"                        
## [141] "Create-Date: Oct 26 2018 02:13:03"               "Modify-Date: Apr 24 2021 02:02:02"

tibble::as_tibble(tidy_pwhois(res))
## # A tibble: 11 x 19
##    org_record org_id org_name can_allocate street_1 city  state postal_code country register_date update_date
##    <chr>      <chr>  <chr>    <lgl>        <chr>    <chr> <chr> <chr>       <chr>   <chr>         <chr>      
##  1 0          GRNA   Green A… FALSE        5222 33… Gran… MI    49512-2070  US      1997-12-19    2011-09-24 
##  2 1          Netwo… Network… TRUE         <NA>     <NA>  <NA>  <NA>        IT      2014-11-19    2015-05-26 
##  3 2          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  4 3          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  5 4          C0334… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-03-14    2013-03-14 
##  6 5          Netwo… Network… TRUE         <NA>     <NA>  <NA>  <NA>        <NA>    2013-05-31    2013-05-31 
##  7 6          C0467… APPLE, … FALSE        1 INFIN… CUPE… CA    95014-2083  US      2013-08-21    2013-08-21 
##  8 7          C0471… APPLE, … FALSE        1500 PO… COLU… OH    43240       US      2013-09-30    2013-09-30 
##  9 8          Apple… Apple, … TRUE         <NA>     <NA>  <NA>  <NA>        US      2016-05-19    2016-05-19 
## 10 9          C0609… Apple, … FALSE        21625 G… Ashb… VA    20147       US      2016-04-14    2016-06-21 
## 11 10         C0709… APPLE, … FALSE        340 CUM… PORT… ME    04101       US      2018-10-24    2018-10-24 
## # … with 8 more variables: create_date <dttm>, modify_date <dttm>, admin_0_handle <chr>, noc_0_handle <chr>,
## #   abuse_0_handle <chr>, tech_0_handle <chr>, referral_server <chr>, comment <chr>
```

and can return results in different formats including Team Cymru tables:


```r
(res <- whois('type=cymru 17.253.144.10'))
## [1] "AS      | IP               | ORG NAME                      | CC | NET NAME                         | AS ORG NAME"
## [2] "714     | 17.253.144.10    | Apple Inc.                    | US | APPLE-WWNET                      | Apple Inc."

str(tidy_cymru(res), 1)
## 'data.frame':  1 obs. of  6 variables:
##  $ as         : chr "714"
##  $ ip         : chr "17.253.144.10"
##  $ org name   : chr "Apple Inc."
##  $ cc         : chr "US"
##  $ net name   : chr "APPLE-WWNET"
##  $ as org name: chr "Apple Inc."
```

That `tidy_cymru()` function can be used on responses from the Team Cymru 
WHOIS service as well:


```r
(res <- whois('-v AS23028', "whois.cymru.com"))
## [1] "AS      | CC | Registry | Allocated  | AS Name"        "23028   | US | arin     | 2002-01-04 | TEAM-CYMRU, US"

str(tidy_cymru(res))
## 'data.frame':  1 obs. of  5 variables:
##  $ as       : chr "23028"
##  $ cc       : chr "US"
##  $ registry : chr "arin"
##  $ allocated: chr "2002-01-04"
##  $ as name  : chr "TEAM-CYMRU, US"
```

The Prefix WhoIs project can also return responses in Routing Policy Specification Language (RPSL), but there is no 'tidy' function for this format yet:


```r
whois('type=rpsl 17.253.144.10') 
## [1] "Origin: AS714"                                       "Route: 17.253.144.0/21"                             
## [3] "Date: 20210424"                                      "AS-Org-Name: Apple Inc."                            
## [5] "Org-Name: Apple Inc."                                "Net-Name: APPLE-WWNET"                              
## [7] "Source: PWHOIS Server 208.74.248.120:43 at 20210424"
```

Old-school WHOIS


```r
str(pwhois::whois_query("r-project.org"), 2)
## List of 5
##  $ domain        :List of 11
##   ..$ id             : chr "D11753086-LROR"
##   ..$ domain         : chr "r-project.org"
##   ..$ punycode       : chr "r-project.org"
##   ..$ name           : chr "r-project"
##   ..$ extension      : chr "org"
##   ..$ whois_server   : chr "whois.gandi.net"
##   ..$ status         : chr "clienttransferprohibited"
##   ..$ name_servers   : chr [1:4] "ns1.wu-wien.ac.at" "ns2.wu-wien.ac.at" "ns1.urbanek.info" "ns2.urbanek.info"
##   ..$ created_date   : chr "1999-10-27T14:39:07Z"
##   ..$ updated_date   : chr "2019-07-03T14:01:15Z"
##   ..$ expiration_date: chr "2023-10-27T15:39:07Z"
##  $ registrar     :List of 5
##   ..$ id          : chr "81"
##   ..$ name        : chr "GANDI SAS"
##   ..$ phone       : chr "+33.170377661"
##   ..$ email       : chr "abuse@support.gandi.net"
##   ..$ referral_url: chr "http://www.gandi.net"
##  $ registrant    :List of 10
##   ..$ id          : chr "REDACTED FOR PRIVACY"
##   ..$ name        : chr "REDACTED FOR PRIVACY"
##   ..$ organization: chr "R Foundation for Statistical Computing"
##   ..$ street      : chr "REDACTED FOR PRIVACY"
##   ..$ city        : chr "REDACTED FOR PRIVACY"
##   ..$ postal_code : chr "REDACTED FOR PRIVACY"
##   ..$ country     : chr "AT"
##   ..$ phone       : chr "REDACTED FOR PRIVACY"
##   ..$ fax         : chr "REDACTED FOR PRIVACY"
##   ..$ email       : chr "add47e049106e1f37ddc6277e9d401d8-1071757@contact.gandi.net"
##  $ administrative:List of 10
##   ..$ id         : chr "REDACTED FOR PRIVACY"
##   ..$ name       : chr "REDACTED FOR PRIVACY"
##   ..$ street     : chr "63-65 boulevard Massena"
##   ..$ city       : chr "Paris"
##   ..$ province   : chr "Paris"
##   ..$ postal_code: chr "75013"
##   ..$ country    : chr "FR"
##   ..$ phone      : chr "+33.170377666"
##   ..$ fax        : chr "+33.143730576"
##   ..$ email      : chr "be8b14b26f4e2a7daecefa6c20056f57-838661@contact.gandi.net"
##  $ technical     :List of 10
##   ..$ id         : chr "REDACTED FOR PRIVACY"
##   ..$ name       : chr "REDACTED FOR PRIVACY"
##   ..$ street     : chr "63-65 boulevard Massena"
##   ..$ city       : chr "Paris"
##   ..$ province   : chr "Paris"
##   ..$ postal_code: chr "75013"
##   ..$ country    : chr "FR"
##   ..$ phone      : chr "+33.170377666"
##   ..$ fax        : chr "+33.143730576"
##   ..$ email      : chr "be8b14b26f4e2a7daecefa6c20056f57-838661@contact.gandi.net"
```

## pwhois Metrics


Table: cloc Package Metrics for pwhois

|Lang         | # Files|  (%)|    LoC|  (%)| Blank lines|  (%)| # Lines| (%)|
|:------------|-------:|----:|------:|----:|-----------:|----:|-------:|---:|
|Go           |    1031| 0.40| 787752| 0.49|       21936| 0.48|   80696| 0.5|
|JSON         |     183| 0.07|   9131| 0.01|           0| 0.00|       0| 0.0|
|XML          |       6| 0.00|   5802| 0.00|         228| 0.00|      20| 0.0|
|HTML         |      10| 0.00|   2214| 0.00|         441| 0.01|      16| 0.0|
|R            |       8| 0.00|    307| 0.00|         113| 0.00|     203| 0.0|
|Forth        |       3| 0.00|    303| 0.00|          24| 0.00|       0| 0.0|
|ReasonML     |       2| 0.00|    201| 0.00|          16| 0.00|       0| 0.0|
|HCL          |       2| 0.00|    192| 0.00|          16| 0.00|       0| 0.0|
|Perl         |       2| 0.00|    191| 0.00|          16| 0.00|       0| 0.0|
|C++          |       2| 0.00|    134| 0.00|          19| 0.00|       0| 0.0|
|Prolog       |       2| 0.00|    134| 0.00|          24| 0.00|       0| 0.0|
|m4           |       2| 0.00|    132| 0.00|          17| 0.00|       0| 0.0|
|Bourne Shell |       3| 0.00|    109| 0.00|          20| 0.00|       0| 0.0|
|Tcl/Tk       |       2| 0.00|     86| 0.00|          18| 0.00|       0| 0.0|
|Rust         |       2| 0.00|     65| 0.00|          18| 0.00|       0| 0.0|
|Dockerfile   |       2| 0.00|     52| 0.00|          20| 0.00|      15| 0.0|
|C/C++ Header |       1| 0.00|     48| 0.00|          27| 0.00|      10| 0.0|
|YAML         |       2| 0.00|     45| 0.00|           0| 0.00|       0| 0.0|
|xBase Header |       2| 0.00|     40| 0.00|          12| 0.00|       0| 0.0|
|Ruby         |       2| 0.00|     34| 0.00|           8| 0.00|       0| 0.0|
|C            |       1| 0.00|     30| 0.00|          20| 0.00|       4| 0.0|
|make         |       2| 0.00|     25| 0.00|           7| 0.00|       4| 0.0|
|Assembly     |       6| 0.00|     18| 0.00|          16| 0.00|      25| 0.0|
|Rmd          |       1| 0.00|     17| 0.00|          33| 0.00|      50| 0.0|
|SUM          |    1279| 0.50| 807062| 0.50|       23049| 0.50|   81043| 0.5|

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. 
By participating in this project you agree to abide by its terms.

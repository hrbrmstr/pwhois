package main

/*
  #define USE_RINTERNALS
  #include <R.h>
  #include <Rinternals.h>

  SEXP MakeChar(char *json);

*/
import "C"
import "github.com/likexian/gokit/xjson"
import "github.com/likexian/whois"
import whoisparser "github.com/likexian/whois-parser"

//export whois_query
func whois_query(input string, server string) C.SEXP {

  text, err := whois.Whois(input, server)
  if err != nil { return(C.R_NilValue) }

  info, err := whoisparser.Parse(text)
  if err != nil { return(C.R_NilValue) }

  data, err := xjson.PrettyDumps(info)
  if err != nil { return(C.R_NilValue) }

  //return(C.R_NilValue)
  return(C.MakeChar(C.CString(data)))

}

func main() {}
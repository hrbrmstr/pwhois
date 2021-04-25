#include "_cgo_export.h"

#include <R_ext/Rdynload.h>

#include <stdlib.h>
#include <string.h>

// This gets called from Go and returns a character vector
SEXP MakeChar(char *json) {

  if (json != NULL) {

    SEXP value_vec = PROTECT(allocVector(STRSXP, 1));
    SET_STRING_ELT(value_vec, 0, mkChar(json));
    UNPROTECT(1);

    return(value_vec);

  } else {
    return(R_NilValue);
  }

}

// The thing we're going to call from a .R file
// It calls the Go `whois_query()` function which, in turn, calls MakeChar() above

SEXP R_whois_query(SEXP query, SEXP server) {

  SEXP squery = STRING_ELT(query, 0);
  SEXP sserver = STRING_ELT(server, 0);

  GoString hquery = { (char*) CHAR(squery), Rf_xlength(squery) };
  GoString hserver = { (char*) CHAR(sserver), Rf_xlength(sserver) };

  SEXP out = whois_query(hquery, hserver);

  return(out);

}

// Required "registration" code by CRAN

static const R_CallMethodDef CallEntries[] = {
  {"R_whois_query", (DL_FUNC) &R_whois_query, 2},
  {NULL, NULL, 0}
};

void R_init_pwhois(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}



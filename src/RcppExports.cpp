// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// subDistCpp
NumericVector subDistCpp(NumericVector dist, IntegerVector idx, bool diag, bool upper, int N, int n);
RcppExport SEXP _easyDist_subDistCpp(SEXP distSEXP, SEXP idxSEXP, SEXP diagSEXP, SEXP upperSEXP, SEXP NSEXP, SEXP nSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type dist(distSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type idx(idxSEXP);
    Rcpp::traits::input_parameter< bool >::type diag(diagSEXP);
    Rcpp::traits::input_parameter< bool >::type upper(upperSEXP);
    Rcpp::traits::input_parameter< int >::type N(NSEXP);
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    rcpp_result_gen = Rcpp::wrap(subDistCpp(dist, idx, diag, upper, N, n));
    return rcpp_result_gen;
END_RCPP
}
// extractDistCpp
NumericVector extractDistCpp(NumericVector dist, IntegerVector idx1, IntegerVector idx2, int N, int n1, int n2);
RcppExport SEXP _easyDist_extractDistCpp(SEXP distSEXP, SEXP idx1SEXP, SEXP idx2SEXP, SEXP NSEXP, SEXP n1SEXP, SEXP n2SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type dist(distSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type idx1(idx1SEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type idx2(idx2SEXP);
    Rcpp::traits::input_parameter< int >::type N(NSEXP);
    Rcpp::traits::input_parameter< int >::type n1(n1SEXP);
    Rcpp::traits::input_parameter< int >::type n2(n2SEXP);
    rcpp_result_gen = Rcpp::wrap(extractDistCpp(dist, idx1, idx2, N, n1, n2));
    return rcpp_result_gen;
END_RCPP
}
// getColumns
NumericMatrix getColumns(NumericVector dist, IntegerVector ColIdx, int N, int nCol);
RcppExport SEXP _easyDist_getColumns(SEXP distSEXP, SEXP ColIdxSEXP, SEXP NSEXP, SEXP nColSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type dist(distSEXP);
    Rcpp::traits::input_parameter< IntegerVector >::type ColIdx(ColIdxSEXP);
    Rcpp::traits::input_parameter< int >::type N(NSEXP);
    Rcpp::traits::input_parameter< int >::type nCol(nColSEXP);
    rcpp_result_gen = Rcpp::wrap(getColumns(dist, ColIdx, N, nCol));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_easyDist_subDistCpp", (DL_FUNC) &_easyDist_subDistCpp, 6},
    {"_easyDist_extractDistCpp", (DL_FUNC) &_easyDist_extractDistCpp, 6},
    {"_easyDist_getColumns", (DL_FUNC) &_easyDist_getColumns, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_easyDist(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

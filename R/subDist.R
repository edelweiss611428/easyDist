#' @name subDist
#' @title Extract a sub-distance matrix from a "dist" object
#'
#' @description  subDist() allows us to efficiently extract from a "dist" object a sub-distance matrix of class "dist"
#' of a subset of the original dataset.
#'
#' @usage subDist(dist, idx, diag = F, upper = F)
#'
#' @param dist  A "dist" object, which can be obtained by the "dist" function.
#' @param idx An integer vector indicates the indexes of the extracted units (idx can't be smaller than 1 or larger
#' than the dataset size N.
#' @param diag A boolean value indicates whether or not attr(dist, "Diag") = TRUE (by default, FALSE).
#' @param upper A boolean value indicates whether or not attr(dist, "Upper") = TRUE (by default, FALSE).
#'
#' @details We are interested in extracting from a "dist" object a sub-distance matrix of class "dist" of a subset
#' of the original dataset. A simple way to do that is to convert the "dist" object to a numeric matrix using as.matrix(),
#' extract the relevant values, and convert the matrix back to a "dist" object using as.dist(). However, it is slow.
#' subDist() allows us to do that efficiently without the need of conversion.
#'
#' @return a sub-distance matrix of class "dist"
#'
#' @examples
#'
#' x = rnorm(1000)
#' dx = dist(x)
#' subDist(dx, 1:10)
#'
#' @author Minh Long Nguyen \email{edelweiss611428@gmail.com}
#' @export


subDist = function(dist, idx, diag = F, upper = F){

  if (inherits(dist, "dist") == TRUE) {
    N = attr(dist, "Size")
  } else{
    stop("dist must be a 'dist' object!")
  }

  if(!is.vector(idx, "numeric")){
    stop("idx must be a numeric (integer) vector!")
  } else{
    idx = as.integer(idx)
    n = length(idx)
  }

  if(n > N){
    stop("Length of idx cannot be larger than the dataset size!")
  }

  if(min(idx) < 1 | max(idx) > N){
    stop("idx cannot be smaller than 1 or larger than N")
  }

  return(.subDistCpp(dist = dist, idx = idx - 1, diag, upper, N, n))

}


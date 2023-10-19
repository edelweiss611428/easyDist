#' @name subDist
#' @title Extracting a sub-distance matrix of class "dist" from a "dist" object
#'
#' @description  This function allows us to efficiently extract a sub-distance matrix of class "dist" from a "dist" object.
#'
#' @usage subDist(dist, idx, diag = F, upper = F)
#'
#' @param dist  A "dist" object, which can be obtained with the "dist" function.
#' @param idx An integer vector specifying the indexes of units in the subsets. Indexes can't be smaller than 1 or larger than the dataset
#' size N.
#' @param diag A boolean value controls whether or not the diagonal elements (0) are displayed. By default, diag = F.
#' @param upper A boolean value controls whether or not the upper-triangular elements (0) are displayed. By default, diag = F.
#'
#' @details Extracting a sub-distance matrix of class "dist" from a "dist" object can be done by back and forth conversion between
#' a "dist" object and a numeric matrix using as.dist and as.matrix functions. However, it is extremely inefficient and slow as we only
#' partially extract the "dist" object. This function allows us to directly extract the relevant values directly without the need
#' of conversion.
#'
#' @importFrom cluster pam
#' @importFrom microbenchmark microbenchmark
#' @return a sub-distance matrix of class "dist"
#'
#' @examples
#' library("cluster")
#' #Generate four clusters of size 50 from 2d Gaussian distributions.
#' sdev = 0.1
#' x1 = cbind(rnorm(50, 0, sdev), rnorm(50, 0, sdev))
#' x2 = cbind(rnorm(50, 1, sdev), rnorm(50, 1, sdev))
#' x3 = cbind(rnorm(50, 1, sdev), rnorm(50, 0, sdev))
#' x4 = cbind(rnorm(50, 0, sdev), rnorm(50, 1, sdev))
#' X = rbind(x1, x2, x3, x4)
#' dx = dist(X)
#' C = pam(dx, 4)$clustering #Apply PAM for clustering X.
#' X2 = X[c(1:10, 51:60, 101:110, 151:160),]
#' dx2 = subDist(dx, c(1:10, 51:60, 101:110, 151:160))
#' C2 = pam(dx2, 4)$clustering #Apply PAM for clustering X2.
#' par(mfrow = c(1,2))
#' plot(X, col = C, pch = as.character(C), xlab = "X1", ylab = "X2")
#' plot(X2, col = C2, pch = as.character(C2), xlab = "X1", ylab = "X2")
#'
#' @examples
#' library("microbenchmark")
#' x = rnorm(1:1000)
#' dx = dist(x)
#' #Extract a sub-distance matrix of class "dist" corresponding to the first 10 units
#' microbenchmark(as.dist(as.matrix(dx)[1:10, 1:10]),
#'                subDist(dx, 1:10))
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
    if(is.null(idx)){
      stop("idx cannot be NULL")
    }
    idx = as.integer(idx)
    n = length(idx)
  }

  if(min(idx) < 1 | max(idx) > N){
    stop("idx cannot be smaller than 1 or larger than N")
  }

  return(.subDistCpp(dist = dist, idx = idx - 1L, diag, upper, N, n))

}


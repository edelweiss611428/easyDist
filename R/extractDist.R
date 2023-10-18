#' @name extractDist
#' @title Subset a symmetric distance matrix of class "dist"
#'
#' @description  extractDist() allows us to efficiently subset a distance matrix of class "dist" without converting
#' the "dist" object to a numeric matrix.
#'
#' @usage extractDist(dist, idxRows = NULL, idxCols = NULL)
#'
#' @param dist  A "dist" object, which can be obtained by the "dist" function.
#' @param idxRows An interger vector indicates the indexes of units in the first subset. It cannot be smaller than 1
#' or larger than the dataset size. By default, idxRows = NULL.
#' @param idxCols An interger vector indicates the indexes of units in the second subset. It cannot be smaller than 1
#' or larger than the dataset size. By default, idxCols = NULL.
#'
#' @details We are interested in extracting pair-wises distances between units in two subsets (indicated by their
#' indexes) from a "dist" object. A simple way to do that is to convert the "dist" object to a numeric matrix using
#' as.dist() and extract the relevant values using the squared brackets operator for matrix subsetting. However,
#' it is very slow. extractDist() efficiently extract the pair-wise distances from the "dist" object without the need of conversion.
#'
#' When either idxRows or idxCols are NULL, extractDist() extracts column vectors of the "dist" matrix given by
#' the indexes of the not-null vector. Since the distance matrix is symmetric, it does not matter if we extract
#' the row vectors or the column vectors. However, our implementation is more efficient for extracting column vectors
#' from a "dist" object. If idxRows and idxCols are both NULL, the "dist" object is converted to a full numeric
#' distance matrix.
#'
#'
#' @return A numeric matrix storing pair-wise distances between the units in each subset.
#'
#' @examples
#'
#' x = rnorm(100)
#' dx = dist(x)
#' extractDist(dx, idxRows = 1:10, idxCols = 25:50)
#'
#' @author Minh Long Nguyen \email{edelweiss611428@gmail.com}
#' @export


extractDist = function(dist, idxRows = NULL, idxCols = NULL){

  if (inherits(dist, "dist") == TRUE) {
    N = attr(dist, "Size")
  } else{
    stop("dist must be a 'dist' object!")
  }

  if(is.null(idxRows)){

    if(is.null(idxCols)){
      return(.getColumnsCpp(dist, ColIdx = (1:N)-1L, N = N, nCol = nCols))
    } else{

      if(!is.vector(idxCols, "numeric")){
        stop("idxCols should be a numeric (integer) vector")
      } else{

        idxCols = as.integer(idxCols)
        if(min(idxCols) < 1 | max(idxCols) > N){
          stop("idxCols cannot be smaller than 1 or larger than N")
        }

        nCols = length(idxCols)
        return(.getColumnsCpp(dist, ColIdx = idxCols-1L, N = N, nCol = nCols))

      }
    }
  }


  if(is.null(idxCols)){

    if(is.null(idxRows)){
      return(.getColumnsCpp(dist, ColIdx = (1:N)-1L, N = N, nCol = nCols))
    } else{

      if(!is.vector(idxRows, "numeric")){
        stop("idxRows should be a numeric (integer) vector")
      } else{

        idxRows = as.integer(idxRows)
        if(min(idxRows) < 1 | max(idxRows) > N){
          stop("idxRows cannot be smaller than 1 or larger than N")
        }

        nRows = length(idxRows)
        return(.getColumnsCpp(dist, ColIdx = idxRows-1L, N = N, nCol = nRows))

      }
    }
  }

  if((!is.vector(idxRows, "numeric")) | (!is.vector(idxCols, "numeric"))){
    stop("idx must be a numeric (integer) vector!")
  } else{

    idxRows = as.integer(idxRows)
    idxCols = as.integer(idxCols)
    nRows = length(idxRows)
    nCols = length(idxCols)

  }


  if(min(idxRows) < 1 | min(idxCols) < 1 | max(idxRows) > N | max(idxCols) > N){
    stop("idxRows and idxCols cannot be smaller than 1 or larger than N")
  }

  return(.extractDistCpp(dist, idxRows-1L, idxCols-1L, N, nRows, nCols))
}


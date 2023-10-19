#' @name extractDist
#' @title Extract pair-wises distances of units in two groups from a "dist" object
#'
#' @description  This function allows us to extract pair-wise distances of units in two groups, specified by their indexes, from
#' a "dist" object
#'
#' @usage extractDist(dist, idxGroup1 = NULL, idxGroup2 = NULL)
#'
#' @param dist  A "dist" object, which can be obtained with the "dist" function.
#' @param idxGroup1 An integer vector specifying the indexes of units the FIRST group. If idxGroup1 is not NULL, indexes can't be
#' smaller than 1 or larger the dataset size N. By default, idxGroup1 = NULL.
#' @param idxGroup2 An integer vector specifying the indexes of units the SECOND group. If idxGroup2 is not NULL, indexes can't be
#' smaller than 1 or larger the dataset size N. By default, idxGroup2 = NULL.
#'
#' @details Extracting pair-wises distances between units in two groups from a "dist" object may be of interest. However,
#' we can't use the bracket operator directly to extract rows and columns from the "dist" object as we do with numeric matrices.
#' A simple way to do that involves converting the "dist" object to a symmetric numeric matrix using the as.matrix function. However,
#' it is extremely inefficient and slow as we only partially extract the "dist" object. The function allows us to extract pair-wise
#' distances without the need of conversion.
#'
#' When either idxGroup1 or idxGroup2 is NULL, the function extracts the entire "columns" specified by the not-null vector. Since
#' the distance matrix is symmetric. It does not matter mathematically if we extract the rows or the columns. However, our implementation
#' is more efficient for extracting "columns" from a "dist" object. If idxGroup1 and idxGroup2 are not specified (NULL), the "dist" object
#' is fully converted to a numeric matrix.
#'
#' @importFrom microbenchmark microbenchmark
#' @return A numeric matrix storing pair-wise distances between the units in each subset.
#'
#' @examples
#' x = rnorm(50)
#' dx = dist(x) #Euclidean distance matrix of class "dist"
#' #Extract the pairwise distances between the first unit and the other units.
#' extractDist(dx, idxGroup1 = 1)
#'
#' @examples
#' library("microbenchmark")
#' x = rnorm(100)
#' dx = dist(x) #Euclidean distance matrix of class "dist"
#' microbenchmark(extractDist(dx, idxGroup1 = 1), as.matrix(dx)[,1])
#'
#' @author Minh Long Nguyen \email{edelweiss611428@gmail.com}
#' @export


extractDist = function(dist, idxGroup1 = NULL, idxGroup2 = NULL){

  if (inherits(dist, "dist") == TRUE) {
    N = attr(dist, "Size")
  } else{
    stop("dist must be a 'dist' object!")
  }

  if(is.null(idxGroup1)){

    if(is.null(idxGroup2)){
      return(.getColumnsCpp(dist, ColIdx = (1:N)-1L, N = N, nCol = N))
    } else{

      if(!is.vector(idxGroup2, "numeric")){
        stop("idxGroup2 should be a numeric (integer) vector")
      } else{

        idxGroup2 = as.integer(idxGroup2)
        if(min(idxGroup2) < 1 | max(idxGroup2) > N){
          stop("idxGroup2 cannot be smaller than 1 or larger than N")
        }

        nGroup2 = length(idxGroup2)
        return(.getColumnsCpp(dist, ColIdx = idxGroup2-1L, N = N, nCol = nGroup2))

      }
    }
  }


  if(is.null(idxGroup2)){

    if(is.null(idxGroup1)){
      return(.getColumnsCpp(dist, ColIdx = (1:N)-1L, N = N, nCol = N))
    } else{

      if(!is.vector(idxGroup1, "numeric")){
        stop("idxGroup1 should be a numeric (integer) vector")
      } else{

        idxGroup1 = as.integer(idxGroup1)
        if(min(idxGroup1) < 1 | max(idxGroup1) > N){
          stop("idxGroup1 cannot be smaller than 1 or larger than N")
        }

        nGroup1 = length(idxGroup1)
        return(.getColumnsCpp(dist, ColIdx = idxGroup1-1L, N = N, nCol = nGroup1))

      }
    }
  }

  if((!is.vector(idxGroup1, "numeric")) | (!is.vector(idxGroup2, "numeric"))){
    stop("idxGroup1 and idxGroup2 must be numeric (integer) vectors!")
  } else{

    idxGroup1 = as.integer(idxGroup1)
    idxGroup2 = as.integer(idxGroup2)
    nGroup1 = length(idxGroup1)
    nGroup2 = length(idxGroup2)

  }


  if(min(idxGroup1) < 1 | min(idxGroup2) < 1 | max(idxGroup1) > N | max(idxGroup2) > N){
    stop("idxGroup1 and idxGroup2 cannot be smaller than 1 or larger than N")
  }

  return(.extractDistCpp(dist, idxGroup1-1L, idxGroup2-1L, N, nGroup1, nGroup2))
}


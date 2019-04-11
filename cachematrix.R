## A pair of functions that cache the inverse of a matrix.
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL
set <- function(y){
  x <<- y
  inverse <<- NULL
}
get <- function() x
setinverse <- function(m) inverse <<- m
getinverse <- function() inverse

list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse
  if(!is.null(inv))
  {
    print("Inverse Calculated... Returning Inverse")
    return(inv)
  }
  matrix_data <- x$get()
  inv <- solved(matrix_data)
  x$getinverse(inv)
  inv
}

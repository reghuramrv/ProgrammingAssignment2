## Creates a wrapper around the matrix so that it can be cached
## This function deal with the creation of cached square matrix 

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    invMat <- NULL
    set <- function(y) {
        invMat <<- y
       
    }
    get <- function() x
    setinverse <- function(solve) invMat <<- solve
    getinverse <- function() invMat
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Cached Solve function to find inverse of a square matrix

cacheSolve <- function(x, ...) {
    invMat <- x$getinverse()
    if(!is.null(invMat)) {
        message("getting inverse from cached data")
        invMat
    }
    data <- x$get()
    invMat <- solve(data, ...)
    x$setinverse(invMat)
    invMat
}

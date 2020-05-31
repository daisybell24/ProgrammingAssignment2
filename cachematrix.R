## Two functions to create a special object that stores
## a matrix and caches its inverse.

## Creates list of functions to set the value of the matrix,
## get the value of the matrix, set the value of the inverse
## and get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Calculates the inverse of the special matrix returned
## by makeCacheMatrix, or retrieves it from the cache if 
## already computed

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        matr <- x$get()
        i <- solve(matr, ...)
        x$setinv(i)
        i
        ## Return a matrix that is the inverse of 'x'
}

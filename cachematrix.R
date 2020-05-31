## Two functions to create a special object that stores
## a matrix and cache's its mean.

## Creates list of functions to set the value of the matrix,
## get the value of the matrix, set the value of the inverse
## and get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inv) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Function to calculate the inverse of the special matrix
## returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(m)
        }
        matr <- x$get()
        i <- solve(matr, ...)
        x$setinv(i)
        i
        ## Return a matrix that is the inverse of 'x'
}

## makeCacheMatrix takes an input matrix and generates four different functions
## which are: set, get, setsolve, getsolve.
## set(y) takes a matrix y and replace it with matrix x.
## get() returns matrix x.
## setsolve(solve) stores inverse of matrix x as "solve"
## getsolve() returns inverse of matrix x


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
    }


## cacheSolve checks if inverse value of matrix has been already calculated.
## If yes, returns it. If not or matrix x was changed calculates inverse. 
## Input is a special list produced by makeCacheMatrix.

cacheSolve <- function(x, ...) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}

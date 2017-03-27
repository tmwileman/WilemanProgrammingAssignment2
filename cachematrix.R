## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function does four things. First it creates a special "matrix ## object. The set function then stores the data for the matrix in an ## environment called y. setinverse and getinverse store future 
## inputs into "m" and then call it back.
makeCacheMatrix <- function(x = matrix()) {
		x <- NULL
        set <- function(y) {
                x <<- y;
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
## cacheSolvefirst pulls the inverse from the previous function and then sees if it is unchanged. If the matrix is unchanged, it returns the value of m. If the data has changed, it solves for the inverse, sets that as the new "setinverse" and then prints it.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)      
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}

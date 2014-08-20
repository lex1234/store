## Theses function creates a matrix and computes its inverse then caches
## it such that if a re-attempt to recompute the same matrix occurs, it
## simply retrieves the cached result thereby saving costly processing time.

##
## the makeCacheMatrix() is used to create a matrix and cache its inverse
##
## i.e. m <- makeCacheMatrix(matrix(c(1,1,1,3,4,3,3,3,4),nrow=3,ncol=3))
## get() displays the current contents of the matrix i.e. m$get()
##      [,1] [,2] [,3]
## [1,]    1    3    3
## [2,]    1    4    3
## [3,]    1    3    4
##
## getimx() and setimx() gets and sets the inverse of the matrix respectively
## 
makeCacheMatrix <- function(a = matrix()) {
        imx <- NULL
        get <- function() a
        setimx <- function(mx) imx <<- mx
        getimx <- function() imx
        list(get = get,
             setimx = setimx,
             getimx = getimx)
}


##
## the cacheSolve() is used to compute the inverse of a matrix return from
## makeCacheMatrix().
## if the inverse has already been previously calculated, cacheSolve()
## simply retrieves the inverse from the already cached result.
##
## i.e. cacheSolve(m)
##> cacheSolve(m)
##     [,1] [,2] [,3]
##[1,]    7   -3   -3
##[2,]   -1    1    0
##[3,]   -1    0    1
##
## Run cacheSolve() again... retrieves the cached result.
## a message is displayed indicating it.
##
##> cacheSolve(m)
##cached result
##     [,1] [,2] [,3]
##[1,]    7   -3   -3
##[2,]   -1    1    0
##[3,]   -1    0    1
##
cacheSolve <- function(mtx, ...) {
        imx <- mtx$getimx()
        if(is.null(imx)) {
                imx <- solve(mtx$get())
                mtx$setimx(imx)                
        } else {
                message("cached result")
        }
        imx
}

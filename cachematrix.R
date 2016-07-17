## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##comment describing function directly below
## this function creates a "special" matrix object that can cache an
## inverse of itself. 
##Caching the inverse saves computational time and prevents the program
## from repeatedly computing the the code

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) inv <<- solve
  getmatrix <- function() inv
  list(set=set, get=get,
       setmatrix=setmatrix, 
       getmatrix=getmatrix)
}
## Write a short comment describing this function
  
## comment describing function below 

## this solve function computes the inverse of the matirx created by the
## makeCacheMatrix function, but if the inverse has been perviously calculated
## within the same matrix then the function should retrieve inversed matrix
## from the cache.

cacheSolve <- function(x = matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getmatrix()
  if(!is.null(inv)){
    message("getting cahced data")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix, ...)
  x$setmatrix(inv)
  inv
}

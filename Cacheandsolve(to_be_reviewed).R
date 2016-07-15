makeCacheMatrix <- function(x = matrix()){
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

cacheSolve <- function(x=matrix(), ...){
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
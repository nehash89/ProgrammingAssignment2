## The overall function calculates inverse of a matrix. If the inverse for the matrix is already calculated, then the function returns the stored cache value.

## makeCacheMatrix is a function that stores a list of function. Get and Set are used to call for and modify the matrix that is stored. GetInverse is used to call the stored value of inverse in the cache. The << is used to take advantage of the scoping rules of R. 

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) s <<- solve
  getinverse <- function() s
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## cacheSolve is a simple function that returns a matrix that is the inverse of 'x' if it is stored in the cache. If it is not in cache, it calculates the inverse and stores it using setinverse.

cacheSolve <- function(x, ...) {
  s <- x$getinverse()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data,...)
  x$setinverse(s)
  s 
  
  ## Return a matrix that is the inverse of 'x'
}

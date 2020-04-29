## These functions will create a matrix which caches its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL 
  set <- function(y) {
    x <<- y
    m <<- NULL
}

 #stored matrix
 get <- function() x
 #Inverse matrix and set to store in setcachinverse
 setcachedinverse <- function(inverse) m <<- inverse 
 #stored value of cachedinverse
 getcachedinverse <- function() m

 #list of cache matrix
 list(set = set, get = get,
     setcachedinverse = setcachedinverse,
     getcachedinverse = getcachedinverse)

}

## These functions are to retrieve the invers matrix from MakeCacheMatrix above.

cacheSolve <- function(x, ...) {
  m <- x$getcachedinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setcachedinverse(m)
  m
}


#Solution
#> my_metrix <- makeCacheMatrix(matrix(1:4,2,2))
#> my_metrix$get()
#     [,1] [,2]
#[1,]    1    3
#[2,]    2    4
#> cacheSolve(my_metrix)
#     [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5

A = rbind(c(4,2,7),c(3,7,1),c(5,2,-1))

# Problem 1
pivot.above = function(A, r, c){
  n = nrow(A)
  A[r, ] = A[r, ]/A[r,c]
  for (i in 1:(r-1)) {
    A[i, ] = A[i, ] - A[r, ]*A[i,c]
  }
  A
}

# Problem 2
pivot.below = function(A,r,c){
  n = nrow(A)
  for(i in (r+1):n){
    A[i, ] = A[i, ] - A[r, ]/A[r,c]*A[i,c]
  }
  A
}

row.reduce.no.division = function(A){
  n = nrow(A)
  for(i in 1:(n-1)){
    A = pivot.below(A,i,i)
  }
  A
}
B=matrix(1:25,nrow=5,ncol = 5)
A = t(B)%*%B

pivot.below = function(A,r,c){
  n = nrow(A)
  if(r<n){
    for(i in (r+1):n){
      A[i, ] = A[i, ] - A[r, ]/A[r,c]*A[i,c]
    }
    A
  }
  else{
    A
  }
}
locate.pivot = function(A,r,c){
  n = nrow(A)
  x = A[r:n,c] # this extract the numbers we search through
  # picking a non-zero number or taking the maximum number
  #which.max shows the location of the maximum
  m = which.max(abs(x))
  max.row = A[r+m-1,]
  original.row = A[r,]
  #swap
  A[r,]=max.row
  A[r+m-1,]=original.row
  A
}
row.reduce.no.division = function(A){
  n=nrow(A)
  m=ncol(A)
  i=1
  j=1
  while(i<=n & j<=m){
    A = locate.pivot(A,i,j)
    if(A[i,j] != 0){
      A = pivot.below(A,i,j)
      i=i+1
      j=j+1
    }
    else{
      # don't do anything and move across to the next column
      i=i
      j=j+1
    }
  }
  A
}
B = row.reduce.no.division(A)
sum(B)


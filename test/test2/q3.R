nrm = function(x){
  # round off error: for never ending num computer takes only a finite number of places 
  # so 2-(sqrt(2))^2 = 0.00001 not 0
  
  # running into a zero vector
  if( sum(x*x) < 1e-6 ){
    NULL
  }
  else{
    x/sqrt(sum(x^2))# x/length of vector
  }
}

proj = function(x,A){ 
  n = ncol(A)
  coef = rep(NA,n)
  for(i in 1:n){
    coef[i] = sum(xA[,i])
  }
  answer = rep(0,n)
  for(i in 1:n){
    answer = answer + coef[i]A[,i] 
  }
  answer
}

gram.schmidt = function(A){
  n = ncol(A)
  Q = matrix( nrm(A[,1]) )
  for(i in 2:n){
    Q = cbind( Q , nrm( A[,i] - proj(A[,i],Q) ) )
  }
  Q
}

A = rbind(c(1,0,0,0,1),
          c(1,0,1,0,1),
          c(1,0,-1,0,1))
gram.schmidt(A)
z = cbind(rep(0.5773503  ,3),c(0,0.7071068,-0.7071068)) # the result from gram-schmidt
z
b = matrix((c(0,1,2,3,4)))
b
proj(b,z)
y = proj(b,z) # [1] 3.333334 4.833334 1.833334
y= c(3.333334, 4.833334, 1.8333340,0,0)
matrix(y)
inv(t(y)%*%y)%*%(t(y)%*%b)

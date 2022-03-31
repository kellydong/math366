# Q1
A = matrix(NA, nrow=50,ncol=50)
for (i in 1:50) {
  for(j in 1:50){
    A[i,j] = (i*j)%%7
  }
}

nrm = function(x){
  if( sum(x*x) < 1e-6 ){
    NULL
  }
  else{
    x/sqrt(sum(x^2))
  }
}
proj = function(x,A){
  n = ncol(A)
  coef = rep(NA,n)
  for(i in 1:n){
    coef[i] = sum(x*A[,i])
  }
  answer = rep(0,n)
  for(i in 1:n){
    answer = answer + coef[i]*A[,i] 
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
gram.schmidt(A)
# answer: 4

# Q2
f = function(x){
  (x^3) - 1
}

g = function(x){
  3*(x^2)
}

newtons.method = function(f,g,x0,n){
  s = x0 - f(x0)/g(x0)
  for(i in 1:(n-1)){
    s = s - f(s)/g(s)
  }
  s
}
# answer: 300.7287

# Q3 answer:
x=c(4,-3,0,2,5,-5)

sgn = function(x){
  n = length(x)
  x2 = rep(0,n)
  for(i in 1:n){
    if(x[i]>0){
      x2[i] = 1
    } 
    else if(x[i] < 0){
      x2[i] = -1
    }
    else{
      x[2] = 0
    }
  }
  x2
}

#Q4
A = matrix(NA,nrow=50,ncol=50)
for(i in 1:50){
  for(j in 1:50){
    A[i,j] = sin(i)+cos(j)
  }
}
frobenius = function(A) {
  n = nrow(A)
  m = ncol(A)
  answer = 0
  for (i in 1:n) {
    for (j in 1:m) {
      answer = answer + (A[i,j]*A[i,j])
    }
  }
  answer = sqrt(answer)
  answer
}

one = function(A) {
  n = nrow(A)
  m = ncol(A)
  largest = 0
  for (i in 1:m) {
    total = 0
    for (j in 1:n) {
      total = total + abs(A[j,i])
    }
    if (total >= largest) {
      largest = total
    }
  }
  largest
}

inf = function(A) {
  n = nrow(A)
  m = ncol(A)
  largest = 0
  for (i in 1:n) {
    total = 0
    for (j in 1:m) {
      total = total + abs(A[i,j])
    }
    if (total >= largest) {
      largest = total
    }
  }
  largest
}

two = function(A) {
  values = c(eigen(t(A)%*%A)$values)
  largest = max(values)
  answer = sqrt(largest)
  answer
}
# answer:
# inf(A) = 50.25716
# frobenius(A) = 50.00051
# one(A) = 50.09716
# two(A) = 35.55158

#Q5
A = matrix(NA,nrow=50,ncol=50)
for(i in 1:50){
  for(j in 1:50){
    A[i,j] = sin(i)+cos(j)
  }
}

pivot.above = function(A,r,c){
  n = nrow(A)
  A[r, ] = A[r, ]/A[r,c] 
  for(i in (r-1):1){
    A[i, ] = A[i, ] - A[r, ]*A[i,c] 
  }
  A
}

simple.row.reduce = function(A){
  n = nrow(A)
  for(i in n:2){ # Note: until n-1 because the last line is not pivot below function
    A = pivot.above(A,i,i)
  }
  A[1, ] = A[1, ]/A[1,1] # fix the issue with last line
  A
}
sum(simple.row.reduce(A))
#answer: [1] 239.3093

#Q6
total = 0
for(i in 1:10){
  for(j in 1:10){
    for(k in 1:10){
      total = total + sin(i+j+k)
    }
  }
}

#answer: [1] 5.695587


# Problem 1
sum = 0
for(i in 0:10){
  for(j in 0:i){
    sum = sum + sin(i^2)*cos(j^2)
  }
}

# Problem 2
x = c(3,6,-1)

ID = function(x){
  n = length(x)
  A = matrix(0, nrow= n, ncol=n)
  for (i in 1:n) {
    A[n-i+1, i] = x[i]
  }
  A
}
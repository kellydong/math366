# Function in R, just like in math, are input/output systems

# Let us write the function f(x,y) = x^2 + y
f = function(x,y){
  x^2 + y
}
# environment panel shows a new function
# test: f(1,2) in the console outputs 3
# a = c(1,2)
# b = c(3,4)
# f(a,b) -> [1] 4 8

# Let us write a function which will INPUT a vector 
# and the OUTPUT will be the diagonal matrix containing this vector
# D is a known function the R shows about
# ?D --> documentation page 
# so let's use DI

x = c(3,6,-1)
# x is a vector input (don't have to declare)
DI = function(x){
  # size of matrix depends on the vector
  n = length(x)
  # make a 0 matrix where the size of matrix is set based on vector
  A = matrix(0, nrow = n, ncol = n)
  # individually selecting position of matrix and changing value
  for(i in 1:n){
    A[i,i] = x[i]
  }
  print(A)
}
DI(x)
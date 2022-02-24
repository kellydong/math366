A = rbind(c(1,2,3), c(4,5,6), c(7,8,9))

# There's a built in function for finding Eigen Value
# eigen(A) 
# eigen() decomposition
# $values
# [1]  1.611684e+01 -1.116844e+00 -1.303678e-15 (basically 0)
# The computer uses a different way to solve for eigen so these results are 
# close estimate
# selecting only eigen values: eigen(A)$values 

I = diag(3)
# f(lambda) = det(A-lambda*I)
# x = lambda
f = function(x){
  det(A-x*I)
}
# f(0) is [1] 6.661338e-16 because the determinant function is using a numberical
# solution to solve it 

roots(f, 5, -5) #result: [1] -4.768372e-08 -1.116844e+00
roots(f, -25, 25) #result: [1] -1.116844e+00 -2.384186e-07  1.611684e+01

A = matrix(rbinom(9, size = 3, prob = 0.5), ncol = 3, nrow = 3)
print(A)


### Another Method for finding the largest Eigen value
B = rbind(c(2,2,3), c(1,3,0), c(3,3,0))

#initial guess vector
x = c(1,-1,2)

# sum(x^2)
# sqrt(sum(x^2))  Euclidean Norm of vector

x = x/sqrt(sum(x^2))
matrix(x) # force R to see x as a matrix
# Can't do A * x
x1 = A%*%x # matrix multiplication
x1 = x1/sqrt(sum(x1^2))

x2 = A%*%x1
x2 = x2/sqrt(sum(x2^2))

# As a loop
n = 10 # pick a certain number of times we are doing this
# i is not use int he code, it's just telling the code how many times to repeat
for (i in 1:n) {
  x = B%*%x
  x = x/sqrt(sum(x^2))
  x
}

# find lambda by B%*%x / x (after running through the loop) => they should all come out to be around the same thing
# this is the largest eigen value
# check with eigen(B)


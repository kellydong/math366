f = function(x){
  (2*x[1]-x[2]+4x[3]-1)^2 + (3*x[1]-x[2]+x[3]+3)^2 + (x[1]-2*x[2]+1)^2 + (x[1]+x[3]-2)^2
}

x = c(-1,0,1)
n = 20

# remember to write inv() and not ^-1 why? think about matrix multiplication 2 ways
for(i in 1:n){
  # have to turn the gradient to a matrix to prevent error
  # recall %*% is matrix multiplication
  x = x - inv(hessian(f,x))%*%matrix(grad(f,x))
  #display x as vector
  x = as.vector(x)
}
x

optim(c(0.9,0.1),f)
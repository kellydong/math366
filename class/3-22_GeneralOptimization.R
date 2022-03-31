# estimating the dertivative
f = function(x){
  sqrt(x)
}
eps= 0.1
p =4
(f(p+eps) - f(p-eps))/(2*eps) #0.2500195 which is around 1/4


f=function(x){
  x[1]^2+x[2]^3
}
f(c(1,1)) #2

grad(f,c(1,1)) # 2 3 

hessian(f,c(1,2)) 
# sometimes u might see a messy number but that is because it is running using 
# an approximation

# https://en.wikipedia.org/wiki/Second_partial_derivative_test

f = function(x){
  (x[1] + x[2])*(x[1]*x[2] +x[1]*x[2]^2)
}

grad(f,c(1,-1)) # expect 0,0 which is does
hessian(f,c(1,-1))
eigen(hessian(f,c(1,-1))) # 0.4142136 -2.4142136

eigen(hessian(f,c(3/8,-3/4)))# -0.28125 -0.75000


f = function(x){
  (x[1] + x[2])*(x[1]*x[2] +x[1]*x[2]^2)
}

x = c(0.25,-0.3)
n = 5

# remember to write inv() and not ^-1 why? think about matrix multiplication 2 ways
for(i in 1:n){
  # have to turn the gradient to a matrix to prevent error
  # recall %*% is matrix multiplication
  x = x - inv(hessian(f,x))%*%matrix(grad(f,x))
  #display x as vector
  x = as.vector(x)
}
x
# 0.004878601 -0.005249663 == basically 0,0

# Let's try something else:
x = c(0.4,-0.6) #  0.375 -0.750

# depending on where u begin it will push u to a certain solution

# When the function is convex, it is safe to use this and u will get the same answer regardless

# There is a code in R that does Optimization for u: optim


optim(c(0.4,-0.6),f)
# 3.161427e+18 -5.058545e-01 This doesn't make sense because there's no absolute min

f = function(x){
  -(x[1] + x[2])*(x[1]*x[2] +x[1]*x[2]^2)
}

optim(c(0.4,-0.6),f) # 0.3750215 -0.7500058 absolute max works
# be careful when picking initial points, code will throw out garbage after a 
# few run through and it still can't find the answer
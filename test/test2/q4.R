f2 = function(x){
  (150+10*x[1]+8*x[2])/(10+x[1]^2+x[2]^2)
}

x = c(0,0)
n = 20

for(i in 1:n){
  x = x - inv(hessian(f2,x))%*%matrix(grad(f2,x))
  #display x as vector
  x = as.vector(x)
}
x # 0.3274710 0.2619768

optim(c(0,0),f2)

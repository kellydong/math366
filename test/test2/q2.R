best.line = function(x,y){
  n = length(x)
  # assuming that the vector(x,y) have the same legnth
  # can add if statement to make this check for better code
  
  # function we are minimizing g(a,b,c1,...cn)
  lin.fun = c(0,0,rep(1,n))
  
  # the two matrix
  A.upper = cbind(x,rep(1,n),-diag(n))
  A.lower = cbind(x,rep(1,n),diag(n))
  A = rbind(A.upper, A.lower)
  
  # inequality
  ineq = c(rep("<=",n),rep(">=",n)) # consist of 2n contraints
  
  rhs = c(y,y)
  
  # only want to see the first two components which is a and b instead of 
  # displaying every c 
  lp("min", lin.fun, A, ineq, rhs)$solution[1:2]
}

# creating a distributed scattered plot linearly

x = runif(100,min = -10, max = 10)

# keep the max and min low so that we can see something that looks a little 
# bit like a line
y = 3*x + 5 + runif(100,min = -2, max= 2) 
# After the 5 there's a random effect that mess up the relationship
plot(x,y)

best.line(x,y) # got something around 3 for a and 5 for b

# curve 
curve(3.001734*x+4.712429, add = TRUE, col="red")
# "x" is required syntax

# can replace 3.00001734 with best.line(x,y)[1] 
# and 4.712429 with best.line(x,y)[2]


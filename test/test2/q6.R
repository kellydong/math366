x=iris[101:150,]$Sepal.Length
y=iris[101:150,]$Sepal.Width
plot(x,y)

best.line.minmax = function(x,y){
  n = length(x)
  A.upper = cbind(x,rep(1,n), rep(-1,n))
  A.lower = cbind(x, rep(1,n), rep(1,n))
  A = rbind(A.upper, A.lower)
  ineq = c(rep("<=",n),rep(">=",n))
  rhs = c(y,y)
  
  lin.fcn = c ( 0,0, 1)
  lp("min", lin.fcn, A, ineq, rhs)$solution[1:2] 
  # we are only interested in a,b not the error terms
}
best.line.minmax(x,y)

curve(0.2352941*x + 1.3882353, add=TRUE,col="red")


lin.fun = c(0,0,rep(1,4))
lin.fun
A.upper = cbind(c(2,3,1,1),c(-1,-1,-2,0),c(4,1,0,1),-diag(4))
A.lower = cbind(c(2,3,1,1),c(-1,-1,-2,0),c(4,1,0,1),diag(4))
A = rbind(A.upper, A.lower)
A

ineq = c(rep("<=",4),rep(">=",4))
ineq
rhs = c(1,-3,-1,2,1,-3,-1,2)
rhs
lp("min", lin.fun, A, ineq, rhs)$solution

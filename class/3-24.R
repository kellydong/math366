A=cbind(c(1,4,5),c(2,5,6))
b=c(1,2,3)


rref(cbind(A,b))
# telling you that there's no solution to that problem

b = matrix(b)
x = inv(t(A)%*%A)%*%(t(A)%*%b)
# [1,] 0.0000000
# [2,] 0.4615385
as.vector(x) #display as vector


A = rbind(c(0,1,1),c(1,0,1),c(1,1,0))
eigen(A)$values
Q = eigen(A)$vectors
t(Q) %*% Q # Should get identity matrix
Q %*% t(Q) # should get identity matrix
det(Q) # -1

D = rbind(c(2,0,0),c(0,-1,0),c(0,0,-1))
(Q %*% D) %*% t(Q) # should get A back

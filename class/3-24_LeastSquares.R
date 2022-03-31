
# A is tall matrix - lot of rows little columns
A = matrix( NA, nrow = 600 , ncol = 3 ) 

# an integer generated matrix
# it's irrelevant what is put in here, just a filler
for( i in 1:600 ){ 
  for( j in 1:3   ){
    A[i,j] = (i^3 + j^2 + 5)%%101
  }
}

# a vector of integers
b = 1:600

# making sure that there's no solution to this system
# run this: rref(cbind(A,b))
# Go for least squares solution:
# inv(t(A)%*%A)%*%(t(A)%*%matrix(b))
# solutions: 2.3065931, 0.1773344, 2.3042602

# If matrix A is not invertible then this solution won't work
# Another reason: computation reasons: matrix multiplications for large matrix 
# requires computational time, program heavy ...

# Another method:
# first compute orthonormal basis for span(A)
Q = gram.schmidt(A)
# Three col in Q after running the code. v1 and v2 are perpendicular with each 
# other

# project b onto the span(Q) (easy computationally)
z = proj(b,Q) 

# solving for all 600
rref(cbind(A,z)) 
# the top 3 will be ur answer
# However this is not the best computational thing to do


# 3 lines chosen at random

# Solve the truncated system, solving the first 3
rref(  cbind( A[1:3, ] , z[1:3] ) )
# this didn't work, since there are repeats in the first 3

# No unique solution, use different truncation
rref(  cbind( A[598:600, ] , z[598:600] ) ) 
# now it works
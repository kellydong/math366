# The 3 basic row operations on a matrix
# 1) Multiply a row by a non-zero scalar
# 2) add a multiple of a row into a different row
# 3) Interchange rows

# The basic idea of row reduction is to fill up
# your matrix with as many as 0's and 1's as possible

A=rbind(c(1,2,3),c(4,5,6),c(7,8,9))

# Working it out step by step
A[2, ] = A[1, ]*(-4) + A[2, ]
A[3, ] = A[1, ]*(-7) + A[3, ]
A[2, ] = A[2, ]*(-1/3)
A[3, ] = A[2, ]*6 + A[3, ]

# Write a program in R that do this calculation for us automatically
# pivots of matrix = the number used to cancel other 

# Let us first write a calculator for filling zeros below a specified
# matrix position called "pivot"

# Ex:
B = matrix(1:12, nrow = 4, ncol = 3)
# let's look at the number 10 at [2,3] and change that to 1
B[2, ] = B[2, ]*B[2,3] # B[2,3] = (1/10)
# Note: have to specify where we want to pivot
# Replace bottom numbers by zero:
B[3, ] = B[3, ] - B[2, ]*B[3,3]
B[4, ] = B[4, ] - B[2, ]*B[4,3]

# Pivot calculator that requires a specified row and column input,
# it turns that matrix entry into "1" and fills the numbers below 
# it with 0s.

# input: matrix, row, and column
pivot.below = function(A,r,c){
  n = nrow(A) # calculate number of rows of A
  A[r, ] = A[r, ]/A[r,c] # Assuming that pivot is not a 0 number
  for(i in (r+1):n){
    A[i, ] = A[i, ] - A[r, ]*A[i,c] 
  }
  A
}
# Run pivot.below(B,2,3) output is the same at before when running one by one
# Note: if matrix is 4x3 then pivot.below(A,4,2) will yield an out of bound error
# This works fine as ling as r< n, otherwise it is out of bounds

# Let us write a simplified half row reduction which will assume that there is no
# issue of division-by-zero (i.e. row exchanges are not necessary in the calculation) 
simple.row.reduce = function(A){
  n = nrow(A)
  for(i in 1:(n-1)){ # Note: until n-1 because the last line is not pivot below function
    A = pivot.below(A,i,i)
  }
  A[n, ] = A[n, ]/A[n,n] # fix the issue with last line
  A
}
# Note: when this function is ran with matrix B, we get NaN for the last two row
# this is because matrix B requires row exchanges

C = rbind(c(4,2,7), c(3,7,1), c(5,2,-1))
det(C) # to check for requiring row exchange(det == 0 needs row exchange)

# fixing row reduction calculator to take into account of row exchange videos 
# this will be in the second exam

rref(A) # row reduction down and up the diagonal in the pracma package
# type rref to see the rref code

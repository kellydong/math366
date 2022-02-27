# 2/1 Introduction

# Vector is just an ordered sequence of numbers
# In R we use "c" ("combine")

# In order to run: select code and click run
# see results in console 
#  can type a variable in the console and print out result for the value

x = c(4,7,3,0,-1) # defined a vector that consist of these 5 number

# when printing this out in the console there will be a [1] in front: this indicate where the number is located

y = 200:300 
# colon generate a sequence of number
# note that there are multiple index when printed in console


# It is common to select a number form a vector
# Simply write x[i] where i indicates the index position in the vector
# Note indexing starts at 1 not zero

x[3] # selecting number out of vector

# You can also select a block of indices from a vector
y[1:10] # selecting the indices from 1 - 10

# if  you try to run y[500] (there's no value) then will result in NA

# It is also very common to edit vectors
y[1] = -1

# type y in the console to see the first number changed to -1

y[2:11] = 0

# Vectors can be added and multiplied
# component by component, but they need to have the same length

z = c(6,3,0,7,-2)

# result for x+z will be adding each component by component
# result for x*z will be multiplying component by component

# Note multiplying is not common in math
# To comput the dot product you need to sum the numbers in the product
# you can use the "sum()" command

sum(x*z) # dot product

# when running x*y (not the lengths are diff) the compiler does something but generates a warning message



## MATRIX ##

# Another way to store data is using matrices (it's a 2-d vector)
# matrix how u mapping one space to another space
# cube of numbers are not going to come up, but are possible

# There are 3 common ways to input a matrix in R,
# "rbind" (row bind), "cbind" (column bind), and "matrix"

#ex: matrix[[1 2 3][4 5 6][7 8 9]]

# note there's 3 vectors
A = rbind( c(1,2,3), c(4,5,6), c(7,8,9) )
# This is noted as "Data" in memory (under environment tabs)
# This is because this is treated like a different data type
# MATLAB doesn't differentiate matrix and vectors
# in R when dealing with matrix and vectors sometimes it might be uncompatiable
# If the matrix is really large, and you want to see it completely:
# go to environment panel and click on the matrix aka A

B = cbind(c(1,2,3),c(4,5,6),c(7,8,9))
# In rbind, vectors are arrange in rows
# using cbind treats each vector as a column


# You can add and multiply matrices jsut like vectors component- by-component
# run A+B in console
# Run A*B (still component by component) -- This is WRONG in matrix multiplication

# If you want to do standard matrix multiplication:
A%*%B

# Just like vectors you can select and edit numbers from a matrix
# The convention is row then col.
# So A[i,j] is the number at row i col j
# When going outside the bound A[5,3]: will have an error "subscript out of bound" 
# The ppl designing R might think that matrix are more serious

# You can edit the matrix by specifying what the new value is

A[2,3] = 0 # 6 is replace with 0

# You can also select rows/col as vector from a matrix
# you would type either:
# A[i, ] or A[ ,j]
# example A[,2] takes the second column as a vector form

# You can edit the entire block(a column or row) of numbers in a matrix
# A[,2] = -1 => all numbers in the second column is replaced with -1

#replace bottom row by 302
# create a vector
v= c(3, 0, 2)
A[3,] = v

# caution*: make sure the vector is the same length

# The last useful command for inputting a matrix is "matrix" which simply takes 
# a vector and arranges it into a matrix with a 
# specific number of rows and cols
a = 1:12
# 12 input can be made into a 3x4 or 4x3 matrix:
C = matrix(a, nrow = 3, ncol = 4)
C = matrix(a, nrow = 3, ncol = 4, byrow=TRUE)

# generating random numbers is helpful if you want to test you code
# on some random examples

r = runif(10, min = 2, max = 4) #randomly uniform distribution
# 10 random numbers uniformly chosen
# within interval [2,4]


# If you want to generate random integers
r2 = rbinom(10, size = 3, prob = 0.5) # binomial distribution
# 10 numbers generated
# 3 - how many times u flipping a coin
# If you are throwing a coin three time the maximum number of times u getting 3 head is 3 
# and the minimum is 0







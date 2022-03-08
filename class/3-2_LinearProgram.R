# Let's solve the Linear Program on Tuesday
# f(x1,x2) = 1x1+1x2

f = c(1,1)

# Change this
# x1 >=0

# To: (system of linear equality)
#1x1+0x2 >= 0
#0x1+1x2 >= 0
#-1x1 + 1x2 <= 1
#1x1 + 6x2 <= 15
#4x1 - 1x2 <= 10

A = rbind(c(1,0),
          c(0,1),
          c(-1,1),
          c(1,6),
          c(4,-1))

# You can always turn all inequalities into form '<=' by multiplying by a negative -1
# Some packages in R assumes that the inequalities are set up in the form '<='

# Now we are going to input the vector b which is the right hand side
b = c(0,0,1,15,10)

#specify direction of inequality in string(char) vector
ineq = c(">=",">=","<=","<=","<=")

# f is the objective function == the function u are trying to linearize 
lp("max",f,A,ineq,b)
# Output: Success: the objective function is 5 
# If there is an error that might mean that the domain is not closed off

# the solution we came up with was 3,2
lp("max",f,A,ineq,b)$solution # output: 3 2
lp("min",f,A,ineq,b)$solution # output: 0 0 

f = c(6,8,5,9)
A = rbind(c(2,1,1,3),
          c(1,3,1,2),
          diag(4))
#diag(4) make a 4 by 4 matrix with diagonals of 1
b = c(5,3,rep(0,4)) # 5 3 0 0 0 0 repeat 0 4 times
ineq = c("<=","<=",rep(">=",4))

lp("max",f,A,ineq,b)$solution #17: 2,0,1,0

# Check:
# c(2,0,1,0)*f
# sum(^) = 17
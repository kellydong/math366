# Suppose you want to create a nutrition bar which has at least 20g of fat,
# 30g of carb, and 20g of protein. From the available food items find which
# combination of food items will lead to this goal and MINIMIZE your total
# cost. 

# Let us require that the nutrition bar does not have too many calories, let us 
# bound the number of calories by 500

# extract the column for the cost
f = A$Cost # the cost function (linear) that is to be minimized

# matrix of constants
# M = rbind(A$Fat, A$Carb, A$Protein, diag(6))
M = rbind(A$Calories, A$Fat, A$Carb, A$Protein, diag(6))

#vector of inequality
# ineq = rep(">=",9)
ineq = c("<=",rep(">=",9))

# b = c(20,30, 20, rep(0,6))
b = c(500, 20,30, 20, rep(0,6))

lp("min",f,M,ineq,b)$solution
#the objective function is 0.425625 = 0.0000000 0.6736111 0.0000000 0.2430556 0.0000000 0.0000000

# under 500 calories:
# 0.0000000 0.6736111 0.0000000 0.2430556 0.0000000 0.0000000


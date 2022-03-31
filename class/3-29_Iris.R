iris # load the iris dataset
x=iris[1:50,]$Sepal.Length
y=iris[1:50,]$Sepal.Width
plot(x,y)

A = cbind(x,1) # replace 1 with rep(1,50) to remove warning
solution = inv(t(A)%*%A)%*%(t(A)%*%y) #if there's error change y to matrix

curve(0.7985283*x - 0.5694327, add=TRUE,col="red")

# Using GramSchmidt

Q1 = gramSchmidt(A) # the one that's built in
Q2 = gram.schmidt(A) # our own

z = proj(y,Q2)

#bind matrix
cbind(A,z)
rref(cbind(A,z))


#rejecting the repeated rows
rref(cbind(A[1:2,], z[1:2]))

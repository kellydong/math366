x= runif(200,min = -10,max=10)
y=3*x^2-5*x+4 
y = y+runif(200,min=-20,max=20) # adding background noise
plot(x,y)

A=cbind(x^2,x,1)
inv(t(A)%*%A)%*%(t(A)%*%y)

curve(2.977819*x^2-4.894618*x+4.379622, add=TRUE,col="red")

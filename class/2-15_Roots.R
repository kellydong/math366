# ifelse statement 
# let's make a piecewise function
# |x| = x, if x>=0
#     = -x, if x<0

f = function(x){
  if(x>=0){
    x
  } else{
    -x
  }
}

# this finds a root on the interval from [a,b] for the equation f(x) = 0
# by using the bisection algorithm. The number of steps to use is by default
# set n = 20 (2^20 ~ 1 million, will bring you close to five or 6 decimal place
# of accuracy)

# By writing n = 20 in the parameter, by default n = 20 if not specified
locate.root = function(f,a,b,n=20){
  root = (a+b)/2
  for(i in 1:n){
    # The way to check for end point is by multiplying the value of the endpoints.
    if(f(a)*f(root) < 0){
      b = root
    } 
    else{
      a = root
    }
    root = (a+b)/2
  }
  root
}

f = function(x){x^2-2}
# Trying with the function above:
# locate.root(f,0,2) = 1.414214

# This divides the interval [a,b] into N sub-intervals
# then it applies the bisection algorithm each sub-interval

# seq(0,1,length.out = 5) 
# This make numbers that are seperated equally
roots = function(f,a,b,n=20,N=100){
  x = seq(a,b,length.out = (N+1))
  roots = NULL
  for(i in 1:N){
    if(f(x[i])*f(x[i+1]) < 0){
      roots = c(roots, locate.root(f, x[i], x[i+1], n))
    }
  }
  roots
}
# roots(f,-2,2) ==> -1.414 1.414

g = function(x){sin(3*x) - 5*x^3}
# result: [1] -0.5818222  0.5818222
# note that 0 wasn't here, b/c it fell right at the midpoint/root
# play around with the interval and try not to input symmetrical interval
# ex: root(g,-0.9,0.8)

# Another Issue:
# j = function(x){sin(3*x)}
# roots(j,0,2*pi,N=3) => NULL
# roots(j,0,2*pi,N=4) => 2.094395 5.235988
# roots(j,0,2*pi,N=5) => 2.094395 3.141593 4.188790 5.235988
# play around with the numbers until the numbers stop growing
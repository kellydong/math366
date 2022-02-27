# 2/3 Loops

## RECAP
x = 2 # value will be stored in environment
# After this line is ran, type x in console to get the value of x
x = x + 3 #mathematical nonsense (but this means replacing x with x+3)

# In the old days the notation is this:
x <- 2
x <- x+2

# Let us find the sum of the first 100 integers
s = 0 # sum = 0
s = s + 1 # Keep in mind that s is changing, sum = 1 
s = s + 2 # sum = 3
s = s + 3 # sum = 6
# ...
# s = s + 100

# "FOR" Loop
# we want to say s = s+n where n foes form 1 to 100
s = 0
for (n in 1:100) {
  s = s + n
}
# running this calculates s but doesn't show it
print(s) # prints s without going into the console

# Note if print(s) is put inside the loop then it will excute everytime s changes

# Fibonocci 
# (fn)n>=0
# 1,1,2,3,5,8,13,21
# Initial conditions: f0 = 1, f1 = 1
# fn = fn-1 + fn-2 for n>=2

# Let us generate the vector of the first 100 terms of the Fibonnaci sequence

f = rep(NA,101) # starts at index 0 to index 100 = 101 terms
# NA repeated 101 times
f[1] = 1
f[2] = 1
# f[3] = f[2] + f[1]
# f[4] = f[3] + f[2]
for (n in 3:101) {
  f[n] = f[n-1] + f[n-2]
}
# result of f will be in exponential notation
# R only keeps 6 digits


# An alternative method
f = NULL
# the difference between NA and NULL is that NA is an empty palce holder and NULL is a empty set
# c(NA,NA) -> NA, NA
# c(NULL, NULL) -> NULL (union of two empty set)

# f = NULL
# f[2] = 3
# result: NA, 3

f[1] = 1
f[2] = 1
# each time a new term is added on
for(n in 3:10){
  f[n] = f[n-1] + f[n-2]
  print(f)
}



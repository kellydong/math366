# Problem 1
F = function(A) {
  n = nrow(A)
  m = ncol(A)
  answer = 0
  for (i in 1:n) {
    for (j in 1:m) {
      answer = answer + (A[i,j]*A[i,j])
    }
  }
  answer = sqrt(answer)
  answer
}

one = function(A) {
  n = nrow(A)
  m = ncol(A)
  largest = 0
  for (i in 1:m) {
    total = 0
    for (j in 1:n) {
      total = total + abs(A[j,i])
    }
    if (total >= largest) {
      largest = total
    }
  }
  largest
}

inf = function(A) {
  n = nrow(A)
  m = ncol(A)
  largest = 0
  for (i in 1:n) {
    total = 0
    for (j in 1:m) {
      total = total + abs(A[i,j])
    }
    if (total >= largest) {
      largest = total
    }
  }
  largest
}

two = function(A) {
  values = c(eigen(t(A)%*%A)$values)
  largest = max(values)
  answer = sqrt(largest)
  answer
}

mat.norm = function(A,type = c("one","inf","F","2")) {
  if (type == "one") {
    one(A)
  }
  else if (type == "inf") {
    inf(A)
  }
  else if (type == "F") {
    F(A)
  }
  else if (type == "2") {
    two(A)}
}

# Problem 2
f = function(x){
  (x^3) - 1
}

g = function(x){
  3*(x^2)
}

newtons.method = function(f,g,x0,n){
  s = x0 - f(x0)/g(x0)
  for(i in 1:(n-1)){
    s = s - f(s)/g(s)
  }
  s
}

#Q1
Food = c("Nuttela",
         "Peanut Butter",
         "Pasta",
         "Oats",
         "Soybeans",
         "Egg White Isolate")

f.vec = c(30,50,2,8,25,0)
c.vec = c(60,20,75,68,35,3)
p.vec = c(6,25,14,13,36,80)
cal = c(540,590,370,375,500,420)
a = c(0.85,0.52,0.35,0.31,2.53,6.59) 

optimize.food = function(a, p.vec, c.vec, f.vec, p, c, f, cal.low, cal.high){
  n = length(Food)
  A = data.frame(Food, f.vec, c.vec, p.vec, cal, a)
  func = A$a
  M = rbind(A$cal, A$cal, A$f.vec, A$c.vec, A$p.vec, diag(n))
  ineq = c(">=", "<=",rep(">=",3), rep(">=",n))
  b = c(cal.low, cal.high, p, c,f, rep(0,n))
  lp("min",func,M,ineq,b)$solution
}

optimize.food(a,p.vec,c.vec,f.vec,20,30,20,0,500)

#Q2


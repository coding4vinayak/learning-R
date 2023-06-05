#r programming loop 
x <- rnorm(5)
x


for(i in x){
  print(i)
}

#conventional programming 
for(j in 1:5){
  print(x[j])
}

#-------------------
N <- 100
a <- rnorm(N)
b <- rnorm(N)

#vectorized opration
c <- a * b
c

# de- vectorize opration

d <- rep(NA,N)
for(i in 1:N){
  d[i] <- a[i] * b[i]
}
d





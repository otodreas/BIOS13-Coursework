n <- 1000 # the length of the walk
x <- rep(0, n) # start with all zeros

# get an empty plot to start with:
plot(NA, type = 'n', xlim=c(0,n), ylim=c(-2*sqrt(n),2*sqrt(n)))
for (iter in 1:100) { # repeat 100 times
  # walk randomly:
  for (i in 1:(n-1)) { 
    x[i+1] <- x[i] + rnorm(1)
  }
  # plot:
  lines(1:n,x, col = "black")
} 


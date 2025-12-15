# Clear variables
rm(list = ls())

# Parameters
r1 <- 1
k <- 0.1

# Vector of population sizes
n1 <- seq(0, 10, length.out = 100)

# Vector to store population change at each population size
dndt <- n1

# Loop through values of n, update corresponding dndt
for (i in seq_along(n1)) dndt[i] <- (r1 - k * n1[i]**2) * n1[i]

# Plot
plot(
  n1, dndt,
  type = "l", main = "Dynamics of\npopulation 1",
  xlab = "Population size", ylab = "Derivative of population size"
)

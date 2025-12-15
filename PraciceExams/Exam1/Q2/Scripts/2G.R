# Clear variables
rm(list = ls())

# Install and mount packages
# install.packages("deSolve")
library(deSolve)

# Assign starting state values to vector y
y <- c(n1 = 5, n2 = 1)

# Assign vector containing time sequence
times <- seq(0, 100, by = 0.1)

# Assign parameters to global environment
params <- c(r1 = 1, r2 = 1, k = 0.1, m = 0.5)

# Assign function to compute values of derivatives in system
func <- function(t, state, params) {
  with(as.list(c(state, params)), {
    dn1dt <- (r1 - k * n1**2) * n1 - m * n1
    dn2dt <- (r2 - k * n2**2) * n2 - m * n1 # Is this right? n1 in this equation means pop can go below 0
    return(list(c(dn1dt, dn2dt)))
  })
}

# Run ODE solver for both populations
out <- ode(y, times, func, params)

# Plot
plot(
  out[, 1], out[, 2],
  type = "l", ylim = c(min(out[, 2], out[, 3]), max(out[, 2], out[, 3])),
  main = "Populations over time", xlab = "Time", ylab = "Population size", col = "red"
)
points(out[, 1], out[, 3], type = "l", col = "blue")

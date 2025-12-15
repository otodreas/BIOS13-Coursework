rm(list = ls())

library(deSolve)

r1 <- 1
r2 <- 1
k <- 0.1
m <- 0.5

time <- seq(0, 100, by = 0.1)

coupled_dynamics <- function(t, state) {
  n1 <- state[1]
  n2 <- state[2]

  dn1 <- (r1 - k * n1**2) * n1 - m * n1
  dn2 <- (r2 - k * n2**2) * n2 - m * n1

  list(c(dn1, dn2))
}

initial_state <- c(n1 = 5, n2 = 1)

result <- ode(
  y = initial_state,
  times = time,
  func = coupled_dynamics,
  params = NULL
)

plot(result[, "time"], result[, "n1"], type = "l", col = "blue")
lines(result[, "time"], result[, "n2"], col = "red")
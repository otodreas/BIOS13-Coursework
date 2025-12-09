rm(list=ls())
library(deSolve)

#Define SIR model as function (later used in the ODE solver)
SIRV_func <- function(t, SIRV, P) {
  S <- SIRV[1]
  I <- SIRV[2]
  R <- SIRV[3]
  V <- SIRV[4]
  
  #Assume that vaccination takes time to get in place at some time t_vaccine
  if (t<P$t_vaccine) { #before vaccination the model as before
    dSdt <- -P$beta * I * S + P$gamma*R 
    dIdt <- P$beta * I * S - P$rho * I 
    dRdt <- P$rho * I - P$gamma*R
    dVdt <- 0
  } else { #after vaccination 
    dSdt <- -P$beta * I * S + P$gamma*R - P$c*S 
    dIdt <- P$beta * I * S - P$rho * I
    dRdt <- P$rho * I - P$gamma*R - P$c*R
    dVdt <- P$c*(S+R)
  }
  return(list(c(dSdt,dIdt,dRdt,dVdt)))
}

SIRV0 <- c(S=1000, I=1, R=0, V=0)
R0 <- 3
rho <- 1/14
beta <- rho*R0/SIRV0[1]


#Parameters as before but now also with c (vaccination rate), t_vaccine (time vaccination is possible) and vaccination efficiency
# Assume that vaccination is done within 30 days
# Assume that vaccination is in place after one year

P <- list(beta=beta, rho=rho, gamma=1/180, c=1/30, t_vaccine=365)

#Test if the R0 makes sense
R0 <- 1/P$rho * P$beta * SIRV0[1]
cat('R0 = ', R0)

tt <- seq(0,700, by=1)
result <- ode(y=SIRV0, func=SIRV_func, parms=P, times=tt)
plot(result)

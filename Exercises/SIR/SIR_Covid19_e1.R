rm(list=ls())
library(deSolve)

#Define SIR model as function (later used in the ODE solver)
SIR_func <- function(t, SIR, P) {
  S <- SIR[1]
  I <- SIR[2]
  R <- SIR[3]
    dSdt <- -P$beta * I * S + P$gamma*R
    dIdt <- P$beta * I * S - P$rho * I - P$mu*I
    dRdt <- P$rho * I-P$gamma*R
    
  return(list(c(dSdt,dIdt,dRdt)))
}

SIR0 <- c(S=1000, I=1, R=0) #Inital conditions


#Parameters
#For Covid-19 recovery rate is 14 days => rho=1/14)
rho <- 1/14 

#R0 has been estimated to be between 1.5-3.5 (see slide)
R0<-3

#Beta can be computed from R0 (see slide)
beta <- rho*R0/SIR0[1]

#Collect parameter in P, including gamma assuming that resistance only last for 30 days (also test with 180 days)
# Also including some death rate that is high but still less than the recovery rate e.g. 0.035
P <- list(beta=beta, rho=rho, gamma=1/30, mu=0)
#P <- list(beta=beta, rho=rho, gamma=1/180, mu=0.035)


tt <- seq(0,200, by=1) #Set time values for the solver

#Run the solver and plot the results
result <- ode(y=SIR0, func=SIR_func, parms=P, times=tt)
plot(result)

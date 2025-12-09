rm(list=ls())
library(deSolve)

#Define SIR model as anction (later used in the ODE solver)
SIR_func <- function(t, SIR, P) {
  S <- SIR[1]
  I <- SIR[2]
  R <- SIR[3]
    dSdt <- -P$beta * I * S 
    dIdt <- P$beta * I * S - P$rho * I
    dRdt <- P$rho * I
    
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

#Collect the parameters in same variable as a list of parameters 
P <- list(beta=beta, rho=rho) #collect parameter in P


tt <- seq(0,200, by=1) #Set time values for the solver

#Run the solver and plot the results
result <- ode(y=SIR0, func=SIR_func, parms=P, times=tt)
plot(result)

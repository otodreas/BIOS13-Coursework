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


#Start by assuming some valus for rho and beta
rho <- 1/7 # Recovery rate (1/rho = time you stay infected) (For Covid-19 recovery rate is 14 days => rho=1/14)
beta <- 0.0002 # Contact rate (For Covid-19, estimated from R0 equation (see slide))

#Collect the parameters in same variable as a list of parameters (note: can be done directly, makes lines 20 and 21 redundant)
P <- list(beta=beta, rho=rho) #collect parameter in P


# Growth rate initially for the virus R0 can be derived from the parameters above (see slides)
#R0<- 1/P$rho*P$beta*SIR0[1]
#cat('R0 = ', R0) #Print to console


tt <- seq(0,200, by=1) #Set time values for the solver

#Run the solver and plot the results
result <- ode(y=SIR0, func=SIR_func, parms=P, times=tt)
plot(result)

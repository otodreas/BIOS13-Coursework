runQ <- function(Pin, Pout, T_queue) {
  #Write a function "runQ.R" that takes three input variables: 
  #runQ <- function(Pin, Pout, T_queue) and
  #simulates a queue for T_queue minutes 
  #plot the length of the queue over time
  
  #Start with an empty gueue: 
  Q_length <- 0
  Q_stored <- rep(0,T_queue)
  for (t in 1:T_queue){
    #Every minute, a new customer is added to the queue with probability Pin
    if (runif(1)<Pin){
      Q_length <- Q_length + 1
    }
    #Also every minute, a customer is finished with probability Pout and leaves the queue
    if(runif(1)<Pout && Q_length>0){
      Q_length <- Q_length - 1
    }
    Q_stored[t]<-Q_length
  }
  
 #plot the length of the queue over time
  plot(1:T_queue, Q_stored, type='l')
  
}
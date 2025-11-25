runMoran <- function(N, tmax){
  #Write a function runMoran that simulates
  # the Moran process tmax (input variable) time-steps,
  #starting with a single copy of A
  #and returns the final number of A's
  
  #A vector of individuals: 
  population <- rep('B',N)
  #A single A indvidual 
  population[1] <- 'A'
  
  for (t in 1:tmax){
    #Each time-step, one random individual i chosen to die.
    dying_and_reporducing <- sample.int(N,2)
    dying <- dying_and_reporducing[1]
    reproducing <- dying_and_reporducing[2]
    
    #It is replaced by the copy of another randomly chosen individual that was
    #chosen to reproduce
    population[dying]<-population[reproducing]
    
    #Note: To introduce selection for A you would like to give a A individuals
    # a higher probability of being selected for reproduction than a B
    # individual. This can be done by identifying A and B individuals in the
    # population vector and then sample that vector with weighted sampling
    # (see slides)
  }
  #Retrun the number of A's in the population by suming the numer of 'TRUES'
  #retrund by the sum funtion
  return(sum(population=='A'))
}



#Write another function Pfixation that uses runMoran to
#iterate the Moran process repeated times and returns 
#the probability of fixation of A.
Pfixation <- function(N,repeats){
  tmax <- 10000
  count <- 0
  for (i in 1:repeats){
    Acount <- runMoran(N,tmax)
    #Count the number of fixations
    if (Acount==N){
      count <- count+1
    }
  }
  return(count/repeats)
}


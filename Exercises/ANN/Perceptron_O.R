# R Perceptron based on perceptron.m 


StepFunction <- function(Input) {
   
   if(Input <= 0) {
      Outsignal <- 0
   } else {
      Outsignal <- 1
   }
   return(Outsignal)
   
}

NUM_EXAMPLES <- 4
NUM_INPUTS <- 2
# Set up a matrix of input examples. Each row is an example input set.
INPUT <- matrix(c(0, 0,
                  1, 0,
                  0, 1,
                  1, 1), nrow=NUM_EXAMPLES, ncol=NUM_INPUTS, byrow = TRUE)

CORRECT_OUTPUT <- c(0,1,1,1) # correct output

eta <- 0.8  # factor controlling how much weights should be adjusted
done <- FALSE     # Flag to signal when a solution has been found
Count <- 0        # counter for the number of batches (a batch = try all four examples)

W <- runif(3,-3,3) # initialize random uniform weights between -3 and 3
print(W)
SaveOutput <- c() # empty vector to save output

while(!done && Count < 25) {      # the ! is a NOT operator. Task will be solved when done = TRUE
   
   TOTAL_ERROR <- 0 # Sums up total error in one batch
   for(Example in 1:NUM_EXAMPLES)  {          # four examples of pairwise input 0 or 1
      
      # start with the bias (last weight):
      SumWS <- W[NUM_INPUTS+1]*1          # SumWS sums the product from the weights * signals
      # Add the rest of the signals:
      for(Weight in 1:NUM_INPUTS) { 
         Signal <- INPUT[Example, Weight] # get signal from signal vector
         SumWS <- SumWS + W[Weight]*Signal                # sum for all weights
      }
      
      Output <- StepFunction(SumWS)           #check if incoming signal produces output in transfer function   
      Error <- Output - CORRECT_OUTPUT[Example] # difference between expected and actual output (=supervision!)
      
      TOTAL_ERROR <- TOTAL_ERROR  + abs(Error)
      
      if(Error > 0) {          # check if weights should be decreased
         W[1] <- W[1] - abs(Error*INPUT[Example,1]*eta)      # adjust weight 1
         W[2] <- W[2] - abs(Error*INPUT[Example,2]*eta)      # adjust weight 2
         W[3] <- W[3] - abs(Error*eta)                      # adjust weight 3 (=bias)
      } 
      
      if(Error < 0 ) {      # check if weights should be increased
         for (i in 1:NUM_INPUTS) {
            W[i] <- W[i] + abs(Error*INPUT[Example,i]*eta)   # adjust weight i
         }
         W[NUM_INPUTS+1] <- W[NUM_INPUTS+1] + abs(Error*eta) # adjust the bias
      }
      
   }
   Count <- Count + 1
   SaveOutput[Count] <- TOTAL_ERROR/NUM_EXAMPLES
   if(TOTAL_ERROR == 0) {
      done <- TRUE # if we got no error -> task is done, exit 
      # (we could also use a break statement here, instead of the flag)
   }   
}


op <- par(mfrow = c(1,2)) 
plot(1:Count,SaveOutput,type="l",ylab="Error",xlab="iterations",main="error after n interations",ylim=c(0,1)) # plot error rate at the end
# plot correct outputs with different colors:
plot(INPUT, col = as.factor(CORRECT_OUTPUT),pch=19,xlim=c(-0.5,1.5),main="decision boundary") # plot decision boundary
# Plot the decision boundary:
slope <- W[1]/(-W[2])
intercept <- W[3]/(-W[2])
abline(intercept,slope,lwd=2)
par(op) # reset graphics variables to previous state (cleaning up)


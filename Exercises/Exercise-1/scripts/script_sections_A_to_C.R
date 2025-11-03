####Keep an eye to all the comments inside the script, they will be useful for 
#### you to be able to understand more easily the contents of this script

rm(list = ls()) #Eliminates all the objects that were present in the environment
#### Exercises basic R course ####
### A. Variables and labels ###
## 1. Create a variable named tigers with the value 10 ##
tigers <- 10 

## 2. Create another variable lions with the value tigers + 12 ##
lions <- tigers + 12

## 3. Check that there now are two object called tigers and lions, using ls() 
## or objects(). ##
ls()
objects()

## 4. Make sure that lions has the value 22.##
cat("lions = ", lions, "\n") #This will result in printing the value of lions
                             #whenever I source the script.
                             #including "\n" within cat() is used to tell R that 
                             #next time it prints something it has to be in a 
                             #separate line 

## 5. Change the value of tigers to 15 ##
tigers <- 15

## 6. Make sure that lions still has the value 22 (and that you understand why). ##
cat("lions = ", lions, "\n") #Same as question 4

## 7. It is possible to name or tag almost anything in R. A name attribute 
##can be a longer, more meaningful description of a variable, which may have 
## more meaning than the, often short, variable name (such as tigers or lions 
## above). It can also be a short description of a column of a data frame. 
##The names() function is used to access or change the name attribute of a 
## variable. Try the following commands:
names(tigers) <- "The numbers of tigers in this jungle" 
print(tigers)
names(tigers)
tigers2 <- 2*tigers
tigers2
print(tigers2)
unname(tigers2)

### B. Expressions ###
## 8. Calculate (you find the correct answer on the right): ##
2^8 #a
26/7 #b
(26 + 2^8)/7 #c
26 + 2^(8/7) #d
(26+2)^(8/7) #e

## 9. Create variables 𝑎 = 4 and 𝑏 = 7 and calculate ##
a <- 4
b <- 7
a^b #a
sin(a) + exp(b) #b
b*sqrt(a) #c
pi * log(a + b) #d

### C. Vectors ###
## 10. Use the commands c(), seq() or rep() to create the vectors:##
rep(2, 3) #a, this command repeats whatever you tell it the number of times you want
seq(2, 10, by = 2) #b, creates a sequence going from 2 to 10 with steps of 2
seq(0, 300, by = 3) #c, same as b but from 0 to 300 with steps of 3
rep(2:3, 3) #d, the rep command can also be used with vectors (in this case
            # the vector 2:3 is repeated 3 times)
seq(0.5, 2, by = 0.1) #e, same as b and c but sequence from 0.5 to 2 with steps of 0.1
seq(11, 27, length = 23) #f, same seq command but this time you choose the legnth 
                         #of the vector
seq(8, -1) #g, typing the following: 8:-1 also works fine, when you don't specify
           # the step size by =, then R will automatically take steps of 1

## 11. ##
u <- seq(5, 100, by = 5)
u[c(3, 7)] <- 0 #you can multi-index by using a vector, in this case elements 3
                # and 7 by creating a vector c(3, 7) containing these numbers
u[u > 50] <- -3 #note here how I'm using u > 50 to index all values above 50
u <- u + 7
print(u)

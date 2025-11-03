# R lecture 1

# assigning variables: use <- (alt + "-")
p <- 0

# list variables
ls()

# remove variable
rm(p)

# remove all variables
rm(list=ls())

# math
NA  # missing value
NaN  # undefined (not an number)
NULL  # empty set (nothing)
Inf  # infinity
-Inf  # negative infinity

# Logical operators
# <, <=, >, >=, ==, !=
# &, &&: and
# |, || or
3 < 8 && 5 == 2  # you usually want to use double equals sign

# VECTORS
# can only store one data type
c(1, 2.5, 8)
1:5  # create vector of integers
5:1
seq(1, 6, by=10)  # jump integer places using by
seq(1, 5, length=6)  # create exact ranges using length
rep(3, 4)  # repeat value
rep(3:7, 2)  # repeat vector

# VECTOR FUNCTIONS
x <- c(1,2,3,5,99)
length(x)
range(x)
sort(x)
var(x)
sd(x)

# MATHEMATICAL EXPRESSIONS WITH VECTORS
x <- c(1,2,3,5,99)
y <- c(0,4,0,9,9)
z <- c(0,1)
x * 4  # basic math operations are applied on all values
x * y  # you can do operations on vectors of equal length
x * z  # cycles over z

# INDEXING
v <- seq(1, 3, by=0.5)
v
v[2]  # one based indexing
v[3] <- 100  # replace value by index

v
v[1:3]  # slicing
v[c(1, 4)]
v[-2]  # everything but the minus index
v[-(2:4)]  # everything but elements 2 through 4

v2 <- c(T, T, T, F)
x2 <- c(4, 34, 88, 9)
x2 < 10  # by element in x2, which values pass the condition

x2[c(T, F, F, T)]  # drop positions where the value is false
# or ...
x2[x2<10] <- 0; x2  # get values from x2 less than 10 and overwrite with 0

# ASSIGNING CAN EXTEND A VECTOR
x <- 1:3; x
x[6] <- 99; x  # NA values added to fit 99 into the vector x
x + c(1, 100)  # vector recycling

# CHARACTER OBJECTS/STRINGS
char_obj <- c("hello", "world"); char_obj
char_obj[1]  # get first element (NOT LETTER, EVEN WHEN 1D)
substr(char_obj[1], 1, 3)  # get elements by location using sub-string
substr(char_obj[1], 1, 1) <- "H"; char_obj  # fix case

# LISTS
# support mixed data types, element names
mylist <- list(car=c("volvo", "bmw"), weight=9, "unnamed"); mylist  # name elements
mylist$car  # access elements by name with $
# for lists, you NEED to use double brackets for classical indexing
mylist[1]  # returns a list
mylist[[1]]  # returns a vector (most basic data type in R, in this case a character vector)

mylist[[1]][2]  # returns second element of first element of list ([0][1] in python)
mylist[1][2]  # returns nothing

# COERCIONS between data types
as.numeric("12")
as.character(43)
as.integer(pi)

# INPUT AND OUTPUT: get inputs from user, generate outputs
x <- readline("Assign variable using input: ")
plot(1:10, (1:10)^2)  # plotting on x and y axis

# PROGRAM CONTROL
x <- rnorm(1); x  # random value from normal distribution (mean 0)
if (x < 0) x <- -x; x  # make positive

x <- runif(2, 0, 1); x  # random value from uniform dist (2 values from 0-1)

# WHILE
n <- 0
x <- runif(1)
while (x < 5/6) {
        x <- runif(1)  # draw random
        n <- n+1  # increment counter
}
cat(n)

# REPEAT
n <- 0
repeat {  # equivalent to while True in python
        x <- runif(1)
        if (x < 5/6) {
                n <- n+1
        } else {
                break  # in a repeat loop, you need to break
        }
}
cat(n)

# FOR
for (i in 1:3) print (1:i)  # for loop one liner

# multi line for
for (i in 1:3) {
        print(1:i)
}
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


#### BIOS13 Linear algebra in R:  owl-rat dynamics

rm(list = ls())
#dynamic matrix:
A=matrix(c(0.5,-0.2,0.3,1.2),nrow = 2,ncol = 2)

#start population is 2000 and 1000:
x0=c(2000,1000)
#according to the dynamical system, x1=A%*%x0:
x1=A%*%x0
x2=A%*%x1
#how about after time t?
#create a time series:
x_old=x1
o_series=x_old[1,]
r_series=x_old[2,]
#run for 10 years:
time=10
#from the second year:
for (i in 2:time){
    x_new=A%*%x_old
    o_series=c(o_series,x_new[1,])
    r_series=c(r_series,x_new[2,])
    x_old=x_new
}


#plot the time series:
plot(1:time,o_series,type = 'l',col='blue',
     main="Population sizes of owls and rats",
     xlab="years",
     ylab="population size")
    
lines(1:time,r_series,col='red')

#point out the population size at the end of the time series: (the population size at the end time)
points(time,o_series[time],pch=16, col='blue')
points(time,r_series[time],pch=16, col='red')
text(x = c(time,time),
     y = c(o_series[time],r_series[time]),
     labels = c(o_series[time], r_series[time]))

legend("topleft",c("owls","rats"),fill=c("blue","red"))


#note:
#%*% Multiplies two matrices, if they are conformable. 
#If one argument is a vector, it will be promoted to either a row or column matrix to make the two arguments conformable. 
#If both are vectors of the same length, it will return the inner product (as a matrix).

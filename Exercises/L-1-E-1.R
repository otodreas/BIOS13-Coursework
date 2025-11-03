# Write a script that
#         creates vector v1 with values 1, 1.5, 2, 2.5, ..., 7
#         creates vector v2 with the 3rd, 4th, and 11th elements of v1
#         assigns zero to values of v2 larger than 2
#         prints out v2 in the console using cat
# run script using "source"

v1 <- seq(1, 7, by=0.5)
v2 <- v1[c(3, 4, 11)]
v2[v2 > 2] <- 0
print(v2)  # in this case, "print" works too, but it prints with leading [1]

# DOCS ON RUN VS SOURCE
# The difference between running lines from a selection and invoking Source is
# that when running a selection all lines are inserted directly into the console
# whereas for Source the file is saved to a temporary location and then sourced
# into the console from there (thereby creating less clutter in the console).
reverse_vector <- function(v) {
  rv = rep(0, length(v))
  for (i in seq_along(v)) {
    rv[length(v) - i + 1] <- v[i]
  }
  return(rv)
}
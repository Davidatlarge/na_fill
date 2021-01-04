# replace NA with input value
# choose maximum number of consecutive NAs to fill
# choose if leading and tailing NAs should be filled

na_fill <- function(values, # vector of values
                    maxgap, # maximum number of consecutive NAs to fill
                    filler, # fill value
                    fill.ends = FALSE # should leading and tailing NAs be filled if they are fewer than maxgap
) {
  runs <- rle(is.na(values))
  to.replace <- rep(runs$values & runs$lengths <= maxgap, runs$lengths)
  if(!fill.ends) {
    if(runs$values[1]) {to.replace[1:runs$lengths[1]] <- FALSE}
    if(runs$values[length(runs$values)]) {
      to.replace[(length(to.replace)-runs$lengths[length(runs$values)]+1):length(to.replace)] <- FALSE
    }
  }
  values[to.replace] <- filler
  return(values)
}

# na_fill(c(NA,NA,1,2,3,NA,2,3,NA,NA,NA,4,3,NA,NA,NA), 3, 0, fill.ends = FALSE)

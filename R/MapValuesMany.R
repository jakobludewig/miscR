#' Map a number of multiple values to single values (code by Mark Riseley)
#'
#' to is a single target recoding value for each list main element in from,
#' e.g. from = list(1:10, 11:20), to = c("1-10"; "11:20")
#' @param x, from, to
#' @keywords recode, vectors, map
#' @export
#' @examples
#' MapValuesMany(x,from,to)
MapValuesMany <- function(x, from, to=names(from)) {
   # nb not handling factor variable
   stopifnot(length(from)==length(to))
   # not worrying if from values not in x
   # handling factors
   if (is.factor(x)) {
      # ensure NAs get converted if intended
      if(anyNA(from)) x <- addNA(x)
      levels(x) <- MapValuesMany(levels(x), from, to)
      return(x)
   }
   # initialize result vector
   result <- rep(NA, length(x))
   # check if any thing is missed by from
   notinfrom <- !x %in% unlist(from)
   # loop through from list
   for(i in seq_along(from)) {
      test <- x %in% from[[i]]
      result[test] <- to[[i]]
   }
   # reinstate original values for anything not in from
   result[notinfrom] <- x[notinfrom]
   return(result)
}

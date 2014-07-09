require(plyr)
require(mvtnorm)

#'
#' This function generates normal-multinomial random sample
#' 
rnorm.multinom <- function (N, Mu, Sigma, Size) {
  M = cbind(exp(rmvnorm(N, Mu, Sigma)), 1)
  M = M / apply(M, 1, sum)
  M = cbind(as.numeric(Size), M)
  aaply(.data=M, .margins=1, .expand=FALSE, 
      .fun = function(p) as.numeric(rmultinom(1, as.numeric(p[1]), p[-1])) )
} 
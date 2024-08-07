SSmean <- function(m1 = NULL, m2 = NULL,
                           sd1 = NULL, sd2 = NULL,
                           sd.global = NULL,
                           alpha = 0.05, power = 0.8,
                           type = "two.sample",
                           alternative = "two.sided") {

  #### Check Params ####
  if(is.null(m1) | is.null(m2)){
    stop("m1 and m3 must be provided")
  }

  if((is.null(sd1) | is.null(sd2)) & is.null(sd.global)){
    stop("If sd.global is missing, both sd1 and sd2 must be provided")
  }

  #### Code Fonction ####
  if(!is.null(sd1) & !is.null(sd2)) {
    sd <- sqrt((sd1^2+sd2^2)/2)
  } else {
    sd <- sd.global
  }

  return(N = ceiling(pwr::pwr.t.test(d = abs(m1-m2)/sd,
                                     sig.level = alpha, power = power,
                                     alternative = alternative)$n))
}


# SSmean(m1 = 2350, m2 = 1850,
#             sd1 = 250, sd2 = 400)

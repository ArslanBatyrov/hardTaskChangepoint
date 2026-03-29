fit_ar_change <- function(x, ar_order = 1, trend = FALSE,
                          method = "PELT", minseglen = 5) {
  if (!is.numeric(x)) {
    stop("x must be numeric")
  }
  
  if (any(is.na(x))) {
    stop("x must not contain missing values")
  }
  
  if (!ar_order %in% c(1, 2)) {
    stop("ar_order must be 1 or 2")
  }
  
  if (!is.logical(trend) || length(trend) != 1) {
    stop("trend must be TRUE or FALSE")
  }
  
  if (!method %in% c("PELT", "AMOC")) {
    stop("method must be 'PELT' or 'AMOC'")
  }
  
  if (!is.numeric(minseglen) || length(minseglen) != 1 || minseglen <= 0) {
    stop("minseglen must be a positive number")
  }
  
  n <- length(x)
  
  if (ar_order == 1 && n < 3) {
    stop("x is too short for AR1 changepoint fitting")
  }
  
  if (ar_order == 2 && n < 4) {
    stop("x is too short for AR2 changepoint fitting")
  }
  
  if (ar_order == 1 && !trend) {
    design_matrix <- cbind(
      x[-1],
      rep(1, n - 1),
      x[-n]
    )
  }
  
  if (ar_order == 1 && trend) {
    design_matrix <- cbind(
      x[-1],
      rep(1, n - 1),
      2:n,
      x[-n]
    )
  }
  
  if (ar_order == 2 && !trend) {
    design_matrix <- cbind(
      x[-c(1, 2)],
      rep(1, n - 2),
      x[2:(n - 1)],
      x[1:(n - 2)]
    )
  }
  
  if (ar_order == 2 && trend) {
    design_matrix <- cbind(
      x[-c(1, 2)],
      rep(1, n - 2),
      3:n,
      x[2:(n - 1)],
      x[1:(n - 2)]
    )
  }
  
  fit <- EnvCpt:::cpt.reg(
    design_matrix,
    method = method,
    minseglen = minseglen
  )
  
  return(fit)
}
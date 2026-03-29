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
  
  NULL
}

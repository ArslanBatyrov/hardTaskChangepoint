test_that("fit_ar_change runs for AR1 without trend", {
  x <- c(rnorm(100, 0, 1), rnorm(100, 3, 1))
  fit <- fit_ar_change(x, ar_order = 1, trend = FALSE)
  expect_s4_class(fit, "cpt.reg")
})

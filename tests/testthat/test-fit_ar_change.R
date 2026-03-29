test_that("fit_ar_change runs for AR1 without trend", {
  x <- c(rnorm(100, 0, 1), rnorm(100, 3, 1))
  fit <- fit_ar_change(x, ar_order = 1, trend = FALSE)
  expect_s4_class(fit, "cpt.reg")
})

test_that("fit_ar_change runs for AR2 without trend", {
  x <- c(rnorm(100, 0, 1), rnorm(100, 3, 1))
  fit <- fit_ar_change(x, ar_order = 2, trend = FALSE)
  expect_s4_class(fit, "cpt.reg")
})

test_that("fit_ar_change runs for AR1 with trend", {
  x <- c(0.02 * (1:100) + rnorm(100, 0, 1),
         0.05 * (101:200) + rnorm(100, 0, 1))
  fit <- fit_ar_change(x, ar_order = 1, trend = TRUE)
  expect_s4_class(fit, "cpt.reg")
})

test_that("fit_ar_change runs for AR2 with trend", {
  x <- c(0.02 * (1:100) + rnorm(100, 0, 1),
         0.05 * (101:200) + rnorm(100, 0, 1))
  fit <- fit_ar_change(x, ar_order = 2, trend = TRUE)
  expect_s4_class(fit, "cpt.reg")
})

test_that("fit_ar_change rejects non-numeric input", {
  expect_error(fit_ar_change(letters), "x must be numeric")
})

test_that("fit_ar_change rejects missing values", {
  expect_error(fit_ar_change(c(1, NA, 3)), "x must not contain missing values")
})

test_that("fit_ar_change rejects invalid ar_order", {
  expect_error(fit_ar_change(rnorm(20), ar_order = 3),
               "ar_order must be 1 or 2")
})

test_that("fit_ar_change rejects invalid trend", {
  expect_error(fit_ar_change(rnorm(20), trend = "yes"),
               "trend must be TRUE or FALSE")
})
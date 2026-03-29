Right now the package focuses on fitting AR1 and AR2 changepoint models, either with a trend or without one, using `EnvCpt`.

# Main function

The main function in the package is:

- `fit_ar_change()`

At the moment it supports:

- AR1 without trend
- AR2 without trend
- AR1 with trend
- AR2 with trend

# Example

```r
x <- c(rnorm(100, 0, 1), rnorm(100, 3, 1))
fit <- fit_ar_change(x, ar_order = 1, trend = FALSE)
fit
Testing

I added tests for the main cases I wanted this function to handle:

AR1 without trend
AR2 without trend
AR1 with trend
AR2 with trend
non-numeric input
missing values
invalid ar_order
invalid trend

```
Small honest note

There is still one R CMD check note coming from the use of EnvCpt:::cpt.reg, which is an internal function from EnvCpt. I kept it this way because the whole hard task is basically wrapping the easy task logic, and that original logic was built around this internal regression changepoint function.
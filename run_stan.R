
library(rstan)
library(sn)

n = 1000

x <- as.numeric(sn::rsn(n, 10, 0.25, 0.5))

datastan <- list(N = n, x = x)
fit <- stan(
  file = "skew_normal.stan",
  data = datastan,
  iter = 1000,
  chains = 4,
  pars = c("sigma", "gamma")
)

print(fit)

saveRDS(fit, file = "fit.rds")

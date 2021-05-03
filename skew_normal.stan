data {
  int<lower=0> N;      // # time points (equally spaced)
  vector[N] x;      // mean corrected return at time t
}
parameters {
  real<lower=.1, upper=.5> sigma;
  real<lower=.2, upper=.8> gamma;
}

model {
  sigma ~ uniform(0.1, 0.5);
  gamma ~ uniform(0.2, 0.8);
  x ~ skew_normal(10, sigma, gamma);
}

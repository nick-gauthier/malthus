deriv(N) <- r * N * (1 - N / K) - N * W
deriv(W) <- (a * N ^ 2 - b * W)

# Create a vector of initial condition
initial(N) <- 0.5
initial(W) <- 0

r <- user(0.015)    # growth rate [0-0.03]
K <- user(3)
a <- user(0.01)
b <- user(0.05)

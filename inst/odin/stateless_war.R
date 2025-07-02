deriv(N) <- r * N * (1 - N / K) - N * W
deriv(W) <- (a * N ^ 2 - b * W)

# Create a vector of initial condition
initial(N) <- 0.5
initial(W) <- 0

r <- parameter(0.015)
K <- parameter(3)
a <- parameter(0.01)
b <- parameter(0.05)

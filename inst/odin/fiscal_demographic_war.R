deriv(N) <- r * N * (1 - N / K) - delta * N * W
deriv(S) <- rho * N * (1 - N / K) - beta * N
deriv(W) <- a * N ^ 2 - b * W - alpha * S

K <- kmax - c * W

initial(N) <- 0.5
initial(S) <- 0
initial(W) <- 0.5

r <- user(0.015)    # growth rate [0-0.03]
rho <-  user(1)
beta <- user(0.25) # per capita state expenditure [0-1]
delta <- user(0.1)
kmax <- user(3)
a <- user(0.01)
b <- user(0.05)
c <- user(1) # not in paper
alpha <- user(0.1)

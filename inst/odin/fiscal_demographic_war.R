deriv(N) <- r * N * (1 - N / K) - delta * N * W
deriv(S) <- if ((S + s_deriv) < 0) -S else s_deriv
deriv(W) <- if ((W + w_deriv) < 0) -W else w_deriv

K <- kmax - c * W
s_deriv <- rho * N * (1 - N / K) - beta * N
w_deriv <- a * N ^ 2 - b * W - alpha * S


initial(N) <- N0
initial(S) <- S0
initial(W) <- W0

N0 <- user(1)
S0 <- user(0)
W0 <- user(0)

r <- user(0.015)    # growth rate [0-0.03]
rho <-  user(1)
beta <- user(0.25) # per capita state expenditure [0-1]
delta <- user(0.1)
kmax <- user(3)
a <- user(0.01)
b <- user(0.05)
c <- user(1) # not in paper
alpha <- user(0.1)

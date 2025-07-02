deriv(N) <- r * N * (1 - N / K) - delta * N * W
deriv(S) <- if ((S + s_deriv) < 0) -S else s_deriv
deriv(W) <- if ((W + w_deriv) < 0) -W else w_deriv

K <- kmax - c * W
s_deriv <- rho * N * (1 - N / K) - beta * N
w_deriv <- a * N ^ 2 - b * W - alpha * S


initial(N) <- N0
initial(S) <- S0
initial(W) <- W0

N0 <- parameter(1)
S0 <- parameter(0)
W0 <- parameter(0)

r <- parameter(0.015)
rho <- parameter(1)
beta <- parameter(0.25)
delta <- parameter(0.1)
kmax <- parameter(3)
a <- parameter(0.01)
b <- parameter(0.05)
c <- parameter(1)
alpha <- parameter(0.1)

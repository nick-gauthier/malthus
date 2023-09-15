deriv(N) <- r * N * (1 - N / K)
deriv(S) <- if ((S + s_deriv) < 0) -S else s_deriv


K <- k0 * (1 + c * S / (s0 + S))
s_deriv <- rho * N * (1 - N / K) - beta * N

initial(N) <- 50
initial(S) <- 200

r <- user(0.02)
k0 <- user(100)
beta <- user(1)
c <- user(400)
s0 <- user(300)
rho <- user(0.2)

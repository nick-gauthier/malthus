deriv(N) <- r * N * (1 - N / K)
deriv(S) <- if ((S + s_deriv) < 0) -S else s_deriv

K <- 1 + c * S / (s0 + S)
s_deriv <- N * (1 - N / K) - beta * N

initial(N) <- 0.5
initial(S) <- 0.1

r <- user(0.02)
beta <- user(0.25)
c <- user(3)
s0 <- user(10)

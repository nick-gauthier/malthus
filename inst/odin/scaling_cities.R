# in progress!
deriv(Y) <- r * Y * (1 - Y / K) - Y * H * N ^ beta + Tr
deriv(N) <- H / E * Y * N ^ beta - M / E * N ^ alpha + Im

initial(Y) <- 1
initial(N) <- 1

r <- user(0.1)
K <- user(1)
M <- user(4e-7)
H <- user(1e-6)
E <- user(1e-4)
beta <- user(1.1)
alpha <- user(0.9)
Tr <- user(0)
Im <- user(0)

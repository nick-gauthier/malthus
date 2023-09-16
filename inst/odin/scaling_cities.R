# in progress!
#deriv(Y) <- r * Y * (1 - Y / K) - Y * H * N ^ beta + Tr
#deriv(N) <- H / E * Y * N ^ beta - M / E * N ^ alpha + Im

deriv(Y) <- Y * (1 - Y) - Y * H * N ^ beta + Tr
deriv(N) <- H * Y * N ^ beta - M * N ^ alpha + Im

initial(Y) <- Y0
initial(N) <- N0

N0 <- user(1)
Y0 <- user(1)
#r <- user(0.1)
#K <- user(1)
M <- user(0.32)
H <- user(0.5)
#E <- user(1e-4)
beta <- user(1.1)
alpha <- user(0.9)
Tr <- user(0)
Im <- user(0)

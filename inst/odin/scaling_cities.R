# in progress!
#deriv(Y) <- r * Y * (1 - Y / K) - Y * H * N ^ beta + Tr
#deriv(N) <- H / E * Y * N ^ beta - M / E * N ^ alpha + Im

deriv(Y) <- Y * (1 - Y) - Y * H * N ^ beta + Tr
deriv(N) <- H * Y * N ^ beta - M * N ^ alpha + Im

initial(Y) <- Y0
initial(N) <- N0

N0 <- parameter(1)
Y0 <- parameter(1)
#r <- user(0.1)
#K <- user(1)
M <- parameter(0.32)
H <- parameter(0.5)
#E <- user(1e-4)
beta <- parameter(1.1)
alpha <- parameter(0.9)
Tr <- parameter(0)
Im <- parameter(0)

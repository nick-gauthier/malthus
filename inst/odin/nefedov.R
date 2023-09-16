deriv(N) <- r * N * (1 - N / K)
deriv(K) <- harvest - N
harvest <- q * food / (q - 1) * N / (N + food / (q - 1))

initial(N) <- N0
initial(K) <- K0

food <- user(1) # N0 from the paper
q <- user(1.2)
r <- user(0.01)
N0 <- user(0.1)
K0 <- user(0.01)

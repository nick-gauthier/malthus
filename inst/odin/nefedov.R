deriv(N) <- r * N * (1 - N / K)
deriv(K) <- harvest - N
harvest <- q * food / (q - 1) * N / (N + food / (q - 1))

initial(N) <- 50
initial(K) <- 100

food <- user(100)
q <- user(1.2)
r <- user(0.02)

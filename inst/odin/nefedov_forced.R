deriv(N) <- r * N * (1 - N / K)
deriv(K) <- harvest - N
harvest <- q * food / (q - 1) * N / (N + food / (q - 1))

initial(N) <- N0
initial(K) <- K0

food <- interpolate(tt, y) # N0 from the paper, equilibrium pop (?)
q <- user(1.2)
r <- user(0.01)
N0 <- user(0.1)
K0 <- user(0.01)

tt[] <- user()
y[] <- user()
dim(tt) <- user()
dim(y) <- length(tt)

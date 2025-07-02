deriv(N) <- r * N * (1 - N / K)
deriv(K) <- harvest - N
harvest <- q * food / (q - 1) * N / (N + food / (q - 1))

initial(N) <- N0
initial(K) <- K0

food <- interpolate(tt, y) # N0 from the paper, equilibrium pop (?)
q <- parameter(1.2)
r <- parameter(0.01)
N0 <- parameter(0.1)
K0 <- parameter(0.01)

tt <- parameter()
y <- parameter()
dim(tt) <- parameter(rank = 1)
dim(y) <- length(tt)

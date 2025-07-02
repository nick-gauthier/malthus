N_lag_fitness <- delay(N, tau1) # time delay
N_lag_resources <- delay(N, tau2) # time delay

cap <- b1 * N_lag_resources # strategy 1 niche capacity
cap2 <- b2 * N_lag_resources # strategy 1 niche capacity

Kt1 <- C + a1 + cap # carrying capacity strategy 1
Kt2 <- C + a2 + cap2 # carrying capacity strategy 2

fit1 <- r - (S / Kt1) * N_lag_fitness # per capita fitness strategy 1

K <- if (fit1 < fmin) Kt2 else Kt1 # actual carrying capacity

deriv(N) <- r * N - (S * N ^ alpha) / K

output(fitness) <- r - (S * N / K) # actual per capita fitness

# K <- A - B * N_lag_resources + C # carrying capacity # note not this anymore, b has to be negative to get this?


# Create a vector of initial conditions
initial(N) <- 0.01

r <- parameter(0.25)
S <- parameter(0.5)
C <- parameter(1)

# assume a1 < a2 and b1 > b2
a1 <- parameter(0)
a2 <- parameter(3)

b1 <- parameter(0)
b2 <- parameter(0)

fmin <- parameter(0.1)
tau1 <- parameter(0, constant = TRUE)
tau2 <- parameter(0, constant = TRUE)

alpha <- parameter(2)

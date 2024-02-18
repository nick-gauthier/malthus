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

r <- user(0.25)  # growth rate [0-0.03] # 0.25 in the paper for generational time scale
S <- user(0.5) # cost of social integration, 0 < S <= 1
C <- user(1) # climate control on resources

# assume a1 < a2 and b1 > b2
a1 <- user(0) # effect of human-made infrastructure on carrying capacity pre innovation
a2 <- user(3) # effect of human-made infrastructure on carrying capacity post innovation

b1 <- user(0) # effect of population density on resource productivity pre innovation
b2 <- user(0) # effect of population density on resource productivity post innovation

fmin <- user(0.1) # minimum fitness to induce innovation
tau1 <- user(0) # time delay in perception of population pressure impacting fitness (generations)
tau2 <- user(0) # time delay in population pressure impacting carrying capacity (generations)

alpha <- user(2) # exponent of population pressure on carrying capacity

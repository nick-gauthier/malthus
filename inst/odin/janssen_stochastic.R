update(P) <- P + births - deaths
update(R) <- if (R_next < 0) 0 else R_next

Q <- a * R * P ^ alpha
epsilon <- rnorm(0, epsilon_sdev)
h <- tau * (1 + epsilon) * Q

p_b <- rb * h / 100
p_d <- rd * (2 - h / 100)

deaths <- rbinom(P, p_d)
births <- rbinom(P, p_b)

R_next <- R + g * R * (R / c) ^ gamma * (1 - R / c) - eta * P

# Create a vector of initial conditions
initial(P) <- P0
initial(R) <- R0

P0 <- user(10)
R0 <- user(100)

epsilon_sdev <- user(0.15)
rb <- user(0.03)    # birth rate
rd <- user(0.02)    # birth rate
tau <- user(1) # rainfall
gamma <- user(1) # degredation factor
g <- user(0.0844) # regeneration rate of soil per year
eta <- user(0.5) # annual depletion rate of resource per household
a <- user(1)  # improvement factor
c <- user(100) # carrying capacity
alpha <- user(0.2) # production elasticity

update(P) <- P + births - deaths
update(R) <- if (R_next < 0) 0 else R_next

Q <- a * R * P ^ alpha
epsilon <- Normal(0, epsilon_sdev)
h <- tau * (1 + epsilon) * Q

p_b <- rb * h / 100
p_d <- rd * (2 - h / 100)

deaths <- Binomial(P, p_d)
births <- Binomial(P, p_b)

R_next <- R + g * R * (R / c) ^ gamma * (1 - R / c) - eta * P

# Create a vector of initial conditions
initial(P) <- P0
initial(R) <- R0

P0 <- parameter(10)
R0 <- parameter(100)

epsilon_sdev <- parameter(0.15)
rb <- parameter(0.03)
rd <- parameter(0.02)
tau <- parameter(1)
gamma <- parameter(1)
g <- parameter(0.0844)
eta <- parameter(0.5)
a <- parameter(1)
c <- parameter(100)
alpha <- parameter(0.2)

deriv(P) <- (beta1 * rho_p - delta1) * P
deriv(E) <- (beta2 * rho_e - delta2) * E

rho_p <- rho0 * (1 + (1 - epsilon) * a * E) * (1 - g * P) / (1 + a * E)
rho_e <- rho0 * epsilon * a * (1 - g * P) * P / (1 + a * E)

initial(P) <- 100
initial(E) <- 10

beta1 <- user(0.02)
delta1 <- user(0.02)
beta2 <- user(0.5)
delta2 <- user(0.025)
epsilon <- user(0.1)
rho0 <- user(2) # max rate of food production per producer
g <- user(.0001) # per capita production decline with increasing numbers
a <- user(.1) # Elite coercion ability, aka maximum size of area that can be controlled by oe exploiter

deriv(P) <- (beta1 * rho_p - delta1) * P
deriv(E) <- e_deriv
deriv(S) <- if ((S + s_deriv) < 0) -S else s_deriv

g <- g0 * (h + S) / (h + (1 + c) * S)
rho_p <- rho0 * (1 + (1 - epsilon) * a * E) * (1 - g * P) / (1 + a * E)
rho_e <- rho0 * epsilon * a * (1 - g * P) * P / (1 + a * E)

e_deriv <- (beta2 * rho_e - delta2) * E
s_deriv <- (if (e_deriv > 0) gamma else 0) * e_deriv - alpha * E

initial(P) <- P0
initial(E) <- E0
initial(S) <- S0

P0 <- user(1)
E0 <- user(0.1)
S0 <- user(0)


beta1 <- user(0.02)
delta1 <- user(0.02)
beta2 <- user(0.5)
delta2 <- user(0.025)
epsilon <- user(1)
rho0 <- user(2) # max rate of food production per producer
gamma <- user(10)
a <- user(0.2) # Elite coercion ability, aka maximum size of area that can be controlled by oe exploiter
c <- user(3)
h <- user(1)
alpha <- user(1)
g0 <- user(1)

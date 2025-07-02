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

P0 <- parameter(1)
E0 <- parameter(0.1)
S0 <- parameter(0)


beta1 <- parameter(0.02)
delta1 <- parameter(0.02)
beta2 <- parameter(0.5)
delta2 <- parameter(0.025)
epsilon <- parameter(1)
rho0 <- parameter(2)
gamma <- parameter(10)
a <- parameter(0.2)
c <- parameter(3)
h <- parameter(1)
alpha <- parameter(1)
g0 <- parameter(1)

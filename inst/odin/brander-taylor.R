deriv(S) <- r * S * (1 - S / K) - alpha * beta * L * S # resource stock
deriv(L) <- L * (phi * alpha * beta * S - sigma) # population (growth proportional to difference between resource consumption and death rate)

initial(L) <- L_init
initial(S) <- K

L_init <- parameter(40)
beta <- parameter(0.4)
alpha <- parameter(1e-06)
phi <- parameter(4)
sigma <- parameter(0.01)
K <- parameter(12000)
r <- parameter(0.004)

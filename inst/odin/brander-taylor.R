deriv(S) <- r * S * (1 - S / K) - alpha * beta * L * S # resource stock
deriv(L) <- L * (phi * alpha * beta * S - sigma) # population (growth proportional to difference between resource consumption and death rate)

initial(L) <- L_init
initial(S) <- K

L_init <- user(40)
beta <- user(0.4) # resource preference, i.e share of labor force for food production/harvest
alpha <- user(1e-6) # extraction efficiency, at default parameter "if S = K a household could provide its subsistence in about 20% available labor time"
phi <- user(4) # procreation parameter, positive population growth if stock is about 50% of carrying capacity
sigma <- user(0.01) # natural death rate - natural birth rate -- pop decreases by 10% per decade in absence of resources
K <- user(12000) # environmental carrying capacity for resource
r <- user(0.004) # 4% per decade

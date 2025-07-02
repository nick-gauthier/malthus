
# Include external C++ function
config(include) <- "pgamma.cpp"

dt <- user(1)

# Model dimensions
n_age <- user(120)

# Initial conditions
initial(pop[]) <- pop_init[i]

# Production parameters
yield_base <- user(13100 * 365)      # Base yield (kcal/ha/year)
land_max <- user(1000)         # Maximum arable land
work_hours <- user(5)          # Hours devoted to agriculture per day
land_per_hour <- user(0.0944)  # Area cultivated per worker-hour (ha/worker-hour)
cal_max <- user(2785 * 365)          # Maximum yearly caloric requirement
set_aside <- user(0)         # Yield proportion set aside
alpha <- user(0.12)  # annual decay rate of food in storage

# Age-specific parameters
work_capacity[] <- user()      # Age-specific work capacity (0-1)
food_need[] <- user()          # Age-specific relative food needs
surv_base[] <- user()          # Base survival rates
fert_base[] <- user()          # Base fertility rates
pop_init[] <- user()           # Initial population distribution
surv_shape[] <- user()         # Survival shape parameters

# Set dimensions for age-specific vectors
dim(work_capacity) <- n_age
dim(food_need) <- n_age
dim(surv_base) <- n_age
dim(fert_base) <- n_age
dim(pop_init) <- n_age
dim(surv_shape) <- n_age

# Calculate workforce and consumption
workers[] <- pop[i] * work_capacity[i]
dim(workers) <- n_age
total_workers <- sum(workers)

cal_need[] <- pop[i] * cal_max * food_need[i]
dim(cal_need) <- n_age
total_cal_need <- sum(cal_need) * dt # scale to time step

# Yield variation as fraction of base yield
yield_var[] <- user()
dim(yield_var) <- user()
yield_actual <- yield_base * if (as.integer(step) >= length(yield_var)) yield_var[length(yield_var)] else yield_var[step + 1]

# Food production with stochastic variation and land limitation
land_used <- 1 - exp(-land_per_hour * work_hours * total_workers / land_max)
#yield_actual <- rgamma(1 / (yield_var^2), yield_base * (yield_var^2))
food_prod <- yield_actual * land_max * land_used * (1 - set_aside) * dt # scale to time step

# Food availability ratio
food_ratio <- (food_prod) / total_cal_need
#surplus <- food_prod - total_cal_need

# Vital rates responsive to food ratio
fert_actual[] <- fert_base[i] * pgamma_cpp(food_ratio, 4.579627264, 0.1)
mort_rate[] <- 1 - (surv_base[i] * pgamma_cpp(food_ratio, surv_shape[i], 0.1))

# Population dynamics
births_by_age[] <- rbinom(pop[i], 1 - (1 - fert_actual[i])^dt)
total_births <- sum(births_by_age)
deaths[] <- rbinom(pop[i], 1 - (1 - mort_rate[i])^dt) # sub-step scaling of probabilities
pop_surviving[] <- pop[i] - deaths[i]

# Aging
aging_up[] <- rbinom(pop_surviving[i], dt)
dim(aging_up) <- n_age

# Set dimensions for dynamic variables
dim(births_by_age) <- n_age
dim(mort_rate) <- n_age
dim(fert_actual) <- n_age
dim(deaths) <- n_age
dim(pop_surviving) <- n_age
dim(pop) <- n_age

# Update equations -- double check this is correct!
update(pop[1]) <- pop_surviving[1] - aging_up[1] + total_births
update(pop[2:(n_age-1)]) <- (pop_surviving[i] - aging_up[i]) + aging_up[i-1]
update(pop[n_age]) <- pop_surviving[n_age] + aging_up[n_age - 1]

update(food_stored) <- food_stored + food_prod - total_cal_need - alpha * food_stored * dt
update(food_ratio_out) <- food_ratio
#update(surplus_out) <- surplus
update(delta_N) <- total_births - sum(deaths)
initial(food_stored) <- 0
# initial(surplus_out) <- 0
initial(delta_N) <- 0
initial(food_ratio_out) <- 1


# Include external C++ function
config(include) <- "pgamma.cpp"

# Model dimensions
n_age <- parameter(120)

# Initial conditions
initial(pop[]) <- pop_init[i]

# Production parameters
yield_base <- parameter(13100 * 365)
land_max <- parameter(1000)
work_hours <- parameter(5)
land_per_hour <- parameter(0.0944)
cal_max <- parameter(2785 * 365)
set_aside <- parameter(0)
alpha <- parameter(0.12)

# Age-specific parameters
work_capacity <- parameter()
food_need <- parameter()
surv_base <- parameter()
fert_base <- parameter()
pop_init <- parameter()
surv_shape <- parameter()

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
yield_var <- parameter()
dim(yield_var) <- parameter(rank = 1)
yield_actual <- yield_base #* if (as.integer(step) >= length(yield_var)) yield_var[length(yield_var)] else yield_var[step + 1]
# note big temp change above because need to adapt to step!!!
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
births_by_age[] <- Binomial(pop[i], 1 - (1 - fert_actual[i])^dt)
total_births <- sum(births_by_age)
deaths[] <- Binomial(pop[i], 1 - (1 - mort_rate[i])^dt)
pop_surviving[] <- pop[i] - deaths[i]

# Aging
aging_up[] <- Binomial(pop_surviving[i], dt)
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

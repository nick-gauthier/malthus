library(odin)
library(tidyverse)
library(shiny)

# Define deterministic and stochastic logistic growth functions
logistic_ode <- odin::odin({
  deriv(N) <- r * N * (1 - N / K)

  initial(N) <- N0

  N0 <- user(10)
  K <- user(500)
  r <- user(0.01)

}, verbose = FALSE)

logistic_stochastic <- odin::odin({
  update(N) <- N + births - deaths
 # p_N <- b - (b - theta) * (N / K)
#  p_d <- d - (theta - d) * (N / K)
   p_N <- b
    p_d <- d * (1 + (N / K))
  deaths <- rbinom(N, p_d / dt)
  births <- rbinom(N, p_N  / dt)

 # deaths <- rbinom(N, d * N/K / dt)
#  births <- rbinom(N, b / dt)

  initial(N) <- N0

  K <- user(1000)
  b <- user(0.02)
  d <- user(0.01)
  theta <- user(0)
  N0 <- user(10)
  dt <- user(1)

}, verbose = FALSE)

# Shiny UI
ui <- fluidPage(
  titlePanel("Logistic Growth Simulation"),
  sidebarLayout(
    sidebarPanel(
      numericInput("N0", "Initial Population", 10),
      numericInput("K", "Carrying Capacity", 500),
      numericInput("r", "Intrinsic Growth Rate (Deterministic)", 0.01),
      numericInput("b", "Birth Rate (Stochastic)", 0.02),
      numericInput("d", "Death Rate (Stochastic)", 0.01),
      numericInput("theta", "Theta (Stochastic)", 0),
      numericInput("replicate", "Number of Replicates", 10),
      actionButton("run", "Run Simulation")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Shiny Server
server <- function(input, output, session) {
  observeEvent(input$run, {
    # Run deterministic model
    log_ode_model <- logistic_ode$new(K = input$K, N0 = input$N0, r = input$r)
    result_ode <- log_ode_model$run(0:1000) |>
      as_tibble()

    # Run stochastic model
    log_stoch_model <- logistic_stochastic$new(K = input$K, N0 = input$N0, theta = input$theta,
                                               b = input$b, d = input$d)
    result_stoch <- log_stoch_model$run(0:1000, replicate = input$replicate)
    result_stoch <- log_stoch_model$transform_variables(result_stoch)
    result_stoch <- cbind.data.frame(t = result_stoch[[1]], result_stoch[-1]) |>
      pivot_longer(-t)

    # Plotting both deterministic and stochastic
    output$plot <- renderPlot({
      ggplot() +
        geom_line(data = result_stoch, aes(x = t, y = value, group = name, color = "Stochastic"), alpha = 0.25) +
        geom_line(data = result_ode, aes(x = t, y = N, color = "Deterministic"), alpha = 1) +
        scale_color_manual(values = c("Stochastic" = "blue", "Deterministic" = "red")) +
        labs(title = "Logistic Growth Simulation",
             x = "Time",
             y = "Population Size",
             color = "Model Type") +
        theme_bw()
    })
  })
}

# Run the app
shinyApp(ui, server)

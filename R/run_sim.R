#' Title
#'
#'
#' @return
#' @export
#'
#' @examples
#' @export
run_sim <- function(model, nsim = 500, ..., tidy = TRUE){

  mod <- model$new(user = list(...))
  mod_run <- mod$run(seq_len(nsim))

  result <- mod$transform_variables(mod_run) |>
    tibble::as_tibble() |>
    dplyr::rename(time = t)

  if(tidy) result <- tidyr::pivot_longer(result, -time, names_to = 'var')

  return(result)
}

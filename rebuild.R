odin::odin_package('.')
devtools::document()
path <- devtools::build(vignettes = TRUE)
install.packages(path, repos = NULL, type = "source")

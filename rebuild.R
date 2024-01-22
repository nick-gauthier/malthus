odin::odin_package('.')
devtools::document()
devtools::build(vignettes = TRUE)
install.packages("~/Dropbox (UFL)/Projects/malthus_0.1.0.tar.gz", repos = NULL, type = "source")



library(stringr)
library(tidyverse)

time <- tweets$timestamp

reports <- tibble(
	filename = str_c(time, "tweet", ".html"),
	params = map(time, ~list(time = .))
)

reports %>%
	select(output_file = filename, params) %>%
	pwalk(rmarkdown::render, input = "mytemplate.Rmd", output_dir = "output")



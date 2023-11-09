library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(lvplot)
library(glue)
library(tidyverse)

for (i in seq_len(6)) {
    print(glue("i = {i}"))
    path <- glue("{getwd()}/matd46/topico_{i}/topico_{i}.Rmd")
    pagedown::chrome_print(path, verbose = 0)
}
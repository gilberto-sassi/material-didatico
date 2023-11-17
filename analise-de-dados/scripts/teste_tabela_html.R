if (!require(pacman)) install.packages(pacman)
library(pacman)
p_load(readxl, writexl, readODS)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(tidyverse)

nlinha <- sample(2:4, 1)
ncol <- sample(2:4, 1)

matriz <- matrix(rnorm(nlinha * ncol), nrow = nlinha)
rownames(matriz) <- paste0("A_", 1:nlinha)
colnames(matriz) <- paste0("B_", 1:ncol)

HTML(matriz, file = "")

if (!require(pacman)) install.packages(pacman)
library(pacman)
p_load(readxl, writexl, readODS)
p_load(ggthemes)
p_load(glue)
p_load(statBasics)
p_load(tidyverse)

#------------------------------------------------------------------------------
# formatos

# U
x <- seq(from = 0, to = 1, by = 0.001)
y <- dbeta(x, shape1 = 0.5, shape2 = 0.5)
f <- \(x, y) {
    ggplot(tibble({{x}}, {{y}})) +
        geom_line(aes({{x}}, {{y}}))
}
f(x, y)

# estritamente decrescente
y <- dbeta(x, shape1 = 0.5, shape2 = 2)
f(x, y)

# estritamente convexo
y <- dbeta(x, shape1 = 1, shape2 = 3)
f(x, y)

# reta decrescente
y <- dbeta(x, shape1 = 1, shape2 = 2)
f(x, y)

# estritamente concava
y <- dbeta(x, shape1 = 1, shape2 = 1.5)
f(x, y)

# estritamente crescente
y <- dbeta(x, shape1 = 1, shape2 = 0.8)
f(x, y)

# estritamente convexo
y <- dbeta(x, shape1 = 3, shape2 = 1)
f(x, y)

# reta crescente
y <- dbeta(x, shape1 = 2, shape2 = 1)
f(x, y)

# estritamente côncava
y <- dbeta(x, shape1 = 1.5, shape2 = 1)
f(x, y)

# unimodal

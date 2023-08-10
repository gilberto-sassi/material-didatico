library(readxl)
library(readODS)
library(writexl)
library(readxl)
library(readODS)
library(writexl)
library(ggthemes)
library(glue)
library(statBasics)
library(patchwork)
library(tidyverse)

#------------------------------------------------------------------------------
# bimodal

shape_1 <- c(2, 2)
shape_2 <- c(6, 0.8)

densidade <- function(x) {
    map_dbl((x + 10) / 20, \(u) {
        1:2 |>
            map_dbl(~ 0.5 * dbeta(u, shape1 = shape_1[.x], shape2 = shape_2[.x])) |>
            sum() |>
            map_dbl(~ .x * 20 - 10)
    })
}

x <- seq(from = -10, to = 10, by = 0.01)

ggplot(tibble(x, y = densidade(x)), aes(x, y)) +
    geom_line()

amostra <- function(n) {
    indices <- sample.int(2, size = n, replace = TRUE, prob = c(0.5, 0.5))
    seq_along(indices) |> map_dbl(\(k) {
        rbeta(1, shape1 = shape_1[indices[k]], shape2 = shape_2[indices[k]])
    })
}
n <- 10000
dados <- tibble(x = amostra(n))
k <- round(1 + log2(n))

ggplot(dados, aes(x = x, y = after_stat(density))) +
    geom_histogram(bins = k)+
    geom_density()


shape_1 <- c(2, 2)
shape_2 <- c(6, 0.8)

densidade <- function(x) {
    map_dbl((x + 10) / 20, \(u) {
        1:2 |>
            map_dbl(~ 0.5 * dbeta(u, shape1 = shape_1[.x], shape2 = shape_2[.x])) |>
            sum() |>
            map_dbl(~ .x * 20 - 10)
    })
}

x <- seq(from = -10, to = 10, by = 0.01)

ggplot(tibble(x, y = densidade(x)), aes(x, y)) +
    geom_line()

amostra <- function(n) {
    indices <- sample.int(2, size = n, replace = TRUE, prob = c(0.5, 0.5))
    indices |> map_dbl(\(k) {
        20 * rbeta(1, shape1 = shape_1[k], shape2 = shape_2[k]) - 10
    })
}
n <- 10000
dados <- tibble(x = amostra(n))
k <- round(1 + log2(n))

ggplot(dados, aes(x = x, y = after_stat(density))) +
    geom_histogram(bins = k)

dados <- tibble(
    bimodal = amostra(n),
    uniforme = runif(n, min = -10, max = 10),
    normal = rnorm(n, mean = 0, sd = sqrt(54.95))
)
bimodal <- ggplot(dados, aes(x = "")) + geom_boxplot(aes(y = bimodal)) +
    ylim(c(-15, 15)) + theme_minimal()
uniforme <- ggplot(dados, aes(x = "")) + geom_boxplot(aes(y = uniforme)) +
    ylim(c(-15, 15)) + theme_minimal()
normal <- ggplot(dados, aes(x = "")) + geom_boxplot(aes(y = normal)) +
    ylim(c(-15, 15)) + theme_minimal()

bimodal + uniforme + normal

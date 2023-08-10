#' Display Letter Values.
#'
#' Display and return letter values.
#'
#' The diagram is, by default, the 5-number summary, where the sample size, the median (location measure) and the F-spread (distance between lower fourth and upper fourth). Others diagrams are avalaible increasing the argument \code{level}.
#'
#' @details This function computes the letter values as presented at Understanding Robust and Exploratory Data Analysis by Hoaglin, Mosteller and Tukey published in 1983.
#' 
#' This is a generic print method for the class "lv".
#'
#' @param x an object \code{lv}.
#' @examples
#' lv_rivers <- letter_value(rivers)
#' print.lv(lv_rivers)
print.lv <- function(x) {
    len <- length(x$sample)

    df_lv <- x$lv_data_frame

    name <- x$variable_name

    add_space <- \(x, n) ifelse(
        nchar(x) == n,
        x,
        c(x, rep(" ", n - nchar(x))) |> paste0(collapse = "")
    )

    coluna_1 <- length(df_lv$letter) |>
        seq_len() |>
        purrr::map_chr(\(k) {
            glue::glue("{df_lv$letter[k]} {df_lv$depth[k]}")
        })
    n1 <- max(nchar(coluna_1))
    coluna_1 <- purrr::map_chr(coluna_1, ~ add_space(.x, n1))

    coluna_2 <- c(
        "|",
        2:length(df_lv$letter) |>
            purrr::map_chr(\(k) {
                glue::glue("| {df_lv$lv_lower[k]}")
            })
    )
    n2 <- max(nchar(coluna_2))
    coluna_2 <- purrr::map_chr(coluna_2, ~ add_space(.x, n2))

    coluna_3 <- glue::glue("    {df_lv$lv_lower[1]}    ")
    for (k in 2:length(df_lv$letter)) {
        coluna_3 <- c(coluna_3, rep(" ", nchar(coluna_3[1])) |> paste0(collapse = ""))
    }
    n3 <- max(nchar(coluna_3), length(name))
    coluna_3 <- purrr::map_chr(coluna_3, ~ add_space(.x, n3))

    coluna_4 <- c(
        "",
        2:length(df_lv$letter) |>
            purrr::map_chr(\(k) {
                glue::glue("{df_lv$lv_upper[k]}")
            })
    )
    n4 <- max(nchar(coluna_4))
    coluna_4 <- purrr::map_chr(coluna_4, ~ add_space(.x, n4))


    name <- add_space(name, max(n2 + n3 + n4 + 2, nchar(name)))
    linha <- paste0(rep("-", max(n2 + n3 + n4 + 2, nchar(name))),
            collapse = "")
    output <- glue::glue("n = {len}

{paste0(rep(' ', n1), collapse = '')}{name}
{paste0(rep(' ', n1), collapse = '')}{linha}

")
    for (k in seq_len(length(df_lv$letter))) {
        output <- paste0(output, glue::glue("{coluna_1[k]}{coluna_2[k]}{coluna_3[k]}{coluna_4[k]} |

"))
    }

    cat(output)
}

#' Compute Letter Value.
#'
#' \code{letter_value} returns the letter values until the level indicated by \code{level}.
#'
#' @details This function computes the letter values as presented at Understanding Robust and Exploratory Data Analysis by Hoaglin, Mosteller and Tukey published in 1983.
#'
#' @param x numeric vector
#' @param level integer value between 2 and 9 indicating the level to compute the letter values. Default value is 2.
#' @param na_rm a logical evaluating to \code{TRUE} or \code{FALSE} indicating whether NA values should be stripped before the computation proceeds. Default value is \code{TRUE}.
#' @return a \code{list} object is returned with the variable name (\code{variable_name}), the sample (\code{sample}), and a data frame with the following columns:
#' \describe{
#'  \item{letter}{a letter indicating the letter value}
#'  \item{depth}{depth of the letter value}
#'  \item{lv_lower}{lower letter value}
#'  \item{lv_upper}{upper letter value}
#' }
#' @example
#' letter_value(rivers)
letter_value <- function(x, level = 2, na_rm = TRUE) {
    if (na_rm) {
        order_stats <- na.omit(x) |> sort()
    } else {
        order_stats <- sort(x)
    }

    len <- length(order_stats) # length of sample
    if (level > 9) stop("Limit level summary is 9.")

    letters <- c("F", "E", "D", "C", "B", "A")

    depth <- (len + 1) / 2
    for (l in 2:level) {
        depth <- c(depth, (floor(depth[l - 1]) + 1) / 2)
    }

    if (depth[level] < 1) stop("Levels too high to be estimated.")

    median_lv <- (order_stats[floor(depth[1])] +
                    order_stats[ceiling(depth[1])]) / 2
    lower_lv <- vector("double", level - 1)
    upper_lv <- vector("double", level - 1)

    for (l in 2:level) {
        k <- floor(depth[l])
        lower_lv[l - 1] <- order_stats[k]
        upper_lv[l - 1] <- order_stats[len + 1 - k]
    }

    output <- list(
        variable_name = paste(deparse(substitute(x))),
        sample = order_stats,
        lv_data_frame = tibble::tibble(
            letter = c("M", letters[seq_len(level - 1)], "1"),
            depth = c(depth, 1),
            lv_lower = c(median_lv, lower_lv, order_stats[1]),
            lv_upper = c(median_lv, upper_lv, order_stats[len])
        )
    )

    class(output) <- c(class(output), "lv")
    return(output)
}
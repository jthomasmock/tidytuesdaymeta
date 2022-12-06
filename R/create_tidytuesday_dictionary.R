#' Create the TidyTuesday data dictionary
#' @param x an in memory data.frame or tibble.
#' @importFrom dplyr mutate
#' @importFrom tibble tibble
#' @importFrom knitr kable
#' @export

create_tt_dict <- function(x) {
    tibble::tibble(variable = names(x)) %>%
        dplyr::mutate(
            class = purrr::map(x, typeof),
            description = variable
        ) %>%
        knitr::kable()
}


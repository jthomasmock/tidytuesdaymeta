#' Create the TidyTuesday data dictionary
#' @importFrom dplyr mutate
#' @importFrom tibble tibble
#' @importFrom knitr kable
#' @export

create_tidytuesday_dictionary <- function(x) {
    tibble::tibble(variable = names(x)) %>%
        dplyr::mutate(
            class = purrr::map(x, typeof),
            description = "."
        ) %>%
        knitr::kable()
}


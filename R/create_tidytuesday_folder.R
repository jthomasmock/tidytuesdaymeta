#' Create the TidyTuesday directory
#' @importFrom fs dir_create
#' @importFrom here here
#' @importFrom glue glue
#' @importFrom lubridate year
#' @importFrom lubridate wday
#' @export

create_tidytuesday_folder <- function() {

    # Logic check if Tuesday calc fails
    if (lubridate::wday(tidytuesdaymeta:::next_tuesday(), label = TRUE) != "Tue") {
        stop("Today ain't Tuesday bub!")
    }

    fs::dir_create(
        here::here(
            lubridate::year(lubridate::today()),
            tidytuesdaymeta::next_tuesday()
        )
    )
}



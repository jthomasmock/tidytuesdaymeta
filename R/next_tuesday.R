
#' Find upcoming tuesday
#'
#' @export

next_tuesday <- function() {
    todays_date <- lubridate::today(tz = "America/New_York")

    diff_tuesday <- 3 - lubridate::wday(todays_date)

    if (diff_tuesday < 0) {
        diff_tuesday <- diff_tuesday + 7
    }
    return(todays_date + diff_tuesday)
}


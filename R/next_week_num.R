#' Find this week's number
#'
#' @importFrom lubridate ymd year
#' @export

next_week_num <- function() {
  # set date for files structure and names
  week_date <- next_tuesday()
  year <- lubridate::year(week_date)
  jan_1st <- paste0(year, "0101")
  jan_1st <- lubridate::ymd(jan_1st)

  # Today's date + 1 = tomorrow
  week_num <- as.numeric((week_date - jan_1st)) / 7 + 1
  round(week_num)
}

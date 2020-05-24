#' Update the data_type.csv file for tidytuesdayR
#'
#' @importFrom readr read_csv
#' @importFrom lubridate year
#' @importFrom dplyr `%>%``
#' @import dplyr
#' @importFrom stringr str_sub str_remove
#' @export
#'


get_data_type <- function(file_names, delimiter){
  # get old data
  old_data <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/static/tt_data_type.csv")

  new_data <- file_names

  raw_df <- dplyr::tibble(
    Week = rep(tidytuesdaymeta::next_week_num(), length(new_data)),
    Date = rep(tidytuesdaymeta::next_tuesday(), length(new_data)),
    year = rep(lubridate::year(Sys.Date()), length(new_data)),
    data_files = new_data,
    delim = delimiter
  )

  data_df <- dplyr::mutate(raw_df,
         data_type = stringr::str_sub(data_files, -4),
         data_type = stringr::str_remove(data_type, "\\.")) %>%
    dplyr::select(Week:year, data_files, data_type, delim) %>%
    dplyr::bind_rows(old_data) %>%
    dplyr::arrange(year, Week)

  data_df
}

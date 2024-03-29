#' Update the data_type.csv file for tidytuesdayR
#' @param file_names a vector of file names that are used for this week's datasets, eg `c("elevators.csv", "manufacturers.csv")`
#' @param delimiter a vector matching the specific data files and their delimiters, eg `c(",", ",")`
#' @importFrom readr read_csv
#' @importFrom lubridate year
#' @importFrom dplyr `%>%`
#' @importFrom readr write_csv
#' @import dplyr
#' @import stringr
#' @export

update_data_type <- function(file_names, delimiter){
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
    dplyr::arrange(desc(Date))

  data_df %>%
    readr::write_csv("tt_data_type.csv")
}

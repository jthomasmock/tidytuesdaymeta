# create_skim_section <- function() {
#
#     week_date <- tomtom::next_tuesday()
#     year <- lubridate::year(week_date)
#     jan_1st <- paste0(year, "0101")
#     jan_1st <- lubridate::ymd(jan_1st)
#
#     # Today's date + 1 = tomorrow
#     week_num <- as.numeric((week_date - jan_1st))/7 + 1
#     week_num <- round(week_num)
#
#     # Create the smaller skim object
#     tidytuesday_skim <- function(...) {
#         skimmed_df <- skimr::skim(...)
#
#         dplyr::select(skimmed_df, -(numeric.p0:numeric.p100))
#     }
#
#     # get this year
#     this_year <- lubridate::year(tomtom::next_tuesday())
#
#     # get this week's date
#     this_tuesday <- tomtom::next_tuesday()
#
#     # generic for this week's tidytuesday directory
#     tuesday_directory <- function(...) {
#         here::here(this_year, this_tuesday, ...)
#     }
#
#     # Find all .csvs in this week's tidytuesday directory
#     all_csvs <- list.files(tuesday_directory()) %>%
#         .[stringr::str_detect(., ".csv")]
#
#     # create a dataframe of the files and the file names in the directory
#     df_names <- data.frame(
#         csv_names = all_csvs,
#         df_names = str_remove(all_csvs, ".csv")
#     )
#
#     map_chr(
#         .x = all_csvs,
#         .f = tidytuesday_skim
#     )
#
#     list_dataframes <- map(.x = all_csvs, ~ readr::read_csv(tuesday_directory(.x)))
#
# }
#
#
# create_skim_section()
#
#
# map(
#     .x = list_dataframes,
#     .f = tidytuesday_skim
# ) %>%
#     knitr::kable()
#
#
# tidytuesday_skim(gun_murders.csv)
#
#
# # get this week's date
# this_tuesday <- tomtom::next_tuesday()
#
# # generic for this week's tidytuesday directory
# tuesday_directory <- function(...) {
#     here::here(this_year, this_tuesday, ...)
# }
#
# # Find all .csvs in this week's tidytuesday directory
# all_csvs <- list.files(tuesday_directory()) %>%
#     .[stringr::str_detect(., ".csv")]
#
# # create a dataframe of the files and the file names in the directory
# df_names <- data.frame(
#     csv_names = all_csvs,
#     df_names = str_remove(all_csvs, ".csv")
# )
#
# # map_chr(
# #   .x = all_csvs,
# #   .f = tidytuesday_skim
# # )
#
# read_and_skim <- function(...){
#     temp_df <- readr::read_csv(tuesday_directory(...))
#
#     tidytuesday_skim(temp_df)
# }
#
# list_dataframes <- map(
#     .x = all_csvs,
#     ~ readr::read_csv(tuesday_directory(.x))
# ) %>%
#     set_names(all_csvs)
#
#
#
# # create_skim_section()
#
#
# map(
#     .x = list_dataframes,
#     .f = tidytuesday_skim
# )

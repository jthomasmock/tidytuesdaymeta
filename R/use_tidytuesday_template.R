#' Use a usethis-style template for TidyTuesdy
#' Thank you Jenny + Sharla + Sharleen!
#'
#' Creates a file from data and a template.
#' Combine your template file with your data.
#'
#' @return A logical vector indicating if file was modified.
#' @import whisker
#' @import lubridate
#' @export

# tues_date <- date
# year <- year
# week_num <- week_num
#
# next_week_num <- function() {
#   # set date for files structure and names
#   week_date <- tidytuesdaymeta::next_tuesday()
#   year <- lubridate::year(week_date)
#   jan_1st <- paste0(year, "-01-01")
#   jan_1st <- lubridate::ymd(jan_1st)
#
#   # Today's date + 1 = tomorrow
#   week_num <- as.numeric((week_date - jan_1st)) / 7 + 1
#   round(week_num)
# }
#
# use_tidytuesday_template <- function(
#                          save_as = template,
#                          title_subject,
#                          dataset_name,
#                          ignore = FALSE,
#                          open = FALSE) {
#   # This week's num
#   week_num <- next_week_num()
#
#   # This week's date
#   tues_date <- tidytuesdaymeta::next_tuesday()
#
#   # This year
#   year <- lubridate::year(week_date)
#
#
#   template_contents <- render_template(title_subject, dataset_name)
#
#   new <- write_over(proj_path(save_as), template_contents)
#
#   if (ignore) {
#     use_build_ignore(save_as)
#   }
#
#   if (open && new) {
#     edit_file(proj_path(save_as))
#   }
#
#   invisible(new)
# }
#
# render_template <- function(template, title_subject, dataset_name) {
#   template_path <- find_template(template)
#   strsplit(
#     whisker::whisker.render(
#       readLines(template_path, encoding = "UTF-8"), dataset_name), "\n"
#     )[[1]]
# }
#
# monday_path <- function() {
#   path <- here::here(
#     lubridate::year(lubridate::today()),
#     tidytuesdaymeta::next_tuesday()
#   )
#   path
# }

# use_tidytuesday_readme <- function(open = interactive()) {
#   use_tidytuesday_template("README.md", open = open)
# }

use_tidytuesday_readme <- function(title_subject, dataset_name){

  raw_readme <- readLines(here::here("static/readme_template.md"))

  title_subject <- title_subject

  dataset_name <- dataset_name

  core_url <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/"

  year <- lubridate::year(Sys.Date())
  tues_date <- tidytuesdaymeta::next_tuesday()
  week_num <- tidytuesdaymeta::next_week_num()

  filled_readme <- whisker::whisker.render(raw_readme)

  writeLines(
    filled_readme,
    here::here(
      lubridate::year(lubridate::today()),
      tidytuesdaymeta::next_tuesday(),
      "readme.md"
    )
  )
}

# monday_path <- function() {
#   path <- here::here(
#     lubridate::year(lubridate::today()),
#     tidytuesdaymeta::next_tuesday(),
#     "readme.md"
#   )
#   path
# }

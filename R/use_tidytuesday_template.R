#' Use a usethis-style template for TidyTuesdy
#' Thank you Jenny + Sharla + Sharleen!
#'
#' Creates a file from data and a template.
#' Combine your template file with your data.
#' @param title_subject a single topic for this week's data
#' @param dataset_name a single dataset name in the pattern of `filename` - the .csv will be appended
#' @return A logical vector indicating if file was modified.
#' @import whisker
#' @import lubridate
#' @export

use_tidytuesday_readme <- function(title_subject, dataset_name){

  raw_readme <- readLines(fs::path_package("readme_template.md", package = "tidytuesdaymeta"))

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

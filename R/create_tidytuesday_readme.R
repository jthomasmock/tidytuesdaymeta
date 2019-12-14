# Goal of this function
# Create a readme in the directory
# Basic idea is use: rmarkdown::render("test_md.rmd")
# Along with the template

#' Color scale constructor for tomtom colors
#'
#' @param title datasets for creating the data dictionary and flat files
#' @export

# Create the readme based on data
create_tidytuesday_readme <- function(title, ...) {

    # Logic check if Tuesday calc fails
    if (lubridate::wday(tidytuesdaymeta::next_tuesday(), label = TRUE) != "Tue") {
        stop("Today ain't Tuesday bub!")
    }

  rmarkdown::render(
    input = "static/tidytuesday_readme_template.rmd",
    output_file = here::here(
      lubridate::year(lubridate::today()),
      tidytuesdaymeta::next_tuesday(),
      "readme.md"
    ),
    params = list(title, ...)
  )
}


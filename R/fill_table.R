

#' Fill table for readme
#'
#' @param title title of week's data
#' @param swap append data/year or just date
#'
#' @return kable table
#' @export
fill_table <- function(title, swap = FALSE){

  week_num <- next_week_num()
  date <- next_tuesday()

  year <- substr(Sys.Date(), 1, 4)

  if(swap){
    template <- readLines("inst/table.md")[2]
  } else {
    template <- readLines("inst/table.md")[1]
  }

  filled <- whisker::whisker.render(template)

  cat(filled)

  rstudioapi::insertText(filled)

}

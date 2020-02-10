#' Create the R4DS Community TidyTuesday posts
#'
#' @importFrom rtweet post_tweet
#' @importFrom lubridate today ymd
#' @importFrom glue glue
#' @importFrom emo ji
#' @importFrom here here
#' @export
#'


post_tidytuesday <- function(exploring, short_link) {

  week_num <- tidytuesdaymeta::next_week_num()
  week_date <- tidytuesdaymeta::next_tuesday()
  tues_year <- as.character(lubridate::year(week_date))

  # post the tweet with fill
  rtweet::post_tweet(
    status = glue::glue(
      "The @R4DScommunity welcomes you to week {week_num} of #TidyTuesday!  We're exploring {exploring}!

",
      emo::ji("folder"),
      " http://bit.ly/tidyreadme
",
      emo::ji("news"),
      " {short_link}

#r4ds #tidyverse #rstats #dataviz"
    ),

    # The below code is relative to my project
    # You need to specify path to the images for tweeting
    media = list(
      here::here("static_img", "tt_logo.png"),
      here::here("static_img", "tt_rules.png"),
      here::here(tues_year, week_date, "pic1.png"),
      here::here(tues_year, week_date, "pic2.png")
    )
  )
}

#' Create the R4DS Community TidyTuesday posts
#'
#' @param exploring topic for this week
#' @param short_link short link or URL to the article for this week
#' @param alt_add a length two vector of strings indicating the alt-text for pic1.png and pic2.png
#'
#' @importFrom rtweet post_tweet
#' @importFrom lubridate today ymd
#' @importFrom glue glue
#' @importFrom emoji emoji
#' @importFrom here here
#' @export
#'


post_tidytuesday <- function(exploring, short_link, alt_add) {

  week_num <- tidytuesdaymeta::next_week_num()
  week_date <- tidytuesdaymeta::next_tuesday()
  tues_year <- as.character(lubridate::year(week_date))

  # post the tweet with fill
  rtweet::post_tweet(
    status = glue::glue(
      "The @R4DScommunity welcomes you to week {week_num} of #TidyTuesday!  We're exploring {exploring}!

",
      emoji::emoji("folder"),
      " http://bit.ly/tidyreadme
",
      emoji::emoji("news"),
      " {short_link}

#r4ds #tidyverse #rstats #dataviz"
    ),

    # The below code is relative to my project
    # You need to specify path to the images for tweeting
    media = c(
      fs::path_package("inst", "static_img", "tt_logo.png", package = "tidytuesdaymeta"),
      fs::path_package("inst", "static_img", "tt_rules.png", package = "tidytuesdaymeta"),
      here::here(tues_year, week_date, "pic1.png"),
      here::here(tues_year, week_date, "pic2.png")
    ),
media_alt_text = c(
  "Logo for the #TidyTuesday Project, it's the words TidyTuesday overlaying a black paint splash",
  "The data set comes from the source article or the source that the article credits. Be mindful that the data is what it is and Tidy Tuesday is designed to help you practice data visualization and basic data wrangling in R.
This is NOT about criticizing the original article or graph. Real people made the graphs, collected or acquired the data! Focus on the provided dataset, learning, and improving your techniques in R.
This is NOT about criticizing or tearing down your fellow #RStats practitioners or their code! Be supportive and kind to each other! Like other's posts and help promote the #RStats community!
Use the hashtag #TidyTuesday on Twitter if you create your own version and would like to share it.
Include a picture of the visualisation.
Include a copy of the code used to create your visualization.
Focus on improving your craft, even if you end up with something simple!
Give credit to the original data source whenever possible.",
alt_add
)
  )
}

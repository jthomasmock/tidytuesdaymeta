# 

The data this week comes from []().

### Get the data here

```{r}
# Get the Data

 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data///.csv')

# Or read in with tidytuesdayR package (https://github.com/thebioengineer/tidytuesdayR)
# PLEASE NOTE TO USE 2020 DATA YOU NEED TO USE tidytuesdayR version ? from GitHub

# Either ISO-8601 date or year/week works!

# Install via devtools::install_github("thebioengineer/tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('')
tuesdata <- tidytuesdayR::tt_load(, week = )


 <- tuesdata$
```
### Data Dictionary

# `.csv`

A full data dictionary is available at: [the source](https://data.sfgov.org/City-Infrastructure/Street-Tree-List/tkzw-k3nq) but it's fairly sparse.



### Cleaning Script


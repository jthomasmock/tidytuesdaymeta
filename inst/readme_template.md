# {{title_subject}}

The data this week comes from []().

### Get the data here

```{r}
# Get the Data

{{dataset_name}} <- readr::read_csv('{{core_url}}{{year}}/{{tues_date}}/{{dataset_name}}.csv')

# Or read in with tidytuesdayR package (https://github.com/thebioengineer/tidytuesdayR)

# Either ISO-8601 date or year/week works!

# Install via devtools::install_github("thebioengineer/tidytuesdayR")

tuesdata <- tidytuesdayR::tt_load('{{tues_date}}')
tuesdata <- tidytuesdayR::tt_load({{year}}, week = {{week_num}})


{{dataset_name}} <- tuesdata${{dataset_name}}
```
### Data Dictionary

# `{{dataset_name}}.csv`

### Cleaning Script


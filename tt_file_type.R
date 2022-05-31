library(tidytuesdaymeta)
library(tidyverse)
library(fs)
library(jsonlite)
listviewer::jsonedit(raw_json)

raw_json <- fromJSON("tt_data_type.json")

raw_json %>% as_tibble() %>% 
  unnest(data) 

data_2020 <- fs::dir_ls("~/tidytuesday_github/data/2020") %>% 
  as.character() %>% 
  enframe()

all_data <- tribble(
  ~year,
  "2018",
  "2019",
  "2020"
) %>% 
  mutate(year_path = paste0("~/tidytuesday_github/data/",year)) %>% 
  mutate(weeks = map(year_path, dir_ls)) %>% 
  unnest_longer(weeks) %>% 
  mutate(week_date = str_sub(weeks_id, -10)) %>% 
  filter(!str_detect(tolower(weeks_id), "readme")) %>% 
  mutate(data_files = map(weeks, list.files)) %>% 
  unnest_longer(data_files) %>% 
  filter(str_detect(data_files, ".")) %>% 
  mutate(data_type = str_sub(data_files, -4) %>% str_remove("\\.")) %>% 
  filter(data_type %in% c("csv", "tsv", "xls", "xlsx", "rds", "zip")) %>% 
  mutate(delim = map(paste(weeks_id, data_files, sep = "/"), identify_delim)) %>% 
  unnest_wider(delim) %>% 
  rename("delim" = ...1) %>% 
  mutate(delim = if_else(data_type %in% c("xls", "xlsx", "zip"), NA_character_, delim))

all_data %>% count(delim, sort = T)

all_data %>% 
  write_csv("tt_data_type.csv")

all_data %>% 
  select(year, week_date, data_files, data_type, delim) %>% 
  group_by(year) %>% 
  nest() %>% 
  jsonlite::write_json("tt_data_type.json")

list.files("~/tidytuesday_github")

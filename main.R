# remember to install packages first
library(tidyverse)
tuesdata <- tidytuesdayR::tt_load('2024-01-16')

polling_places <- tuesdata$polling_places

# For states with data for multiple elections, how have polling location counts per county changed over time?

# get final county location counts over time

polling_by_county <- polling_places %>%
  dplyr::group_by(election_date, state, county_name)%>%
  dplyr::summarize(count_distinct = n_distinct(precinct_name))
# note that AK does not have distinct county names - disregard for now

# next steps: maybe start with counties in wisconsin change over time

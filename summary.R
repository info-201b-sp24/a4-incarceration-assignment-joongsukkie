install.packages(dplyr)
library(dplyr)
jail_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true")
# County with highest total_pop_15to64 at current year (2018).
highest_pop_county_2018 <- jail_data %>%
  filter(year == 2018) %>%
  filter(total_pop_15to64 == max(total_pop_15to64, na.rm = TRUE)) %>%
  select(county_name, total_pop_15to64)
# County with lowest total_pop_15to64 at current year (2018).
lowest_pop_county_2018 <- jail_data %>%
  filter(year == 2018) %>%
  filter(total_pop_15to64 == min(total_pop_15to64, na.rm = TRUE)) %>%
  select(county_name, total_pop_15to64)

# Average total_jail_pop at current year. 
average_total_jail_pop_2018 <- jail_data %>%
  filter(year == 2018) %>%
  summarise(average_total_jail_pop = mean(total_jail_pop, na.rm = TRUE))

# County with the highest/lowest black_prison_pop at current year.
max_black_jail_pop_2018 <- jail_data %>%
  filter(year == 2018) %>%
  filter(!is.na(black_jail_pop)) %>%
  slice(which.max(black_jail_pop)) %>%
  select(county_name, black_jail_pop)

min_black_jail_pop_2018 <- jail_data %>%
  filter(year == 2018) %>%
  filter(!is.na(black_jail_pop)) %>%
  slice(which.min(black_jail_pop)) %>%
  select(county_name, black_jail_pop)

num_rows <- nrow(jail_data)
num_cols <- ncol(jail_data)
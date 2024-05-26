library(ggplot2)
library(dplyr)
jail_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true")

top_counties_2018 <- jail_data %>%
  filter(year == 2018) %>%
  filter(!(county_name %in% c("Cook County", "Harris County", "Orange County"))) %>%
  arrange(desc(total_pop_15to64)) %>%
  slice(1:5) %>%
  pull(county_name)

top_data <- jail_data %>%
  filter(county_name %in% top_counties_2018 & year >= 1985) 

line_colors <- c("red", "blue", "green", "purple", "orange")  # Example colors

ggplot(top_data, aes(x = year, y = black_jail_pop, color = county_name, group = county_name)) +
  geom_line(size = 1.5) +  
  scale_color_manual(values = line_colors, name = "Legend") +
  labs(x = "Year", y = "Number of Incarcerated Black Citizens",
       title = "Number of Incarcerated Black Citizens Over Time",
       color = "County") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )

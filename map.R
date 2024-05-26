library(ggplot2)
library(dplyr)
library(maps)
library(viridis)
library(tidyr)

jail_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true")

data_2018 <- jail_data %>%
  filter(year == 2018) 

state_black_jail <- data_2018 %>%
  group_by(state) %>%
  summarise(black_jail_pop = sum(total_pop, na.rm = TRUE))

states_map <- map_data("state")

state_black_jail$region <- tolower(state.name[match(state_black_jail$state, state.abb)])
states_map <- left_join(states_map, state_black_jail, by = "region")

ggplot(states_map, aes(x = long, y = lat, group = group, fill = black_jail_pop)) +
  geom_polygon(color = "black") +
  scale_fill_viridis_c(name = "Black Jail Population", label = scales::comma, na.value = "grey") +
  theme_minimal() +
  labs(title = "Geographical Distribution of Incarcerated Black Citizens in 2018",
       fill = "Black Jail Population",
       x = "",
       y = "") +
  theme(
    legend.position = "right",
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
    )
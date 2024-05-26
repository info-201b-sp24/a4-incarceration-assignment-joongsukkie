library(ggplot2)
library(dplyr)
jail_data <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/us-jail-pop.csv?raw=true")

data_1998 <- jail_data %>%
  filter(year == 1998)
comma_format <- function(x) {
  formatC(x, format = "d", big.mark = ",")
}
ggplot(data_1998, aes(x = total_pop_15to64, y = black_jail_pop)) +
  geom_point(color = "blue", size = 2) +
  scale_x_continuous(labels = comma_format, limits = c(0, 2500000)) +  
  scale_y_continuous(labels = comma_format, limits = c(0, 4000)) + 
  labs(x = "Population Ages 15 to 64", y = "Number Incarcerated Black Citizens",
       title = "Incarcerated Black Citizens vs. Population Per County") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 14),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )
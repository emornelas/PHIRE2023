# Purpose: Intro ggplot2
# Your Name: Elissa Ornelas
# Your Email: elissamornelas@arizona.edu
# Created: 2023-05-24

# Library -----------------------------------------------------------------

library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)


# Section Shortcut --------------------------------------------------------

# Ctrl + Shift + R

# Load data as object
gapminder <- gapminder

# Making a visualization
# Continuous
ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point( alpha = 0.5, color = "blue") +
  geom_point("1f436") +
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 3)

# Categorical year
ggplot(gapminder, 
       aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(aes(color = continent))

# # Adding Emojis: Emo ppackages
# ggplot(data = gapminder,
#        mapping = aes(x = gdpPercap, y = lifeExp)) +
#   geom_point( alpha = 0.5, color = "blue") +
#   geom_point(emoji = "1f436") +
#                scale_x_log10() +
#                geom_smooth(method = "lm", linewidth = 3))

# Visualize Americans only
gapminder %>% # ctrl+shift+m for pipe
  filter(continent == "Americas")

americas <- gapminder %>% 
  filter(continent == "americas")

# Plot Americas
americas %>% 
ggplot(americas, 
       aes(x = year, y = lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~country) +
  labs(x = "year",
       y = "life expectancy",
       title = "title")
       

#Statistical Summary
#Getting means of samples
gm_medians <- gapminder %>%
  filter(continent == "Africa") %>%
  group_by(year) %>%
  summarise(life_med = median(lifeExp), gdp_med = median(gdpPercap))

gm_medians
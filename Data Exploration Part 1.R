install.packages("gapminder")
library(gapminder)
head(gapminder)
#Levels show your factors
levels(gapminder$country)
# Years are numeric variables so you will create a vector for those
unique(gapminder$year)

#Graphing change of pop in years
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot()
#This will show it on a logarithmic scale
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot() +
  scale_y_log10()

#Filtering and Arranging by Population
# Finding the largest countries
library("dplyr")

gm.big <- gapminder %>%filter(year == 2007) %>%arrange(desc(pop))
head(gm.big, n = 10)
#Head for top of data, tail for end of data
tail(gm.big, n = 10)

#Determining Outliers in Per Capita GDP
#Plot
ggplot(gapminder, aes(x = factor(year), y = gdpPercap)) + geom_boxplot()
# finding rows where gdpPercap is > 13988

filter(gapminder, gdpPercap > 13988)

#Graphing Life Expentancy
ggplot(gapminder, aes(x = factor(year), y = lifeExp)) + geom_boxplot()
#Finding Country w/ low life expentancy
filter(gapminder, lifeExp < 28)
gm.Europe <- filter(gapminder, continent =="Europe")
filter(gm.Europe,lifeExp<53)


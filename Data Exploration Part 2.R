gm_Angola <- filter(gapminder, country == "Angola")
head(gm_Angola)
ggplot(gm_Angola) + geom_line(aes(x = year, y = lifeExp)) + ylab("Life Expectancy") + ggtitle("Life Expectancy in Angola")
ggplot(gm_Angola) + geom_line(aes(x = year, y = gdpPercap)) + ylab("Per Capita GDP") + ggtitle("GDP in Angola")
# creating frame w/ 4 countries to compare
gm_Africa4 <- filter(gapminder, country %in% c("Angola", "Ghana", "Ethiopia", "South Africa"))
#Choose the variables you want to use
gm_AfricaClean <- select(gm_Africa4, country, year, lifeExp, gdpPercap)
head(gm_AfricaClean)

# You can combine filtering and selecting operations into on cammand with %>%
gm_AfricaClean <- gapminder %>%filter(country %in% c("Angola", "Ghana", "Ethiopia", "South Africa")) %>%select(country, year, lifeExp, gdpPercap)

#Life Exp of 4 countries
ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = lifeExp, color = country)) +ylab("Life Expectancy") + ggtitle("Life Expectancy in Four Countries")
# GDP of the 4
ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = gdpPercap, color = country)) +ylab("Per Capita GDP") + ggtitle("GDP in Four Countries")

# Put plots together w/ gridarrange
install.packages("gridExtra")
library("gridExtra")
life_exp <- ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = lifeExp, color = country))
GDP <- ggplot(gm_AfricaClean) + geom_line(aes(x = year, y = gdpPercap, color = country)) + ylab("Life Expectancy")
grid.arrange(life_exp, GDP, ncol = 1)
#ncol is saying 1 column

#PLoting specific areas of importance over graph
ggplot(gm_AfricaClean, aes(x = year, y = lifeExp, color = country)) +
  geom_line() + geom_point(aes(size = gdpPercap)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy and GDP in Four Countries")

#plotting against eachother
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point()

#connecting points w/ geom_line() vs. geom_path()
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point() + geom_line()
#this will only get you the dots to connect cloest to eachother

ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point() + geom_path()
#This will go from point to point accurate w/ the information

#Making points w/ transparency alpha= argument
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year)) + geom_path()
#Making points larger
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0))

#Finally adding lables to axis
ggplot(gm_AfricaClean, aes(x = gdpPercap, y = lifeExp, color = country)) +
  geom_point(aes(alpha = year), size = 3) + geom_path() +
  scale_alpha(range = c(0.3, 1.0)) +
  xlab("Per capita GDP") + ylab("Life Expectancy")


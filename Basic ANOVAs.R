library("dplyr")
library("rcompanion")
library("car")

apps <- na.omit(NEWgoogleplaystore %>% filter(Category %in% c("BEAUTY", "FOOD_AND_DRINK", "PHOTOGRAPHY")))

apps$Price <- as.numeric(apps$Price)

plotNormalHistogram(apps$Price)

apps$PriceSQRT <- sqrt(apps$Price)
plotNormalHistogram(apps$PriceSQRT)

apps$PriceCUBE <- apps$Price ^ 3
plotNormalHistogram(apps$PriceCUBE)

# Bartlett test when it is normally distributed
bartlett.test(Price ~ Category, data=apps)
# Fligner test when data is not normally distributed
fligner.test(Price ~ Category, data=apps)

appsANOVA <- aov(apps$Price ~ apps$Category)

summary(appsANOVA)

ANOVA <- lm(Price ~ Category, data=apps)
Anova(ANOVA, Type="II", white.adjust=TRUE)

pairwise.t.test(apps$Price, apps$Category, p.adjust="none")

pairwise.t.test(apps$Price, apps$Category, p.adjust="bonferroni")

pairwise.t.test(apps$Price, apps$Category, p.adjust="bonferroni", pool.sd = FALSE)

appsMeans <- apps %>% group_by(Category) %>% summarize(Mean = mean(Price))





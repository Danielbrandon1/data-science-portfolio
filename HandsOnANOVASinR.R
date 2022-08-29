library("dplyr")
library("rcompanion")
library("car")
places <- na.omit(avocados %>% filter(region %in% c("Albany", "Houston", "Seattle")))

plotNormalHistogram(places$AveragePrice)

places$AveragePriceSQRT <- sqrt(places$AveragePrice)

plotNormalHistogram(places$AveragePriceSQRT)

places$AveragePriceLOG <- log(places$AveragePrice)

plotNormalHistogram(places$AveragePriceLOG)

bartlett.test(AveragePrice ~ region, data=avocados)

cadoANOVA <- aov(avocados$AveragePrice ~ avocados$region)

summary(cadoANOVA)

pairwise.t.test(avocados$AveragePrice, avocados$region, p.adjust="none")
pairwise.t.test(avocados$AveragePrice, avocados$region, p.adjust="bonferroni", pool.sd = FALSE)


cadoMeans <- avocados %>% group_by(region) %>% summarize(Mean = mean(AveragePrice))

summary(cadoMeans)

# Price differs but not by much
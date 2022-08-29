install.packages("Ecdat")
library(Ecdat)
library(ggplot2)
head(Cigarette)
head(Cigarette)
ggplot(Cigarette, aes(x = factor(state), y = packpc)) + geom_boxplot()

packspercapperstate

#Find the median over all the states of the number of packs per capita for each year

Cig_medians <- Cigarette %>% group_by(state) %>% summarise(pack_med = median(packpc)
Cig_medians

d <- ggplot(Cigarette, aes(x = packpc, y = avgprs))
d + geom_point(color=year)

lin_reg <- lm(packpc ~ avgprs, Cigarette)
print(lin_reg)
summary(lin_reg)

d <- ggplot(Cigarette, aes(x = avgprs, y = packpc))
d + geom_point() + geom_smooth(method=lm, se=FALSE)

newprice = avgprs / cpi 

newprice <- mutate(Cigarette, newprice = avgprs/cpi)

d <- ggplot(newprice, aes(x = newprice, y = packpc))
d + geom_point() + geom_smooth(method=lm, se=FALSE)

lin_reg <- lm(packpc ~ newprice, newprice)
print(lin_reg)
summary(lin_reg)

nineeight <- filter(Cigarette, year == "1985")
ninenine <- filter(Cigarette, year == "1995")

t_dep <- t.test(nineeight$packpc, ninenine$packpc, paired = TRUE)
t_dep

library(dplyr)
med_cig <- Cigarette %>% group_by(state) %>% summarize(med.packpc = mean(packpc))
med_cig
filter(med_cig, year <= "1995", year >= "1985") 
library(ggplot2)
ggplot(med_cig, aes(x = factor(state), y = med.packpc)) + geom_boxplot()
Cigarette %>% group_by(year) %>% summarise(med.packs.year = median(packpc))

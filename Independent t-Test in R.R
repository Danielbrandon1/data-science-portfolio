#We are comparing t test to lab and ia400; alt is 2 sided anf var alwasy FLASE unless told otherwise
t_ind <- t.test(frostedflakes$Lab, frostedflakes$IA400, alternative="two.sided", var.equal=FALSE)
print(t_ind)

install.packages("reshape2")
library(reshape2)
ff <- melt(frostedflakes, id="X")

ggplot(ff) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test Method") + ylab("Percentage of Sugar")

#Quiz Example
install.packages("DAAG")
library(DAAG)
erie <- greatLakes[,1]
huron <- greatLakes[,2]

t.test(greatLakes["erie"], greatLakes["huron"], alternative="two.sided", var.equal=FALSE)
#Need Help!!!!!!!!!!!!!!!
#not enough 'x' observations

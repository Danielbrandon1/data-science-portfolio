scores <- read.csv("scores.csv")
head(scores)

t_dep <- t.test(scores$postest, scores$pretest, paired = TRUE)
t_dep

library(reshape2)
ss <- melt(scores, measure.vars = c("pretest", "postest"))
head(ss)

ggplot(ss) + geom_boxplot(aes(x = variable, y = value)) + xlab("Test") + ylab("Score")


dd <- scores$postest - scores$pretest
df <- data.frame(dd)
ggplot(df, aes(x = dd)) + geom_histogram(binwidth = 1) + xlab("Difference between postest and pretest")
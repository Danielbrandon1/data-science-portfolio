library("mvnormtest")
library("car")

str(heartAttacks$chol)
str(heartAttacks$trestbps)

keeps <- c("chol", "trestbps")
heartAttacks1 <- heartAttacks[keeps]

heartAttacks2 <- as.matrix(heartAttacks1)

heartAttacks3 <- na.omit(heartAttacks2)

mshapiro.test(t(heartAttacks3))


leveneTest(heartAttacks$trestbps, heartAttacks$sex, data=heartAttacks)

leveneTest(heartAttacks$chol, heartAttacks$sex, data=heartAttacks)

cor.test(heartAttacks$chol, heartAttacks$trestbps, method="pearson", use="complete.obs")

MANOVA <- manova(cbind(chol, trestbps) ~ sex, data = heartAttacks)
summary(MANOVA)


summary.aov(MANOVA, test = "wilks") 

# it seems there is a corelation with trestbps but not so much cholestoral in comparison to male and females with heart attacks

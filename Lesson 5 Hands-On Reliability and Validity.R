library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

studentSurvey1 <- studentSurvey[, 31:43]

studentSurvey1matrix <- cor(studentSurvey1)

View(round(studentSurvey1matrix, 2))

cortest.bartlett(studentSurvey1)

det(studentSurvey1matrix)

pcModell1 <- principal(studentSurvey1, nfactors = 10, rotate = "none")
pcModell1

plot(pcModell1$values, type="b")

pcModell2 <- principal(studentSurvey1, nfactors = 2, rotate = "none")
pcModell2

residualss <- factor.residuals(studentSurvey1matrix, pcModell2$loadings)

residualss <- as.matrix(residualss[upper.tri(residualss)])

largeResidd <- abs(residualss) > .05

sum(largeResidd)

sum(largeResidd/nrow(residualss))

pcModell3 <- principal(studentSurvey1, nfactors = 2, rotate = "oblimin")
pcModell3

print.psych(pcModell3, cut = .3, sort=TRUE)

pcModell4 <- principal(studentSurvey1, nfactors = 2, rotate = "varimax")
print.psych(pcModell4, cut=.3, sort=TRUE)

library("psych")

goodFWB <- studentSurvey1[, c(1,2,4,8)]
badFWB <- studentSurvey1[, c(3,5,6,7,9,10)]


studentSurvey1$FWB1_3r <- NA
studentSurvey1$FWB1_3r[studentSurvey1$FWB1_3 == 1] <- 5
studentSurvey1$FWB1_3r[studentSurvey1$FWB1_3 == 2] <- 4
studentSurvey1$FWB1_3r[studentSurvey1$FWB1_3 == 3] <- 3
studentSurvey1$FWB1_3r[studentSurvey1$FWB1_3 == 4] <- 2
studentSurvey1$FWB1_3r[studentSurvey1$FWB1_3 == 5] <- 1

studentSurvey1$FWB1_5r <- NA
studentSurvey1$FWB1_5r[studentSurvey1$FWB1_5 == 1] <- 5
studentSurvey1$FWB1_5r[studentSurvey1$FWB1_5 == 2] <- 4
studentSurvey1$FWB1_5r[studentSurvey1$FWB1_5 == 3] <- 3
studentSurvey1$FWB1_5r[studentSurvey1$FWB1_5 == 4] <- 2
studentSurvey1$FWB1_5r[studentSurvey1$FWB1_5 == 5] <- 1

studentSurvey1$FWB1_6r <- NA
studentSurvey1$FWB1_6r[studentSurvey1$FWB1_6 == 1] <- 5
studentSurvey1$FWB1_6r[studentSurvey1$FWB1_6 == 2] <- 4
studentSurvey1$FWB1_6r[studentSurvey1$FWB1_6 == 3] <- 3
studentSurvey1$FWB1_6r[studentSurvey1$FWB1_6 == 4] <- 2
studentSurvey1$FWB1_6r[studentSurvey1$FWB1_6 == 5] <- 1

studentSurvey1$FWB2_1r <- NA
studentSurvey1$FWB2_1r[studentSurvey1$FWB2_1 == 1] <- 5
studentSurvey1$FWB2_1r[studentSurvey1$FWB2_1 == 2] <- 4
studentSurvey1$FWB2_1r[studentSurvey1$FWB2_1 == 3] <- 3
studentSurvey1$FWB2_1r[studentSurvey1$FWB2_1 == 4] <- 2
studentSurvey1$FWB2_1r[studentSurvey1$FWB2_1 == 5] <- 1

studentSurvey1$FWB2_3r <- NA
studentSurvey1$FWB2_3r[studentSurvey1$FWB2_3 == 1] <- 5
studentSurvey1$FWB2_3r[studentSurvey1$FWB2_3 == 2] <- 4
studentSurvey1$FWB2_3r[studentSurvey1$FWB2_3 == 3] <- 3
studentSurvey1$FWB2_3r[studentSurvey1$FWB2_3 == 4] <- 2
studentSurvey1$FWB2_3r[studentSurvey1$FWB2_3 == 5] <- 1

studentSurvey1$FWB2_4r <- NA
studentSurvey1$FWB2_4r[studentSurvey1$FWB2_4 == 1] <- 5
studentSurvey1$FWB2_4r[studentSurvey1$FWB2_4 == 2] <- 4
studentSurvey1$FWB2_4r[studentSurvey1$FWB2_4 == 3] <- 3
studentSurvey1$FWB2_4r[studentSurvey1$FWB2_4 == 4] <- 2
studentSurvey1$FWB2_4r[studentSurvey1$FWB2_4 == 5] <- 1

studentSurvey22 <- studentSurvey1[, c(1,2,4,8,11,12,13,14,15,16)]

alpha(goodFWB)
alpha(badFWB)
alpha(studentSurvey22)


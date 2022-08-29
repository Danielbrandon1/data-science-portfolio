library(rcompanion)
plotNormalHistogram(cruise_ship$PassSpcR)
plotNormalHistogram(cruise_ship$passngrs)
cruise_ship$passngrsSQRT <- sqrt(cruise_ship$passngrs)
plotNormalHistogram(cruise_ship$passngrsSQRT)
plotNormalHistogram(cruise_ship$Crew)
cruise_ship$CrewSQRT <- sqrt(cruise_ship$Crew)
plotNormalHistogram(cruise_ship$CrewSQRT)




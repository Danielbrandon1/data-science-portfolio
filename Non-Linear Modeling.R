# Non-Linear Modeling


### Quadratic Relationships/Modeling
library("ggplot2")

#Graph Quadratic Relationship to confirm if data is quadratic

quadPlot <- ggplot(bluegill_fish, aes(x = age, y=length)) + geom_point() + stat_smooth(method = "lm", formula = y ~ x + I(x^2), size =1)

quadPlot

# First, square the 'x' term

Agesq <- bluegill_fish$age^2

# When using lm for quadratic modeling, it goes lm(dataset $ 'Y' ~ dataset $ X + 'X'squared variable)


quadModel <- lm(bluegill_fish$length~bluegill_fish$age+Agesq)
summary(quadModel)

### Exponential Relationships/Modeling

## Decibel Scale Example
#There are some common things with which you are probably familiar that are exponential.
#For example, noise is on an exponential scale called the decibel (dB) scale.
#In fact, the noise scale is exponential both in intensity, and 'loudness.' 
#For instance, a sound at 40 dB would be quiet talking, whereas a sound at 50 dB (louder conversation) would be 10 times as intense, and twice as loud.

#A change of 10 dB is not that big of a deal, but a change of 40 dB (for instance) is a pretty big change. 
#Again starting at 40 dB, a change to 80 dB (loud highway noise at close range) is change of intensity of 10,000x, and a change in loudness of 16x. 
#An 80 dB sound is much more than just twice the intensity or loudness of a 40 dB sound.
#Take a look: PNG L03-10 (1)

# When using lm for exponential modeling, get log of your 'Y' variable
# lm(log)(dataset$'Y')~datset$'X'

exMod <- lm(log(bacteria$Count)~bacteria$Period)
summary(exMod)

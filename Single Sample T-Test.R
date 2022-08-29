head(frostedflakes)
#This is two variables: Lab, which contains the percentage of sugar measured in a 25 gram sample of Frosted Flakes
#Using a laboratory high performance liquid chromatography technique,  
#IA400, which contains the percentage of sugar in the same sample measured by a machine (the Infra-Analyzer 400)

t.test(frostedflakes$Lab, mu = 37)
print(t_obj)
library("dplyr")

t_obj <- t.test(frostedflakes$Lab, mu = 37)
print(t_obj)

ggplot(frostedflakes, aes(x = Lab)) + geom_histogram(binwidth = 1)

ggplot(frostedflakes, aes(sample = Lab)) + geom_qq()

#t.test(LakeHuron, mu = 577)







library(qplot)
library(ggplot2)
data("diamonds")
head(diamonds)
names(diamonds)

ggplot(diamonds, aes(x = price, y = x)) +
  geom_jitter(alpha = 1/10, color = 'blue')+
  geom_line(stat = 'summary', fun.y = mean)
  




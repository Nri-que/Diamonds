



library(ggplot2)
library(dplyr)
data("diamonds")
head(diamonds)
names(diamonds)




ggplot(diamonds, aes(x = x, y = price)) +
  geom_point(alpha = 1/10, color = 'blue')+
  xlim(3,9) +
  geom_smooth(method = 'lm', color = 'red')

ggsave("length in mm and price.png")
  
cor.test(diamonds$x, diamonds$price)



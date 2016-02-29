library(ggplot2)
data(diamonds)
?diamonds

#A data frame with 53940 rows and 10 variables:
#price: price in US dollars (\$326–\$18,823)
#carat: weight of the diamond (0.2–5.01)
#cut: quality of the cut (Fair, Good, Very Good, Premium, Ideal)
#color: diamond colour, from J (worst) to D (best)
#clarity: a measurement of how clear the diamond is (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))
#x: length in mm (0–10.74)
#y: width in mm (0–58.9)
#z: depth in mm (0–31.8)
#depth: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)
#table: width of top of diamond relative to widest point (43–95)


summary(diamonds)
class(diamonds)
str(diamonds)
head(diamonds)
dim(diamonds)

qplot(diamonds$price, binwidth = 500)

summary(diamonds$price)

sum(diamonds$price < 500)
nrow(subset(diamonds, price < 500))
   # why cant I do the following
nrow(diamonds$price < 500)

sum(diamonds$price <= 250)
nrow(subset(diamonds, price < 250))

sum(diamonds$price >= 15000)
nrow(subset(diamonds, price >= 15000))

ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 100, 
                                  color = "black", fill = "yellow") + 
  ggtitle("Diamonds Price Histogram between $0 and $1800.") + 
  coord_cartesian(xlim=c(0,18000, 100), ylim = c(0,3000,100))

?ggsave

ggsave('pricehistogram.png')

library(ggplot2)
data(diamonds)
ggplot(diamonds) + geom_histogram(aes(x=price), binwidth = 1, 
                                  color = "black", fill = "lightblue") + 
  ggtitle("Diamonds Price by Cut Histogram") + 
  facet_grid(. ~ carat)


by((diamonds$price/diamonds$carat), diamonds$color, summary)


ggplot(diamonds) + geom_boxplot(aes(x = (price/carat),  y = color, fill = price/carat), color = 'red') + 
  ggtitle("Diamond Price per Carat by Color.")


by((diamonds$price/diamonds$carat), diamonds$color, summary)

##############################################################

## Part one  answer

ggplot(diamonds) + geom_boxplot(aes(x = color,  y = (price/carat), fill = price/carat), color = 'red') + 
  scale_y_continuous(breaks = seq(0,18000,1000)) +
  ggtitle("Diamond Price per Carat by Color.")

ggsave("Boxplot -Diamond Price per Carat by Color.png")










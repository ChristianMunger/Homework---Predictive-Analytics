#Homework 5
#==========================================
#  Slide 48
#==========================================
library(ggplot2)
ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~hwy)
ggplot(mpg, aes(displ, cyl)) + geom_point() + facet_wrap(~cyl)
#Faceting hwy works but creates many unuseful facets, while cyl only creates 4 and is more useful.


ggplot(mpg, aes(displ, hwy)) + geom_point() + facet_wrap(~cyl)
#6 and 8 cylinder cars have similar plots and have worse fuel mileage than 4 and 5 cylinder cars.
#8 cylinder cars also have the largest engine size.

help(facet_wrap)
#nrow changes the number of rows and ncol change the number of columns.

#Scales allows you to fix the x and y axis.  You might use scales if there is a large difference in values 
#on different facets.
#==========================================
#  Slide 74
#==========================================
#Manually imported AutoClaims from files
attach(AutoClaims)
names(AutoClaims)
date <- policy_bind_date
by_month <- months(as.POSIXlt(date, format="%d/%m/%Y"))
ggplot(AutoClaims, aes(by_month, total_claim_amount)) + geom_path(color = "red") + geom_point(color = "blue") 
ggplot(AutoClaims, aes(by_month, policy_annual_premium)) + geom_path(color = "red") + geom_point(color = "blue")
#Im not sure how to put the months in chronological order? I tried using as.factor and levels but it wouldn't seem to work.
#==========================================
#  Slide 83-87
#==========================================
View(diamonds)
attach(diamonds)
names(diamonds)

head(diamonds)

tail(diamonds)

summary(diamonds)

str(diamonds)

dim(diamonds)

ggplot(diamonds, aes(price)) + geom_histogram()

ggplot(diamonds, aes(price)) + geom_histogram(binwidth = 500) + xlab("Diamond Price U$") + ylab("Frequency") + ggtitle("Diamond Price Distribution")

ggplot(diamonds, aes(price)) + geom_histogram(binwidth = 100) + xlab("Diamond Price U$") + ylab("Frequency") + ggtitle("Diamond Price Distribution") + facet_wrap(~cut)

mean(price)
median(price)
max(price)
min(price)
sum(cut == "Fair")
sum(cut == "Good")
sum(cut == "Very Good")
sum(cut == "Ideal")
table(cut)

sum(price <= 500)
sum(price <= 250)
sum(price >= 15000)

library(dplyr)
slice_max(diamonds, price)

slice_min(diamonds, price)

diamonds[cut == "Fair",]

Fair <- group_by(filter(diamonds, cut == "Fair"), price)
  median(Fair$price)
Good <- group_by(filter(diamonds, cut == "Good"), price)
  median(Good$price)
Very_Good <- group_by(filter(diamonds, cut == "Very Good"), price)
  median(Very_Good$price) 
Ideal <- group_by(filter(diamonds, cut == "Ideal"), price)
  median(Ideal$price)
Premium <- group_by(filter(diamonds, cut == "Premium"), price)
  median(Premium$price)
  
ggplot(diamonds,aes(cut,price))+ geom_boxplot()

d <- subset(diamonds, color == "D")
summary(d)
IQR(d$price)

j <- subset(diamonds, color == "J")
summary(j)
IQR(j$price)


#==========================================
#  Slide 10
#==========================================
install.packages("maps")
library(maps)
library(dplyr)
pollution<-avgpm25    #Manually installed avgpm25 from files
map("county", "california")
with(filter(pollution, pm25 > 15), points(longitude, latitude, pch=16, col="red"))


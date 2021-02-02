#Homework 4
#==========================================
#  Slide 20
#==========================================
View(chicago)   #Manually imported from files
attach(chicago)
hist(chicago $ tmpd)
hist(chicago $ dptp)
hist(chicago $ pm25tmean2)
hist(chicago $ pm10tmean2)
hist(chicago $ o3tmean2)
hist(chicago $ no2tmean2)
#Missing data can bias analysis by causing misrepresentations in the data and skew in the plots.

q <- quantile(Chicago$tmpd, seq(0, 1, 0.1), na.rm = TRUE)
Chicago <- mutate(Chicago, tmpd.quint = cut(tmpd, q))
quint <- group_by(Chicago, tmpd.quint)
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),  no2 = mean(no2tmean2, na.rm = TRUE))
#There appears to be a positive correlation between tmpd and o3 and a slight negative correlation between tmpd and no2 for tmpd < 70.


qq <- quantile(Chicago$dptp, seq(0, 1, 0.1), na.rm = TRUE)
Chicago <- mutate(Chicago, dptp.quint = cut(dptp, qq))
quint <- group_by(Chicago, dptp.quint)
summarize(quint, o3 = mean(o3tmean2, na.rm = TRUE),  no2 = mean(no2tmean2, na.rm = TRUE))
#There appears to be a positive correlation between dptp and o3 and no correlation between dptp and no2.

#==========================================
#  Slide 23-24
#==========================================

library(data.table)
ozone<-fread("C:/Users/cmunger/Downloads/hourly_44201_2014/hourly_44201_2014.csv")
attach(ozone)
str(ozone)
head(ozone)
tail(ozone)
names(ozone)
names(ozone)[22]<-paste("StateName")
names(ozone)[14]<-paste("SampleMeasurement")
names(ozone)[23]<-paste("CountyName")
attach(ozone)
table(ozone$"Time Local")
library(dplyr)
unique(ozone$"State Name")
select(ozone, "State Name") %>% unique %>% nrow
quantile(ozone$ "Sample Measurement ", seq(0, 1, 0.1))
ranking <- group_by(ozone, StateName, CountyName)%>%summarize(ozone = mean(SampleMeasurement),
                                                              n=n())#%>% as.data.frame%>%arrange(desc(ozone1))

  
# PC imported the data and ran the code without any errors


#==========================================
#  Slide 27
#==========================================

#Watched the videos.




#==========================================
#  Slide 40
#==========================================
library(ggplot2)
library(ggthemes)
ggplot(mpg, aes(x = cty, y = hwy)) + geom_point()
#There is a positive linear relationship between cty and highway. My only concern about drawing conclusions from the plot would be for values of cty > 30.
ggplot(mpg, aes(model, manufacturer)) + geom_point() 
#This plot shows the model of the car and its associated manufacturer.As it is the plot isn't useful because it isn't informative.  I would group the data in a histogram or bar plot to describe the amount of models per manufacturer.
ggplot(mpg, aes(cty, hwy)) + geom_point()
#Same as described in the first plot.
ggplot(diamonds, aes(carat, price)) + geom_point()
#Very clustered mapping that shows a positive correlation between carat size and price.
ggplot(economics, aes(date, unemploy)) + geom_line()
#The model fluctuates a lot. However, over time it shows that unemployment has risen. This can be due to some unknown factor such as population increase.
ggplot(mpg, aes(cty)) + geom_histogram()
#Skewed right with a concentration around cty = 16
#==========================================
#  Slide 45
#==========================================
ggplot(mpg, aes(drv, hwy)) + geom_boxplot() 
ggplot(mpg, aes(drv, hwy)) + geom_violin()

#For fuel economy, front wheel is the most efficient for saving gas, with rear wheel drive second, and 
#4 wheel drive being the most inefficient.

ggplot(mpg, aes(class, displ, color = drv)) + geom_jitter(width = .5, height = 0)
#This plot shows that drive train is mostly associated with the size of the car.  A smaller car usually has a 
#smaller engine size and is typically front wheel drive with 2 seaters being the only small car and exclusively rear wheel drive.
#A larger car usually has a larger engine and is mostly 4 or rear wheel drive with subcompact
#being the only large front wheel drive vehicle.



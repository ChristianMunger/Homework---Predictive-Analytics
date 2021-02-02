#===========================================================================
#Homework 2
#===========================================================================
#===========================================================================
#Problem 1
install.packages("data.table")
library(data.table)
flights = fread("https://github.com/arunsrinivasan/satrdays-workshop/raw/master/flights_2014.csv")

flights[arr_delay >= 120]
flights[dest == "IAH" | dest == "HOU"]
flights[carrier %in% c("AA", "DL", "UA")]
flights[month %in% 7:9]
flights[dep_delay >= 60| dep_delay - arr_delay > 30]
flights[dep_time <= 600 | dep_time >= 2400]
flights[is.na(dep_time)]  #17 columns empty dep_time

#===========================================================================
#Problem 2
#1.
A<-matrix(A <- c(8, 1, 4, 5, 6, 3, 9, 10, 12, 23, 44, 32 ), byrow = TRUE, nrow = 3)
A

#Outputs  
#       The Matrix
#       8 1 4 5
#       6 3 9 10 
#       12  23  44  32

#2  a. 8

#   b. 5  10  32

#   c. 6  9
#      12 44

#   d. FALSE  TRUE  TRUE

#3.     1 2
#       3 4
#       5 6
#       7 8
#       9 10

#4.     1 6
#       2 7
#       3 8
#       4 9
#       5 10

#5.     50 87
#       37 78
#       72 45

#6.     1 5 9
#       2 6 10
#       3 7 11
#       4 8 12

#7.     5 3

#8.     6 2

#9.  a. 6
#    b. Error in matrix_c[1:3, 2:3] : subscript out of bounds
#    c.                                       add_row 
#       1       2       3       4       5       1 
#    d. 1 6

#10. 
#Let 1 be the top chart, 2 be the bottom left, and 3 be the bottom right
#Height and Volume - 3,2,1
#Girth and Volume -  2,1,3
#Girth and Height -  1.2,3


#===========================================================================
#Problem 3

mydata <- read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv")
head(mydata)
tail(mydata)
summary(mydata)

str(mydata)

hist(mydata $ mpg)
hist(mydata $ mpg, breaks  = 10)
boxplot(mydata$mpg  ~  mydata$cyl)
plot(mydata$mpg  ~ mydata$cyl)
plot(mydata$hp, mydata$mpg )
abline(lm(mydata$mpg ~ mydata$hp))

#===========================================================================
#Problem 4

data("iris")
head(iris)
tail(iris)
summary(iris)

iris.vers = subset(iris, Species == "versicolor")
iris.vers

sepal.dif = iris.vers$Sepal.Length - iris.vers$Sepal.Width
sepal.dif

iris.vers = data.frame(iris.vers, sepal.dif)
iris.vers

library(dplyr)
iris.filtered = filter(iris, Sepal.Width > 3.5, Species =="virginica")
iris.filtered

iris.odd = iris[c(T,F), 1]
iris.odd

mean(iris[,"Sepal.Length"])
mean(iris[,"Petal.Length"])
mean(iris[,"Sepal.Width"])
mean(iris[,"Petal.Width"])
mean(sepal.dif)
mean(iris.odd)
#===========================================================================















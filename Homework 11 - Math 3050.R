#Homework 11
#==========================================
#  Slide 118,119
#==========================================
library(tidyverse)
#1. E. All of the above
#2. C. both marginal frequencies are fixed
#3. FALSE
#4. 
E <- as.matrix(c(10, 12, 13, 14, 16, 21))
C <- as.matrix(c(1, 3, 7, 8, 9, 11))
dim(E) <- c(2,3)
dim(C) <- c(2,3)
median(E)
median(C)
fisher.test(E,C)

#==========================================
#  Slide 132-135
#==========================================
#1.
x <- c(0,3,6,7,9)
y <- c(0, 1.4, 2.6, 3.8, 7.2)
cor(x,y)

#2. B. 80% of the variation in y is due to regression on x
#3. B. .87
#4. 
 covariance <- 0.15*(0.06-0.082)*(0.04-0.04975)+ 0.6*(0.08-0.082)*(0.05-0.04975)+0.25*(0.10-0.082)*(0.055-0.04975)
 covariance
 correlation <- covariance/((.01249)*(.0046))
 correlation

#5.
attach(faithful)
View(faithful)
ggplot(faithful, aes(eruptions, waiting)) + geom_point() + geom_smooth(method =lm)
cov(eruptions,waiting)
var(eruptions,waiting)


#==========================================
#  Slide 160
#==========================================
install.packages("boot")
library(boot)
hsb2 <- read.table("https://stats.idre.ucla.edu/stat/data/hsb2.csv", sep=",", header=T)
pearson <- function(d, i){
  d2 <- d[i, ]
  return(cor(d2$write, d2$math))
  
}
bootcorr <- boot(data=hsb2,statistic=pearson, R = 500)
summary(bootcorr)
mean(bootcorr$t)-mean(bootcorr$t0)
sqrt(var(bootcorr$t))
plot(bootcorr)
#==========================================
#  Slide 28,29
#==========================================
attach(cars)
View(cars)
head(cars)
ggplot(cars, aes(x = speed, y = dist)) + geom_point()+geom_abline()
#Speed increases with distance
par(mfrow = c(1,2))
boxplot(speed)
boxplot(dist)
p <- ggplot(cars, aes(speed, fill = "red"))+ geom_density()
q <- ggplot(cars, aes(dist, fill = "red"))+ geom_density()
library(gridExtra)
grid.arrange(p,q, ncol = 2)
cor(speed,dist)
reg <- lm(dist~speed)
anova(reg)

dataset <- data.marketing.budget.12mo
attach(dataset)
head(dataset)
boxplot(Spend)
boxplot(Sales)
ggplot(dataset, aes(Spend,Sales))+geom_point()
lm(Sales~Spend)
summary(lm(Sales~Spend))
#Sales and Spend have a positive linear relationship

#==========================================
#  Slide 32,33
#==========================================
url = "http://stats191.stanford.edu/data/salary.table"
salary.table <- read.table(url, header=T)
salary.table$E <- factor(salary.table$E)
salary.table$M <- factor(salary.table$M)
attach(salary.table)
model <- lm(S~(E+M+X))
model
plot(model)
summary(model)
#M and X have the smallest p-values
#X has the smallest standard error
anova(model)
model2 <- lm(S~E+M+X+X:E)
anova(model2)

#==========================================
#  Slide 51,52
#==========================================
library(MASS)
install.packages("faraway")
library(faraway)
View(savings)
attach(savings)
savings_model = lm(sr ~ ., data = savings)
library(MASS)
boxcox(savings_model, lambda = seq(0.5,1.5,0.1)) 
shapiro.test(sr)

#The residual plot indicates the data is not from a normal distribution as it is conical

#==========================================
#  Slide 65,66
#==========================================
#1. D. 12
#2. TRUE

mcheck <- function (obj, ...){
  rs <- obj$resid
  fv <- obj$fitted
  windows(7,4)
  par(mfrow=c(1,2))
  plot(fv, rs, xlab="Fitted Values", ylab="Residuals", pch=16,col="red")
  abline(h=0, lty=2)
  qqnorm(rs, xlab="Normal scores", ylab="Ordered residuals", main="", pch=16)
  qqline(rs, lty=2,col="green")
  par(mfrow=c(1,1))
  invisible(NULL)
}
mcheck(beta(2,3))
mcheck(weibull(2,4))
mcheck(logistic(3,2))

attach(cars)
View(cars)
carsmodel <- lm(dist ~ speed)
boxcox(carsmodel, lambda = .5)











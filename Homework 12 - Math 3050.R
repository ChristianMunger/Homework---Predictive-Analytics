#Homework 12
#==========================================
#  Slide 71
#==========================================
View(cars)
attach(cars)
a <- lm(dist~speed)
lm.influence(a)

dataset <- data.marketing.budget.12mo
attach(dataset)
b <- lm(Sales~Spend)
lm.influence(b)

url = "http://stats191.stanford.edu/data/salary.table"
salary.table <- read.table(url, header=T)
salary.table$E <- factor(salary.table$E)
salary.table$M <- factor(salary.table$M)
attach(salary.table)
c <- lm(S~(E+M+X))
lm.influence(c)

library(faraway)
View(savings)
attach(savings)
lm.influence(lm(sr ~ ., data = savings))
#==========================================
#  Slide 97
#==========================================
AIC(a)
AIC(b)
AIC(c)
AIC(lm(sr ~ ., data = savings))

#==========================================
#  Slide 128
#==========================================
summary(a)[[1]]
summary(a)[[2]]
summary(a)[[3]]
summary(a)[[4]]
summary(a)[[5]]
summary(a)[[6]]
summary(a)[[7]]
summary(a)[[8]]
summary(a)[[9]]
summary(a)[[10]]
summary(a)[[11]]

summary(b)[[1]]
summary(b)[[2]]
summary(b)[[3]]
summary(b)[[4]]
summary(b)[[5]]
summary(b)[[6]]
summary(b)[[7]]
summary(b)[[8]]
summary(b)[[9]]
summary(b)[[10]]
summary(b)[[11]]

summary(c)[[1]]
summary(c)[[2]]
summary(c)[[3]]
summary(c)[[4]]
summary(c)[[5]]
summary(c)[[6]]
summary(c)[[7]]
summary(c)[[8]]
summary(c)[[9]]
summary(c)[[10]]
summary(c)[[11]]

summary(lm(sr ~ ., data = savings))[[1]]
summary(lm(sr ~ ., data = savings))[[2]]
summary(lm(sr ~ ., data = savings))[[3]]
summary(lm(sr ~ ., data = savings))[[4]]
summary(lm(sr ~ ., data = savings))[[5]]
summary(lm(sr ~ ., data = savings))[[6]]
summary(lm(sr ~ ., data = savings))[[7]]
summary(lm(sr ~ ., data = savings))[[8]]
summary(lm(sr ~ ., data = savings))[[9]]
summary(lm(sr ~ ., data = savings))[[10]]
summary(lm(sr ~ ., data = savings))[[11]]




#==========================================
#  Slide 143,144
#==========================================
url2 = "http://pages.stat.wisc.edu/~ane/st572/data/toxic.txt"
Toxicity.Data <- read.table(url2, header=T)
attach(Toxicity.Data)


fit1 <- lm(Toxicity.Data)
anova(fit1)
fit2 <- lm(toxicity~dose)
anova(fit2)
fit3 <- lm(toxicity~weight)
anova(fit3)
fit4 <- lm(toxicity~dose + weight)
anova(fit4)
anova(fit1,fit2,fit3,fit4)
#fit4 is the best model
#==========================================
#  ANOVA QUESTIONS
#==========================================
#1. a)
#A = 2
#B = 11
#C = 14.19
#D = 8.52
#E = 1.577
#F = 5.403

#b) 12 observations

#2. B. two variances

#3. C. 40

#4. 
#A = 2
#B = 95
#C = 97
#D = 25
#E = 215
#F = 2
#G = 6.25

#5. D. F

#6. A. Mean Squares

#7. 
#DFT = 27
#SSt = 2618.72
#MSt = 197.403
#MSe = 68.3
#F-Ratio = 2.89
#28 total observations

#8.
#DFe = 6
#SSt = 2613.6
#SST = 6474.6
#MSt = 1306.8
#9 total observations


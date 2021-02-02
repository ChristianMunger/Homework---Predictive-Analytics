#Homework 10
#==========================================
#  Slide 39
#==========================================
Cat <- cat_data
attach(cat_data)
library(ggplot2)

ggplot(Cat, aes(y, fill = soil))+geom_histogram(binwidth = 5)

ggplot(Cat, aes(sample = y, col = soil))+geom_qq()

#Y is largest in sandy soil and smallest in clay soil with silty in between.

shapiro.test(y)
wilcox.test(y)

install.packages("e1071")
library(e1071) 
skewness(y)

#==========================================
#  Slide 40
#==========================================
set.seed(1234) #set.seed() will keep your random numbers from
#changing each time you run the code
my_data <- data.frame(name = paste0(rep("M_", 10), 1:10),
                      weight = round(rnorm(10, 20, 2), 1) )
attach((my_data))

head(my_data, n = 10)
summary(my_data)
ggplot(my_data,aes(y = weight))+geom_boxplot()
shapiro.test(weight)
ggplot(my_data,aes(sample = weight))+geom_qq()
res <- t.test(weight,mu = 25)
res


#==========================================
#  Slide 82
#==========================================
attach(scores)

ggplot(scores, aes(x=student,y=pre.score))+geom_boxplot()
ggplot(scores, aes(x=student,y=post.score))+geom_boxplot()
ggplot(scores, aes(x=student,y=pre.score))+geom_histogram(stat = "identity")
ggplot(scores, aes(x=student,y=post.score))+geom_histogram(stat = "identity")
ggplot(scores, aes(sample = pre.score))+geom_qq()
ggplot(scores, aes(sample = post.score))+geom_qq()
#In general it applears that post.score is greater than the pre.score


fligner.test(pre.score,post.score)
t.test(pre.score,post.score)
wilcox.test(pre.score,post.score)
#==========================================
#  Slide 83
#==========================================
attach(drugtesting)

ggplot(drugtesting, aes(Control))+geom_boxplot()
ggplot(drugtesting, aes(Drug))+geom_boxplot()
ggplot(drugtesting, aes(Control))+geom_histogram(binwidth = 2)
ggplot(drugtesting, aes(Drug))+geom_histogram(binwidth = 2)
ggplot(drugtesting, aes(sample = Control))+geom_qq()
ggplot(drugtesting, aes(sample = Drug))+geom_qq()
#In general it appears that those with the drug usually have higher values


fligner.test(Control, Drug)
t.test(Control,Drug)
wilcox.test(Control,Drug)

#==========================================
#  Slide 84
#==========================================
# Data in two numeric vectors
women_weight <- c(38.9, 61.2, 73.3, 21.8, 63.4, 64.6, 48.4, 48.8, 48.5)
men_weight <- c(67.8, 60, 63.4, 76, 89.4, 73.3, 67.3, 61.3, 62.4) # Create a data frame
my_data <- data.frame( group = rep(c("Woman", "Man"), each = 9),
                       weight = c(women_weight, men_weight))

attach(my_data)
ggplot(my_data, aes(y = weight, col = group))+geom_boxplot()
ggplot(my_data, aes(weight, fill = group, alpha = .2))+geom_density()
#It appears that the males typically weigh more than females with the female weight being more distributed.


fligner.test(weight, group)
t.test(weight)
wilcox.test(weight)
#==========================================
#  Slide 91-92
#==========================================
#P(M|D)=.41522
#P(M|A)=.29066
#P(F|D)=.17301
#P(F|A)=.12111

#F(M|D)=141.176
#F(M|A)=98.824
#F(F|D)=58.824
#F(F|A)=41.176


#==========================================
#  Slide 102-103
#==========================================

#true
#true
#true
#D
#C
#true


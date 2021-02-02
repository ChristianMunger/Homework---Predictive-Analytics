#Homework 9
#==========================================
#  Slide 148
#==========================================
(choose(4,2)*choose(10,3))/choose(14,5)
(choose(4,3)*choose(10,2))/choose(14,5)
(choose(4,2)*choose(10,3)+choose(4,3)*choose(10,2)+choose(4,4)*choose(10,1))/choose(14,5)
(choose(4,0)*choose(10,5))/choose(14,5)
#==========================================
#  Slide 157
#==========================================
dmultinom(x = c(5,2,2,1),size = 10,prob = c(0.4,0.2, 0.05,0.01),log = FALSE)

dmultinom(x = c(3,1,1),prob=c(2/9,3/9,4/9))
#==========================================
#  Slide 166
#==========================================
1-ppois(3,2)

exp(-5.4)*((5.4^7)/factorial(7))

1-ppois(5,4.6)
#==========================================
#  Slide 12
#==========================================
Mydata <- c(15, 10, 25, 37, 42, 12, 40, 38, 50, 44)
sort(Mydata)
qqnorm(Mydata)
qqline(Mydata)
#==========================================
#  Slide 21
#==========================================
#TRUE
random_n<-runif(1000)
random_b<-dbeta(random_n,2,3)
random_w<-dweibull(random_n,2,4)
random_d<-dlogis(random_n,3,2)
shapiro.test(random_b)
shapiro.test(random_w)
shapiro.test(random_d)

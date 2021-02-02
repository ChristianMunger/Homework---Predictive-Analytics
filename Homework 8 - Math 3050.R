#Homework 8
#==========================================
#  Slide 53
#==========================================
multiplier <- rpois(10000,lambda = 25)
par(mfrow=c(1,1))
hist(runif(10000)*multiplier,main="")
means <- numeric(10000)
for (i in 1:10000)
{
  means[i] <- mean(runif(5)*10)
}
yHeight<- 1600
hist(means,ylim=c(0, yHeight),main="")
xbar<-mean(means)
xbar
sdbar<-sd(means)
sdbar
seqFrom <-0
seqTo<-10
segInc<-0.1
normheight<-5000
xv <- seq(seqFrom, seqTo, segInc)
yv <- dnorm(xv,mean=4.998581,sd=1.28996)* normheight
lines(xv,yv)
#==========================================
#  Slide 81-82
#==========================================

pchisq(2.34, 6, ncp = 0, lower.tail = TRUE)

pchisq(15.34, 9, ncp = 0, lower.tail = FALSE)

pchisq(6.66, 17, ncp = 0, lower.tail = TRUE)+pchisq(27.34, 17, ncp = 0, lower.tail = FALSE)

pchisq(25.41, 14, ncp = 0, lower.tail = TRUE)-pchisq(5.25, 14, ncp = 0, lower.tail = TRUE)

qchisq(.0333, 5, ncp = 0, lower.tail = TRUE)

qchisq(.125, 25, ncp = 0, lower.tail = FALSE)

qchisq(.75,11,lower.tail = TRUE)
qchisq(.75,11,lower.tail = FALSE)

qchisq(.0333,23,lower.tail = TRUE)
qchisq(.0333,23,lower.tail = FALSE)
#==========================================
#  Slide 99
#==========================================
x <- seq(0,4,.01)
par(mfrow=c(2,2))
y <- dgamma(x,1.12,.5)
plot(x,y,type="l",col="red",main="alpha = 1.12")

#==========================================
#  Slide 139
#==========================================

p <-  .1
n <- 4
x <- 0:n
px <- choose(n,x)*p**x*(1-p)**(n-x)
barplot(px,names=x,xlab="outcome",ylab="probability",col="green")
barplot(pbinom(0:4,4,p),names=0:4,
        xlab="parasitized fish",
        ylab="probability",col="red")

#The red plot represents a cumulative distribution across the sequence, where the green plot shows a standard binomial distribution.
#As p gets closer to 1 the distribution shifts from rightward skewed to leftward skewed on the green plot with a normal distribution at p=.5.
     

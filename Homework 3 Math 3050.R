#===========================================================================
#Homework 3
#===========================================================================
#===========================================================================
#Slide 23
my.age <- as.integer(readline(prompt="Please Enter your Age: "))
 if (my.age < 18)
{
  print("You Are Not a Major. You are Not Eligible to Work.")
  } else if (my.age >= 18 & my.age < 60)
{ 
  print("You are Eligible to Work.Please fill the Application Form and Email to us.")
    }
   if (my.age >= 60)
{
  print("As per the Government Rules, You are too Old to Work.Please Collect your pension!")
     }else print("This Message is from Outside the Nested IF Else Statement")

#===========================================================================
#Slide 24
apple <- c(109.49,109.90,109.11,109.95,111.03,112.12)
 ifelse(apple < 110,"buy the apple stock ","don't buy the apple stock " ) 
  
  
#===========================================================================
#Slide 33

 num = as.integer(readline(prompt="Enter a number: "))
 sum = 0
 len = num
 while(len > 0) {
   digit = len %% 10
   sum = sum + (digit ^ len)
   len = floor(len / 10)
 }
 if(num == sum) {
   print(paste(num, "is an Armstrong number"))
 } else {
   print(paste(num, "is not an Armstrong number"))
 }
 
 
#===========================================================================
#Slide 35
Fibonacci <- function(n) {
  x <- c(0,1)
  while (length(x) < n) {
    position <- length(x)
    new <- x[position] + x[position-1]
    x <- c(x,new)
  }
  return(x)
}
Fibonacci(15)

#==================================================================
#Slide 56
 num = as.integer(readline(prompt="Enter a number: "))
 len <- function(x)
  ndigits <- function(x) nchar(trunc( abs(x) ) )
 cat("the number", num, "has",ndigits(num), "digits.")
 
 
#===========================================================================
#Slide 57
 
 Times <- function()
   
 {
n <- readline(prompt="How many numbers do you want to enter: ")
n <- as.integer(n)
 if (is.na(n)){n <- readnumber()}
Numbers <- c()
for (i in 1:n){
  num <- readline(prompt="Enter an integer: ")
  Numbers[i]<-as.numeric(num)
}
len <- readline(prompt = "What number do you want to check for in the vector?")
x <- sum(Numbers == len)

cat("The number", len, "appears", x, "times in the vector." ) 

}

 Times()
 
#===========================================================================
#Slide 69

x <- rpois(1000, lambda = 10)
table(x)


data(iris) 
attach(iris)
names(iris)
tapply(Sepal.Length, Species, mean)
tapply(Sepal.Width, Species, mean)
tapply(Petal.Length, Species, mean)
tapply(Petal.Width, Species, mean)


data(mtcars)
attach(mtcars)
names(mtcars)
tapply(mpg,list(cyl,vs), median)
tapply(mpg, list(cyl, vs, gear), median)
ftable(tapply(disp, list(cyl, vs, gear, carb), median))

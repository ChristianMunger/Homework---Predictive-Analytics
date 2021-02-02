#Assignment 1 - HW Solutions

#==============================================================
#Bio
#==============================================================

#1. Senior
#2. Mathematics and Statistics
#3. I have knowledge of basic syntax in R 
#   and Python as I have been taking an online  
#   data analytics course through coursera.

#==============================================================
#Topic 1 - Part 1 - Slide 15
#==============================================================
10*3
x <- 5
10*x    
a <- c(1,2,3,4)    
  sqrt(a)
  exp(a)
  log(a)
  min(a)
  max(a)
b<- c(-1,-2,-3,-4)
  a*b
  a-b
  a/b
  b/a
#==============================================================
#Topic 1 - Part 1 - Slide 43
#==============================================================
sequence <- seq(10,50, by = 5)
    sqrt(sequence)
    log(sequence)
    log10(sequence)
    log2(sequence)
#==============================================================
#Topic 1 - Part 1 - Slide 70
#==============================================================
Function <- c("Floor", "Ceiling", "Trunc", "Round")
A <- c(floor(-2.7), ceiling(-2.7), trunc(-2.7), round(-2.7))
B <- c(floor(-0.5), ceiling(-0.5), trunc(-0.5), round(-0.5))
C <- c(floor(0.3), ceiling(0.3), trunc(0.3), round(0.3))
D <- c(floor(1.5), ceiling(1.5), trunc(1.5), round(1.5))
E <- c(floor(2.8), ceiling(2.8), trunc(2.8), round(2.8))
functions <- data.frame(Function, A, B, C, D, E)

#Floor returns the closest integer less than or equal to the number
#Ceiling returns the closest integer greater than or equal to the number
#Trunc drops the decimals and keeps the integer
#Round simply rounds to the greatest integer
    
#==============================================================
#Topic 1 - Part 1 - Slide 71 
#==============================================================

install.packages("readxl")
library("readxl")
install.packages("data.table")
library("data.table")

data <- read.csv("http://apps.fs.fed.us/fiad-bdownloads/CSV/LICHEN_SPECIES_SUMMARY.csv")
data2 <- read.table ("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/cancer.txt", header=T)
data3 <- read.csv('https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv')
head(data)
head(data2)
head(data3)
tail(data)
tail(data2)
tail(data3)
str(data)
str(data2)
str(data3)

#==============================================================
#Topic 1 - Part 1 - Slide 72
#==============================================================

education <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv",stringsAsFactors =FALSE)
colnames(education) <- c("X","State","Region","Urban.Population","Per.Capita.Income","Minor.Population","Education.Expenditures")
View(education)

mean(education$Urban.Population)
mean(education$Per.Capita.Income)
mean(education$Minor.Population)
mean(education$Education.Expenditures)
sd(education$Urban.Population)
sd(education$Per.Capita.Income)
sd(education$Minor.Population)
sd(education$Education.Expenditures)
range(education$Urban.Population)
range(education$Per.Capita.Income)
range(education$Minor.Population)
range(education$Education.Expenditures)

Urban.Population <- c("657.8", "145.0164", "322 909")
print(Urban.Population)
Per.Capita.Income <- c("4675.12", "644.5063", "3448 5889")
print(Per.Capita.Income)
Minor.Population <- c("325.74", "19.42312", "287 386")
print(Minor.Population)
Education.Expenditures <- c("284.6", "61.34014", "208 546")
print(Education.Expenditures)



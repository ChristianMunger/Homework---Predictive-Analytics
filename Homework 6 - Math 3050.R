#Homework 5
#==========================================
#  Slide 12
#==========================================
install.packages("maps")
library(maps)
library(dplyr)
pollution <- avgpm25
NC<-filter(pollution, State.Name=="North Carolina")
NC
map("county", "North Carolina")
with(NC, points(longitude, latitude, pch=16,col=NC$pm25_rounded))
legend("bottomleft",cex = .75, horiz=TRUE, title ="Air Pollution
Levels",legend = paste(unique(NC$pm25_rounded)),
       col = unique(NC$pm25_rounded), pch = 19, bty = "n")

 


#==========================================
#  Slide 54
#==========================================
#Watched videos on youtube.





#==========================================
#  Slide 62
#==========================================
mtcars <- read.csv('https://raw.githubusercontent.com/guru99-edu/R-Programming/master/mtcars.csv', header =TRUE, sep = ',', stringsAsFactors =FALSE)
View(mtcars)
attach(mtcars)

# mpg as a function of cyl across vs types
mtcars$vs <- factor(x = mtcars$vs, labels = c("auto", "manual"))
interaction.plot(x.factor = mtcars$cyl,    
                 trace.factor = mtcars$vs, 
                 response = mtcars$mpg,   
                 fun = median, 
                 type = "l",     
                 ylab = "Miles per gallon (mpg)",
                 xlab = "Cylinders (cyl)",
                 col = c("blue4", "red4"),
                 lty = 1,  # line type
                 lwd = 2,  # line width
                 trace.label = "Transmission",  
                 xpd = FALSE)  


reg1 <- lm(mpg~vs + cyl)
summary(reg1)

reg2 <- lm(mpg~vs * cyl) 
summary (reg2)
#Cylinders and mpg are negatively related for all transmission types.

#disp as a function of cyl across vs types
mtcars$vs <- factor(x = mtcars$vs, labels = c("auto", "manual"))
interaction.plot(x.factor = mtcars$cyl,    
                 trace.factor = mtcars$vs, 
                 response = mtcars$disp,   
                 fun = median, 
                 type = "l",     
                 ylab = "Engine Size",
                 xlab = "Cylinders (cyl)",
                 col = c("blue4", "red4"),
                 lty = 1,  # line type
                 lwd = 2,  # line width
                 trace.label = "Transmission",  
                 xpd = FALSE)  

reg3 <- lm(disp~vs + cyl)
summary(reg3)

reg4 <- lm(disp~vs * cyl) 
summary (reg4)
#Cylinders and engine size are positively related for all transmission types.

#mpg as a function of gear across vs types
mtcars$vs <- factor(x = mtcars$vs, labels = c("auto", "manual"))
interaction.plot(x.factor = mtcars$gear,    
                 trace.factor = mtcars$vs, 
                 response = mtcars$mpg,   
                 fun = median, 
                 type = "l",     
                 ylab = "Miles per gallon (mpg)",
                 xlab = "Gear",
                 col = c("blue4", "red4"),
                 lty = 1,  # line type
                 lwd = 2,  # line width
                 trace.label = "Transmission",  
                 xpd = FALSE)  


reg5 <- lm(mpg~vs + gear)
summary(reg5)

reg6 <- lm(mpg~vs * gear) 
summary (reg6)
#mpg and gears are positively related for manual cars and are not related for automatic cars.

#hp as a function of cyl across am types
mtcars$am <- factor(x = mtcars$am, labels = c("auto", "manual"))
interaction.plot(x.factor = mtcars$cyl,    
                 trace.factor = mtcars$am, 
                 response = mtcars$hp,   
                 fun = median, 
                 type = "l",     
                 ylab = "Horsepower (hp)",
                 xlab = "Cylinders (cyl)",
                 col = c("blue4", "red4"),
                 lty = 1,  # line type
                 lwd = 2,  # line width
                 trace.label = "Transmission",  
                 xpd = FALSE) 


reg7 <- lm(hp~am + cyl)
summary(reg7)

reg8 <- lm(hp~am * cyl) 
summary (reg8)
#hp and cyl are positively related for all transmission types.

#==========================================
#  Slide 63/64
#==========================================
Framingham <- read.csv("http://publicifsv.sund.ku.dk/~tag/Teaching/share/data/Framingham.txt",sep=" ")
View(Framingham)
attach(Framingham)

smoothScatter(DBP,SBP)
plot(DBP, SBP, pch = 19, col = rgb(0, 0, 0, 0.15))
plot(DBP,SBP, pch = 19, col = SEX)
       legend("bottomright", horiz=FALSE, xjust=0, title ="Gender" ,legend = paste(unique(SEX)),
              col = unique(SEX), pch = 19, bty = "n")
#DBP and SBP are positively related. 
   
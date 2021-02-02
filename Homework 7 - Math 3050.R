#Homework 7
#==========================================
#  Slide 78-86
#==========================================
r = getOption("repos")
r["CRAN"] = "http://cran.us.r-project.org"
options(repos = r)
install.packages(c("readxl", "ggplot2", "tidyverse", "choroplethrMaps", "devtools", "dplyr", "yaml", "knitr"))
devtools::install_github("UrbanInstitute/urbnmapr")
library(readxl)
library(ggplot2)
library(tidyverse)
library(devtools)
library(choroplethrMaps)
library(urbnmapr)
library(dplyr)
library(yaml)
library(knitr)

ggplot() +
  geom_polygon(data = urbnmapr::states, mapping = aes(x = long, y = lat, group =
                                                        group), fill = "grey", color = "white") +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45)

data(state.map)
data("state.regions")
data("statedata")
ggplot(state.map, aes(long, lat, group=group)) + geom_polygon()
household_data <- left_join(countydata, counties, by = "county_fips")
household_data %>%
  ggplot(aes(long, lat, group = group, fill = medhhincome)) +
  geom_polygon(color = NA) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "Median Household Income")

state.map.CA <- subset(state.map, region=="california")
ggplot(state.map.CA, aes(long, lat, group=group)) + geom_polygon()
household_data_CA <-subset(household_data, state_abbv=="CA")
household_data_CA %>%
  ggplot(aes(long, lat, group = group, fill = medhhincome)) +
  geom_polygon(color = NA) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  labs(fill = "Median Household Income")

mi_cities <- maps::us.cities %>%
  tbl_df() %>%
  filter(country.etc =="MI") %>%
  select(-country.etc, lon = long) %>%
  arrange(desc(pop))
mi_cities
ggplot(mi_cities, aes(lon, lat)) +
  geom_polygon(aes(group = group), mi_counties, fill = NA, colour = "grey50") +
  geom_point(aes(size = pop), colour = "red") +
  scale_size_area() +
  coord_quickmap()

library(dplyr)
library(maps)
library(ggplot2)
library(gridExtra)
View(ggplot2::midwest)
mi_census <- ggplot2::midwest %>%
  tbl_df() %>%
  filter(state =="MI") %>%
  mutate(county = tolower(county)) %>%
  select(county, area, poptotal, percwhite, percblack)

unique(ggplot2::midwest$state)

census_counties <- left_join(mi_census, mi_counties,
                             by = c("county" ="id"))
census_counties


mi_census <- ggplot2::midwest %>%
  tbl_df() %>%
  filter(state =="MI") %>%
  mutate(county = tolower(county)) %>%
  select(county, area, poptotal, percwhite, percblack)
mi_census
mi_counties <- map_data("county", "michigan") %>%
  select(lon = long, lat, group, id = subregion)
census_counties <- left_join(mi_census, mi_counties, by = c("county" ="id"))
census_counties
p1 <-ggplot(census_counties, aes(lon, lat, group = county)) +
  geom_polygon(aes(fill = poptotal)) +
  coord_quickmap()
p2 <-ggplot(census_counties, aes(lon, lat, group = county)) +
  geom_polygon(aes(fill = percwhite)) +
  coord_quickmap()
grid.arrange(p1, p2, nrow = 2)
#==========================================
#  Slide 97-99
#==========================================
install.packages("gridExtra")
library(gridExtra)
library(ggplot2)
chicago$year <- format(as.POSIXct(chicago$date),"%Y")
attach(chicago)

P1 <- ggplot(chicago, aes(x = year, y = o3tmean2)) +
  geom_bar(stat='identity')
P1
P2 <- ggplot(chicago, aes(x=year,y=no2tmean2)) +
  geom_bar(stat='identity')
P2
grid.arrange(P1, P2)

attach(actor_ages)
ggplot(actor_ages, aes(actor_age, actress_age)) +
  geom_line()
ggplot(actor_ages, aes(actor_age, actor, group = actor)) +
  geom_point() +
  geom_line()
#Richard Gere, Harrison Ford, and Denzel Washington.
age_diff <- cbind(actor_age-actress_age)
ggplot(actor_ages, aes(age_diff, budget, group = age_diff)) +
  geom_point() +
  geom_line()
#A larger budget tends to create a larger gap in ages.
ggplot(actor_ages, aes(actor_race, budget, group = actor)) +
  geom_point() +
  geom_line()
#White actors are usually cast in films with a higher budget.

attach(AutoClaims)
ggplot(AutoClaims, aes(months_as_customer,total_claim_amount))+geom_boxplot()
ggplot(AutoClaims, aes(x=months_as_customer,y=total_claim_amount))+geom_bar(stat="identity")
median(months_as_customer)
#months_as_customer is distributed fairly normally with around 200 months being when the largest total claim amount occurs.

smoothScatter(insured_zip,total_claim_amount)
#Insured_zip cannot be used to predict total_claim_amount.

ggplot(AutoClaims, aes(insured_occupation, total_claim_amount, group = insured_occupation)) +
  geom_point() 
#This shows the distribution of claim amounts per each occupation.  Most occupations tend to have around the same claim amount.  However, exec_management tend to have a slightly higher claim amount that other occupations.

ggplot(AutoClaims, aes(incident_location, total_claim_amount, group = incident_location)) +
  geom_point() 
#No relationship between location and total claim amount.

ggplot(AutoClaims, aes(auto_model, total_claim_amount, group = auto_model)) +
  geom_point() 
ggplot(AutoClaims, aes(x=auto_model,y=total_claim_amount))+geom_bar(stat="identity")
#Larger vehicles like the Ram and Wrangler and vehicles of more expensive makes like Audi have the highest total claim amount. 

ggplot(AutoClaims, aes(x=age,y=total_claim_amount))+geom_bar(stat="identity")
median(age)
#This bar plot is distributed fairly normally with the highest total claim amounts occurring around the median age of 38.

ggplot(AutoClaims, aes(insured_sex, total_claim_amount, group = insured_sex)) +
  geom_boxplot() 
#This distribution shows that females tend to have a higher max total claim amount with the median being similar to males.

ggplot(AutoClaims, aes(insured_hobbies, total_claim_amount, group = insured_hobbies)) +
  geom_boxplot() 
#Aside from base jumping and bungee jumping, more 'dangerous' hobbies such as skydiving, basketball, and paintball tend to have a higher claim amount, while safer hobbies like chess have a lower claim amount.

ggplot(AutoClaims, aes(insured_education_level, total_claim_amount, group = insured_education_level)) +
  geom_boxplot() 
#The median of each education level is fairly similar. However, high school education shows the largest range of total claim amount than all other education levels.

ggplot(AutoClaims, aes(witnesses, total_claim_amount, group = witnesses)) +
  geom_boxplot() 
#The amount of witnesses does not effect the total claim amount.
#==========================================
#  Slide 30
#==========================================
#1.
choose(13,5)/choose(52,5)

(choose(13,3)+choose(13,2))/choose(52,5)

choose(26,5)/choose(52,5)
#2.
perm <- function(n,k){choose(n,k) * factorial(k)}
perm(6,1)+perm(6,2)+perm(6,3)+perm(6,4)+perm(6,5)+perm(6,6)
#Total = 1956
#==========================================
#  Slide 31
#==========================================
perm(49,6)
perm(53,6)


#==========================================
#  Slide 47
#==========================================
qnorm(.95, mean = 100, sd = 15)

random <- rnorm(1000, mean = 100, sd = 15)
hist(random, probability = TRUE)
xy <- seq(min(random), max(random), length=100)
lines(xy, dnorm(xy, mean=100, sd=15))

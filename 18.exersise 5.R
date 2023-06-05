

work <- read.csv("Homework-Data.csv")
head(work)


data_1960 <- work[work$Year == 1960,]
data_2013 <- work[work$Year == 2013,]

#cheack row count
(data_1960)
(data_2013)

#creat additional dataframe
add1960 <- data.frame(code = Country_Code , Life.exp = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(code = Country_Code , Life.exp = Life_Expectancy_At_Birth_2013)

#merge the pair of data frmame
 
merged1960 = merge(data_1960 , add1960 , "Country.code" = "Country.code" , 
                   "Code" = "Code" )
merged2013 = merge(data_2013 , add2013 , "Country.code" = "Country.code" , 
                   "Code" = "Code" )

#cheack new structure

str(merged1960)
str(merged2013)

#drop year

merged1960$Year <- NULL
merged2013$Year <- NULL

#visulaize
library(ggplot2)

# visualize 1960

qplot(data =  merged1960 , x = Fertility.Rate , y = Life.exp,
       color = Region,
       size = I(5),
       alpha= I(0.5),
       title = "Life expectancy vs fretilty(1960)")

#visualizing 2013
qplot(data =  merged2013 , x = Fertility.Rate , y = Life.exp,
      color = Region,
      size = I(5),
      alpha= I(0.5),
      title = "Life expectancy vs fretilty(2013)")




























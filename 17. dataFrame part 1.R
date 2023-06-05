

# select filde
states <- read.csv(file.choose())
states


#method 2

getwd()

setwd() #set working directory

rm(states)

stats <- read.csv("DemographicData.csv")
stats

#--------------------------exploring data

stats

nrow(stats) #no of rows

ncol(stats) #no of column

head(stats, n=10) 

tail(stats, n=6)

str(stats) #stucture of dataframe


summary(stats)


#------- using $ sign
head(stats)
stats[3,3]

stats[3, 'Birth.rate']


stats$Internet.users  #colum exteract

stats$Internet.users[2]

levels(stats$Income.Group)

#--------------------basic oprations with DF

stats[1:10,] #subsetting

stats[c(4,100),] #specific row

#remmeber how [] works

is.data.frame(stats[1,]) #no need to drop=f this is df

is.data.frame(stats[,1]) #answer is false for df is now vw=ector

#to resolve this

is.data.frame(stats[,1,drop=F]) #now this is df

# multioly colums
head(stats)

stats$Birth.rate * stats$Internet.users

stats$Birth.rate + stats$Internet.users

# add colum

head(stats)

stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats


#test

stats$xyz <- 1:5
head(stats)       #its repete only if in multiple of df

# remove a column

head(stats)

stats$MyCalc <- NULL


#-----------------gplot

library(ggplot2)


qplot(data=stats, x=Internet.users)

qplot(data=stats, x=Internet.users, y= Birth.rate, size=4,
      color=I("blue"))


qplot(data=stats, x=Internet.users, y= Birth.rate, geom = 'boxplot')


#-----------visualizing what we nwwd

qplot(data=stats, x=Internet.users, y= Birth.rate)

qplot(data=stats, x=Internet.users, y= Birth.rate, size=I(4))

qplot(data=stats, x=Internet.users, y= Birth.rate, size=I(4),
      color= 'RED')



qplot(data=stats, x=Internet.users, y= Birth.rate, 
      color= Income.Group,size=I(5))

#------------ creating dataframe




mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)


#colnames(mydf) <- c('Country', 'Code', 'Region')

rm(mydf)


mydf <- data.frame(Country = Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
mydf



#------------------ merging


merged <- merge(stats, mydf, by.x= 'Country.Code', by.y = 'Code')

head(merged)

merged$Country <- NULL

#------------------plotting or visulaizing

qplot( x=Internet.users, y= Birth.rate,data=stats, 
       color= region, size=I(5), shape=I(19), alpha=I(0.6)
       , main="birth  rate vs Internet users")

























































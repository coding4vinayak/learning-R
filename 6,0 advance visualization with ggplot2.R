gwtwd()
setwd("F:/programming languages/r studio/data/seaction-6")
getwd()


movies  <- read.csv("Movie-Ratings.csv")

head(movies)

colnames(movies) <- c("Films", "Genre", "CriticRating" , "AudianceRating" 
                      , "BudgetMillons","Year")
head(movies)
str(movies)
summary(movies)



factor(movies$Year)

movies$Year <- factor(movies$Year)  #converting year colum in factor


str(movies)

#--------asthetics

library(ggplot2)

ggplot(data = movies, aes(x=CriticRating, y = AudianceRating )) +
       geom_point()

# add color

ggplot(data = movies, aes(x=CriticRating, y = AudianceRating , 
                          color = Genre , size = Genre , alpha = I(0.5))) + geom_point()


ggplot(data = movies, aes(x=CriticRating, y = AudianceRating , 
      color = Genre , size = BudgetMillons ))+ geom_point()


#------------ plotting with layers


p <- ggplot(data = movies, aes(x=CriticRating, y = AudianceRating , 
                          color = Genre , size =  Genre ))

#geom point
p + geom_point()


# geom lines
p + geom_line()

#both
p + geom_point() + geom_line()

#------------ overiding asthetics

q <- ggplot(data = movies, aes(x=CriticRating, y = AudianceRating , 
                               color = Genre , size =  BudgetMillons))


q + geom_point()

# override aes

q + geom_point(aes(size = CriticRating))


q + geom_point(aes(color = BudgetMillons))



q + geom_point(aes(x = BudgetMillons))

q + geom_point(size = 1) + geom_line(size = 1)

#--------- mapping vs setting

r <- ggplot(data = movies , aes(x = CriticRating, y = AudianceRating))

r + geom_point()
# asd color
r + geom_point(aes(color= Genre))

# settings
r + geom_point(color = "DarkGreen") #not usin aes confusing eha

# 1 . Mapping   (use aes for mapping)
r + geom_point(aes(size = BudgetMillons))

# 2. setting (dont use aes for setting)
r + geom_point(size=6)
#error
r + geom_point(aes(size =6)) # this 6 size is differant in aes

#------------------ histogram and density chart

s <- ggplot(data = movies, aes(x = BudgetMillons))

s + geom_histogram(binwidth = 10)

# add color

s + geom_histogram(binwidth = 10, aes(fill = Genre))

# add a border

s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")

# improve
s + geom_density(aes(fill = Genre))

s + geom_density(aes(fill = Genre), position = "stack")

#-------- starting layer tips

t <- ggplot(data = movies, aes(x = AudianceRating))
t + geom_histogram(bandwith = 10,
                   fill = "white", color = "Blue")


# another way 
t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10,aes(x = AudianceRating),
                   fill = "white", color = "Blue")

# chart 4 
t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10,aes(x = CriticRating),
                   fill = "white", color = "Blue")


#chart 5

t <- ggplot()

#----------- statitical transformation

u <- ggplot(data = movies , aes(x = CriticRating, y = AudianceRating, 
                                color = Genre ))

u + geom_point() + geom_smooth(fill = NA)

# boxplot

u <- ggplot(data = movies , aes(x = Genre, y = AudianceRating, 
                                color = Genre ))

u + geom_boxplot(size = 1.2)

u + geom_boxplot(size = 1.2) + geom_point()

# tip

u + geom_boxplot(size = 1.2) + geom_jitter()

# another way
 u + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)

# -------------- using facet
v <- ggplot(data= movies, aes(x = BudgetMillons))
v + geom_histogram(binwidth = 10 , aes(fill= Genre),
                   color = "Black")

# facets


v + geom_histogram(binwidth = 10 , aes(fill= Genre),
                   color = "Black") +
  facet_grid(Genre~., scales = "free")


# scatterplots


w <-  ggplot(data = movies , aes(x = CriticRating, y = AudianceRating, 
                                     color = Genre ))

w + geom_point(size = 3)

# facets
w + geom_point(size = 3) +
  facet_grid(Genre~.)

w + geom_point(size = 3) +
  facet_grid(.~Year)

w + geom_point(size = 3) +
  facet_grid(Genre~Year)

w + geom_point(size = 1) +
  geom_smooth()+
  facet_grid(Genre~Year)

w + geom_point(size = ) +
  geom_smooth()+
  facet_grid(Genre~Year)

# chart 1 \
#-----------------coordinates


m <- ggplot(data = movies , aes(x = CriticRating,y = AudianceRating,
            size = BudgetMillons , colour = Genre))
m + geom_point()


m + geom_point() +
  xlim(50 , 100) +
  ylim(50, 100)

# wont work all the time


n <- ggplot(data= movies, aes(x = BudgetMillons))
n + geom_histogram(binwidth = 10, aes(fill = Genre ) , color = "Black")


n + geom_histogram(binwidth = 10, aes(fill = Genre ) , color = "Black")+
      ylim(0,50)


# insted zoom
n + geom_histogram(binwidth = 10, aes(fill = Genre ) , color = "Black")+
  coord_cartesian(ylim = c(0,50))


# improve chart 1


w + geom_point(aes(size = BudgetMillons)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))


#--------- theam


o <- ggplot(data = movies, aes(x = BudgetMillons))
h <- o + geom_histogram(binwidth = 10 , aes(fill= Genre),
                   color = "Black")


# axis labels

h + xlab("Money Axis") + ylab("Number of movies")

# label formating'

h + xlab("Money Axis") + ylab("Number of movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
                                    size = 20,),
        axis.title.y = element_text(colour = "Red", size = 20))
  
# tick mark formating
h + xlab("Money Axis") + ylab("Number of movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
                                    size = 20,),
        axis.title.y = element_text(colour = "Red", size = 20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))


# legend formating
h + xlab("Money Axis") + ylab("Number of movies") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
                                    size = 20,),
        axis.title.y = element_text(colour = "Red", size = 20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 20),
        legend.position = c(1, 1),
        legend.justification = c(1,1))


# title of plot

h + xlab("Money Axis") + ylab("Number of movies") +
  ggtitle("Movies Budget Distribution") +
  theme(axis.title.x = element_text(colour = "DarkGreen",
                                    size = 20,),
        axis.title.y = element_text(colour = "Red", size = 20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 10),
        legend.position = c(1, 1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour =  "DarkBlue",
                                  size = 20,
                                  family = "Courier"))























































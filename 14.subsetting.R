# subsetting of metrix

Games
Games[1:3, 6:10]


Games[c(1,10),]
Games[,c('2008','2009')]

#problem in subsetting

Games[1,]

is.matrix(Games[1,])
is.vector(Games[1,])


Games[1,,drop=F]













Games

data <- MinutesPlayed[1,, drop=F]
matplot(t(data), type = 'b', pch = 15:18, col=c(1:4,6))
legend('bottomleft', inset = 0.01, legend = Players[1],pch = 10:12, col=c(1:4,6),
       horiz = F,par(mar=c(1,1,1,1)) )

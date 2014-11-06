drops.men = read.csv("/Users/hallmank/Desktop/drops_m");
drops.women = read.csv("/Users/hallmank/Desktop/drops_f");
drops.men = subset(drops.men,drops.men$Percent < 1.5);
drops.women = subset(drops.women,drops.women$Percent < 1.5);
drops.men.D1=subset(drops.men,drops.men$Division=="D1");
drops.men.D2=subset(drops.men,drops.men$Division=="D2");
drops.men.D3=subset(drops.men,drops.men$Division=="D3");
drops.women.D1=subset(drops.women,drops.women$Division== "D1");
drops.women.D2=subset(drops.women,drops.women$Division=="D2");
drops.women.D3=subset(drops.women,drops.women$Division=="D3");

#d3line=lm(drops.men.D3$Drop ~ drops.men.D3$Percent);
#d2line=lm(drops.men.D2$Drop ~ drops.men.D2$Percent);
#d1line=lm(drops.men.D1$Drop ~ drops.men.D1$Percent);

#d1womenline=lm(drops.women.D1$Drop ~ drops.women.D1$Percent);
#d2womenline=lm(drops.women.D2$Drop ~ drops.women.D2$Percent);
#d3womenline=lm(drops.women.D3$Drop ~ drops.women.D3$Percent);

#plot(drops.women.D1$Percent,drops.women.D1$Drop,col="blue",pch=1,xlab="Percent of top time in event",ylab="Percent drop");points(drops.women.D3$Percent,drops.women.D3$Drop,col="red",pch=1);points(drops.women.D2$Percent,drops.women.D2$Drop,col="green",pch=1);abline(d1line,col="blue");abline(d3line,col="red");abline(d2line,col="green");

drops.women.ordered = drops.women[order(drops.women$Percent),];
drops.men.ordered = drops.men[order(drops.men$Percent),];

#w.top = Reduce(rbind,by(drops.women.ordered,drops.women.ordered$Team,head,n=20));
#w.bot = Reduce(rbind,by(drops.women.ordered,drops.women.ordered$Team,tail,n=20));

#m.top = Reduce(rbind,by(drops.men.ordered,drops.men.ordered$Team,head,n=20));
#m.bot = Reduce(rbind,by(drops.men.ordered,drops.men.ordered$Team,tail,n=20));

#t.test(w.top$Drop,w.bot$Drop);
#t.test(m.top$Drop,m.bot$Drop);

#Team speeds
speed.women = aggregate(drops.women.D3$Percent ~ drops.women.D3$Team,FUN=mean)
names(speed.women)=c("Team","Percent")
speed.women$Drop = aggregate(drops.women$Drop ~ drops.women$Team,FUN=mean)[,2]
speed.women = subset(speed.women,abs(speed.women$Drop) < .02)
plot(speed.women$Percent,speed.women$Drop,pch=20,xlab="Team Average Percent of Top Time",ylab="Percentage Drop");abline(lm(speed.men$Drop ~ speed.men$Percent));text(speed.women$Percent,speed.women$Drop,labels=speed.women$Team,cex=0.6, pos=4)

              ############ APPLIED STATISTICS -> EXERCISE 2 (continuation of Exercise 1) ############

############################################################
rm(list = ls()) # rm() -----> remove objects; ls() -----> list of all objects

                                              ### Задача 2 ### 
# Генерирайте 1000 проявления на случайната величина Z с плътност f_Z(x)=f_X(x)*99/100+f_Y(x)*1/100, 
# където f_X(x) и f_Y(x) са плътностите съответно на X~N(1,4) и Y~N(100,9). Има ли несъгласувани 
# наблюдения в получената извадка? Намерете ги и обяснете причината за наличието им.
p=runif(1000,0,1)>99/100;
simData=rnorm(1000,1+(100-1)*p,sqrt(4)+(sqrt(9)-sqrt(4))*p)
any(abs((simData-median(simData)))>3*mad(simData))  
simData[which(abs((simData-median(simData)))>3*mad(simData))]
              
              

                                           ### Functions ###

mean.and.sd <- function(x){
  av <- mean(x)
  sdev <- sd(x)
  return(c(mean=av, SD=sdev))
}
uniData<-runif(1000,min = 0,max = 1)  # runif - генерира равномерно разпределени сл.в.
1/2; sqrt(1/12)
mean.and.sd(uniData)


norm.contaminated.sample <-function(mu1,sigma1,mu2=0,sigma2=1,proportion=1/2,size=1){
  p=runif(size,0,1)>proportion;
  return(rnorm(size,mu1+(mu2-mu1)*p,sigma1+(sigma2-sigma1)*p))
}
norm.contaminated.sample(100,1,proportion=1/5,size=20)
####################################################################################################

                                            ### Задача 3 ###
# Напишете функция rand.Circle(), която да генерира n на брой равномерно разпределени точки от кръг  
# с център (x_0,y_0) и радиус r. Използвайте функцията plot() за да изобразите резултата от изпълнението 
# на функцията rand.Circle().

# Hint: Използвайте полярното представяне на точките от кръга:
# x=x_0+r*cos(theta)
# y=y_0+r*sin(theta)
rand.Circle <- function(n,x_0,y_0,r){
  theta = 2*pi*runif(n,0,1);
  R = r*sqrt(runif(n,0,1));
  x = x_0 + R*cos(theta);
  y = y_0 + R*sin(theta);
  return(cbind(x,y))
}
plot(rand.Circle(10000,0,0,4),asp=1)


                  ### if, else, for, repeat, while, break, next ###
# if Statement
a<-sample((-100):100,1)
if (a>0) print(paste("Числото",a,"е положително!",sep = " "))

# if () {} else {}
a<-sample(100:1000,1)
b=2
deliSe=paste("Числото",a,"се дели на",b,"!",sep = " ")
neSeDeli=paste("Числото",a,"не се дели на",b,"!",sep = " ")

if (a%%b==0) { print(deliSe) 
} else {print(neSeDeli)}

#ifelse()
ifelse(a%%b, neSeDeli, deliSe)

# for(... in ...){}
n=30
for (i in 1:n){
  a<-sample(100:1000,1)
  if (a%%2==0 & a%%3==0) print(paste("Числото",a,"се дели на 6!",sep = " "))
}

# repeat + break
a=1
repeat {
  print(a)
  a=a+1
  if (a==10){
    break
  }
}

# while
a=1
while (a<10){
  print(a)
  a=a+1
}

# next
for(i in 1:10){
  if(i%%2==0) { print(i)
  } else next
}

                                                    ### Задача 4 ###
# Пресметнете вероятността в група от 23 човека да има поне двама, които имат рожден ден на една и
# съща дата от годината. Намерете приближение на тази вероятност като направите 10000 симулации на
# този експеримент.

p.comp=1;
for (i in 1:23){
  p.comp=p.comp*(366-i)/365;
}
(p=1-p.comp)
# Alternative way
{
  p.comp=(366-1:23)/365;
  (p=1-prod(p.comp))
}

single.Sim <- function(n){
  group.Sim=as.integer(runif(n,1,366))
  return(any(duplicated(group.Sim)))
}

count=0;
for (i in 1:10000){
  count=count+single.Sim(23);
}
(p.approx=count/10000)
# Alternative way
{
  sum(sapply(rep(23,10000),single.Sim))/10000
}
####################################################################################################

                                                ### Задача 5.1 ###
# Напишете функция square.approx.Pi(), която да дава оценка на числото Пи, базирана на вероятността
# случайно избрана точка от единичния квадрат да е в единичния кръг. Нека аргумент на функцията е 
# trials - брой на генерираните точки от единичния квадрат.
square.approx.Pi<- function(trials){
  x=runif(trials,min = -1,max = 1);
  y=runif(trials,min = -1,max = 1);
  return(4*sum(sqrt(x^2+y^2)<=1)/trials);
}

square.approx.Pi(10000)

                                                  ### Задача 5.2 ###
# Направете 10000 оценки на числото Пи, като използвате функцията square.approx.Pi() 
# с аргумент trials=100. Съхранете полученият резултат във вектор approx.Pi и за него 
# намерете най-малкия елемент, най-големия елемент, средноаритметичното, медианата,
# стандартното отклонение, първия и третия квартил. Сравнете получените оценки за 
# очакване и дисперсия с теоретичните. Като използвате ЦГТ, постройте 95% доверителен интервал
# за очакването на approx.Pi.
n=10000
trials=100

approx.Pi=numeric(n);
for(i in 1:n){
  approx.Pi[i]=square.approx.Pi(trials);
}
# Alternative way
{
  approx.Pi=sapply(rep(trials,n),square.approx.Pi)
} 

min(approx.Pi)
max(approx.Pi)
mean(approx.Pi)
pi # Theoretical mean
median(approx.Pi)
sd(approx.Pi)
sqrt(pi*(4-pi)/trials) # Theoretical standard deviation
summary(approx.Pi)

alpha=0.05
th.limits=c(lower.bound=qnorm(alpha/2,mean=pi,sd=sqrt(pi*(4-pi)/trials),lower.tail = TRUE),
           upper.bound=qnorm(alpha/2,mean=pi,sd=sqrt(pi*(4-pi)/trials),lower.tail = FALSE))
th.limits

emp.limits=c(lower.bound=qnorm(alpha/2,mean=mean(approx.Pi),sd=sd(approx.Pi),lower.tail = TRUE),
            upper.bound=qnorm(alpha/2,mean=mean(approx.Pi),sd=sd(approx.Pi),lower.tail = FALSE))
emp.limits

boxplot(approx.Pi)
hist(approx.Pi,probability = TRUE)
abline(v=emp.limits,col=3,lty=2,lwd=2)
# Arguments(colors, styles and ect.) for points and lines
{
?par
?points
plot(1:25,pch=1:25,cex=seq(3,1,length.out = 25))
abline(v=1:10,lty=1:10,col=c(1:8,rgb(0.5,0.5,0.5),rgb(165/255,75/255,165/255)),lwd=10:1)
}
####################################################################################################

                                            ### Задача 6 ###
# Като използвате функцията norm.contaminated.sample(), генерирайте 100 проявления на случайната 
# величина Z с плътност f_Z(x)=f_X(x)*3/4+f_Y(x)*1/4, където f_X(x) и f_Y(x) са плътностите 
# съответно на X~N(0,1) и Y~N(4,1). Постройте boxplot и хистограма на получените данни. Можем ли
# да приемем нулевата хипотеза, че данните са нормално разпледелени с очакване 1 при ниво на съгласие
# alpha=0.05? Каква е стойността на p-value на статистиката? Нормално ли са разпределени данните?
data=norm.contaminated.sample(0,1,4,1,proportion=3/4,size=100)
boxplot(data,col = "lightgrey",outcol="red", outlwd=2)
d=density(data,bw="SJ")
h=hist(data,prob=TRUE)
lines(d,col='blue',lwd=2)
curve(dnorm(x, mean=mean(data), sd=sd(data)), add=TRUE, col=2,lwd=2)
(mu=mean(data))
(sd=sd(data))
mean.and.sd(data)
(tStat=sqrt(100)*(mu-1)/sd)
alpha=0.05;
(criticalValue=abs(qt(alpha/2,100-1)))
(p_value=2*pt(abs(tStat),df=99,lower.tail=FALSE))

t.test(data, mu=1)
shapiro.test(data)
ks.test(data,"pnorm")



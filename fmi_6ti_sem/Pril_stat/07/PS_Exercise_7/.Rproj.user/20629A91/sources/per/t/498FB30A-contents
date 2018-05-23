           ######### APPLIED STATISTICS -> EXERCISE 7 (continuation of Exercise 6) #######


#####################################################################################################
library(MASS)
rm(list=ls())
str(Boston)
??Boston
edit(Boston)
attach(Boston)
lm.fit=lm(medv~lstat)
lm.fit
summary(lm.fit)
plot(lstat,medv)
par(mfrow=c(2,2))
plot(lm.fit)
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
par(mfrow=c(1,1))
which.max(hatvalues(lm.fit))

# Non-linear transform
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
lm.fit=lm(medv~lstat)
anova(lm.fit,lm.fit2)
par(mfrow=c(1,1))
plot(lm.fit2)
lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)
summary(lm(medv~log(rm)))
detach(Boston)

###################################################################################################
rm(list=ls())                   
library(readxl)
path = "Data/Cars_raw.xls"
read_excel(path,sheet=1)
dataM=as.data.frame(read_excel(path,sheet=2)) # data for modelling
dataP=as.data.frame(read_excel(path,sheet=3)) # data for predictions
str(dataM)
str(dataP)
                                            #### Задача 2 ####
# Като изплозвате данните 'dataM' по-горе, конструирайте и изследвайте прост линеен модел за
# предсказване на цената на автомобил втора употреба 'Y' на база на най-подходящата променлива 'X'. 
# Какви изводи може да направите?

# Correlation table
corTable=cor(dataM)
# test=cor.test(dataM[,1],dataM[,2])
# str(test)
getCor <- function(x){
  a=cor.test(dataM[,1],dataM[,x])
  return(c(est=a$estimate,pValue=a$p.value))
}
ind=2:length(dataM)
corVector=sapply(ind,getCor)
corVector
colnames(corVector)=mapply(paste,"X",ind-1,sep="")

# Data preparation
ord_index=order(corVector[2,])
corVector[,ord_index]
dataM[,length(dataM)+1]=dataM[,ord_index[1]+1]
names(dataM)[length(dataM)]=paste("X")
str(dataM)

# Model 1 + Scatter plot + Confidence and prediction lines
model1=lm(Y ~ X,data = dataM)
minX=floor(min(dataM$X))
maxX=floor(max(dataM$X))+1
predData <- data.frame(X=minX:maxX)
pp <- predict(model1, int="p", newdata=predData,level=0.95)
pc <- predict(model1, int="c", newdata=predData)
plot(dataM$X, dataM$Y, xlim=range(dataM$X),
     ylim=range(dataM$Y, pp, na.rm=T),pch=21,cex=1.5,bg=rgb(1/3,1/3,1/3))
abline(model1, col=rgb(220/255,0,0), lwd=3)
matlines(predData, pc[,2:3], lty=c(2,2),col=rgb(0,1/2,0),lwd=c(2,2))
matlines(predData, pp[,2:3], lty=c(3,3),col=rgb(0,0,0),lwd=c(2,2))
legend('topright',
       legend = c('Regression line','Confidence lines','Prediction lines'),
       col=c(rgb(220/255,0,0),rgb(0,1/2,0),rgb(0,0,0)),lty=c(1,2,3),lwd=c(3,2,2))


summary(model1)
se=sqrt(deviance(model1)/df.residual(model1))
se                  # standard error
rse=se/mean(dataM$Y)
rse                 # realtive standard error

plot(model1)
shapiro.test(residuals(model1))
ks.test(residuals(model1),"pnorm",mean=0,sd=se)

                              ### Bartlett test for heteroscedasticity ###
dataM[,length(dataM)+1]=as.factor(dataM$X>median(dataM$X))
names(dataM)[length(dataM)]=paste("X_Groups")
levels(dataM[,length(dataM)])=c("Group 1","Group 2")
str(dataM)
lmg1=lm(Y~X,data = dataM, subset = which(dataM$X_Groups=="Group 1"))
lmg2=lm(Y~X,data = dataM, subset = which(dataM$X_Groups=="Group 2"))
bartlett_stat=deviance(lmg1)/deviance(lmg2)
if(bartlett_stat>1){
  bartlett_p.value=pf(bartlett_stat, df.residual(lmg1), df.residual(lmg2), lower.tail = FALSE)
} else{
  bartlett_p.value=pf(1/bartlett_stat, df.residual(lmg2), df.residual(lmg1), lower.tail = FALSE)}
c("Stat"=bartlett_stat,"p.value"=bartlett_p.value)
#####################################################################################################

set.seed(1)
x1=runif(100)
x2=0.5*x1+rnorm(100)/10
y=2+2*x1+0.3*x2+rnorm(100)
                                            #### Задача 3 ####
# Намерете корелацията между х1 и х2 и начертайте scatterplot, за да изобразите връзката между двете
# променливи. Значими ли са коефициентите пред х1 и х2 в модела y~x1+x2 ? А в моделите y~x1 и y~x2?
# Обяснете получените резултати.

set.seed(1)
cor.test(x1,x2)








####################################################################################################
rm(list=ls())                   
library(readxl)
read_excel("Data\\Cars_raw.xls",sheet=1)
dataM=as.data.frame(read_excel("Data\\Cars_raw.xls",sheet=2)) # data for modelling
corTable=cor(dataM)

model2=lm(Y~X2+X4,data = dataM)
summary(model2)

QMC_X10=lm(X10~X2+X4,data = dataM)
summary(QMC_X10)
model3=lm(Y~X2+X4+X10,data = dataM)
summary(model3)

QMC_X1=lm(X1~X2+X4+X10,data = dataM)
summary(QMC_X1)
model4=lm(Y~X2+X4+X10+X1,data = dataM)
summary(model4)

QMC_X3=lm(X3~X2+X4+X10,data = dataM)
summary(QMC_X3)
model5=lm(Y~X2+X4+X10+X3,data = dataM)
summary(model5)

QMC_X5=lm(X5~X2+X4+X10+X3,data = dataM)
summary(QMC_X5)
model6=lm(Y~X2+X4+X10+X3+X5,data = dataM)
summary(model6)

QMC_X8=lm(X8~X2+X4+X10+X3+X5,data = dataM)
summary(QMC_X8)
model7=lm(Y~X2+X4+X10+X3+X5+X8,data = dataM)
summary(model7)

QMC_X7=lm(X7~X2+X4+X10+X3+X5,data = dataM)
summary(QMC_X7)

QMC_X9=lm(X9~X2+X4+X10+X3+X5,data = dataM)
summary(QMC_X9)
model8=lm(Y~X2+X4+X10+X3+X5+X9,data = dataM)
summary(model8)

QMC_X6=lm(X6~X2+X4+X10+X3+X5+X9,data = dataM)
summary(QMC_X6)
model9=lm(Y~X2+X4+X10+X3+X5+X9+X6,data = dataM)
summary(model9)

model=lm(Y~X2+X4+X10+X3+X5+X9,data = dataM)
summary(model)



                             ######### APPLIED STATISTICS -> EXERCISE 10 #######


rm(list=ls())                       ### Linear Discriminant Analysis ###  
                  
                                        # Simulated example of LDA #
# install.packages("MASS")
library("MASS")

# generate data
set.seed(1)

groupN=100 # number of cases per group
group1x=rnorm(n = groupN, mean = 0, sd = 4)
group1y=rnorm(n = groupN, mean = 0, sd = 4)
group2x=rnorm(n = groupN, mean = 10, sd = 5)
group2y=rnorm(n = groupN, mean = 10, sd = 5)

group1=data.frame(x = group1x, y = group1y, group = "A")
group2=data.frame(x = group2x, y = group2y, group = "B")
simData=rbind(group1, group2)

# LDA
simModel=lda(group ~ x + y, data = simData)
simModel
plot(simModel)

#scatterplot
plot(simData[,1:2], col = simData[,3])
points(simModel$means, pch = "+", cex = 3, col = c("black", "red"))

# draw discrimination line
predN=1000
newDataX <- seq(from = min(simData$x), to = max(simData$x), length.out = predN)
newDataY <- seq(from = min(simData$y), to = max(simData$y), length.out = predN)
newData <- expand.grid(x = newDataX, y = newDataY)
predData <- as.numeric(predict(simModel, newdata = newData)$class)
contour(x = newDataX, y = newDataY, z = matrix(predData, nrow = predN, ncol = predN), 
        levels = c(1, 2), add = TRUE, drawlabels = FALSE)

                                          # The Stock Market Data #
# install.packages("ISLR")
library(ISLR)

str(Smarket)
?Smarket
edit(Smarket)
summary(Smarket)
plot(Smarket)
cor(Smarket) # WRONG! -> Factor variable
cor(Smarket[,-9])
plot(Smarket$Volume)
                                              ### LDA for Smarket ###

attach(Smarket)
train=(Year<2005)
Smarket2005=Smarket[!train,]
Direction2005=Direction[!train]

ldaModel=lda(Direction~Lag1+Lag2,data=Smarket,subset=train)
ldaModel
summary(ldaModel)
plot(ldaModel)
plot(x=Lag1,y=Lag2, col = Direction)
points(ldaModel$means, pch = "+", cex = 3, col = c("black", "red"))

ldaPred=predict(ldaModel, Smarket[train,])
ldaClass=ldaPred$class
table(ldaClass,Direction[train])

ldaPred2005=predict(ldaModel, Smarket2005)
names(ldaPred2005)
str(ldaPred2005)

ldaClass2005=ldaPred2005$class
table(ldaClass2005,Direction2005)
mean(ldaClass==Direction2005)

sum(ldaPred2005$posterior[,1]>=.5)
sum(ldaPred2005$posterior[,1]<.5)
ldaPred2005$posterior[1:20,1]
ldaClass2005[1:20]
sum(ldaPred2005$posterior[,1]>.7)
summary(ldaPred2005$posterior)
detach(Smarket)

                                                  ### IRIS dataset ###
# install.packages("MASS")
library("MASS")
data("iris")
str(iris)
boxplot(iris[which(iris$Species=="setosa"),1:4])
boxplot(iris[which(iris$Species=="versicolor"),1:4])
boxplot(iris[which(iris$Species=="virginica"),1:4])
model1=lda(Species~.,data=iris)
model1

model2=lda(Species~Sepal.Length+Sepal.Width,data=iris)
model2
#scatterplot
plot(x=iris$Sepal.Length,iris$Sepal.Width, col = iris$Species)
points(model2$means, pch = "+", cex = 3, col = c(1,2,3))

# draw discrimination line
predN=1000
newDataX <- seq(from = min(iris$Sepal.Length), to = max(iris$Sepal.Length), length.out = predN)
newDataY <- seq(from = min(iris$Sepal.Width), to = max(iris$Sepal.Width), length.out = predN)
newData <- expand.grid(Sepal.Length = newDataX, Sepal.Width = newDataY)
predData <- as.numeric(predict(model2, newdata = newData)$class)
contour(x = newDataX, y = newDataY, z = matrix(predData, nrow = predN, ncol = predN), 
        levels = c(1,2,3), add = TRUE, drawlabels = FALSE)

                                                      #### Задача 1 ####
# Като изплозвате данните 'Default' от пакета 'ISLR', конструирайте линеен дискриминантен модел за
# предсказване на променливата 'default'. Какви изводи може да нправите?
rm(list=ls())                       ### Linear Discriminant Analysis ###  

library("ISLR")
data("Default")
str(Default)

# Convert str to 1s and 2s
Default$student = as.numeric(Default$student)
Default$default = as.numeric(Default$default)

plot(default~student,data=Default)
plot(default~balance,data=Default)
plot(default~income,data=Default)

#Split data
smp_size <- floor(0.9 * nrow(Default))
train_ind <- sample(seq_len(nrow(Default)), size = smp_size)

df_train = Default[train_ind,]
df_test = Default[-train_ind,]

# ne e dobra praktika
cor(Default)

# corelaciqta e dobra mqrka za neprekusnati
df_train_1 = df_train[df_train$default==1,]
df_train_2 = df_train[df_train$default==2,]
ks.test(df_train_1$balance, "pnorm", mean(df_train_1$balance), sd(df_train_1$balance))

shapiro.test(df_train_2$balance)

# VAPROS: Kak opredelqme koi feature-i sa vajni i koi ne sa?
lda_model_1 = lda(default~student+balance+income, data=df_train)
lda_model_no_income = lda(default~student+balance, data=df_train)
lda_model_no_student = lda(default~income+balance, data=df_train)

# Kakvo pravi tova vsushtnost? Tozi plot
plot(x=df_train$income, y=df_train$balance, col=df_train$default)
points(lda_model_no_student$means, pch = "+", cex = 2, col = c(3,4))

plot(x=df_train$student, y=df_train$balance, col=df_train$default)

#Make predictions fore train set
train_predict = predict(lda_model_no_income, df_train)

#Make predictions fore test set
test_predict_no_income=predict(lda_model_no_income, df_test)
test_predict_no_student=predict(lda_model_no_student, df_test)

test_predict_output=test_predict$class
train_predict_output=train_predict$class

# kolonite otgovarqt za prediction-a ili redovete otgovarqt predictiona?
table(test_predict_output,df_test$default)

# tuka trqbva s test/train set-a
# kakvo pravi tova po- dolu ?!
mean(train_predict_output==df_test$default)
mean(train_predict_output==df_train$default)

# kakvo e posterior
# kakvo pravim tuka ?
sum(test_predict$posterior[,1]>=.5)
sum(test_predict$posterior[,1]<.5)
test_predict$posterior[1:20,1]
test_predict[1:20]
sum(ltest_predict$posterior[,1]>.7)
summary(test_predict$posterior)

# plot test and result
plot(x=df_test$student,df_test$balance, col=df_test$default)
points(lda_model_no_income$means, pch = "+", cex = 3, col = c("black", "red"))


predN = nrow(df_test)
# kakvo burkam tuka
contour(x = df_test$student, y = df_test$balance, z = matrix(test_predict_output, nrow = predN, ncol = predN), 
        levels = c(1, 2), add = TRUE, drawlabels = FALSE)

# 
# # draw discrimination line
# predN=1000
# newDataX <- seq(from = min(simData$x), to = max(simData$x), length.out = predN)
# newDataY <- seq(from = min(simData$y), to = max(simData$y), length.out = predN)
# newData <- expand.grid(x = newDataX, y = newDataY)
# predData <- as.numeric(predict(simModel, newdata = newData)$class)
# contour(x = newDataX, y = newDataY, z = matrix(predData, nrow = predN, ncol = predN), 
#         levels = c(1, 2), add = TRUE, drawlabels = FALSE)
# 
# 

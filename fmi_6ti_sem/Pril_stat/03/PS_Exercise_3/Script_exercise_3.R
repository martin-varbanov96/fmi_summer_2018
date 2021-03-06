                       ############ APPLIED STATISTICS -> EXERCISE 3 ############

rm(list=ls())                                ### Задача 1 ###
# Напишете функция, която връща доверителен интервал (lowerBound и upperBound) с ниво 
# confLevel (с default value 0.95) за средното на извадка x. Като изполвате функцията 
# missing(), конструирайте функцията така, че да използва нормално разпределение или
# Student разпределение според входните аргументи. Направете проверка за входната стойност 
# на аргумета confLevel.

norm.contaminated.sample <-function(x, confLevel=0.95){
  x_new = data.frame()
  sd_x_old = sd(x)
  mean_x_old = mean(x)
  for(el in x){
    x_tmp = data.frame((mean_x_old - el)/sd_x_old)  
    x_new = rbind(x_new, x_tmp)
  }
  return x_new
}

meanCI = function(x,sigma=sd(x),confLevel=0.95){
  if(confLevel >= 1 || confLevel < 0){
    return("Value of ConfLevel is inadequate")
  }
  else{
    n = length(x)
    meanX=mean(x)
    alpha = 1 -confLevel
    se=sigma/sqrt(n)
  }
}     
                                                             

                                            ##### Matrix #####
m1<-matrix(1,nrow=2,ncol=3)
(m2<-matrix(c(1,2,3),nrow=2,ncol=3))
dim(m2)
m1+m2
1+m2

(m3<-matrix(1:6,ncol=3))
c(1,2)*m3
m3*c(1,2)
c(1,2,3)*m3

c(1,2)%*%m3

t(m1)
t(m1)%*%m1
m22<-t(m2)%*%m2
m22[1,3]<-99
solve(m22)
m22[2,]
m22[c(1,2),c(1,3)]
m22[-c(1,2),-c(1)]

(m4<-matrix(c(1,2,3),nrow=3,ncol=3))
m4[2,1]<-4
m4[,1]
diag(m4)<-5

n<-4
(m<-matrix(1:n,nrow=n,ncol=n))

cbind(m,m)
rbind(m,m)
colSums(m)
rowSums(m)

                                      ### Data frames ###
v1<-1:10
v2<-seq(0,1,length=10)
v3<-letters[1:10]
d1<-data.frame(vector1=v1,vector2=v2,ABC=v3)
str(d1)
d1$ABC
d1$binary <-c(rep(TRUE,times=5),rep(FALSE,times=5))

d2<-data.frame(vector1=v1,ABC=v3,stringsAsFactors =FALSE)
d2$factor<-as.factor(rep(c("male","female"),times=5))
str(d2)

                                      # mtcars dataset
data(mtcars)
mtcars
head(mtcars)
edit(mtcars)
str(mtcars)
colnames(mtcars)[1:5]
rownames(mtcars)[1:5]
mtcars$mpg
mtcars[,1]
mtcars[1,]

                                    #### Import/Export ####

edit(mtcars)
data()
data("longley")
edit(longley)

save(mtcars,file = "Data/testData1.rda")
save(mtcars,iris,file = "Data/testData2.rda")
rm(list=ls())
load("Data/testData2.rda")
ls()
list.files()
file.path("Data/testData2.rda")

install.packages("data.table")        # install package
installed.packages()                  # installed packages
update.packages()                     # keep up to date all packages
library(data.table)                   # load package 
require(data.table)                   # load package 
?data.table                           # read
?fread                                # read

write.table(mtcars,file = "Data/mmtcars.txt", row.names = FALSE)
df <- read.table("Data/mmtcars.txt")

write.csv(women,"Data/wData.csv")
read.csv("Data/wData.csv")

x<-read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt")
x
str(x)
nrow(x)
ncol(x)
colnames(x)<-c("Var1", "Var2","Var3") 
rownames(x)<-x[,1]
names(x)
y<-x[1:5,2:3]
y

library(readxl)
datasets<-system.file("extdata/datasets.xlsx",package = "readxl")
data_iris=read_excel(datasets)

                                        ### Задача 2 ###  
# Запишете данните от втория sheet на файла от datasets в променлива data_mtcars.  
# Преобразувайте data_mtcars в data.frame и променете втората и осмата променливи
# като факторни променливи. Задайте подходящи имена на нивата на тези две променливи.
# Използвайки функцията table(), запиште честотната таблица на факторните променливи
# в нов файл "Engines.csv" в папката "Data".

data_mtcars=read_excel(datasets,sheet = 2)
str(data_mtcars)
data_mtcars=data.frame(data_mtcars)
data_mtcars[,2]<-as.factor(data_mtcars[,2])
data_mtcars[,8]<-as.factor(data_mtcars[,8])
str(data_mtcars)
levels(data_mtcars[,2])<-c("4-Cylinder","6-Cylinder","8-Cylinder")
levels(data_mtcars[,8])<-c("V-shaped","Standard")
tab<-table(data_mtcars[,2],data_mtcars[,8])
write.csv2(tab,file = "Data/Engines.csv")
###############################################################################################

                              ########### Statistical test ##########

normal<-rnorm(100)
hist(normal,probability = TRUE)
qqnorm(normal,main = "Normal Dist")
qqline(normal,col=2)

tdist<-rt(1000,df=3)
hist(tdist,probability = TRUE)
qqnorm(tdist,main = "T Dist")
qqline(tdist,col=2)

shapiro.test(normal)
shapiro.test(tdist)

                                          ### Задача 3 ###  
# Постройте хистограма на данните mpg от mtcars и сравнете разпледелението им с нормалното  
# чрез q-q plot. Използвайки теста на Shapiro-Wilk, проверете хипотезата за нормално 
# разпределение на mpg. Какви изводи може да направите? 








##############################################################################################
ndata<-rnorm(1000,mean = mean(mtcars$mpg), sd= sd(mtcars$mpg))
qqnorm(ndata,main = "Sample Dist")
qqline(ndata,col=2)
ks.test(mtcars$mpg,ndata)

cor.test(normal,tdist,method = ("pearson"))
cor.test(mtcars$hp,mtcars$cyl,method = ("pearson"))
cor.test(mtcars$hp,mtcars$cyl,method = ("kendall"))
cor.test(mtcars$hp,mtcars$cyl,method = ("spearman"))

mean(mtcars$cyl)
t.test(mtcars$cyl,alternative = ("two.sided"),mu=6)
mean(mtcars$mpg)
t.test(mtcars$mpg,alternative = ("less"),mu=20)

t.test(mpg~am,data=mtcars)
t.test(mpg~am,data=mtcars,var.equal=TRUE)
var.test(mpg~am,data=mtcars)

##############################################################################################

install.packages("HSAUR")         # Install package for datasets

                                          ### Задача 4 ###
# Като използвате данните "water" от пакета "HSAUR", проверете дали има зависимост 
# между смъртността и положението на населеното място, както и между твърдостта 
# на водата и положението на населеното място.

data(water,package = "HSAUR")
??water
str(water)
edit(water)

morSouth=water$mortality[water$location=="South"]
morNorth=water$mortality[water$location=="North"]
hardSouth=water$hardness[water$location=="South"]
hardNorth=water$hardness[water$location=="North"]
ks.test(morSouth,morNorth)
ks.test(hardSouth,hardNorth)

cor.test(~mortality + hardness, data = water)
t.test(mortality~location,data=water)
t.test(hardness~location,data=water)
row1=tapply(water$mortality,water$location,mean)
row2=tapply(water$hardness,water$location,mean)
tab=rbind(row1,row2)
rownames(tab)=c("mortality","hardness")
tab

                                            ### Задача 5 ###
# Като използвате данните "waves" от пакета "HSAUR", проверете дали има значима разлика
# между двата метода на закрепване (mooring).






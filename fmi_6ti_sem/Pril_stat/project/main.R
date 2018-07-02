#import PCA packages
install.packages("pls")
library(pls)

path_medical = "/home/martin/Documents/fmi/fmi_summer_2018/fmi_6ti_sem/Pril_stat/project/messidor.csv"
raw_data = read.csv(path_medical, sep=",")

# table with 
cor_table = cor(raw_data)

# test wheter X and Y cord are normaly distributed
p_values = rep(0,length(raw_data))
counter_p_val = 1
for(el in raw_data){
  p_values[counter_p_val] = shapiro.test(el)[2] 
  counter_p_val = counter_p_val+1 
}

# our data does not have normal distro
# TODO try for standartized data

# split data
train_size <- floor(0.8 * nrow(raw_data))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(raw_data)), size = train_size)

train <- raw_data[train_ind, ]
test <- raw_data[-train_ind, ]

# Try logistic regression without any optimization
naive_model = glm.fit <- glm(result ~ X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19, data = raw_data)
naive_predict = predict(naive_model, newdata=test)

# Comparing results
naive_results <- ifelse(naive_predict > 0.5, 1, 0)
true_results = test$result

# results
table(naive_results,true_results)

##################### FULL PCA ####################

# input data converted to PCA
get_pca <- function(input_data){
  
    # Lets apply PCA to all columns
    X = data.frame(input_data)
    X = X[,-which(names(X) == "result")] 
    means=colMeans(X)
    sDevs=apply(X, 2, sd)
    d=dim(X)
    C=X-t(matrix(means, d[2],d[1]))
    Z=C/t(matrix(sDevs, d[2],d[1]))
    
    ev=eigen(var(Z))  
    (vectors=ev$vectors)
    F1=as.matrix(Z)%*%vectors[,1]
    
    # new data from 20D to 2D
    pcaData=data.frame(Y=input_data$result, F1)
    return(pcaData)
}

# Lets apply PCA to all columns
X = data.frame(train)
X = X[,-which(names(X) == "result")] 
means=colMeans(X)
sDevs=apply(X, 2, sd)
d=dim(X)
C=X-t(matrix(means, d[2],d[1]))
Z=C/t(matrix(sDevs, d[2],d[1]))

# ev=eigen(var(Z))  
(vectors=ev$vectors)
F1=as.matrix(Z)%*%vectors[,1]

# new data from 20D to 2D
pcaData=data.frame(Y=train$result, F1)

# TODO: Not working find out how to use test set 
full_pca_test_data = get_pca(test)
full_pca_train_data = get_pca(train)

#Testing
X_train = train[,-which(names(train) == "result")] 
full_pca_train_default_data = prcomp(hable_tmp)
full_pca_princomp = princomp(X,cor=TRUE,score=TRUE) 

#using prcomp 
full_pca_train = prcomp(X_train,scale=TRUE)

#to percentage
pca.var.per <- round(full_pca_train$sdev/sum(full_pca_train$sdev)*100, 1)
plot(pca.var.per)

# plot PC1 and PC2
plot(full_pca_train$x[,1],full_pca_train$x[,2])

#Plot PC1 and Y
plot(full_pca_train$x[,1],train[,"result"])

# Plot PC2 and Y
plot(full_pca_train$x[,2],train[,"result"])

# Here we need the first 5 PCs to represent around 80% of the data
summary(full_pca_princomp)

# Get the top 10 sensors by magnitude
loading_scores <- full_pca_train$rotation[,1]
sensor_scores <- abs(loading_scores) ## get the magnitudes
sensor_score_ranked <- sort(sensor_scores, decreasing=TRUE)
top_10_sensors <- names(sensor_score_ranked[1:10])

top_10_sensors ## show the names of the top 10 genes

# We get that these columns represent the most data:
#  [1] "X6"  "X5"  "X7"  "X4"  "X3"  "X8"  "X19" "X9"  "X10" "X16"

# But if we want to use them in a logistic model, how do we choose how man of them to choose

# Lets pick them all
full_magnetude_data = data.frame(train[,"X3"],train[,"X4"],train[,"X5"],train[,"X6"],train[,"X7"],train[,"X8"],train[,"X9"],train[,"X10"],train[,"X16"],train[,"X19"])

full_magnetude_model = glm.fit <- glm(result ~ X3+X4+X5+X6+X7+X8+X9+X10+X16+X19, data = train)
full_magnetude_predict = predict(full_magnetude_model, newdata=test)

# Comparing results
full_magnetude_results <- ifelse(full_magnetude_predict > 0.5, 1, 0)
true_results = test$result

# results
table(full_magnetude_results,true_results)

############# top 5 factors ##### 

#  [1] "X6"  "X5"  "X7"  "X4"  "X3" 
# Lets top 5
full_magnetude_data = data.frame(train[,"X3"],train[,"X4"],train[,"X5"],train[,"X6"],train[,"X7"])

full_magnetude_model = glm.fit <- glm(result ~ X6+X5+X7+X4+X3, data = train)
full_magnetude_predict = predict(full_magnetude_model, newdata=test)

# Comparing results
full_magnetude_results <- ifelse(full_magnetude_predict > 0.5, 1, 0)
true_results = test$result

# results
table(full_magnetude_results,true_results)


################## top 3 #############


#  [1] "X6"  "X5"  "X7"  "X4"
# Lets top 5
formula = result ~ X6+X5+X7+X4
full_magnetude_model = glm.fit <- glm(formula, data = train)
full_magnetude_predict = predict(full_magnetude_model, newdata=test)

# Comparing results
full_magnetude_results <- ifelse(full_magnetude_predict > 0.5, 1, 0)
true_results = test$result

######### Niki selection #####

getCor <- function(x){
  a=cor.test(train[,1],train[,x])
  return(c(est=a$estimate,pValue=a$p.value))
}
ind=2:length(train)
corVector=sapply(ind,getCor)
colnames(corVector)=mapply(paste,"X",ind-1,sep="")
corVector     # Correlation tests
X=as.matrix(train[,which(corVector[2,]<0.1)+1])


formula = result ~ X9+X10+X18+X19
full_magnetude_model = glm.fit <- glm(formula, data = train)
full_magnetude_predict = predict(full_magnetude_model, newdata=test)

# Comparing results
full_magnetude_results <- ifelse(full_magnetude_predict > 0.5, 1, 0)
true_results = test$result

################################### Selective PCA ###################




top_cor_data = data.frame(train[,"X3"],train[,"X4"],train[,"X5"],train[,"X6"])
top_cor_pca = prcomp(top_cor_data, scale=TRUE)

# Print percentage
pca.var.per <- round(top_cor_pca$sdev/sum(top_cor_pca$sdev)*100, 1)
plot(pca.var.per)


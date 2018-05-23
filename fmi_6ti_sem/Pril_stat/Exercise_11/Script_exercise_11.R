rm(list=ls())                ######### APPLIED STATISTICS -> EXERCISE 11 #######

                                                ### ANOVA ###
install.packages("HSAUR")
data(foster, package = "HSAUR")
??foster
str(foster)
edit(foster)
table(foster$litgen,foster$motgen) #unbalanced
tapply(foster$weight, foster$litgen, mean)
tapply(foster$weight, foster$motgen, mean)
tapply(foster$weight, list(foster$litgen,foster$motgen), mean)
tapply(foster$weight, foster$litgen, sd)
tapply(foster$weight, foster$motgen, sd)
tapply(foster$weight, foster$litgen, shapiro.test)
tapply(foster$weight, foster$motgen, shapiro.test)
plot.design(foster)

                                          ### Bartlett Test ###
bartlett.test(weight ~ litgen,data = foster)
bartlett.test(weight ~ motgen,data = foster)

                                          ### One-way ANOVA ###
oneway.test(weight ~ litgen,data=foster,var.equal = TRUE)
oneway.test(weight ~ litgen,data=foster,var.equal = FALSE)
oneway.test(weight ~ motgen,data=foster,var.equal = TRUE)
oneway.test(weight ~ motgen,data=foster,var.equal = FALSE)

anova(lm(weight~motgen,data=foster))

w_aov<-aov(weight ~ motgen,data = foster)
summary(w_aov)
str(w_aov)
coefficients(w_aov)
residuals(w_aov)
w_aov$contrasts
mean(foster$weight)
options("contrasts")
w_aov_sum<-aov(weight ~ motgen,data = foster,contrasts = list(motgen=contr.sum))
coef(w_aov_sum)

                                      ### Kruskal-Wallis Rank Sum Test ###
kruskal.test(weight ~ motgen,data = foster)
kruskal.test(weight ~ litgen,data = foster)

                                        ### Two-way ANOVA ###
data("weightgain", package = "HSAUR")
??weightgain
str(weightgain)
edit(weightgain)
table(weightgain$source,weightgain$type) # balanced
tapply(weightgain$weightgain, list(weightgain$source,weightgain$type), mean)
tapply(weightgain$weightgain, weightgain$source, shapiro.test)
tapply(weightgain$weightgain, weightgain$type, shapiro.test)
nt=tapply(weightgain$weightgain, list(weightgain$source,weightgain$type), shapiro.test)
nt[1,1];nt[1,2];nt[2,1];nt[2,2]
tapply(weightgain$weightgain, list(weightgain$source,weightgain$type), sd)
plot(weightgain)
plot.design(weightgain)
interaction.plot(weightgain$type, weightgain$source,weightgain$weightgain)
wg_aov <- aov(weightgain ~ source * type, data = weightgain)
# wg_aov <- aov(weightgain ~ source + type+source:type, data = weightgain)
summary(wg_aov)
coef(wg_aov)
coef(aov(weightgain ~ source + type + source:type,
         data = weightgain, contrasts = list(source = contr.sum)))

                                         ### MANOVA ###
data("skulls", package = "HSAUR")
means <- aggregate(skulls[, c("mb", "bh", "bl", "nh")], list(epoch = skulls$epoch), mean)
means
plot.design(skulls)
plot(skulls)

skulls_manova <- manova(cbind(mb, bh, bl, nh) ~ epoch, data = skulls)
summary(skulls_manova, test = "Pillai")
summary(skulls_manova, test = "Wilks")
summary(skulls_manova, test = "Hotelling-Lawley")
summary(skulls_manova, test = "Roy")
summary.aov(manova(cbind(mb, bh, bl, nh) ~ epoch, data = skulls))

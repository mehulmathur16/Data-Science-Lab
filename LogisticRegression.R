library("caTools")

titanic_df <- read.csv("Titanic.csv")
summary(titanic_df)

data <- select(titanic_df, c(2, 3, 5, 6, 12))
head(data)

data$Age[is.na(data$Age)] <- mean(data$Age, na.rm = T)
data$Sex <- as.numeric(factor(data$Sex))
data$Embarked <- as.numeric(factor(data$Embarked))

print(data)

split <- sample.split(data, SplitRatio = 0.7)
train <- subset(data, split == "TRUE")
test <- subset(data, split == "FALSE")

print(train)
print(test)

model <- glm(Survived ~ . , family = binomial(link = "logit"), data = train)
summary(model)

y_pred <- predict(model, select(test, c(2, 3, 4, 5)))
print(y_pred)

#Now, print AUC and ROC curves

library("ROCR")

pr <- prediction(y_pred, test$Survived)

prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf)

auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
print(auc)
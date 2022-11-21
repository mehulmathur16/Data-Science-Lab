data(iris)

str(iris)

install.packages("caTools")
install.packages("randomForest")

library("caTools")
library("randomForest")

split <- sample.split(iris, SplitRatio = 0.7)

print(split)

train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")

print(train)
print(test)

set.seed(120)

classifier_RF <- randomForest(x = train[-5], y = train$Species, ntree = 500)

print(classifier_RF)

pred_result <- predict(classifier_RF, test[-5])
print(pred_result)

print(test[, 5])

confusion_mtx = table(test[, 5], pred_result)
print(confusion_mtx)

plot(classifier_RF)

importance(classifier_RF)

varImpPlot(classifier_RF)
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")

library("dplyr")
library("ggplot2")
library("ggfortify")

data(iris)
head(iris)

data <- select(iris, c(1 : 4))

wssplot <- function(data, nc = 15, seed = 1234) {
  
  wss <- (nrow(data) - 1) * sum(apply(data, 2, var))
  
  for(i in 2 : nc) {
    set.seed(1234)
    
    wss[i] <- sum(kmeans(data, i)$withinss)
  }
  
  plot(1 : nc, wss, type = "b", xlab = "Number of clusters", ylab = "Within groups sum of squares")
  print(wss)
}

wssplot(data)

classifier_RF <- kmeans(data, 2)
print(classifier_RF)
print(classifier_RF$centers)

autoplot(classifier_RF, data, frame = "TRUE")


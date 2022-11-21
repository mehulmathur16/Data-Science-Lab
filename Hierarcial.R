library("dplyr")
head(mtcars)

dist_mtx <- dist(mtcars, method = "euclidean")
print(dist_mtx)

set.seed(240)
model <- hclust(dist_mtx, method = "average")
plot(model)
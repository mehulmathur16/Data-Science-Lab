library("dplyr")
library("factoextra")
head(mtcars)

dist_mtx <- dist(mtcars, method = "euclidean")
print(dist_mtx)

set.seed(240)
model <- hclust(dist_mtx, method = "average")
plot(model)

# Cut tree into 3 groups
sub_grps <- cutree(model, k = 3)

# Visualize the result in a scatter plot
fviz_cluster(list(data = mtcars, cluster = sub_grps))
install.packages("ggplot2")

library("ggplot2")

x <- c(150, 151, 152, 134, 136, 109, 88, 77, 190, 154) # Height
y <- c(60, 80, 90, 87, 65, 55, 89, 90, 43, 100) # Weight

relation <- lm(y ~ x)
print(relation)

a <- data.frame(x = 180)
res <- predict(relation, a)
print(res)

png("LinearRegressionPractice.png")

plot(x, y, main = "Height and Weight Regression", xlab = "Height", ylab = "Weight", abline(lm(y ~ x)), color = "red", pch = 16, cex = 1.3)

dev.off()
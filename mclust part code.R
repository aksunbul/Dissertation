rm(list=ls())

# Loading dataset
dataset = read.csv("summary2.csv")
head(dataset)

# re-indexing
data = dataset[,-2]
data2 = na.omit(data)
no = c(1:4343)

data3 = cbind(no, data2)
head(data3)


# install.packages("mclust")
library(mclust)

# clustering
mod <- Mclust(data3[,3:7])
# mod <- Mclust(data3[,3:7],7)
# mod <- Mclust(data3[,3:7],8)
# mod <- Mclust(data3[,3:7], 10)
# mod <- Mclust(data3[,3:7], 11)
summary(mod)


dr <- MclustDR(mod)
summary(dr)

plot(dr, what = "scatterplot")
plot(dr, what = "scatterplot", xlim=c(-0.0005, 0.0005), ylim=c(-0.0005, 0.0005))
plot(dr, what = "evalues")

data4 = cbind(data3, dr$classification)
head(data4)
write.csv(data4[,2:8],"summary_mclust.csv", row.names = FALSE)




data <- read.csv2("joinedNutrition.csv")


data <- subset(data, select = -c(1,2, 3, 49, 48, 47, 43))

data <- data.frame(apply(X = data, MARGIN = 2, FUN = as.numeric))

meaningful_limit <- 2 / sqrt(length(data[,1]))

correlations_pearson <- cor(x = data, y = data, method = "pearson")
correlations_kendall <- cor(x = data, y = data, method = "kendall")
correlations_spearman <- cor(x = data, y = data, method = "spearman")


write.csv(file = "correlations_pearson.csv", correlations_pearson)
write.csv(file = "correlations_kendall.csv", correlations_kendall)
write.csv(file = "correlations_spearman.csv", correlations_spearman)

significant_pearson <- correlations_pearson > meaningful_limit

atypic_points <- 
        significant_pearson & 
        (abs(correlations_pearson - correlations_kendall) > 4E-1) & 
        (abs(correlations_pearson - correlations_spearman) > 4E-1) 


correlations_non_linear <-         
        (abs(correlations_kendall - correlations_pearson) > 4E-1) & 
        (abs(correlations_spearman - correlations_pearson) > 4E-1) 


write.csv(file = "atypic_points.csv", atypic_points)
write.csv(file = "correlations_non_linear.csv", correlations_non_linear)



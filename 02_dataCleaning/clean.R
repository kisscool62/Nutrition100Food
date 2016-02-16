library(dplyr)

food <- read.csv('../usda_food.csv')


food <- subset(food, select = -c(GmWt_1, GmWt_Desc1, GmWt_2, GmWt_Desc2, Refuse_Pct))

food <- arrange(food, Shrt_Desc)

food <- na.omit(food)
write.table(x = food, row.names = F, quote = T, file = "cleaned_food.csv", sep = ",")

cleaned_raw_food <- read.table(file = "cleaned_raw_food.csv", sep = ",", header = T)
cleaned_raw_food <- na.omit(cleaned_raw_food)

cleaned_raw_food2 <- cleaned_raw_food[cleaned_raw_food$NDB_No != 23386, ]

write.table(x = cleaned_raw_food2, row.names = F, quote = T, file = "cleaned_raw_food.csv", sep = ";")

fool_des <- read.table(file = "FOOD_DES.csv", sep = ";", header = T)

fool_des <- subset(x = fool_des, select = c(1,2))

write.table(x = fool_des, row.names = F, quote = T, file = "fool_des.csv", sep = ";")

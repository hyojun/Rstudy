#R Study

## load data frame
install.packages("readxl")
library(readxl)
data_frame_xls <- read_excel(file.choose(), col_names = F, sheet = 3)
data_frame_csv <- read.csv(file.choose(), stringsAsFactors = F)

## save data frame
write.csv(df_midterm, file = "df_midterm.csv")
save(data_frame, file = "data_frame.rda")
load("data_frame.rda")

## merge data frame
### JOIN
total <- left_join(test1, test2, by = "id")
### UNION ALL
group_all <- bind_rows(group_a, group_b)

## analyze data frame
install.packages("dplyr")
library(dplyr)
### copy
new_data_frame <- data_frame
### overview
head(data_frame)
tail(data_frame)
View(data_frame)
str(data_frame)
summary(data_frame)
glimpse(data_frame)
### preprocessing
summary(exam$math)
#### remove NA
table(is.na(exam$math))
exam$math <- ifelse(is.na(exam$math), 
                    mean(data_frame$score, na.rm = T), 
                    exam$math)
#### remove outlier1
table(data_frame$sex)
data_frame$sex <- ifelse(data_frame$sex == 3, NA, data_frame$sex)

#### remove outlier2
boxplot(data_frame$score)
data_frame$math <- ifelse(data_frame$score < 10, 
                          NA, 
                          data_frame$score)

### manipulate
exam %>% 
  mutate(total = math + science + english)
  filter(math > 50  | english >= 50 & science >= 50 | class %in% c(1,2,3)) %>%
  select(name, class, total)
  mutate(result = ifelse(total >= 70, "pass", "fail"))
  arrange(class, desc(total))
### analyze
exam %>% 
  group_by(grade, class) %>%
  summarise(mean_math = mean(math))

### visualize
data_frame %>% ggplot(aes(x = sex, y = math)) + geom_point()

#### ggplotAssist
install.packages('devtools')
devtools::install_github("cardiomoon/editData")
devtools::install_github("cardiomoon/ggplotAssist")
install.packages("maps")


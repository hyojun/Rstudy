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
dim(data_frame)
summary(data_frame)
glimpse(data_frame)
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

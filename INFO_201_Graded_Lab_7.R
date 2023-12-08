## Name: Jeffery Zhang
## Class: INFO 201
## TA: Xinyu Chang (AD)
## Due: November 16th, 2023

##### ---------- Graded Lab 7: Make Good Plots ----------

library(readr)
library(ggplot2)
library(dplyr)

### 1.1
income_height <- read_delim("C:/Users/xuz-t/OneDrive/Documents/INFO_201_Scripts/INFO_201_Graded_Lab_7_files/data/income-height.csv")
income_height <- income_height[income_height$income > 0, ]

### 1.2
income_height$height_subset <- round(income_height$height / 5) * 5

### 1.3
avg_inc_height <- income_height %>%
  group_by(height_subset) %>%
  summarize(avg_income = mean(income))
ggplot(avg_inc_height, aes(x = as.factor(height_subset), y = avg_income)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Average Income by Height Category",
       x = "Height Category",
       y = "Average Income") +
  theme_minimal()
# Comment: There is indeed a strong positive correlation between height and average income,
# according to this dataset.

### 1.4
avg_inc_by_gender <- income_height %>%
  group_by(sex, height_subset) %>%
  summarize(avg_income = mean(income))
ggplot(avg_inc_by_gender, aes(x = as.factor(height_subset), y = avg_income, fill = sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), color = "black", width = 0.7) +
  labs(title = "Average Income by Height Category and Gender",
       x = "Age Category",
       y = "Average Income",
       fill = "Gender") +
  theme_minimal()

### 1.5
ggplot(income_height, aes(x = as.factor(height_subset), y = income)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Income by Height Category",
       x = "Height Category",
       y = "Income") +
  theme_minimal()

### 1.6
ggplot(income_height, aes(x = as.factor(height_subset), y = income, fill = sex)) +
  geom_boxplot(position = "dodge", color = "black", width = 0.7) +
  labs(title = "Boxplot of Income by Height Category and Gender",
       x = "Height Category",
       y = "Income",
       fill = "Gender") +
  theme_minimal()
# Comment: The positive correlation between height and income is stronger for men
# than it is for women, though it's a bit hard to tell with the outliers
# at the very top adjusting the view window for the entire graph.

### 2.1
scand_COVID <- read_delim("C:/Users/xuz-t/OneDrive/Documents/INFO_201_Scripts/INFO_201_Graded_Lab_7_files/data/covid-scandinavia-wide.csv")
# Comment: A row in this data represents the COVID statistics of the country at a given date

### 2.2
scand_COVID$date <- as.Date(scand_COVID$date)
first_date <- min(scand_COVID$date)
last_date <- max(scand_COVID$date)
# Comment: The first date is 2020-01-22 (YYYY-MM-DD) and the last date is 2022-04-16.

### 2.3
denmark_data <- scand_COVID[scand_COVID$country == "Denmark", ]
ggplot(denmark_data, aes(x = Confirmed, y = Deaths)) +
  geom_point(alpha = 0.7, size = 3, color = "steelblue") +
  labs(title = "Scatterplot of Confirmed Cases vs Deaths in Denmark",
       x = "Confirmed Cases",
       y = "Deaths") +
  theme_minimal()

### 2.4
ggplot(scand_COVID, aes(x = Confirmed, y = Deaths, color = country)) +
  geom_point(alpha = 0.7, size = 3) +
  labs(title = "Scatterplot of Confirmed Cases vs Deaths in Scandinavia",
       x = "Confirmed Cases",
       y = "Deaths",
       color = "Country") +
  theme_minimal()

### 2.5
ggplot(scand_COVID, aes(x = Confirmed, y = Deaths, color = country, group = country)) +
  geom_line(alpha = 0.7, linewidth = 1) +
  labs(title = "Trajectories of Confirmed Cases vs Deaths in Scandinavia",
       x = "Confirmed Cases",
       y = "Deaths",
       color = "Country") +
  theme_minimal()


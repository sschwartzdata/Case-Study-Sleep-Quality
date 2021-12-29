#installing tidyverse and reshape2
install.packages("tidyverse")
install.packages("reshape2")
install.packages("lintr")
install.packages("ggpubr")
install.packages("nortest")
install.packages("tseries")

#adding tidyverse
library(tidyverse)
library(reshape2)
library(lintr)
library(ggpubr)
library(nortest)
library(tseries)

#Pull in data
sleep_data <- read_csv(file = "Data/sleep_data.csv")

head(sleep_data)

#added month column to sleep data
sleep_data <- sleep_data %>%
  add_column(sleep_month = months(sleep_data$sleep_date))

#added quarter column
sleep_data <- sleep_data %>%
  add_column(sleep_quarter = quarters(sleep_data$sleep_date))

#make a long format of the data
sleep_data_long <- melt(sleep_data, id.vars = c("sleep_date", "sleep_month",
 "sleep_quarter", "duration_hrs", "total_toss_turns"))

#checking to see if correctly formatted
head(sleep_data_long)


#Average  and standard deviation of sleep duration
ave_duration <- mean(sleep_data$duration_hrs)
std_duration <- sqrt(var(sleep_data$duration_hrs))
var_duration <- var(sleep_data$duration_hrs)

ave_toss <- mean(sleep_data$total_toss_turns)
std_toss <- sqrt(var(sleep_data$total_toss_turns))
var_toss <- var(sleep_data$total_toss_turns)
#stat data frame
stats <- data.frame(Statistics=c("Average", "Standard Deviation", "Variance"),
                    Results=c(round(ave_duration, digits = 2),
                              round(std_duration,digits = 2),
                              round(var_duration,digits = 2)))
stats2 <- data.frame(Statistics=c("Average", "Standard Deviation", "Variance"),
                    Results=c(round(ave_toss, digits = 2),
                              round(std_toss,digits = 2),
                              round(var_toss,digits = 2)))

view(stats2)

#plotting a bar plot of sleep duration with different colors for the months
sleep_data %>%
  ggplot() +
  geom_bar(data = sleep_data, mapping = aes
  (x = duration_hrs, color = sleep_month)) +
  xlab("Sleep Duration (hrs)") +
  ylab("Days") +
  ggtitle("Sleep Duration")

#histogram with normal distribution
dur <- sleep_data$duration_hrs
h <- hist((sleep_data$duration_hrs), main = "Sleep Duration",
  xlab = "Sleep Duration (hrs)")

xfit <- seq(min(dur), max(dur), length = 40)
yfit <- dnorm(xfit, mean = mean(dur), sd = sd(dur))
yfit <- yfit * diff(h$mids[1:2]) * length(dur)

lines(xfit, yfit, col = "blue", lwd = 2)

#!!!!!!!!!! WORKING ZONE !!!!!!!!!!
#attempting to make a table that has the average sleep stage per month
df <- sleep_data_long %>% group_by(variable) %>% summarize(me = mean(value))
ggplot(aes(x = sleep_data_long$sleep_month, y = me), data = df) +
  geom_bar(position = "stack", stat = "identity")
#!!!!!!!!!! END WORKING ZONE !!!!!!!!!!

#stacked bar graph - need to fix it so that it is the average, not the total

head(sleep_data_long)
df[df$date >= "2020-12-22", ]
long_average <- sleep_data_long[sleep_data_long$sleep_date > "2014-01-17", ]
head(long_average)

labels=c("total_rem_hrs"="REM", "total_deep_hrs"="Deep", 
         "total_light_hrs"="Light", "total_interpurt_hrs"="Interupted",
         "total_unknown_hrs"="Unknown")

n <- ggplot(long_average, aes(fill = variable, x = sleep_month,
 y = value, color = variable)) + 
  scale_color_discrete(labels = labels)
n + geom_bar(position = "fill", stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
  

#!!!!!!!!!! WORKING ZONE !!!!!!!!!!
#attempting to make a table that has the average sleep stage per month
df <- sleep_data_long %>% group_by(variable) %>% summarize(me = mean(value))
ggplot(aes(x = sleep_data_long$sleep_month, y = me), data = df) +
  geom_bar(position = "stack", stat = "identity")
#!!!!!!!!!! END WORKING ZONE !!!!!!!!!!

# testing if sleep duration is normal
qqnorm(sleep_data$duration_hrs)
shapiro.test(sleep_data$duration_hrs)
tseries::jarque.bera.test(sleep_data$duration_hrs)
ad.test(sleep_data$duration_hrs)
cvm.test(sleep_data$duration_hrs)
lillie.test(sleep_data$duration_hrs)
pearson.test(sleep_data$duration_hrs)
sf.test(sleep_data$duration_hrs)

ggqqplot(sleep_data$duration_hrs)


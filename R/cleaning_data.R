#installing tidyverse
install.packages("tidyverse")
#adding tidyverse
library(tidyverse)

#Pull in data
sleep_data <- read_csv(file = "Data/sleep_data.csv")


#added month column to sleep data
sleep_data <- sleep_data %>%
  add_column(sleep_month = months(sleep_data$sleep_date))

#added quarter column
sleep_data <- sleep_data %>%
  add_column(sleep_quarter = quarters(sleep_data$sleep_date))

#Average  and standard deviation of sleep duration
ave_duration <- mean(sleep_data$duration_hrs)
std_duration <- sqrt(var(sleep_data$duration_hrs))

#plotting a bar plot of sleep duration with different colors for the months
sleep_data %>%
  ggplot() +
  geom_bar(data=sleep_data, mapping=aes(x=duration_hrs, color=sleep_month)) +
  xlab("Sleep Duration (hrs)") + 
  ylab("Days") + 
  ggtitle("Sleep Duration")

#histogram with normal distribution
dur <- sleep_data$duration_hrs
h <- hist((sleep_data$duration_hrs), main="Sleep Duration", xlab="Sleep Duration (hrs)")

xfit<-seq(min(dur),max(dur),length=40) 
yfit<-dnorm(xfit,mean=mean(dur),sd=sd(dur)) 
yfit <- yfit*diff(h$mids[1:2])*length(dur) 

lines(xfit, yfit, col="blue", lwd=2)


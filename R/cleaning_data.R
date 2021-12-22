#installing tidyverse
install.packages("tidyverse")
#adding tidyverse
library(tidyverse)

#Pull in data
sleep_data <- read_csv(file = "data/sleep_data.csv")

#added month column to sleep data
sleep_data <- sleep_data %>%
  add_column(sleep_month = months(sleep_data$sleep_date))

#added quarter column
sleep_data <- sleep_data %>%
  add_column(sleep_quarter = quarters(sleep_data$sleep_date))

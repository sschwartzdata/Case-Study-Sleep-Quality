
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import os

data_location = 'C:/Users/sbsch/source/repos/Case-Study-Sleep-Quality/Data/'
os.chdir(data_location)

# Importing Data
sleep_data = pd.read_csv('sleep_data.csv')


# Ploting a histogram of sleep duration

fig, plot = plt.subplots()
plot.hist(sleep_data['duration_hrs'], bins=32)
plt.ylabel('Frequency')
plt.xlabel('Sleep Duration (hrs)')
plt.title(label="Sleep Duration",
          loc="left",
          fontstyle='italic')

plt.savefig("C:/Users/sbsch/source/repos/Case-Study-Sleep-Quality/Python/Plots/sleep_duration_hist.png")
plt.show()
fig.savefig("C:/Users/sbsch/source/repos/Case-Study-Sleep-Quality/Python/Plots/sleep_duration_hist2.png")




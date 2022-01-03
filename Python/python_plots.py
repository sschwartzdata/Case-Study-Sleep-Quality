
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# Importing Data
sleep_data = pd.read_csv("C:/Users/sbsch/source/repos/Case-Study-Sleep-Quality/Data/sleep_data.csv")


# Ploting a histogram of sleep duration

plt.hist(sleep_data['duration_hrs'], bins=32)
plt.ylabel('Frequency')
plt.xlabel('Sleep Duration (hrs)')
plt.title(label="Sleep Duration",
          loc="left",
          fontstyle='italic')

plt.show()

plt.savefig('C:/Users/sbsch/source/repos/Case-Study-Sleep-Quality/Python/Plots/sleep_duration_hist.png')
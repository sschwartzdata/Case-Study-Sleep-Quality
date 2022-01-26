# A Case Study of Sleep Quality from 2013 - 2016
This is a Case Study of sleep data from a friend. The goal is to anwer their specific questions about their sleep quality in the form of slides and supported with visualizations.


## Supporting Files Description
All of the SQL, R, and Python codes and files that were used in this analysis can be found in their respective project directories. 

## Tools Used
**Data Warehouse:** BigQuery <br>
**Query Language:** SQL <br>
**Coding Language:** R <br>
**Data Visualizations:** R and Tableau <br>
**Reporting:** R Markdown and Google Sheets

## Skills Demonstrated
- Data cleaning using R and SQL
- Data manipulation using R
- Data visualization using R and Tableau
- Analysis reporting and recommendations documented in a Google Sheets

## Data 
The data was collected from a Basis B1 fitness tracker from 1/1/2013 to 10/31/2016.

### Data Limitations
The data was limited to the nights that the user wore the tracker. 
The sleep stage data feature was not available until after 1/17/2014. All analysis performed on the sleep stages are limited to the dates 1/18/2014 to 10/31/2016.

### Analysis Assumptions
These are the definitions used for this analysis:
- Weekend nights were defined as Friday and Saturday nights. 
    - This was chosen since the sleep period would end on Saturday or Sunday, when they most often did not use an alarm to wake up.
- A sleep session was assigned to a day if the session started after 12:00 p.m. that day or started before 12:00 p.m. the next day.
    - This was to account for the following situations:
       - The client went to sleep earlier than ususal
       - They did not fall asleep until after midnight
       - They woke up and went back to sleep


## Analysis Goals
The questions asked by the client were the following:
- Quantify the average hours of sleep for each year, quarter, month and day of the week.
- Determine which month and which day of the week have the highest sleep quality.
- Determine if the quality of sleep is better during the weekends or the weekdays.





## Future work
I plan to come back to this project in the near future and demonstrate my ability to duplicate my data analysis using python and PostgreSQL instead of BigQuery and R.

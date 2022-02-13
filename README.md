# fish_count

# Overview
Based on weather conditions can predict fish populations?
What are fish counts going to be next week, month, year?


Null Hypothesis - weather conditions(air temperature, precipitation, water temperature) does not affect weekly steelhead counts 
Supervised machine learning model
    - dependent variable: fish counts
    - X = weather conditions 

End Product:
- Report that provides historical data
- ML will give good or bad time to fish


Other external variables: 
- hatcheries
- ocean weather conditions

Definitions:
- Weather conditions: 
- Stlhd - Adult Steelhead
- TempC - Temperature in degrees Celsius 
- TMAX - Max Temperature in degrees Fahrenheit
- TMIN - Min Temperature in degrees Fahrenheit
- PRCP - Precipitation in Inches


### Data
- weather: https://www.ncei.noaa.gov/access/past-weather/Oregon
- count: http://www.cbr.washington.edu/dart/query/adult_daily

### Tools:
- Jupyter notebook 6.3.0: ETL Process
- Database: pgAdmin and postgres
- tensorflow 2.7.0
- scikit-learn 1.0.2
    - train_test_split
    - StandardScaler
- pandas
- Visual Studio Code 1.60.2
- Tableau
- matplotlib
- numpy
- conda

### Team Communication:
- Slack
- Zoom Meetings

- X(Tech) - John
- Circle(SQL Database)- Lasitha
- Triangle(ML Model)- Jeremy
- Square(Git)- Mike 


## Working Plan
### Before next meeting:
- John:
- Lasitha: create SQL database
- Jeremy: remove rows in weather data
- Mike: 

### Need to complete:
- Build out table in postgres
    - fish count - total_data.csv
    - weather - Bonneville_Dam_OR.csv
    - table
        - day 
        - month
        - week
        - Stlhd




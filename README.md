# fish_count

# Overview
The purpose of this analysis is to see if we can use weather conditions including air temp, precipitation, and water temp to predict steelhead population counts. 

Null Hypothesis - weather conditions (air temperature, precipitation, water temperature) does not affect weekly steelhead counts 
Supervised machine learning model
    - dependent variable: fish counts
    - X = weather conditions

Questions: 
What are fish counts going to be next week, month, year?


End Product:
- Report that provides historical data
- ML will give good or bad time to fish


Other external variables: 
- hatcheries
- ocean weather conditions


Definitions:
- Weather conditions: air temperature, precipitation, water temperature
- Stlhd - Adult Steelhead
- TempC - Temperature in degrees Celsius 
- TMAX - Max Temperature in degrees Fahrenheit
- TMIN - Min Temperature in degrees Fahrenheit
- PRCP - Precipitation in Inches

### Data
- weather: 
    - [website](https://www.ncei.noaa.gov/access/past-weather/Oregon) 
    - [data](https://github.com/mthalken/fish_count/blob/main/Resources/NOAA_csv/Bonneville_Dam_OR.csv)
- count: 
    - [website](http://www.cbr.washington.edu/dart/query/adult_daily)
    - [initial data](https://github.com/mthalken/fish_count/tree/main/Resources/BonFish)
    - [cleaned data](https://github.com/mthalken/fish_count/blob/main/Resources/total_data.csv)
- database ready data: 
    - [stlhd_count.csv](https://github.com/mthalken/fish_count/blob/main/Resources/stlhd_count.csv)
    - [bonWeather.csv](https://github.com/mthalken/fish_count/blob/main/Resources/bonWeather.csv)



### Tools:
- Jupyter notebook 6.3.0
- pgAdmin 4 - postgreSQL 13.4
- Tensorflow 2.7.0
- Scikit-learn 1.0.2
    - Train_test_split
    - StandardScaler
- Pandas 1.3.5
- Visual Studio Code 1.60.2
- Tableau 2021.4
- Matplotlib 3.5.0
- Numpy 1.20.3
- Conda 4.11.0

### Team Communication
- Slack
- Zoom Meetings


### Team Roles
- John: X (Tech) 
- Lasitha: Circle (SQL Database)
- Jeremy: Triangle (ML Model) 
- Mike: Square (Git)  


## Working Plan
### Before next meeting:
- John:
- Lasitha: create SQL database
- Jeremy: remove rows in weather data
- Mike: 

### Need to complete:
- [x] Build out table in postgres
    - [x] fish count - total_data.csv
    - [x] weather - Bonneville_Dam_OR.csv
    - [x] table
        - day 
        - month
        - week
        - Stlhd




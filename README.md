# fish_count

Average water temps per week
Average fish count per week
Find std dev for both to see consistency of data
Enter data to fish (default at current date)
    Reference week number off day and month
Compare to historical fish count against weather conditions with ML
    ML accuracy based on a window of time
        Week
        3 Month
        1 year

ML in jupyter then added column to dataset -> Tableau
    Date

Database connection



# Overview
The purpose of this analysis is to see if we can use weather conditions including air temp, precipitation, and water temp to predict steelhead population counts and catch counts. 

Null Hypothesis - weather conditions (air temperature, precipitation, water temperature) does not affect weekly steelhead counts 

Machine Learning:
- Supervised machine learning model
    - dependent variable: fish counts
    - X = weather conditions

Questions: 
- Can fish populations be predicted?
    - What are fish counts going to be next week, month, year?
- Does climate and weather affect fish populations? 



End Product:
- Tableau story presenting historical data and predictions of fish counts and fish catch counts
    - Visualization (Tableau)
        - Historical data with line plot (week and month)
            - catch and counts
            - weather conditions
            - water temp
        - Gauge chart based on fish catch probability 
        - Future predictions (week and month)
        - Map with pin locations (hover text)
            - highlight waterbody 

        - Filters
            - location
            - fish
            - date
    


Other external variables: 
- hatcheries
- ocean weather conditions
- river weather conditions
- sea lions


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
- map:
    - [naturalearthdata.com](https://www.naturalearthdata.com/downloads/)
- catch count:
    - [dfw.state.or.us](https://www.dfw.state.or.us/resources/fishing/sportcatch_archives.asp)




### Tools:
- GitHub 
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
- Slack - communication
- Zoom Meetings - group work and meetings
- GitHub - project file/project system 


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






# Steelhead Count

# Overview
The purpose of this analysis is to see if wee can use machine learning on weather conditions including air temp, precipitation, and water temp to predict steelhead population counts at the Bonneville Dam on the Columbia River between Oregon and Washington.

## Project Overview
1. Perform exploratory analysis. 
2. Use preprocessing to to prepare the data for the Machine Learning model.
3. Explore the Machine Learning models and evaluate the accuracy of the results.
4. Optimize the Machine Learning model.
5. Create and connect a Database using PostgreSQL.
6. Plan and implement an interactive dashboard with Machine Learning and Database connection.
7. Present dashboard and results. 

## Team
- John Garbett - [GitHub](https://github.com/jgarbett44) | [LinkedIn](https://www.linkedin.com/in/john-garbett-94699267/) 
- Lasitha Liyanage - [GitHub](https://github.com/LasithaL) | [LinkedIn](https://www.linkedin.com/in/lasitha-liyanage-5a599aa/) 
- Jeremy Petty  - [GitHub](https://github.com/jp3tty) | [LinkedIn](https://www.linkedin.com/in/jeremy-petty-7712a1207/) 
- Mike Thalken - [GitHub](https://github.com/mthalken) | [LinkedIn](https://www.linkedin.com/in/mike-thalken/) 

### Questions
- Can fish populations be predicted?
    - What are fish counts going to be next week, month, year?
- Does climate and weather affect fish populations? 
- Does fish count at the Bonneville Dam effect fish catch in the resulting area?

### Tools:
- GitHub 
- Jupyter notebook 6.3.0
- pgAdmin 4 - postgreSQL 13.4
- Tensorflow 2.7.0
- Scikit-learn 1.0.2
- Pandas 1.3.5
- Visual Studio Code 1.60.2
- Tableau 2021.4
- Matplotlib 3.5.0
- Numpy 1.20.3
- Conda 4.11.0


## Data Exploration
We combined data from Columbia Basin Research website and looked at Weeks, Months, Year, Maximum Temperature, Minimum Temperature, Precipitation, Water Temperature and Steelhead Count. We are attempting to answer our Null Hypothesis that weather conditions (air temperature, precipitation, water temperature) does not affect weekly steelhead counts. 
-- Did we use any other of our datasets?

After cleaning the data we can see that there is exponential growth with an increase in Steelhead Count in comparison to Max Air Temp and Water Temp. 
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Water_Temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Max_Water_Temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Min_Air_Temp.png)

There was also a significate decrease in Steelhead Count on days with increased precipitation. 
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_precipitation.png)

We also wanted to see the Steelhead count by week and water temp by week and water temp. 
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Week.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Max_air_temp_by_water_temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Water_temp_by_Week_Number.png)

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

Definitions:
- Weather conditions: air temperature, precipitation, water temperature
- stlhdcount - Adult Steelhead Count
- maxtempf - Maximum Temperature in degrees Fahrenheit 
- mintempf - Minimum Temperature in degrees Fahrenheit
- precipitationinch - Precipitation in Inches
- watertempf - Water temperate in degrees Fahrenheit


## Data Preprocessing
- Target Column: stlheadcount
- Featured Columns: maxtempf, mintempf, precipitationinch, watertempf, stlheadcount

![png](link)


## Machine Learning Model
Looking at our data and using machine learning to predict steelhead counts based on weather conditions we decided to use a polynomial regression using a standard scaler. For our train test split we used the random state at 42 and the default test size of 25%. We choose the polynomial regression model as our data had exponential growth and was multivariate. We also tried other supervised machine learning models and were not able to reach the desired accuracy. 
Some limitations of a polynomial regression model is that the presence of a few outliers and have large effects on results and there are fewer model validation tools for detecting outliers than there are in linear models.
    - other machine learning models we tried:
        - Non-Negative Least Squares
        - Ridge Regression and Classification
        - Lasso
        - Naive Random Oversampling
        - SMOTE Oversampling
        - Undersampling
        - SMOTEEN
        - Balanced Random Forest Classifier
        - Easy Ensemble AdaBoost Classifier
    - other scalers we tried:
        - MinMaxScaler
        - MaxABSScaler
        - Robust Scaler
        - Power Transformer with the yeo-johnson method
        - Power Transformer with the box-cox method
        - Quantile Transformer with uniform distribution
        - Quantile Transformer with normal distribution
        - Normalizer

 




## Interactive Dashboard(In Progress)
Our interactive dashboard will allow users to put in a desired day to go fishing and our dashboard will return the following:
- Machine Learning predictions from historic data on Steelhead counts
- Current Weather Conditions
- Expected Weather Conditions
- Historical Data
    - counts
    - weather conditions
    - water temp
    - catch counts


We will use Tableau, (___) Database, Flask, and Heroku for our final project. 



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



### Team Communication
- Slack - communication
- Zoom Meetings - group work and meetings
- GitHub - project file/project system 


### Team Roles
- John: X (Tech) 
- Lasitha: Circle (SQL Database)
- Jeremy: Triangle (ML Model) 
- Mike: Square (Git)  





# Steelhead Count

# Overview
The purpose of this analysis is to see if wee can use machine learning on weather conditions including air temp, precipitation, and water temp to predict fish population counts at the Bonneville Dam on the Columbia River between Oregon and Washington. We want to be able to provide a tool for people to use to see wether based on historical data if the date they want to go fishing has been ideal and what the historical weather has been on that particular day. 

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
Code: [Preliminary code](https://github.com/mthalken/fish_count/blob/main/Notebooks/data_exploration.ipynb)

We combined data from Columbia Basin Research website and looked at Weeks, Months, Year, Maximum Temperature, Minimum Temperature, Precipitation, Water Temperature and Steelhead Count. We are attempting to answer our Null Hypothesis that weather conditions (air temperature, precipitation, water temperature) does not affect weekly steelhead counts. 
-- Did we use any other of our datasets?

After cleaning the data we can see that there is exponential growth with an increase in Steelhead Count in comparison to Max Air Temp and Water Temp. 

![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Water_Temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Max_Water_Temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_Min_Air_Temp.png)

There was also a significate decrease in Steelhead Count on days with increased precipitation. 
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Steelhead_Count_by_precipitation.png)

We also wanted to see the Steelhead count by week and water temp by week and water temp. 
![png](https://github.com/mthalken/fish_count/blob/main/Images/Steelhead_Count_by_Week.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Max_air_temp_by_water_temp.png)
![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/Water_temp_by_Week_Number.png)

### Data
- Catch count:
    - [website](https://www.dfw.state.or.us/resources/fishing/sportcatch_archives.asp)
    - [original data](https://github.com/mthalken/fish_count/tree/main/Resources/Fish_catch)
    - [cleaned data](https://github.com/mthalken/fish_count/blob/mthalken/Resources/refactored_data/CombinedCatchData.csv)
- Count: 
    - [website](http://www.cbr.washington.edu/dart/query/adult_daily)
    - [initial data](https://github.com/mthalken/fish_count/tree/main/Resources/BonFish)
    - [cleaned data](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/total_data.csv)
- Machine learning data:
    - [daily fish data](https://github.com/mthalken/fish_count/tree/main/Resources/refactored_data/daily_fish_groups)
    - [weekly fish data](https://github.com/mthalken/fish_count/tree/main/Resources/refactored_data/weekly_fish_groups)
    - [combined data](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/combineddata2.csv)
- Weather:
    - [website](https://www.ncei.noaa.gov/access/past-weather/Oregon)
    - [original](https://github.com/mthalken/fish_count/blob/main/Resources/weather/Bonneville_Dam_OR.csv)
    - [cleaned data](https://github.com/mthalken/fish_count/blob/jpetty_branch/Resources/weather/dailyWeatherTable.csv)
    

Definitions:
- Weather conditions: air temperature, precipitation, water temperature
- stlhdcount - Adult Steelhead Count
- chinookcount - Adult Chinook Count
- sockeyecount - Adult Sockeye Count
- cohocount - Adult Coho Count
- shadcount - Adult Shad Count
- maxtempf - Maximum Temperature in degrees Fahrenheit 
- mintempf - Minimum Temperature in degrees Fahrenheit
- precipitationinch - Precipitation in Inches
- watertempf - Water temperate in degrees Fahrenheit
- countid - year, month, and day of recording


## Data Preprocessing
Code: 
- [Combining Data](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/joining_data.ipynb)
- [Grouping](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/grouping_for_analysis.ipynb)
- 

To preprocess our data we combined our csv [files](https://github.com/mthalken/fish_count/tree/main/Resources/BonFish), found the target column and featured columns and dropped the NaN rows. We then grouped the data by day, month, and year with an aggregate mean to prepared for our machine learning model. 
- Target Column: stlheadcount
- Featured Columns: maxtempf, mintempf, precipitationinch, and watertempf

![png](https://github.com/mthalken/fish_count/blob/main/Images/cleaned_data.png)


## Machine Learning Model
Code: 
- [Preliminary code](https://github.com/mthalken/fish_count/blob/main/Notebooks/fish_ml_practice.ipynb)
- [Testing Types of Linear Regression](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/testing_types_of_linear_regression.ipynb)
- [Polynomial Regression](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/poly_regression.ipynb)
- [Polynomial Regression and Scaling](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/poly_regression_%26_scaling.ipynb)
- [Refactored Machine Learning Model](https://github.com/mthalken/fish_count/blob/main/Notebooks/ml_model_on_all_fish_types.ipynb)

Looking at our data and using machine learning to predict steelhead counts based on weather conditions we decided to use a polynomial regression. For our train test split we used the random state at 42 and the default test size of 25%. We choose the polynomial regression model as our data had exponential growth and was multivariate. We also tried other supervised machine learning models and were not able to reach the desired accuracy. 

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

After the initial machine learning model we decided to be able to tell a the story that we want we need to add other fish types to the model. After taking the [total_data.csv](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/total_data.csv) and running it through our preprocessing in [DB_Connection.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/DB_Connection.ipynb) we used [daily_fish_grouping.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/daily_fish_grouping.ipynb) and [weekly_fish_grouping.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/weekly_fish_grouping.ipynb) to create [dailyWeatherTable.csv]() and [combineddata2.csv](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/combineddata2.csv). From the updated dataset we ran our [machine learning](https://github.com/mthalken/fish_count/blob/main/Notebooks/ml_model_on_all_fish_types.ipynb) for each fish type for week and day. After running the train, test, and predict we took the [dailyWeatherTable.csv](https://github.com/mthalken/fish_count/blob/main/Resources/weather/dailyWeatherTable.csv) and using our model predicted a fish count for each [day](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/daily_ml_predictions.csv). 





## Database
The database that we chose to store the static data is PostgreSQL and pgAdmin is the tool that extracts the data from the database. The database is setup with four tables. They are **datevalue**, **bonweather**, **bonfishcounts**, and **combineddata**.
- *datevalue:* The datevalue table stores the values for the year, month and weeknumber that can be referenced by any given date between 1/1/1990 through 12/31/2021.
- *bonweather:* This table hold all weather data such as the max temperature, min temperature and the precipitation for any given date.
- *bonfishcounts:* The bonfishcounts table hold the steelhead count and the water temperature for all data in the date range specified in the datavalue tabledescription.
- *combineddata:* This table combines the data from the bonfishcounts, bonwether, and datevalue tables to produce a dataset that can be used later in the machine learning algorithm.

The combineddata table is extracted into jupyter notebook where it can be used in analysis through machine learning.

Code: 
- The connection string where the data is extracted from the database is found here => [Database Connection](https://github.com/mthalken/fish_count/blob/main/Notebooks/DB_Connection.ipynb)
- The schema that was used to create the tables are found here => [SQL Schema](https://github.com/mthalken/fish_count/blob/main/Resources/fish_schema.sql)




## Interactive Dashboard(In Progress)
[Google Slides](https://docs.google.com/presentation/d/12xjKybODUNdbOfk8_LaIQnlpM5YYDo1VpuQSZEZ8MsU/edit?usp=sharing)

Our interactive dashboard will allow users to put in a desired day to go fishing and our dashboard will return the following:
- Machine Learning predictions from historic data on Steelhead counts
- Current Weather Conditions
- Expected Weather Conditions
- Historical Data
    - counts
    - weather conditions
    - water temp
    - catch counts


We will use Tableau and pgAdmin for our final project. 
    

## Discussion 
Other external variables: 
- hatcheries
- ocean weather conditions
- river weather conditions
- sea lions




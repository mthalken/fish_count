# Fish Count Predictions

# Overview
The purpose of this analysis is to see if we can use machine learning on weather conditions including air temperature, precipitation, and water temperature to predict fish population counts at the Bonneville Dam on the Columbia River between Oregon and Washington. We want to be able to provide a tool for people to use to see whether based on historical data if the date they want to go fishing has been ideal and what the historical weather has been on that particular day. 

## Project Overview
1. Perform exploratory analysis. 
2. Use preprocessing to to prepare the data for the Machine Learning model.
3. Explore the Machine Learning models and evaluate the accuracy of the results.
4. Optimize the Machine Learning model.
5. Create and connect a Database using PostgreSQL.
6. Plan and implement an interactive dashboard with Machine Learning and Database connection.
7. Present dashboard and results. 

## Team
- Jeremy Petty  - [GitHub](https://github.com/jp3tty) | [LinkedIn](https://www.linkedin.com/in/jeremy-petty-7712a1207/) 
- John Garbett - [GitHub](https://github.com/jgarbett44) | [LinkedIn](https://www.linkedin.com/in/john-garbett-94699267/) 
- Lasitha Liyanage - [GitHub](https://github.com/LasithaL) | [LinkedIn](https://www.linkedin.com/in/lasitha-liyanage-5a599aa/) 
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
- Heroku


## Data Exploration
Code: [Preliminary code](https://github.com/mthalken/fish_count/blob/main/Notebooks/data_exploration.ipynb)

We combined data from Columbia Basin Research website and looked at Weeks, Months, Year, Maximum Temperature, Minimum Temperature, Precipitation, Water Temperature and Steelhead Count. We are attempting to answer our Null Hypothesis that weather conditions (air temperature, precipitation, water temperature) does not affect weekly steelhead counts. 

After cleaning the data we can see that there is an exponential growth with an increase in Steelhead Count in comparison to Max Air Temp and Water Temp. 

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

To preprocess our data we combined our csv [files](https://github.com/mthalken/fish_count/tree/main/Resources/BonFish) and [bonWeather.csv](https://github.com/mthalken/fish_count/blob/main/Resources/weather/bonWeather.csv), found the target columns and featured columns. Before we grouped by day, month, and year with an aggregate mean we created new dataframes for each fish type and dropped the NaN rows. 
- Target Column: stlheadcount, chinookcount, shadcount, sockeyecount, and cohocount
- Featured Columns: maxtempf, mintempf, precipitationinch, and watertempf

![png](https://github.com/mthalken/fish_count/blob/mthalken/Images/combineddate2.png)


## Machine Learning Model
Code: 
- [Preliminary code](https://github.com/mthalken/fish_count/blob/main/Notebooks/fish_ml_practice.ipynb)
- [Testing Types of Linear Regression](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/testing_types_of_linear_regression.ipynb)
- [Polynomial Regression](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/poly_regression.ipynb)
- [Polynomial Regression and Scaling](https://github.com/mthalken/fish_count/blob/mthalken/Notebooks/poly_regression_%26_scaling.ipynb)
- [Refactored Machine Learning Model](https://github.com/mthalken/fish_count/blob/main/Notebooks/ml_model_on_all_fish_types.ipynb)

Looking at our data and using machine learning to predict steelhead counts based on weather conditions we decided to use a supervised polynomial regression. For our train, test, and split we used the random state at 42 and the default test size of 25%. We choose to use the polynomial regression model as our data had exponential growth and was multivariate. We also tried other supervised machine learning models and were not able to reach the desired accuracy. 

Some limitations of a polynomial regression model is that the presence of a few outliers can have large effects on results and there are also fewer model validation tools for detecting outliers than there are in linear models.
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

After the initial machine learning model we decided to be able to tell a the story that we want we need to add other fish types to our dashboard. After taking the [total_data.csv](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/total_data.csv) and running it through our preprocessing in [DB_Connection.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/DB_Connection.ipynb) we used [daily_fish_grouping.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/daily_fish_grouping.ipynb) and [weekly_fish_grouping.ipynb](https://github.com/mthalken/fish_count/blob/main/Notebooks/weekly_fish_grouping.ipynb) to create [dailyWeatherTable.csv]() and [combineddata2.csv](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/combineddata2.csv). From the updated dataset we ran our [machine learning](https://github.com/mthalken/fish_count/blob/main/Notebooks/ml_model_on_all_fish_types.ipynb) for each fish type for week and day. After running the train, test, and predict we took the [dailyWeatherTable.csv](https://github.com/mthalken/fish_count/blob/main/Resources/weather/dailyWeatherTable.csv) and using our model predicted a fish count for each [day](https://github.com/mthalken/fish_count/blob/main/Resources/refactored_data/daily_ml_predictions.csv). We stuck with the polynomial regression and changed the train, test, and split random state at vary dependant on the fish. 

After running all fish through our machine learning model we took out Shad and Sockeye because the amount of data and the accuracy scores were not high enough.

Linear Regression Score:

![png](https://github.com/mthalken/fish_count/blob/main/Images/linear_regression_score.png)

Polynomial Regression Score:

![png](https://github.com/mthalken/fish_count/blob/main/Images/polynomial_regression_score.png)

Polynomial Regression Score with Random State:

![png](https://github.com/mthalken/fish_count/blob/main/Images/polynomial_regression_score_refactored_1.png)

Final Weekly Score:

![png](https://github.com/mthalken/fish_count/blob/main/Images/weekly_ml_accuracy.png)

Final Daily Score:

![png](https://github.com/mthalken/fish_count/blob/main/Images/daily_ml_accuracy.png)


## Database
The database that we chose to store the static data is HEROKU. PostgreSQL and pgAdmin is the tool that extracts the data from the database. The database is setup with six tables. They are **datevalue**, **bonweather**, **bonfishcounts**, **combineddata**, **cobineddata2**, and **daily_ml_predictions**.
- *datevalue:* The datevalue table stores the values for the year, month and weeknumber that can be referenced by any given date between 1/1/1990 through 12/31/2021.
- *bonweather:* This table hold all weather data such as the max temperature, min temperature and the precipitation for any given date.
- *bonfishcounts:* The bonfishcounts table hold the raw data steelhead, coho, chinook, sockeye, and chad counts and the water temperature for all data in the date range specified in the datavalue tabledescription.
- *combineddata:* This table combines the data from the bonfishcounts, bonwether, and datevalue tables to produce a dataset that can be used later in the machine learning algorithm. This table only carries steelhead count data.
- *combineddata2:* A second table was created to house an expanded set of data which include steelhead, coho, chinook, sockeye, chad count data and the water temperature in combination with the atmospheric data such as minimum temperature, maximum temperature and precipitation for a given day.
- *combineddata2:* Additional fish species were added to the combneddata table to create combineddata2. The final machine learning algorithms were applied to this table
- *ml_daily_predictions:* This tale carries the predicted values of steelhead, coho, chinnok, sockey, and chad associated with the historical weather data for a 365 days begining January 1 to December 31 over a 30 year period.

The combineddata table is cureently not being used in the data analysis. The combineddata2 table data is extracted into jupyter notebook where it can be used in analysis through machine learning.

Code: 
- The connection string where the data is extracted from the database is found here => [Database Connection](https://github.com/mthalken/fish_count/blob/main/Notebooks/DB_Connection.ipynb)
- The schema that was used to create the tables are found here => [SQL Schema](https://github.com/mthalken/fish_count/blob/main/Resources/fish_schema.sql)




## Interactive Dashboard

### Presentation
[Google Slides](https://docs.google.com/presentation/d/12xjKybODUNdbOfk8_LaIQnlpM5YYDo1VpuQSZEZ8MsU/edit?usp=sharing)

### Tableau
Click [here](https://public.tableau.com/app/profile/mike.thalken/viz/MT-Fish/Story1?publish=yes) to see the Tableau Story. 

![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_historic_1.png)
![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_historic_2.png)

![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_predictions_1.png)
![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_predictions_2.png)

![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_catch_1.png)
![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_catch_2.png)

![png](https://github.com/mthalken/fish_count/blob/main/Images/tableau_going_fishing.png)

## Results 
While we were able to get a high (>90%) accuracy score on steelhead we were not able to replicate that for the other fish types. There are many external variables that can affect fish counts including reproductive cycles, climate change, ocean and surrounding area weather conditions, sea lions, and hatchery releases. Further analysis will need to be done on each specific fish type to find the best machine learning model and accounting for fish cycles. We were able to determine that the accumulation of decreased rain and increased outdoor and water temperature does affect steelhead count at the Bonneville Dam. 

## Discussion 
Further opportunities for this project is to expand fish catch counts from just Steelhead to the other fish types. We could also add a map and location information based on fish count and catch data. Changing the type of machine learning depending on fish type would be another opportunity for model improvement. 





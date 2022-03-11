-- Creating tables for fish_count
CREATE TABLE DateValues (
	DateId INT NOT NULL,
	DateValue DATE NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	PRIMARY KEY (DateId)
);

CREATE TABLE BonFishCounts (
	CountId INT NOT NULL,
	YearWkValue VARCHAR(7) NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	LocationName VARCHAR(40),
	CountDate DATE NOT NULL,
	ChinookCount NUMERIC,
	StlheadCount NUMERIC,
	SockeyeCount NUMERIC,
	CohoCount NUMERIC,
	ChadCount NUMERIC,
	WaterTempF NUMERIC,
	PRIMARY KEY (CountId)
);

CREATE TABLE BonWeather (
	CountId INT NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	LocationName VARCHAR(40),
	DateRecorded DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	PRIMARY KEY (CountId)
);

CREATE TABLE CombinedData (
	CountId INT NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	LocationName VARCHAR(40),
	DateRecorded DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	WaterTempF NUMERIC,
	StlheadCount NUMERIC,
	PRIMARY KEY (CountId)
);

CREATE TABLE CombinedData2 (
	CountId INT NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	LocationName VARCHAR(40),
	DateRecorded DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	WaterTempF NUMERIC,
	StlheadCount NUMERIC,
	ChinookCount NUMERIC,
	SockeyeCount NUMERIC,
	CohoCount NUMERIC,
	ChadCount NUMERIC,
	PRIMARY KEY (CountId)
);

CREATE TABLE daily_ml_predictions (
	DayofYear NUMERIC NOT NULL,
	WeekNumber NUMERIC NOT NULL,
	DateRecorded DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	WaterTempF NUMERIC,
	StlheadPredict NUMERIC,
	ChinookPredict NUMERIC,
	CohoPredict NUMERIC,
	ChadPredict NUMERIC,
	SockeyePredict NUMERIC,
	PRIMARY KEY (DayofYear)
);
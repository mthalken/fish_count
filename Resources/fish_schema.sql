-- Creating tables for fish_count
CREATE TABLE DateValues (
	DateId INT NOT NULL,
	DateValue DATE NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber VARCHAR(2) NOT NULL,
	PRIMARY KEY (DateId)
);

CREATE TABLE BonFishCounts (
	CountId INT NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber VARCHAR(2) NOT NULL,
	LocationName VARCHAR(40),
	CountDate DATE NOT NULL,
	StlheadCount NUMERIC,
	WaterTempF NUMERIC,
	PRIMARY KEY (CountId)
);

CREATE TABLE BonWeather (
	CountId INT NOT NULL,
	YearValue VARCHAR(4) NOT NULL,
	MonthValue VARCHAR(2) NOT NULL,
	WeekNumber VARCHAR(2) NOT NULL,
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
	WeekNumber VARCHAR(2) NOT NULL,
	LocationName VARCHAR(40),
	DateRecorded DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	WaterTempF NUMERIC,
	StlheadCount NUMERIC
);
-- Creating tables for fish_count
CREATE TABLE BonFishCounts (
	CountId INT NOT NULL,
	YearWk VARCHAR(7) NOT NULL,
	YearValue INT NOT NULL,
	MonthValue INT NOT NULL,
	WeekNumber INT NOT NULL,
	LocationName VARCHAR(40),
	CountDate DATE NOT NULL,
	WaterTempC NUMERIC,
	StlheadCount INT,
	PRIMARY KEY (CountId)
);

CREATE TABLE BonWeather (
	CountId INT NOT NULL,
	YearWk VARCHAR(7) NOT NULL,
	YearValue INT NOT NULL,
	MonthValue INT NOT NULL,
	WeekNumber INT NOT NULL,
	LocationName VARCHAR(40),
	CountDate DATE NOT NULL,
	MaxTempF NUMERIC,
	MinTempF NUMERIC,
	PrecipitationInch NUMERIC,
	FOREIGN KEY (CountId) REFERENCES BonFishCounts (CountId),
	PRIMARY KEY (CountId)
);
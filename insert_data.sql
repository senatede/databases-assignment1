USE ASSIGNMENT1;

-- US Presidents
LOAD DATA LOCAL INFILE '/Users/admin/Documents/mysql/databases-assignment1/data/us_presidents.csv'
INTO TABLE presidents
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@president, @start, @end, @party)
SET
    president = @president,
    start_date = STR_TO_DATE(@start, '%M %d, %Y'),
    end_date = STR_TO_DATE(@end, '%M %d, %Y'),
    party = @party;


-- US military spending
LOAD DATA LOCAL INFILE '/Users/admin/Documents/mysql/databases-assignment1/data/military_spending.csv'
INTO TABLE military_spending
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@year, @defense_budget, @gdp, @population)
SET
	year = @year,
    defense_budget = @defense_budget,
    gdp = @gdp,
    population = @population;

-- US military bases
LOAD DATA LOCAL INFILE '/Users/admin/Documents/mysql/databases-assignment1/data/military_bases.csv'
INTO TABLE military_bases
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@site_name, @component, @country, @state_territory, @operation_status, @creation_year)
SET
    site_name = @site_name,
    component = @component,
    country = @country,
    state_territory = @state_territory,
    operation_status = @operation_status,
    creation_year = @creation_year;


-- US military intervations
LOAD DATA LOCAL INFILE '/Users/admin/Documents/mysql/databases-assignment1/data/military_interventions.csv'
INTO TABLE military_interventions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@name, @state, @region, @president, @start_year, @end_year)
SET
    name = @name,
    state = @state,
    region = @region,
    president = @president,
    start_year = @start_year,
    end_year = NULLIF(@end_year,'');
    

-- US school shooting
LOAD DATA LOCAL INFILE '/Users/admin/Documents/mysql/databases-assignment1/data/school_shootings.csv'
INTO TABLE school_shootings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@date, @city, @state, @school, @fatalities, @wounded)
SET
    date = STR_TO_DATE(@date, '%m/%d/%Y'),
    city = @city,
    state = @state,
    school = NULLIF(@school, ''),
	fatalities = NULLIF(@fatalities, ''),
    wounded = NULLIF(@wounded, '');
DROP DATABASE ASSIGNMENT1;
CREATE DATABASE ASSIGNMENT1;
USE ASSIGNMENT1;

-- US Presidents
CREATE TABLE presidents (
    president VARCHAR(100),
    start_date DATE,
    end_date DATE,
    party VARCHAR(50)
);

-- US military spending
CREATE TABLE military_spending (
    year INT,
    defense_budget DECIMAL(10,3),
    gdp DECIMAL(10,2),
    population DECIMAL(10,3)
);

-- US military bases
CREATE TABLE military_bases (
    site_name VARCHAR(150),
    component VARCHAR(100),
    country VARCHAR(100),
    state_territory VARCHAR(100),
    operation_status VARCHAR(50),
    creation_year INT
);

-- US military intervations
CREATE TABLE military_interventions (
    name VARCHAR(150),
    state VARCHAR(100),
    region VARCHAR(100),
    president VARCHAR(100),
    start_year INT,
    end_year INT NULL
);

-- US school shooting
CREATE TABLE school_shootings (
    date DATE,
    city VARCHAR(100),
    state VARCHAR(50),
    school VARCHAR(10) NULL,
    fatalities INT NULL,
    wounded INT NULL
);

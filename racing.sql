CREATE DATABASE racing;

SELECT current_database();

CREATE TABLE teams (
    teams_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE drivers (
    drivers_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    birth_date_year INT NOT NULL
)
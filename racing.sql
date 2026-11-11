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
    birth_date_year INT NOT NULL,
    team_id INT NOT NULL,

    CONSTRAINT fk_drivers_team
        FOREIGN KEY (team_id) REFERENCES teams (teams_id)
        ON DELETE RESTRICT
);

CREATE TABLE races(
    races_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    circuit VARCHAR(50) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE result(
    driver_id INTEGER NOT NULL,
    race_id INTEGER NOT NULL,
    start_position INTEGER CHECK (start_position>0),
    finish_position INTEGER CHECK (finish_position>0),
    PRIMARY KEY (driver_id, race_id),
    CONSTRAINT fk_results_driver
        foreign key (driver_id) REFERENCES drivers(drivers_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_result_race
        foreign key (race_id) REFERENCES races(races_id)
        ON DELETE RESTRICT
);

-- 1. teams
INSERT INTO teams (name, country) VALUES
    ('McLaren', 'Storbritannien'),
    ('Mercedes', 'Tyskland'),
    ('Red Bull Racing', 'Österrike'),
    ('Ferrari', 'Italien');


-- 2. races
INSERT INTO races (name, circuit, country) VALUES
    ('Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Belgien'),
    ('Japanese Grand Prix', 'Suzuka International Racing Course', 'Japan'),
    ('Monaco Grand Prix', 'Circuit de Monaco', 'Monaco'),
    ('Italian Grand Prix', 'Autodromo Nazionale Monza', 'Italien');


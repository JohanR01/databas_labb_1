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

-- 3. drivers
INSERT INTO drivers (name, birth_date_year, team_id) VALUES
    ('Lando Norris', 1999, 1),
    ('Oscar Piastri', 2001, 1),
    ('George Russell', 1998, 2),
    ('Kimi Antonelli', 2006, 2),
    ('Max Verstappen', 1997, 3),
    ('Isack Hadjar', 2004, 3),
    ('Charles Leclerc', 1997, 4),
    ('Lewis Hamilton', 1985, 4);


--4. results
Insert INTO result (driver_id, race_id, start_position, finish_position) VALUES
    (1, 1, 2, 5), (2, 1, 4, 6), (3, 1, 1, 1), (4, 1, 3, 2), (5, 1, 6, 7), (6, 1, 8, NULL), (7, 1, 5, 3), (8, 1, 7, 4),
    (1, 2, 1, 1), (2, 2, 2, 2), (3, 2, 3, 4), (4, 2, 6, 5), (5, 2, 4, 3), (6, 2, 8, 8), (7, 2, 5, 6), (8, 2, 7, 7),
    (1, 3, 4, 3), (2, 3, 5, 5), (3, 3, 3, 2), (4, 3, 6, 6), (5, 3, 7, 7), (6, 3, 8, 8), (7, 3, 1, 1), (8, 3, 2, 4);


-- Test kommandon
SELECT drivers.name FROM drivers;

Insert INTO drivers(name, birth_date_year, team_id) VALUES ('Joe Doe', 2026, 4);

SELECT drivers.name, drivers_id
FROM drivers
WHERE drivers.birth_date_year = 2026;

UPDATE drivers
SET name = 'Joe Doe 2'
WHERE drivers.name = 'Joe Doe';

DELETE FROM drivers
WHERE name = 'Joe Doe 2';

SELECT name FROM drivers;

Insert INTO teams(name, country) VALUES('nocco', 'sverige');
Insert INTO drivers(name, birth_date_year, team_id) VALUES ('Joe Doe', 2026, 6);

SELECT * FROM teams
WHERE name ='nocco';

DELETE FROM drivers
WHERE team_id = 6;

DELETE FROM teams
WHERE name = 'nocco';

SELECT * FROM teams
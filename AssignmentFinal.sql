-- Active: 1747488653773@@127.0.0.1@5432@final_test
-- Rangers Table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- Species Table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

-- Sightings Table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species (species_id) ON DELETE CASCADE,
    ranger_id INT REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    location VARCHAR(100) NOT NULL,
    sighting_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

-- DROP TABLE rangers;

-- DROP TABLE species;

-- DROP TABLE sightings;

SELECT * FROM rangers;

SELECT * FROM species;

SELECT * FROM sightings;

-- Active: 1747412702955@@localhost@5432@conservation_db

-- Insert data into rangers
INSERT INTO
    rangers (ranger_id, name, region)
VALUES (
        1,
        'Alice Green',
        'Northern Hills'
    ),
    (2, 'Bob White', 'River Delta'),
    (
        3,
        'Carol King',
        'Mountain Range'
    );

-- Insert data into species
INSERT INTO
    species (
        species_id,
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        1,
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        2,
        'Bengal Tiger',
        'Panthera tigris tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        3,
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Vulnerable'
    ),
    (
        4,
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

-- Insert data into sightings
INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

-- Problem 1 - Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO
    rangers (ranger_id, name, region)
VALUES (
        4,
        'Derek Fox',
        'Coastal Plains'
    );

-- Problem 2 - Count unique species ever sighted.
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- Problem 3 - Find all sightings where the location includes "Pass".
SELECT * FROM sightings WHERE location LIKE '%Pass';

-- Problem 4 - List each ranger's name and their total number of sightings.
SELECT r.name AS name, COUNT(s.sighting_id) AS total_sightings
FROM rangers AS r
    LEFT JOIN sightings AS s ON r.ranger_id = s.ranger_id
GROUP BY
    r.name
HAVING
    COUNT(s.sighting_id) > 0
ORDER BY r.name;

-- Problem 5 - List species that have never been sighted.
SELECT common_name
FROM species
    LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE
    sightings.sighting_id IS NULL;

-- Problem 6 - Show the most recent 2 sightings.
SELECT common_name, sighting_time, name
FROM
    sightings
    JOIN species ON sightings.species_id = species.species_id
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;

-- Problem 7 - Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    EXTRACT(
        YEAR
        FROM discovery_date
    ) < 1800;

-- Problem 8 - Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
-- SELECT
--     sighting_id,
--     CASE
--         WHEN EXTRACT(
--             HOUR
--             FROM sighting_time
--         ) < 12 THEN 'Morning'
--         WHEN EXTRACT(
--             HOUR
--             FROM sighting_time
--         ) >= 12
--         AND EXTRACT(
--             HOUR
--             FROM sighting_time
--         ) < 17 THEN 'Afternoon'
--         ELSE 'Evening'
--     END AS time_of_day
-- FROM sightings;

SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) >= 12 
             AND EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 9 - Delete rangers who have never sighted any species.
DELETE FROM rangers
WHERE
    NOT EXISTS (
        SELECT
        FROM sightings
        WHERE
            sightings.ranger_id = rangers.ranger_id
    );
-- Link to picture of schema

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE "planets" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "orbital_period_in_years" FLOAT   NOT NULL,
    "orbits_around" TEXT   NOT NULL,
    "galaxy_id" INT   NOT NULL,
    "moons" TEXT   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "galaxy" (
    "id" serial   NOT NULL,
    "galaxy_name" TEXT   NOT NULL,
    CONSTRAINT "pk_galaxy" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "galaxy" ADD CONSTRAINT "fk_galaxy_id" FOREIGN KEY("id")
REFERENCES "planets" ("galaxy_id");

INSERT INTO galaxy
  (galaxy_name)
VALUES
  ('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 1, '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 1, '{}'),
  ('Neptune', 164.8, 'The Sun', 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1, '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1, '{}');
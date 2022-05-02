-- Link to the picture of the schema: https://drive.google.com/file/d/1hG_1vS-0dqUuji27MQaTtbFr-sbSoH9m/view?usp=sharing

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "songs" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "duration_in_seconds" int   NOT NULL,
    "release_date" date   NOT NULL,
    "artist" text   NOT NULL,
    "album" text   NOT NULL,
    "producers" text   NOT NULL,
    CONSTRAINT "pk_songs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "album" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    CONSTRAINT "pk_album" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "artist" (
    "id" serial   NOT NULL,
    "full_name" text   NOT NULL,
    CONSTRAINT "pk_artist" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "producer" (
    "id" serial   NOT NULL,
    "full_name" text   NOT NULL,
    CONSTRAINT "pk_producer" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "album" ADD CONSTRAINT "fk_album_id" FOREIGN KEY("id")
REFERENCES "songs" ("album");

ALTER TABLE "artist" ADD CONSTRAINT "fk_artist_id" FOREIGN KEY("id")
REFERENCES "songs" ("artist");

ALTER TABLE "producer" ADD CONSTRAINT "fk_producer_id" FOREIGN KEY("id")
REFERENCES "songs" ("producers");

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- -- VALUES
-- --   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
-- --   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
-- --   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
-- --   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
-- --   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
-- --   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
-- --   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
-- --   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
-- --   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
-- --   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

INSERT INTO producer
  (full_name)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

INSERT INTO artist
  (full_name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

INSERT INTO album
  (title)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO songs
  (title, duration_in_seconds, release_date, album, artist, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 2),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 3),
  ('Shallow', 216, '09-27-2018', 4, 4, 4),
  ('How You Remind Me', 223, '08-21-2001', 5, 5, 5),
  ('New York State of Mind', 276, '10-20-2009', 6, 6, 6),
  ('Dark Horse', 215, '12-17-2013', 7, 7, 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8, 8, 9),
  ('Complicated', 244, '05-14-2002', 9, 9, 10),
  ('Say My Name', 240, '11-07-1999', 10, 10, 11);



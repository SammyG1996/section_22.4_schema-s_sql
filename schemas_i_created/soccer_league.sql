-- Link to the picture of the schema: https://drive.google.com/file/d/1jeG_knOMP8XU9WavVdCdRGh_f_zlt9A2/view?usp=sharing

-- This table will hold all of the data for the league. It will have the team's name. 
-- It will also contain that leagues start and end dates, and their rankings. This table is
-- Used as a reference whenever a league is mentioned in another table. 
CREATE TABLE "League" (
    "id" serial   NOT NULL,
    "team_name" text   NOT NULL,
    "season_start_date" text   NOT NULL,
    "season_end_date" text   NOT NULL,
    "league_ranking" int   NOT NULL,
    CONSTRAINT "pk_League" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_League_team_name" UNIQUE (
        "team_name"
    )
);

-- This table contains all the players that are in all the leauges, and what Leauge they belong too (by referencing the leauge table).
-- The table also contains the players first and last name.
CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "legue_id" int   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

-- This table contains all the referees by first and last name.
CREATE TABLE "Referees" (
    "id" serial   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

-- This table keeps track of every individual game. It contains the 2 teams (referencing the League table). It also has the date that the game occured.
CREATE TABLE "Game" (
    "id" serial   NOT NULL,
    "team_1" int   NOT NULL,
    "team_2" int   NOT NULL,
    "game_date" text   NOT NULL,
    CONSTRAINT "pk_Game" PRIMARY KEY (
        "id"
     )
);

-- This table will contain all the stats that belong to a specific game using the game id as a special indicator.
-- It also refrences the player table.
CREATE TABLE "Game_Stats" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    "score_count" int   NOT NULL,
    CONSTRAINT "pk_Game_Stats" PRIMARY KEY (
        "id"
     )
);

-- Using the same game table reference this table is used to hold all the referees for a game. 
CREATE TABLE "Game_Referees" (
    "id" serial   NOT NULL,
    "referee_id" int   NOT NULL,
    "game_id" int   NOT NULL,
    CONSTRAINT "pk_Game_Referees" PRIMARY KEY (
        "id"
     )
);

-- Below contains all the constraits for the foreign keys. 
ALTER TABLE "League" ADD CONSTRAINT "fk_League_id" FOREIGN KEY("id")
REFERENCES "Players" ("legue_id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_id" FOREIGN KEY("id")
REFERENCES "Game_Stats" ("player_id");

ALTER TABLE "Referees" ADD CONSTRAINT "fk_Referees_id" FOREIGN KEY("id")
REFERENCES "Game_Referees" ("referee_id");

ALTER TABLE "Game" ADD CONSTRAINT "fk_Game_id" FOREIGN KEY("id")
REFERENCES "Game_Referees" ("game_id");


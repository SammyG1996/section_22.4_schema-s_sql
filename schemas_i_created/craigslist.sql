-- Link to picture of Schema: https://drive.google.com/file/d/1DUhsiCz1Kp7nT6Nq7bqqahm6tFAQo99-/view?usp=sharing

-- This is the table that will hold all of the posts
CREATE TABLE "Posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "description" text   NOT NULL,
    "region_id" int   NOT NULL,
    "zip_code" int   NOT NULL,
    "user" int   NOT NULL,
    "categroy_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

-- This is table contains all the different regions available and is referenced by the posts table
CREATE TABLE "Region" (
    "id" serial   NOT NULL,
    "region" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

-- This is the users table. It will contain all the users on the platform. It is used by the posts table to reference the user who created the post.
CREATE TABLE "Users" (
    "id" serial   NOT NULL,
    "username" text   NOT NULL,
    "first_name" text   NOT NULL,
    "last_name" text   NOT NULL,
    "prefered_region" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Users_username" UNIQUE (
        "username"
    )
);

-- This table contains the zip codes. It is used by the post table to access the City. 
CREATE TABLE "Zip_code" (
    "id" serial   NOT NULL,
    "zip_code" int   NOT NULL,
    "City" text   NOT NULL,
    CONSTRAINT "pk_Zip_code" PRIMARY KEY (
        "id"
     )
);

-- The category table contains all the categories available on the platform. This is then used by the post table to specify which category it belongs to. 
CREATE TABLE "Category" (
    "id" serial   NOT NULL,
    "catergory_name" text   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);


-- These contain all the constraints for the foreign ID's
ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Region" ADD CONSTRAINT "fk_Region_id" FOREIGN KEY("id")
REFERENCES "Users" ("prefered_region");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_id" FOREIGN KEY("id")
REFERENCES "Posts" ("user");

ALTER TABLE "Zip_code" ADD CONSTRAINT "fk_Zip_code_zip_code" FOREIGN KEY("zip_code")
REFERENCES "Posts" ("zip_code");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_id" FOREIGN KEY("id")
REFERENCES "Posts" ("categroy_id");


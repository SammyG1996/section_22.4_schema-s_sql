-- Link to schema: https://drive.google.com/file/d/12X1ks2JN0Lrbmxd6-RrS-4zUtPT7DmY3/view?usp=sharing

-- This will hold the individual doctors 
CREATE TABLE "Doctors" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

-- This will hold the individual patients
CREATE TABLE "Patients" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

-- This will create an id to reference that specific visit. The DOCTOR and the PATIENT will be on here
CREATE TABLE "Visits" (
    "id" serial   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

-- Then I have another table called "Diseases". You'll be able to put all the diseases in here and you can link them all the rows that 
-- belong to that visit by the "visit_id" which is a foreign key referencing the visits table. 
CREATE TABLE "Diseases" (
    "id" serial   NOT NULL,
    "visit_id" int   NOT NULL,
    "disease_name" text   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

-- These will add the constraints to the foreign keys. 
ALTER TABLE "Doctors" ADD CONSTRAINT "fk_Doctors_id" FOREIGN KEY("id")
REFERENCES "Visits" ("doctor_id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_id" FOREIGN KEY("id")
REFERENCES "Visits" ("patient_id");

ALTER TABLE "Diseases" ADD CONSTRAINT "fk_Diseases_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");


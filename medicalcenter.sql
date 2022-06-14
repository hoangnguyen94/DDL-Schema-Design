-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Doctor" (
    "Id" int   NOT NULL,
    "Name" TEXT   NOT NULL,
    "Specialty" TEXT   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Visits" (
    "Id" int   NOT NULL,
    "Doctor_id" int   NOT NULL,
    "Patient_id" int   NOT NULL,
    "Date" DATE   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Patients" (
    "Id" int   NOT NULL,
    "Name" TEXT   NOT NULL,
    "Insurance" TEXT   NOT NULL,
    "Birthday" DATE   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Diseases" (
    "Id" int   NOT NULL,
    "Name" TEXT   NOT NULL,
    "Description" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "Id"
     )
);

CREATE TABLE "Diagnoses" (
    "Id" int   NOT NULL,
    "visit_id" int   NOT NULL,
    "diseases_id" int   NOT NULL,
    "notes" TEXT   NOT NULL,
    CONSTRAINT "pk_Diagnoses" PRIMARY KEY (
        "Id"
     )
);

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_Id" FOREIGN KEY("Id")
REFERENCES "Visits" ("Doctor_id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_Id" FOREIGN KEY("Id")
REFERENCES "Diagnoses" ("visit_id");

ALTER TABLE "Patients" ADD CONSTRAINT "fk_Patients_Id" FOREIGN KEY("Id")
REFERENCES "Visits" ("Patient_id");

ALTER TABLE "Diseases" ADD CONSTRAINT "fk_Diseases_Id" FOREIGN KEY("Id")
REFERENCES "Diagnoses" ("diseases_id");


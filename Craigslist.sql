-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Regions" (
    "ID" int   NOT NULL,
    "Name" Text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Posts" (
    "ID" int   NOT NULL,
    "Title" TEXT   NOT NULL,
    "Text" TEXT   NOT NULL,
    "Location" ADDRESS   NOT NULL,
    "User_id" int   NOT NULL,
    "Regions_id" int   NOT NULL,
    "Category_id" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Users" (
    "ID" int   NOT NULL,
    "Username" USER   NOT NULL,
    "Encrypted_password" PASSWORD   NOT NULL,
    "Preferred_region_id" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Categories" (
    "ID" int   NOT NULL,
    "Name" Text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_User_id" FOREIGN KEY("User_id")
REFERENCES "Users" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_Regions_id" FOREIGN KEY("Regions_id")
REFERENCES "Regions" ("ID");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_Category_id" FOREIGN KEY("Category_id")
REFERENCES "Categories" ("ID");


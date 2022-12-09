-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/PUbDXG
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Create the Diagram for all six csv files.

CREATE TABLE "Associates" (
    "Associate_UIK" varchar   NOT NULL,
    "Positions" varchar   NOT NULL,
    "Account" varchar   NOT NULL,
    CONSTRAINT "pk_Associates" PRIMARY KEY (
        "Associate_UIK"
     )
);

CREATE TABLE "Position_info" (
    "Positions" varchar   NOT NULL,
    "Base_wage" float   NOT NULL,
    "Incentive" varchar   NOT NULL,
    "Base_OT" varchar   NOT NULL,
    "Incentive_OT" varchar   NOT NULL
);

CREATE TABLE "SKU_Master" (
    "SKU_id_number" varchar   NOT NULL,
    "Description" varchar   NOT NULL,
    "Run_rate" varchar   NOT NULL,
    "Hourly_run_rate" float   NOT NULL,
    "Case_cost" varchar   NOT NULL,
    "Position_case" varchar   NOT NULL,
    CONSTRAINT "pk_SKU_Master" PRIMARY KEY (
        "SKU_id_number"
     )
);

CREATE TABLE "Volume" (
    "SKU_id" int   NOT NULL,
    "Production_volume" float   NOT NULL,
    "Dates" date   NOT NULL,
    CONSTRAINT "pk_Volume" PRIMARY KEY (
        "SKU_id"
     )
);

CREATE TABLE "Payroll" (
    "Associates_UIK" int   NOT NULL,
    "Pay" float   NOT NULL,
    "Dates" date   NOT NULL,
    CONSTRAINT "pk_Payroll" PRIMARY KEY (
        "Associates_UIK"
     )
);

ALTER TABLE "Associates" ADD CONSTRAINT "fk_Associates_Positions" FOREIGN KEY("Positions")
REFERENCES "Position_info" ("Positions");

ALTER TABLE "Position_info" ADD CONSTRAINT "fk_Position_info_Base_wage" FOREIGN KEY("Base_wage")
REFERENCES "SKU_Master" ("Hourly_run_rate");

ALTER TABLE "SKU_Master" ADD CONSTRAINT "fk_SKU_Master_Case_cost" FOREIGN KEY("Case_cost")
REFERENCES "Volume" ("Production_volume");

ALTER TABLE "Payroll" ADD CONSTRAINT "fk_Payroll_Dates" FOREIGN KEY("Dates")
REFERENCES "Volume" ("Dates");


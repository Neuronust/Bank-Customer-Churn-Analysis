-- =========================
-- CREATE TABLES
-- =========================
DROP TABLE "bank_churn";
CREATE TABLE "bank_churn" (
  "CustomerId" varchar,
  "CreditScore" numeric,
  "GeographyID" int,
  "GenderID" int,
  "Age" int,
  "Tenure" int,
  "Balance" numeric,
  "NumOfProducts" int,
  "HasCrCard" int,
  "IsActiveMember" int,
  "EstimatedSalary" numeric,
  "Exited" int,
  "Bank_DOJ" text
);



drop TABLE "activecustomer";
CREATE TABLE "activecustomer" (
  "ActiveID" int PRIMARY KEY,
  "ActiveCategory" text
);
drop TABLE "customerinfo";
CREATE TABLE "customerinfo" (
  "CustomerId" varchar PRIMARY KEY,
  "Surname" text
);

drop TABLE "gender";
CREATE TABLE "gender" (
  "GenderID" int PRIMARY KEY,
  "GenderCategory" text
);

drop TABLE "creditcard";
CREATE TABLE "creditcard" (
  "CreditID" int PRIMARY KEY,
  "Category" text
);

drop TABLE "exitcustomer";
CREATE TABLE "exitcustomer" (
  "ExitID" int PRIMARY KEY,
  "ExitCategory" text
);

drop TABLE "geography";
CREATE TABLE "geography" (
  "GeographyID" int PRIMARY KEY,
  "GeographyLocation" text
);

\COPY activecustomer
FROM 'C:/Users/Septian/Documents/Datasets/DataSets/Bank churn/ActiveCustomer.xlsx' DELIMITER ',' CSV HEADER
;

\COPY activecustomer FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\ActiveCustomer.csv' DELIMITER ',' CSV HEADER;
\COPY creditcard FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\CreditCard.csv' DELIMITER ',' CSV HEADER;
\COPY exitcustomer FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\ExitCustomer.csv' DELIMITER ',' CSV HEADER;
\COPY customerinfo FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\customerinfo.csv' DELIMITER ',' CSV HEADER;
\COPY gender FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\gender.csv' DELIMITER ',' CSV HEADER;
\COPY geography FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\geography.csv' DELIMITER ',' CSV HEADER;
\COPY bank_churn FROM 'C:\Users\Septian\Documents\Datasets\DataSets\Bank churn\bank_churn.csv' DELIMITER ',' CSV HEADER;

-- =========================
-- DATA CLEANING
-- =========================
SELECT
	"CustomerId", 
	TRIM(regexp_replace("Surname",'[^a-zA-Z0-9]','','g'))
FROM customerinfo;

SELECT
	*,
	CASE
		WHEN "Bank_DOJ" LIKE '%-%' THEN To_date("Bank_DOJ",'DD-MM-YYYY')
		WHEN "Bank_DOJ" LIKE '%/%' THEN TO_DATE("Bank_DOJ",'MM-DD-YYYY')
	END
FROM bank_churn bc;

--update bank_churn table
ALTER TABLE bank_churn
ALTER COLUMN "Bank_DOJ" TYPE DATE
USING
	CASE
		WHEN "Bank_DOJ" LIKE '%-%' THEN To_date("Bank_DOJ",'DD-MM-YYYY')
		WHEN "Bank_DOJ" LIKE '%/%' THEN TO_DATE("Bank_DOJ",'MM-DD-YYYY')
	END;

-- update customerinfo table
UPDATE customerinfo
SET "Surname"= TRIM(regexp_replace("Surname",'[^a-zA-Z0-9]','','g'));
	
-- =========================
-- ADD CONSTRAINTS (FK)
-- =========================
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("CustomerId") REFERENCES "customerinfo" ("CustomerId") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("GeographyID") REFERENCES "geography" ("GeographyID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("Exited") REFERENCES "exitcustomer" ("ExitID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("HasCrCard") REFERENCES "creditcard" ("CreditID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("GenderID") REFERENCES "gender"("GenderID") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "bank_churn" ADD FOREIGN KEY ("IsActiveMember") REFERENCES "activecustomer"("ActiveID") DEFERRABLE INITIALLY IMMEDIATE;

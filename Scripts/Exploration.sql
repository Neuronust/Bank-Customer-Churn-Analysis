--Data Cleaning
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
ALTER TABLE customerinfo
ALTER COLUMN "Surname" TYPE text
USING
	TRIM(regexp_replace("Surname",'[^a-zA-Z0-9]','','g'));

SELECT
	MAX("Bank_DOJ"),
	MiN("Bank_DOJ")
FROM bank_churn bc ;

--
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH,
    constraint_name,
    constraint_type,
    column_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'exitcustomer';

SELECT DISTINCT 
	"GeographyLocation"
FROM geography g;

SELECT 
	*
FROM geography g
	
-- Retrieve a list of unique countries
SELECT DISTINCT  
	"GeographyLocation"
FROM geography;

-- Retrieve a list of unique customer activity statuses
SELECT DISTINCT  
	"ActiveCategory"
FROM activecustomer;

-- Retrieve a list of unique credit card categories
SELECT DISTINCT  
	"Category"
FROM creditcard;

-- Retrieve a list of unique customer churn statuses
SELECT DISTINCT 
	"ExitCategory"
FROM exitcustomer;

-- Retrieve a list of unique customer genders
SELECT DISTINCT 
	"GenderCategory"
FROM gender;
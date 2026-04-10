--Find churn rate by gender
SELECT
	"GenderCategory",
	AVG("Exited") AS churn_rate
FROM bank_churn bc 
JOIN gender g ON bc."GenderID" = g."GenderID"
GROUP BY "GenderCategory";

--total customers by gender
SELECT
	"GenderCategory",
	"ExitCategory",
	COUNT(DISTINCT "CustomerId") AS total_customer	
FROM bank_churn bc 
JOIN gender g ON bc."GenderID" = g."GenderID"
JOIN exitcustomer e ON bc."Exited"=e."ExitID"
GROUP BY 
	"GenderCategory",
	"ExitCategory";

--Find total customers by countries
SELECT
	"GeographyLocation",
	COUNT(DISTINCT "CustomerId") AS total_customer,
	AVG("Exited") AS churn_rate
FROM bank_churn bc 
JOIN geography g2 ON bc."GeographyID" = g2."GeographyID"
GROUP BY "GeographyLocation";

--Find total customers by churn status
SELECT
    "ExitCategory",
    COUNT(DISTINCT "CustomerId") AS total
FROM bank_churn bc
JOIN exitcustomer e ON bc."Exited"=e."ExitID" 
GROUP BY "ExitCategory";



--Do customers that has credit card tend to churn more?
 SELECT
 	"ExitCategory",
    "Category",
    COUNT( bc."CustomerId")total_customer
FROM bank_churn bc
JOIN exitcustomer e ON bc."Exited"=e."ExitID"
JOIN creditcard c ON bc."HasCrCard"=c."CreditID"  
GROUP BY "ExitCategory",
    "Category"; 

--Which group (by number of products) has the highest churn rate?
SELECT
    "NumOfProducts",
    AVG("Exited") AS churn_rate
FROM bank_churn
GROUP BY "NumOfProducts"
ORDER BY "NumOfProducts";

--churn_rate by customer active and inactive
SELECT
    "IsActiveMember",
    COUNT(*) AS total_customer,
    AVG("Exited") AS churn_rate
FROM bank_churn
GROUP BY "IsActiveMember";

--Correlation
SELECT
	CORR("Age","Exited") AS corr_age_churn,
	 CORR("CreditScore", "Exited") AS corr_credit_churn,
	 CORR("Balance", "Exited") AS corr_balance_churn,
	 CORR("NumOfProducts", "Exited") AS corr_prod_churn,
	 CORR("Tenure", "Exited") AS corr_tenure_churn
FROM bank_churn;
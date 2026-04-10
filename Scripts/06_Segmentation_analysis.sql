--Churn rate by Creditscore
SELECT
	ROUND(AVG("Exited") ,2)AS churn_rate,
	CASE 
		WHEN "CreditScore" BETWEEN 300 AND 579 THEN 'Poor'
		WHEN "CreditScore" BETWEEN 580 AND 669 THEN 'Fair'
		WHEN "CreditScore" BETWEEN 670 AND 739 THEN 'Good'
		WHEN "CreditScore" BETWEEN 740 AND 799 THEN 'Very Good'
		ELSE 'Excellent'
	END AS credit_category
FROM bank_churn
GROUP BY credit_category;

--Churn rate by balance
WITH balance AS(
	SELECT 
		"CustomerId",
		"Exited",
		"Balance",
		"ActiveCategory",
		CASE 
		    WHEN "Balance" = 0 THEN 'Zero Balance'
		    WHEN "Balance" <= 30000 THEN '0-30k'
		    WHEN "Balance" <= 60000 THEN '30k-60k'
		    WHEN "Balance" <= 90000 THEN '60k-90k'
		    WHEN "Balance" <= 120000 THEN '90k-120k'
		    WHEN "Balance" <= 150000 THEN '120k-150k'
		    ELSE '>150k'
		END AS balance_account
	FROM bank_churn bc
	JOIN activecustomer a ON bc."IsActiveMember"=a."ActiveID"
)
SELECT
	COUNT("CustomerId") AS total_customer,
	AVG("Exited") AS churn_rate,
	balance_account,
	"ActiveCategory"
FROM balance
GROUP BY 
	balance_account,
	"ActiveCategory"
ORDER BY churn_rate DESC;

--churn_rate by customer age
WITH age AS(
	SELECT
		"ActiveCategory",
		"CustomerId",
		"Exited",
		CASE
			WHEN "Age" BETWEEN 0 AND 20 THEN '<21'
			WHEN "Age" BETWEEN 21 AND 30 THEN '21-30'
			WHEN "Age" BETWEEN 31 AND 40 THEN '31-40'
			WHEN "Age" BETWEEN 41 AND 50 THEN '41-50'
			WHEN "Age" BETWEEN 51 AND 60 THEN '51-60'
			WHEN "Age" BETWEEN 61 AND 70 THEN '61-70'
			ELSE '>70'
		END AS age_range
	FROM bank_churn bc
	JOIN activecustomer a ON bc."IsActiveMember"=a."ActiveID"
)
SELECT
	"ActiveCategory",
	age_range,
	COUNT(DISTINCT "CustomerId") AS total_customer,
	AVG("Exited") AS churn_rate
FROM age
GROUP BY 
	age_range,
	"ActiveCategory"
ORDER BY churn_rate;

	
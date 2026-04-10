--Find the total balance
SELECT
	SUM("Balance") AS total_balance
FROM bank_churn;

--Find the average and Median Salary
SELECT
    AVG("Balance") AS mean_balance,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY "Balance") AS median_balance
FROM bank_churn;

--Find the Average Credit Score
SELECT
	AVG("CreditScore") AS avg_creditscore
FROM bank_churn;

--Find the Total customer
SELECT
	COUNT(DISTINCT "CustomerId") AS total_customer
FROM bank_churn;

--Find the Average Tenure
SELECT
	AVG("Tenure")
FROM bank_churn;
--Find the Average NumofProduct
SELECT
	AVG("NumOfProducts")
FROM bank_churn;

--Find the total churn and churn rate
SELECT
	SUM("Exited") AS total_churn,
	AVG("Exited") AS churn_rate
FROM bank_churn;

--Find the total customer active
SELECT
	COUNT("CustomerId")
FROM bank_churn 
WHERE "IsActiveMember" = 1


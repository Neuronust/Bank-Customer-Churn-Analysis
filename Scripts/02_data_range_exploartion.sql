-- Find the youngest and oldest customers based on age
SELECT
	MIN("Age") AS youngest_age,
	Max("Age") AS oldest_age
FROM bank_churn;

-- Determine the first and last of customers join date and the total duration in month
SELECT
MIN("Bank_DOJ"),
MAX("Bank_DOJ"),
(EXTRACT(YEAR FROM MAX("Bank_DOJ")) - EXTRACT(YEAR FROM MIN("Bank_DOJ"))) * 12 +
	(EXTRACT(MONTH FROM MAX("Bank_DOJ")) - EXTRACT(MONTH FROM MIN("Bank_DOJ"))) AS total_month
FROM bank_churn;

--Find the highest and lowest customer creditscore
SELECT
	MIN("CreditScore") AS max_credit,
	Max("CreditScore") AS min_credit
FROM bank_churn;

--Find the highest and lowest Balance
SELECT
	MIN("Balance") AS lowest,
	MAX("Balance") AS highest
FROM bank_churn;
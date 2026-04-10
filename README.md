# Project Background
Customer churn is a critical challenge in the banking industry, as retaining existing customers is significantly more cost-effective than acquiring new ones. A high churn rate can indicate underlying issues in customer satisfaction, service quality, or product relevance.

this project aims to uncover actionable insights that can help the bank improve customer retention strategies, enhance engagement, and ultimately reduce churn.

# Executive Summary
This project analyzes customer churn in a banking dataset of 10,000 customers, where the overall churn rate is 20.37%, significantly exceeding the industry benchmark of 5–7%.

The analysis identifies age and customer activity status as the strongest drivers of churn. Older customers, particularly those aged 51–70, show significantly higher churn rates (above 85%) when inactive. Additionally, customers with 3–4 products exhibit extremely high churn rates (over 80%), suggesting that having more products does not necessarily improve customer loyalty.

Geographically, Germany records the highest churn rate (32.44%) compared to France and Spain, indicating potential regional issues. In contrast, factors such as credit score, balance, and tenure show weak or negligible relationships with churn.

You can download the dashboard [here](https://app.powerbi.com/view?r=eyJrIjoiMmI3OTEwYzQtZjE4MC00Nzc3LWI1YzQtMWFjMWJmOWM2OGZkIiwidCI6IjQ3ZDY2NGIzLWQ5ZjctNDM3NC1iMmFkLWU1ZTI5NjA3ZjIwYSJ9) 

![!\[alt text\](image.png)](<Dashboards/Bank Customer Churn.png>)

Overall, the findings highlight that customer engagement and demographic factors play a more critical role than financial attributes in driving churn. Therefore, improving customer engagement, especially among older and inactive segments, should be a key focus for reducing churn.

# Data Structure
The dataset includes information on 10,000 customers. The structure of the data is outlined below: 

![!\[alt text\](<Untitled (3).png>)](<Diagrams/Untitled (3).png>)

# Key Findings
- Overall churn rate is **20.37%**, which is significantly above typical healthy range in banking industry (around 5%-7%)
- Total customer is 10.000, with 4.542 are female (**3,043 retained; 1,139 churned**) and 5,457 are male (**4,559 retained; 898 churned**). Although male customers are higher in number with churn rate **16.46%**, female female customers show a higher proportion **25.07%**
- Age shows the strongest correlation with churn(**0.29**). in comparison, Balance has a weaker correlation (**0.12**), while credit score (**-0.03**), number of product (-0.05), and tenure (**0.0006**) show neligible relation ship with curn
- Churn tends to increase with age, with the highest rates observed among older inactive customers **85.71%** for ages **51–60** and **88.13%** for ages **61–70**, indicating that age and low engagement are key drivers of churn
- Customer distribution is concentrated in the **0–30k** balance category with churn rate **13.97%**, but balance shows only a weak relationship with churn, indicating it is not a strong driver of customer attrition.
- Churn rates are slightly higher among customers with **300-579** credit score (**22.02%** for "Poor") compared to those with **670-739** (**18.62%** for "Good"), indicating a weak relationship between credit score and churn.
-  Customers with 3 products have a churn rate of **82.71%**, increasing to **100%** for those with 4 products, compared to **27.71%** (1 product) and **7.58%** (2 products). Despite the smaller number of customers in the 3 and 4 product categories, this pattern suggests that having more products does not necessarily lead to higher customer loyalty.
- Inactive customers have a significantly higher churn rate (**26.85%**) compared to active customers (**14.27%**).
- Germany has the highest churn rate at **32.44%**, significantly higher than Spain (**16.67%**) and France (**16.15%**). This indicates potential regional issues.

# Recommendation

- The overall churn rate is 20.37%, far above the industry benchmark (5–7%), indicating a critical retention issue. **Implement targeted retention strategies, including early warning systems and proactive customer engagement to reduce churn**.
- Female customers have a higher churn rate (25.07% vs 16.46% for males), suggesting a potential gap in customer needs. **Develop targeted campaigns and improve service personalization to better address female customers.**
- Churn increases significantly with age, reaching up to 88.13% among older customers, especially those who are inactive. **Focus on re-engagement strategies and tailored support for older customer segments.**
- Inactive customers show a much higher churn rate (26.85% vs 14.27%), highlighting the importance of engagement. **Introduce automated triggers, reminders, and incentives to encourage regular activity.**
- Germany has the highest churn rate (32.44%) compared to other regions, indicating potential regional issues. **Conduct deeper analysis and implement localized retention strategies.**
- Customers with 2 products have the lowest churn (7.58%), while those with 3–4 products show extremely high churn (up to 100%). **Optimize product bundling and focus on user experience rather than aggressive cross-selling.**
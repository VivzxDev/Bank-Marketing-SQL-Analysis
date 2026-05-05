
- BANK MARKETING SQL ANALYSIS
- Analyst: Vivek Singh Chandel
- Dataset: Bank Marketing | 11,162 customers
- Business Problem: Identify high-conversion customer 
- segments to optimise deposit campaign strategy


USE bank_analysis;

- Query 1: Total customer count
SELECT COUNT(*) AS total_customers 
FROM bank;

- Query 2: Balance overview
SELECT 
    ROUND(AVG(balance), 2) AS avg_balance,
    MIN(balance) AS min_balance,
    MAX(balance) AS max_balance
FROM bank;

- Query 3: Overall subscription rate
SELECT deposit, 
       COUNT(*) AS total,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM bank), 2) AS percentage
FROM bank
GROUP BY deposit;

- Query 4: Customer count by job
SELECT job, 
       COUNT(*) AS customer_count
FROM bank
GROUP BY job
ORDER BY customer_count DESC;

- Query 5: Average balance by job
SELECT job,
       COUNT(*) AS total_customers,
       ROUND(AVG(balance), 2) AS avg_balance
FROM bank
GROUP BY job
ORDER BY avg_balance DESC;

- Query 6: Subscription rate by job
SELECT job,
       COUNT(*) AS total,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
GROUP BY job
ORDER BY subscription_rate DESC;

- Query 7: Subscription rate by marital status
SELECT marital,
       COUNT(*) AS total_customers,
       ROUND(AVG(balance), 2) AS avg_balance,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
GROUP BY marital
ORDER BY subscription_rate DESC;

- Query 8: Subscription rate by education
SELECT education,
       COUNT(*) AS total,
       ROUND(AVG(balance), 2) AS avg_balance,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
GROUP BY education
ORDER BY subscription_rate DESC;

- Query 9: Impact of loans on subscription
SELECT 
    housing,
    loan,
    COUNT(*) AS customer_count,
    ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
GROUP BY housing, loan
ORDER BY subscription_rate DESC;

- Query 10: Contact method effectiveness
SELECT contact,
       COUNT(*) AS total_contacted,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY contact
ORDER BY conversion_rate DESC;

- Query 11: Age group segmentation
SELECT 
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 45 THEN '30-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(balance), 2) AS avg_balance,
    ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
GROUP BY age_group
ORDER BY subscription_rate DESC;

- Query 12: Campaign contact frequency vs conversion
SELECT campaign,
       COUNT(*) AS total_contacts,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank
GROUP BY campaign
ORDER BY campaign ASC
LIMIT 10;

- Query 13: High value customer segments
SELECT job,
       COUNT(*) AS total,
       ROUND(AVG(balance), 2) AS avg_balance,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS subscription_rate
FROM bank
WHERE balance > 1500
AND `default` = 'no'
GROUP BY job
ORDER BY avg_balance DESC;

- Query 14: Default rate by job
SELECT `default`, COUNT(*) AS count
FROM bank 
GROUP BY `default`;

- Query 15: Monthly campaign performance
SELECT month,
       COUNT(*) AS total_contacted,
       SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
       ROUND(100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate,
       ROUND(AVG(balance), 2) AS avg_balance
FROM bank
GROUP BY month
ORDER BY conversion_rate DESC;
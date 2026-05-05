# Bank-Marketing-SQL-Analysis
# Bank Marketing SQL Analysis

## Business Problem
A Portuguese bank ran a telemarketing campaign to sell term deposit 
products. This analysis identifies which customer segments convert best 
and how campaign strategy can be optimised to maximise subscriptions.

## Dataset
- 11,162 customer records
- 17 variables including demographics, financial data, and campaign details
- Source: Bank Marketing Dataset (Kaggle)

## Tools Used
MySQL, Excel, Power BI

## Key Business Findings

### Finding 1 — Wrong segments being targeted
Students (75%), retired (66%), and above-60 customers (82%) convert 
at far higher rates than blue-collar customers (36%) who receive the 
most campaign contacts.

### Finding 2 — Over-contacting kills conversion
First contact delivers 53% conversion rate. By the 8th contact it 
drops to 25%. Over-contacting is actively reducing campaign performance.

### Finding 3 — Campaign timing is misaligned
May receives the most contacts (2,824) but delivers the worst conversion 
at 33%. December, March, and September deliver 85-91% conversion with 
far fewer contacts.

### Finding 4 — Cellular is the only channel that works
Cellular contact converts at 54% vs unknown method at only 23% — 
2.4x more effective. The bank should prioritise obtaining cellular 
contact details for all customers.

## Recommendations
1. Prioritise student, retired, and above-60 segments in future campaigns
2. Cap contacts at 2-3 per customer — diminishing returns set in sharply after first contact
3. Shift campaign calendar to December, March, September, October
4. Invest in obtaining cellular contact details for all customers

## Queries Covered
- Aggregations and GROUP BY
- CASE WHEN segmentation
- Subqueries
- Conversion rate calculations
- Customer segmentation by demographics and behaviour
- Campaign effectiveness analysis
- High value customer identification
- Monthly trend analysis

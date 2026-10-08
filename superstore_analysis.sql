-- Superstore SQL analysis (DuckDB)
-- Load data
CREATE TABLE superstore AS
SELECT * FROM read_csv_auto('https://raw.githubusercontent.com/cthirumalesh58-arch/superstore-csv/refs/heads/main/Superstore%20(2).csv');

-- 1. Sales, profit and margin by category and region
SELECT Category, Region,
       ROUND(SUM(Sales), 2) AS total_sales,
       ROUND(SUM(Profit), 2) AS total_profit,
       ROUND(SUM(Profit) / SUM(Sales) * 100, 1) AS profit_margin_pct
FROM superstore
GROUP BY Category, Region
ORDER BY total_profit DESC;

-- 2. Profit by discount band
SELECT
  CASE WHEN Discount = 0 THEN '0%'
       WHEN Discount <= 0.2 THEN '1-20%'
       ELSE 'Over 20%' END AS discount_band,
  COUNT(*) AS orders,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(AVG(Profit), 2) AS avg_profit
FROM superstore
GROUP BY discount_band
ORDER BY discount_band;

-- 3. Rank sub-categories by profit within each category
SELECT Category, "Sub-Category",
       ROUND(SUM(Profit), 2) AS total_profit,
       RANK() OVER (PARTITION BY Category ORDER BY SUM(Profit) DESC) AS rank_in_category
FROM superstore
GROUP BY Category, "Sub-Category"
ORDER BY Category, rank_in_category;

-- 4. Monthly sales with running total
WITH monthly AS (
  SELECT DATE_TRUNC('month', "Order Date") AS month,
         ROUND(SUM(Sales), 2) AS sales
  FROM superstore
  GROUP BY month
)
SELECT month, sales,
       ROUND(SUM(sales) OVER (ORDER BY month), 2) AS running_total
FROM monthly
ORDER BY month;

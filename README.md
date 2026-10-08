# Superstore SQL Analysis

SQL analysis of the Superstore retail dataset (9,994 orders, 21 columns) to find where the business makes and loses money. Built with DuckDB.

## Business questions
1. Which category and region combinations are most profitable?
2. How do discounts affect profit?
3. Which sub-categories make or lose the most money?
4. How do sales change month to month?

## Key findings
- *Heavy discounts lose money.* Orders with a discount over 20% (1,393 orders) lost about $135K in total, an average loss of $97 per order. Orders with no discount earned about $321K.
- *Furniture is the weakest category.* Margins are 1.5% to 5.8% in most regions, and Furniture in the Central region loses money (-$2,871, -1.8% margin).
- *Office Supplies in the West is the best performer:* about $52.6K profit at a 23.8% margin.
- *Tables lose the most:* -$17.7K in total. Bookcases (-$3.5K) and Supplies (-$1.2K) also lose money.
- *Copiers earn the most profit* (about $55.6K), followed by Phones and Accessories.
- *Sales are seasonal.* September, November and December are peak months, while January and February are the weakest.

Note: these results show that deep discounts go together with losses, not that discounts alone cause them.

## SQL skills shown
- Aggregations: SUM, AVG, COUNT, GROUP BY
- Conditional logic: CASE WHEN
- Window functions: RANK() OVER (PARTITION BY ...), running total with SUM() OVER (ORDER BY ...)
- CTEs (WITH) and date functions (DATE_TRUNC)

## How to run
1. Open the [DuckDB Web Shell](https://shell.duckdb.org).
2. Paste the queries from superstore_analysis.sql and run them one at a time.

## Tools
SQL, DuckDB

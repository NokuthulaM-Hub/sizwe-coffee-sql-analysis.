Sizwe Coffee SQL Assignment: Error Investigation and Business Analysis

Project Overview

In this project, I worked with a fictional coffee business called Sizwe Coffee to investigate SQL queries, identify coding and data-loading errors, analyse business performance, and understand how errors can affect the accuracy of data analysis.

I used DuckDB to load CSV datasets into database tables and execute SQL queries. The assignment covered eight business questions relating to sales revenue, product profitability, accounts receivable, customer performance, trade promotions, sales representative targets, monthly revenue trends, and product-line margins.

My main focus was not only to obtain query results, but also to investigate errors, understand their causes, and determine whether the data and calculations could be trusted.

1. Database Setup and Initial Errors

Before analysing the business data, I had to load the CSV files into DuckDB and create the corresponding tables. During this process, I encountered several errors.

Error 1: Incorrect CSV filename

Error type: File not found / incorrect file path.

My first attempt to create the customer table referenced sizwe_customer.csv, but the actual file was named sizwe_customers.csv.

The query failed because DuckDB could not find a file matching the supplied filename.

I corrected the filename and successfully created the sizwe_customers table.

Lesson learned: File names and paths must match the source files exactly. A small naming mistake can prevent data from loading.

Error 2: Incorrect CSV filename for accounts payable payments

Error type: File not found / incorrect file path.

I initially referenced sizwe_ap_payment when loading the accounts payable payments data. The correct filename was sizwe_ap_payments.csv.

After correcting the reference, the table loaded successfully.

Lesson learned: I learned to verify source filenames before executing table-creation statements.

Error 3: Missing file extension and incorrect filename

Error type: File not found / incorrect file path.

When creating the sizwe_chart_of_accounts table, I tried several incorrect filename references, including a missing file extension and an incorrect singular filename.

The correct file was sizwe_chart_of_accounts.csv.

Once I used the correct filename, the table loaded successfully.

Lesson learned: I should confirm the exact spelling and extension of every source file before creating a table.

Error 4: Incorrect database command

Error type: SQL dialect or environment compatibility error.

I attempted to execute:

ATTACH 'sizwe_coffee.duckdb' AS sizwe_coffee;

The command returned a parser error in the SQL environment I was using.

I learned that SQL commands can behave differently depending on the database engine, environment, and available features. I also used SHOW TABLES to check whether tables had been created.

Lesson learned: Before troubleshooting a query, I need to understand the SQL environment and confirm which commands it supports.

Error 5: Incorrect filename punctuation

Error type: File not found / incorrect file path.

When loading the stock-on-hand dataset, I initially referenced sizwe_stock_on_hand,csv, using a comma instead of a full stop before the file extension.

DuckDB could not find the file. I corrected the reference to sizwe_stock_on_hand.csv, and the table loaded successfully.

Lesson learned: Small typographical errors can interrupt the data-loading process.

Error 6: Missing SELECT statement

Error type: SQL syntax error.

I attempted to create the sizwe_trade_promotions table using a statement that included FROM but omitted SELECT *.

The statement was incomplete. I then attempted to create the table again, but DuckDB returned an error indicating that the table already existed.

Lesson learned: A valid CREATE TABLE ... AS statement requires a complete query, and I must check whether a table already exists before trying to create it again.

Error 7: Incorrect source file assigned to a table

Error type: Incorrect table-to-source mapping / data integrity issue.

I created the sizwe_reps table using sizwe_roast_batches.csv instead of sizwe_reps.csv.

The table was created successfully, but its contents were incorrect for the intended purpose. When I queried sizwe_reps, the output contained roasting batch information such as batch_id, roast_date, sku, green_kg_in, operator_id, and quality_score, rather than the expected sales representative details.

This was particularly important because later queries used sizwe_reps to obtain representative names, territories, and monthly sales targets.

Why this matters: A query may execute without a syntax error and still produce invalid results if the underlying table contains the wrong data.

Lesson learned: Successful execution does not guarantee correct data. I need to validate table contents and column names after loading each dataset.

Error 8: Incorrect source file assigned to training records

Error type: Incorrect table-to-source mapping / data integrity issue.

I initially used sizwe_vendors.csv when creating the sizwe_training_records table.

I subsequently dropped the incorrectly created table and recreated it using sizwe_training_records.csv.

Lesson learned: I need to verify that each table is created from the appropriate source file and that its columns match the intended business purpose.

2. Business Analysis: Sales Channel Performance

The first business question investigated revenue performance across the Subscription and Wholesale channels for FY2024 and FY2025.

I joined sizwe_sales_orders to sizwe_sales_lines using order_id. I then used conditional aggregation to calculate revenue for each financial year and calculated year-on-year growth.

The query returned the following results:

Sales channel	FY2024 revenue	FY2025 revenue	Growth
Subscription	132,833,985.15	144,573,698.33	8.84%
Wholesale	308,166,012.32	335,426,325.02	8.85%

The results showed that both channels recorded positive revenue growth in the displayed output. Wholesale generated substantially more revenue than Subscription in both periods.

I used NULLIF in the growth calculation to protect against division by zero if the previous financial year’s revenue were zero.

My observation: The results provide a useful comparison of channel performance, but I would still validate the financial-year definitions, revenue fields, and underlying records before presenting the figures as final business results.

3. Business Analysis: Product-Line Profitability

The second question examined which product lines generated the most revenue and gross profit.

I joined the sales orders, sales lines, and products tables. I then calculated total revenue, cost of goods sold (COGS), gross profit, and gross margin percentage.

The displayed results were:

Product line	Gross profit	Gross margin
House Blend	107,148,746.60	38.33%
Single Origin	75,312,800.87	44.27%
Bulk Commercial	54,102,879.48	19.90%
Capsules	42,358,504.67	38.91%
Decaf	32,474,998.07	35.83%

House Blend generated the highest gross profit in the displayed results, while Single Origin had the highest gross margin percentage.

This demonstrated the difference between generating the largest total profit and earning the highest percentage margin.

My observation: Product profitability should be evaluated using both gross profit and gross margin. A product line with the highest revenue does not necessarily have the highest margin.

4. Business Analysis: Accounts Receivable and Collections

The third question examined invoice settlement and outstanding balances across the Subscription and Wholesale channels.

I joined sizwe_ar_ledger to sizwe_customers using customer_id. I used COALESCE to handle missing settlement amounts and calculated outstanding balances by subtracting the amount settled from the invoice amount.

The displayed results showed:

* Wholesale had 28,944 invoices and an outstanding balance of approximately 87,848,227.20.
* Subscription had 19,200 invoices and an outstanding balance of approximately 751,178.89.
* The average settlement time shown was 68.68 days for Wholesale and 3.85 days for Subscription.

Wholesale therefore appeared to have a substantially larger outstanding balance and longer average settlement period.

My observation: These results could indicate a collections issue within Wholesale, but the figures need further validation. I would check whether partial payments, credit notes, overpayments, and invoices not yet due are handled appropriately before concluding that the entire outstanding balance represents overdue debt.

5. Business Analysis: High-Value Customers

The fourth question identified the ten customer accounts with the highest revenue in FY2025.

I joined the customer, sales order, sales line, and sales representative tables. I filtered the data to the relevant financial year, grouped revenue by customer, and sorted the results in descending order.

Halvane Retail Group appeared as the highest-revenue customer in the displayed output, with FY2025 revenue of approximately 38,399,999.89.

The query was intended to help identify major accounts that could be important for customer relationship management, sales planning, and revenue protection.

My observation: High-revenue accounts deserve attention, but revenue alone does not establish profitability or customer value. A more complete assessment could include gross margin, payment behaviour, credit exposure, and account retention.

Data-quality concern: This query depends on the sales representative table being correctly populated. Because I initially loaded the roasting batch dataset into sizwe_reps, the representative-related join and output needed to be treated as unreliable until the table mapping was corrected and the query rerun.

6. Business Analysis: Identifying a Commercial Gap

The fifth question identified wholesale customers with FY2025 revenue but no matching record in the trade promotions table.

I used a NOT EXISTS subquery to identify customers who did not have a corresponding record in sizwe_trade_promotions.

The output returned wholesale accounts ranked by revenue, including Umhlanga Fresh 108, Kalahari Kitchen 42, Ridgeway Foods 308, and Midrand Market 293.

The purpose was to identify customers who might warrant further investigation for promotional opportunities.

My observation: The absence of a promotion record does not automatically mean that a customer has been overlooked. Before recommending a promotion, I would investigate customer eligibility, historical purchasing behaviour, profitability, and whether the promotions table captures every relevant promotion.

7. Business Analysis: Sales Representative Target Achievement

The sixth question compared actual average monthly sales revenue with the monthly target for each sales representative.

I used LEFT JOIN to retain sales representatives even if no matching sales orders were found. I aggregated sales revenue and divided it by 12 to estimate average monthly revenue for the twelve-month period.

The displayed results showed that several representatives exceeded 100% of their monthly targets, while some were below target.

For example, Karabo van Wyk showed target achievement of approximately 250.32%, while Johan Naidoo showed approximately 77.63%.

My observation: Target achievement can help identify strong performance and areas requiring support. However, the results depended on the accuracy of the sizwe_reps table, which was initially created from the wrong CSV file.

I would also verify that all twelve months were represented in the reporting period, that targets were correctly assigned, and that the sales figures were not duplicated by the joins.

8. Business Analysis: Monthly Revenue Trends

The seventh question investigated monthly revenue trends from July 2023 to June 2025.

I grouped sales by month and used the LAG window function to retrieve the previous month’s revenue. I calculated month-on-month percentage changes and a rolling three-month average.

The displayed results showed fluctuations throughout the period. Revenue declined during several months toward the end of each calendar year and increased during the following months.

For example, the displayed month-on-month change was negative in December 2023 and December 2024, followed by positive growth in January 2024 and January 2025.

My observation: Monthly trend analysis helps identify patterns and periods that require further investigation. However, a two-year pattern alone does not prove seasonality or explain the causes of revenue changes. I would compare the trend with promotions, pricing, stock availability, and other operational information before drawing conclusions.

9. Business Analysis: Product-Line Margin Movement

The eighth question compared revenue, gross margin percentage, and revenue contribution across FY2024 and FY2025.

I used conditional logic to assign each transaction to a financial year, calculated revenue and COGS by product line, and used a window function to calculate each product line’s share of total revenue within its financial year.

The displayed output showed that Bulk Commercial revenue increased between the two periods, while House Blend, Capsules, Decaf, and Single Origin had lower FY2025 revenue than FY2024 in the results shown.

Bulk Commercial also represented the largest share of FY2025 revenue in the displayed output, at approximately 33.65%, but had a gross margin of approximately 19.91%.

My observation: Revenue growth and profitability are not the same thing. A product line can contribute a large portion of total revenue while having a comparatively low gross margin. This makes it important to consider revenue contribution alongside COGS and margin percentage.

10. Key Technical Lessons Learned

Through this assignment, I learned the importance of:

* Checking file paths and filenames before loading data.
* Understanding the SQL environment and its supported commands.
* Ensuring that each database table is created from the correct source file.
* Inspecting table structures and sample records after data loading.
* Understanding one-to-many relationships and join conditions.
* Using CTEs to organise complex queries into readable steps.
* Using aggregate functions to calculate business metrics.
* Applying CASE expressions for conditional calculations.
* Using COALESCE and NULLIF to handle missing values and division by zero.
* Applying window functions such as LAG and rolling averages.
* Validating query results instead of assuming that successful execution means the results are correct.
* Explaining analytical results in terms of business implications and limitations.

11. Conclusion

This assignment helped me understand that SQL analysis involves more than writing a query and obtaining an output. The quality of the analysis depends on correct data loading, appropriate joins, accurate calculations, and reliable interpretation.

One of my most important observations was that some errors were immediately visible because a query failed, while others were more serious because the query executed but the underlying data was incorrect. The incorrect mapping of the roasting batch dataset to the sales representative table demonstrated how a data-loading issue could affect subsequent customer and sales performance analysis.

By investigating these issues, I developed a more structured approach to SQL debugging and data validation. I also strengthened my understanding of how SQL can support business decisions relating to revenue, profitability, collections, customer management, and sales performance.

My key takeaway is that reliable business insights start with reliable data and validated SQL logic.

Tools Used

* SQL
* DuckDB
* CSV datasets
* GitHub

Disclaimer

This project is intended for learning and portfolio demonstration. The observations and figures described here reflect the supplied SQL transcript and should be revalidated against correctly loaded source tables before being used as final business findings. Technical issues and suspected data-quality problems are distinguished from confirmed business conclusions.
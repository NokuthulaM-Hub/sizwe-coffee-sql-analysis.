
DuckDB Web Shell running...
DuckDB v2.0.0 (Cyanoptera)
Enter ".help" for usage hints.
memory D .files add
Registered: sizwe_ap_invoices.csv (151059 bytes)
memory D .files add
Registered: sizwe_ap_payments.csv (103259 bytes)
memory D .files add
Registered: sizwe_ar_ledger.csv (3422766 bytes)
memory D .files add
Registered: sizwe_budget.csv (23181 bytes)
memory D .files add
Registered: sizwe_chart_of_accounts.csv (2285 bytes)
memory D .files add
Registered: sizwe_cost_centres.csv (494 bytes)
memory D .files add
Registered: sizwe_customers.csv (129444 bytes)
memory D .files add
Registered: sizwe_employees.csv (31859 bytes)
memory D .files add
Registered: sizwe_fx_rates.csv (16555 bytes)
memory D .files add
Registered: sizwe_gl_transactions.csv (9629814 bytes)
memory D .files add
memory D .files add
Registered: sizwe_listing_fees.csv (42483 bytes)
memory D .files add
Registered: sizwe_products.csv (1650 bytes)
memory D .files add
Registered: sizwe_products.csv (1650 bytes)
memory D .files add
Registered: sizwe_purchase_orders.csv (26058 bytes)
memory D .files add
Registered: sizwe_rep_visits.csv (454481 bytes)
memory D .files add
Registered: sizwe_reps.csv (999 bytes)
memory D .files add
Registered: sizwe_roast_batches.csv (256025 bytes)
memory D .files add
Registered: sizwe_safety_incidents.csv (8749 bytes)
memory D .files add
Registered: sizwe_sales_lines.csv (8189857 bytes)
memory D .files add
Registered: sizwe_sales_orders.csv (3235172 bytes)
memory D .files add
Registered: sizwe_shifts.csv (1834387 bytes)
memory D .files add
Registered: sizwe_stock_movements.csv (3786026 bytes)
memory D .files add
Registered: sizwe_stock_on_hand.csv (46969 bytes)
memory D .files add
Registered: sizwe_trade_promotions.csv (44925 bytes)
memory D .files add
Registered: sizwe_training_records.csv (41908 bytes)
memory D .files add
Registered: sizwe_vendors.csv (4223 bytes)
memory D .share
No commands to share.
memory D .share
No commands to share.
memory D .share
No commands to share.
memory D ATTACH 'sizwe_coffee.duckdb'AS sizwe_coffee;
Parser Error:
syntax error at or near "ATTACH"
memory D SHOW TABLES;
┌─────────┐
│  name   │
│ varchar │
└─────────┘
  0 rows 
memory D SELECT current_database();
┌────────────────────┐
│ current_database() │
│      varchar       │
├────────────────────┤
│ memory             │
└────────────────────┘
memory D SHOW ALL TABLES;
┌──────────┬─────────┬─────────┬──────────────┬──────────────┬───────────┐
│ database │ schema  │  name   │ column_names │ column_types │ temporary │
│ varchar  │ varchar │ varchar │  varchar[]   │  varchar[]   │  boolean  │
└──────────┴─────────┴─────────┴──────────────┴──────────────┴───────────┘
                                  0 rows                                
memory D 
memory D CREATE TABLE sizwe_customers AS
         SELECT *
         FROM read_csv_auto('sizwe_customer.csv');
IO Error:
No files found that match the pattern "sizwe_customer.csv"

LINE 3: FROM read_csv_auto('sizwe_customer.csv');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D 
memory D CREATE TABLE sizwe_customers AS
         SELECT *
         FROM read_csv_auto('sizwe_customers.csv');
memory D SHOW TABLES;
┌─────────────────┐
│      name       │
│     varchar     │
├─────────────────┤
│ sizwe_customers │
└─────────────────┘
memory D SELECT *
         FROM sizwe_customers
         LIMIT 10;
┌─────────────┬────────────────────────┬───────────┬──────────────────┬───────────────┬──────────────┬───────────────┬────────────────┬─────────┐
│ customer_id │      trading_name      │  channel  │     segment      │   province    │ credit_limit │ payment_terms │ onboarded_date │ rep_id  │
│   varchar   │        varchar         │  varchar  │     varchar      │    varchar    │    int64     │     int64     │      date      │ varchar │
├─────────────┼────────────────────────┼───────────┼──────────────────┼───────────────┼──────────────┼───────────────┼────────────────┼─────────┤
│ C-00001     │ Halvane Retail Group   │ Wholesale │ Grocery Chain    │ Western Cape  │      6000000 │            60 │ 2016-03-14     │ R-001   │
│ C-00002     │ Roasted Bean Cafe 58   │ Wholesale │ Hotel Group      │ KwaZulu-Natal │        50000 │            60 │ 2013-07-22     │ R-015   │
│ C-00003     │ Ridgeway Foods 205     │ Wholesale │ Restaurant Group │ Western Cape  │        50000 │            60 │ 2018-12-12     │ R-003   │
│ C-00004     │ Kalahari Kitchen 162   │ Wholesale │ Restaurant Group │ Gauteng       │       100000 │            60 │ 2011-04-22     │ R-011   │
│ C-00005     │ Cape Point Coffee 379  │ Wholesale │ Independent Cafe │ KwaZulu-Natal │       250000 │            60 │ 2015-02-17     │ R-007   │
│ C-00006     │ Zebra Cafe 76          │ Wholesale │ Hotel Group      │ Western Cape  │       500000 │            60 │ 2013-06-25     │ R-017   │
│ C-00007     │ Vaal Trading Co 96     │ Wholesale │ Restaurant Group │ Western Cape  │        50000 │            60 │ 2017-03-17     │ R-010   │
│ C-00008     │ Bloom Coffee House 354 │ Wholesale │ Independent Cafe │ Western Cape  │       100000 │            60 │ 2017-10-18     │ R-010   │
│ C-00009     │ Karoo Provisions 373   │ Wholesale │ Restaurant Group │ Gauteng       │        50000 │            60 │ 2015-01-20     │ R-010   │
│ C-00010     │ Roasted Bean Cafe 360  │ Wholesale │ Restaurant Group │ Gauteng       │      1000000 │            60 │ 2011-10-30     │ R-011   │
└─────────────┴────────────────────────┴───────────┴──────────────────┴───────────────┴──────────────┴───────────────┴────────────────┴─────────┘
  10 rows                                                                                                                             9 columns
memory D  CREATE TABLE sizwe_ap_invoices AS
         SELECT *
         FROM read_csv_auto('sizwe_ap_invoices.csv');
memory D CREATE TABLE sizwe_ap_payments AS
         SELECT *
         FROM read_csv_auto('sizwe_ap_payment');
IO Error:
No files found that match the pattern "sizwe_ap_payment"

LINE 3: FROM read_csv_auto('sizwe_ap_payment');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D CREATE TABLE sizwe_ap_payments AS
         SELECT *
         FROM read_csv_auto('sizwe_ap_payments.csv');
memory D CREATE TABLE sizwe_ar_ledger AS
         SELECT *
         FROM read_csv_auto('sizwe_ar_ledger.csv');
memory D 
memory D 
memory D CREATE TABLE Sizwe_budget AS
         SELECT *
         FROM read_csv_auto('sizwe_budget.csv');
memory D CREATE TABLE sizwe_chart_of_accounts AS
         SELECT *
         FROM read_csv_auto('sizwe_chart_of_accounts');
IO Error:
No files found that match the pattern "sizwe_chart_of_accounts"

LINE 3: FROM read_csv_auto('sizwe_chart_of_accounts');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D CREATE TABLE sizwe_chart_of_accounts AS
         SELECT *
         FROM read_csv_auto('sizwe_chart_of_accounts');
IO Error:
No files found that match the pattern "sizwe_chart_of_accounts"

LINE 3: FROM read_csv_auto('sizwe_chart_of_accounts');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D CREATE TABLE sizwe_chart_of_accounts AS 
         SELECT *
         FROM read_csv_auto('sizwe_chart_of_account.csv');
IO Error:
No files found that match the pattern "sizwe_chart_of_account.csv"

LINE 3: FROM read_csv_auto('sizwe_chart_of_account.csv');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D CREATE TABLE sizwe_chart_of_accounts AS
         SELECT *
         FROM read_csv_auto('sizwe_chart_of_accounts.csv');
memory D CREATE TABLE sizwe_cost_centres AS
         SELECT *
         FROM read_csv_auto('sizwe_cost_centres.csv');
memory D CREATE TABLE sizwe_employees AS
         SELECT *
         FROM read_csv_auto('sizwe_employees.csv');
memory D CREATE TABLE sizwe_fx_rates AS
         SELECT *
         FROM read_csv_auto('sizwe_fx_rates.csv');
memory D CREATE TABLE sizwe_gl_transactions AS 
         SELECT *
         FROM read_csv_auto('sizwe_gl_transactions.csv');
memory D CREATE TABLE sizwe_listing_fees AS
         SELECT *
         FROM read_csv_auto('sizwe_listing_fees.csv');
memory D CREATE TABLE sizwe_products AS
         SELECT *
         FROM read_csv_auto('sizwe_products.csv');
memory D CREATE TABLE sizwe_purchase_orders AS
         SELECT *
         FROM read_csv_auto('sizwe_purchase_orders.csv');
memory D CREATE TABLE sizwe_rep_visits AS
         SELECT *
         FROM read_csv_auto('sizwe_rep_visits.csv');
memory D CREATE TABLE sizwe_reps AS
         SELECT *
         FROM read_csv_auto('sizwe_roast_batches.csv');
memory D CREATE TABLE sizwe_safety_incidents AS
         SELECT *
         FROM read_csv_auto('sizwe_safety_incidents.csv');
memory D CREATE TABLE sizwe_sales_lines AS 
         SELECT *
         FROM read_csv_auto('sizwe_sales_lines.csv');
memory D CREATE TABLE sizwe_sales_orders AS
         SELECT *
         FROM read_csv_auto('sizwe_sales_orders.csv');
memory D CREATE TABLE sizwe_shifts AS
         SELECT *
         FROM read_csv_auto('sizwe_shifts.csv');
memory D CREATE TABLE sizwe_stock_movements AS
         SELECT *
         FROM read_csv_auto('sizwe_stock_movements.csv');
memory D CREATE TABLE sizwe_stock_on_hand AS
         SELECT *
         FROM read_csv_auto('sizwe_stock_on_hand,csv');
IO Error:
No files found that match the pattern "sizwe_stock_on_hand,csv"

LINE 3: FROM read_csv_auto('sizwe_stock_on_hand,csv');
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
memory D CREATE TABLE sizwe_stock_on_hand AS
         SELECT *
         FROM read_csv_auto('sizwe_stock_on_hand.csv');
memory D CREATE TABLE sizwe_trade_promotions AS
         FROM read_csv_auto('sizwe_trade_promotions.csv');
memory D CREATE TABLE sizwe_trade_promotions AS
         SELECT *
         FROM read_csv_auto('sizwe_trade_promotions.csv');
Catalog Error:
Table with name "sizwe_trade_promotions" already exists!
memory D CREATE  TABLE sizwe_training_records AS
         SELECT *
         FROM read_csv_auto('sizwe_vendors.csv');
memory D DROP TABLE sizwe_training_records;
memory D CREATE TABLE sizwe_training_records AS
         SELECT *
         FROM read_csv_auto('sizwe_training_records.csv');
memory D CREATE TABLE sizwe_vendors AS
         SELECT *
         FROM read_csv_auto('sizwe_vendors.csv');
memory D SHOW TABLES;
┌─────────────────────────┐
│          name           │
│         varchar         │
├─────────────────────────┤
│ Sizwe_budget            │
│ sizwe_ap_invoices       │
│ sizwe_ap_payments       │
│ sizwe_ar_ledger         │
│ sizwe_chart_of_accounts │
│ sizwe_cost_centres      │
│ sizwe_customers         │
│ sizwe_employees         │
│ sizwe_fx_rates          │
│ sizwe_gl_transactions   │
│ sizwe_listing_fees      │
│ sizwe_products          │
│ sizwe_purchase_orders   │
│ sizwe_rep_visits        │
│ sizwe_reps              │
│ sizwe_safety_incidents  │
│ sizwe_sales_lines       │
│ sizwe_sales_orders      │
│ sizwe_shifts            │
│ sizwe_stock_movements   │
│ sizwe_stock_on_hand     │
│ sizwe_trade_promotions  │
│ sizwe_training_records  │
│ sizwe_vendors           │
└─────────────────────────┘
          24 rows        
memory D SELECT *
         FROM sizwe_reps
         LIMIT 20;
┌──────────┬────────────┬─────────┬─────────────┬───┬─────────────────┬─────────────┬───────────────┐
│ batch_id │ roast_date │   sku   │ green_kg_in │ … │ weight_loss_pct │ operator_id │ quality_score │
│ varchar  │    date    │ varchar │   double    │ … │     double      │   varchar   │    double     │
├──────────┼────────────┼─────────┼─────────────┼───┼─────────────────┼─────────────┼───────────────┤
│ B-000001 │ 2023-07-25 │ SZ-005  │     1163.72 │ … │           18.32 │ E-0323      │          88.4 │
│ B-000002 │ 2023-07-11 │ SZ-008  │     1239.99 │ … │           16.52 │ E-0120      │          83.0 │
│ B-000003 │ 2023-07-25 │ SZ-002  │     1332.95 │ … │           16.59 │ E-0122      │          86.8 │
│ B-000004 │ 2023-07-26 │ SZ-013  │     1082.88 │ … │            18.4 │ E-0123      │          86.5 │
│ B-000005 │ 2023-07-13 │ SZ-012  │     1700.24 │ … │           15.67 │ E-0151      │          81.5 │
│ B-000006 │ 2023-07-03 │ SZ-021  │      959.45 │ … │           16.17 │ E-0149      │          87.9 │
│ B-000007 │ 2023-07-09 │ SZ-009  │      824.42 │ … │            17.1 │ E-0142      │          87.6 │
│ B-000008 │ 2023-07-21 │ SZ-017  │      863.78 │ … │           17.43 │ E-0154      │          86.6 │
│ B-000009 │ 2023-07-17 │ SZ-020  │     1744.34 │ … │           18.15 │ E-0134      │          86.5 │
│ B-000010 │ 2023-07-27 │ SZ-012  │     1839.35 │ … │            16.4 │ E-0113      │          89.2 │
│ B-000011 │ 2023-07-22 │ SZ-008  │     1021.87 │ … │           16.94 │ E-0126      │          86.4 │
│ B-000012 │ 2023-07-22 │ SZ-012  │      980.44 │ … │           15.78 │ E-0153      │          86.9 │
│ B-000013 │ 2023-07-04 │ SZ-010  │      822.91 │ … │           17.92 │ E-0105      │          90.8 │
│ B-000014 │ 2023-07-16 │ SZ-016  │     1628.85 │ … │           16.73 │ E-0112      │          84.8 │
│ B-000015 │ 2023-07-23 │ SZ-002  │     1481.88 │ … │           16.13 │ E-0134      │          87.3 │
│ B-000016 │ 2023-07-03 │ SZ-019  │      2015.5 │ … │           17.36 │ E-0111      │          90.4 │
│ B-000017 │ 2023-07-09 │ SZ-023  │     2290.22 │ … │           16.91 │ E-0365      │          84.6 │
│ B-000018 │ 2023-07-08 │ SZ-019  │     1690.12 │ … │           15.78 │ E-0112      │          86.9 │
│ B-000019 │ 2023-07-24 │ SZ-014  │     1321.75 │ … │           18.68 │ E-0140      │          85.5 │
│ B-000020 │ 2023-07-23 │ SZ-017  │     1236.53 │ … │           15.03 │ E-0086      │          87.4 │
└──────────┴────────────┴─────────┴─────────────┴───┴─────────────────┴─────────────┴───────────────┘
  20 rows                                                                       8 columns (7 shown)
memory D SELECT *
         FROM sizwe_shifts
         LIMIT 50;
┌─────────────┬────────────┬────────────┬─────────────────┬──────────────┬────────────────┐
│ employee_id │ shift_date │ shift_type │ hours_scheduled │ hours_worked │ overtime_hours │
│   varchar   │    date    │  varchar   │     double      │    double    │     double     │
├─────────────┼────────────┼────────────┼─────────────────┼──────────────┼────────────────┤
│ E-0085      │ 2024-07-01 │ Night      │             9.0 │        10.55 │           1.55 │
│ E-0087      │ 2024-07-01 │ Day        │             9.0 │        10.95 │           1.95 │
│ E-0088      │ 2024-07-01 │ Afternoon  │             9.0 │          9.0 │            0.0 │
│ E-0089      │ 2024-07-01 │ Day        │             9.0 │          9.0 │            0.0 │
│ E-0090      │ 2024-07-01 │ Day        │             9.0 │        10.79 │           1.79 │
│ E-0091      │ 2024-07-01 │ Day        │             9.0 │        10.21 │           1.21 │
│ E-0093      │ 2024-07-01 │ Night      │             9.0 │          9.4 │            0.4 │
│ E-0094      │ 2024-07-01 │ Day        │             9.0 │         9.08 │           0.08 │
│ E-0095      │ 2024-07-01 │ Afternoon  │             9.0 │         9.33 │           0.33 │
│ E-0096      │ 2024-07-01 │ Afternoon  │             9.0 │        10.46 │           1.46 │
│ E-0097      │ 2024-07-01 │ Day        │             9.0 │         9.87 │           0.87 │
│ E-0098      │ 2024-07-01 │ Night      │             9.0 │         9.75 │           0.75 │
│ E-0099      │ 2024-07-01 │ Afternoon  │             9.0 │        11.18 │           2.18 │
│ E-0100      │ 2024-07-01 │ Day        │             9.0 │          9.6 │            0.6 │
│ E-0101      │ 2024-07-01 │ Day        │             9.0 │         9.08 │           0.08 │
│ E-0102      │ 2024-07-01 │ Night      │             9.0 │        10.95 │           1.95 │
│ E-0103      │ 2024-07-01 │ Day        │             9.0 │        10.63 │           1.63 │
│ E-0104      │ 2024-07-01 │ Day        │             9.0 │         10.1 │            1.1 │
│ E-0105      │ 2024-07-01 │ Afternoon  │             9.0 │         9.64 │           0.64 │
│ E-0107      │ 2024-07-01 │ Night      │             9.0 │        10.22 │           1.22 │
│   ·         │     ·      │  ·         │              ·  │           ·  │             ·  │
│   ·         │     ·      │  ·         │              ·  │           ·  │             ·  │
│   ·         │     ·      │  ·         │              ·  │           ·  │             ·  │
│ E-0120      │ 2024-07-01 │ Day        │             9.0 │         9.43 │           0.43 │
│ E-0121      │ 2024-07-01 │ Day        │             9.0 │        10.04 │           1.04 │
│ E-0122      │ 2024-07-01 │ Afternoon  │             9.0 │        10.71 │           1.71 │
│ E-0123      │ 2024-07-01 │ Day        │             9.0 │        10.44 │           1.44 │
│ E-0124      │ 2024-07-01 │ Night      │             9.0 │          9.0 │            0.0 │
│ E-0125      │ 2024-07-01 │ Day        │             9.0 │         9.78 │           0.78 │
│ E-0126      │ 2024-07-01 │ Day        │             9.0 │         9.78 │           0.78 │
│ E-0127      │ 2024-07-01 │ Night      │             9.0 │        10.21 │           1.21 │
│ E-0128      │ 2024-07-01 │ Afternoon  │             9.0 │         9.42 │           0.42 │
│ E-0129      │ 2024-07-01 │ Afternoon  │             9.0 │         9.09 │           0.09 │
│ E-0131      │ 2024-07-01 │ Afternoon  │             9.0 │        10.78 │           1.78 │
│ E-0132      │ 2024-07-01 │ Day        │             9.0 │          9.0 │            0.0 │
│ E-0133      │ 2024-07-01 │ Day        │             9.0 │          9.2 │            0.2 │
│ E-0134      │ 2024-07-01 │ Day        │             9.0 │         9.66 │           0.66 │
│ E-0135      │ 2024-07-01 │ Afternoon  │             9.0 │          9.0 │            0.0 │
│ E-0136      │ 2024-07-01 │ Day        │             9.0 │        10.58 │           1.58 │
│ E-0137      │ 2024-07-01 │ Day        │             9.0 │          9.9 │            0.9 │
│ E-0138      │ 2024-07-01 │ Night      │             9.0 │        10.24 │           1.24 │
│ E-0139      │ 2024-07-01 │ Day        │             9.0 │         9.14 │           0.14 │
│ E-0140      │ 2024-07-01 │ Night      │             9.0 │        10.58 │           1.58 │
└─────────────┴────────────┴────────────┴─────────────────┴──────────────┴────────────────┘
  50 rows (40 shown)                                                            6 columns

Task 1:Channel performance

	memory D WITH channel_revenue AS (
             SELECT
                 so.channel,
         
                 SUM(
                     CASE
                         WHEN so.order_date >= DATE '2023-07-01'
                          AND so.order_date < DATE '2024-07-01'
                         THEN sl.line_revenue
                         ELSE 0
                     END
                 ) AS fy2024_revenue,
         
                 SUM(
                     CASE
                         WHEN so.order_date >= DATE '2024-07-01'
                          AND so.order_date < DATE '2025-07-01'
                         THEN sl.line_revenue
                         ELSE 0
                     END
                 ) AS fy2025_revenue
         
             FROM sizwe_sales_orders AS so
             JOIN sizwe_sales_lines AS sl
                 ON so.order_id = sl.order_id
         
             GROUP BY so.channel
         ),
         
         channel_growth AS (
             SELECT
                 channel,
                 fy2024_revenue,
                 fy2025_revenue,
                 100.0 * (fy2025_revenue - fy2024_revenue)
                     / NULLIF(fy2024_revenue, 0) AS growth_rate_percent
             FROM channel_revenue
         )
         
         SELECT
             channel,
             ROUND(fy2024_revenue, 2) AS fy2024_revenue,
             ROUND(fy2025_revenue, 2) AS fy2025_revenue,
             ROUND(growth_rate_percent, 2) AS growth_rate_percent
         FROM channel_growth
         ORDER BY channel;
┌──────────────┬────────────────┬────────────────┬─────────────────────┐
│   channel    │ fy2024_revenue │ fy2025_revenue │ growth_rate_percent │
│   varchar    │     double     │     double     │       double        │
├──────────────┼────────────────┼────────────────┼─────────────────────┤
│ Subscription │   132833985.15 │   144573698.33 │                8.84 │
│ Wholesale    │   308166012.32 │   335426325.02 │                8.85 │
└──────────────┴────────────────┴────────────────┴─────────────────────┘

Task 2: Where the profit actually comes from
	memory D WITH product_line_profit AS (
             SELECT
                 p.product_line,
         
                 SUM(sl.line_revenue) AS total_revenue,
         
                 SUM(sl.cogs) AS cost_of_goods,
         
                 SUM(sl.line_revenue - sl.cogs) AS gross_profit
         
             FROM sizwe_sales_orders AS so
         
             JOIN sizwe_sales_lines AS sl
                 ON so.order_id = sl.order_id
         
             JOIN sizwe_products AS p
                 ON sl.sku = p.sku
         
             WHERE so.order_date >= DATE '2023-07-01'
               AND so.order_date <  DATE '2025-07-01'
         
             GROUP BY p.product_line
         )
         
         SELECT
             product_line,
             ROUND(total_revenue, 2) AS total_revenue,
             ROUND(cost_of_goods, 2) AS cost_of_goods,
             ROUND(gross_profit, 2) AS gross_profit,
         
             ROUND(
                 100.0 * gross_profit / NULLIF(total_revenue, 0),
                 2
             ) AS gross_margin_percent
         
         FROM product_line_profit
         ORDER BY gross_profit DESC;
┌─────────────────┬───────────────┬───────────────┬──────────────┬──────────────────────┐
│  product_line   │ total_revenue │ cost_of_goods │ gross_profit │ gross_margin_percent │
│     varchar     │    double     │    double     │    double    │        double        │
├─────────────────┼───────────────┼───────────────┼──────────────┼──────────────────────┤
│ House Blend     │   279530948.9 │   172382202.3 │  107148746.6 │                38.33 │
│ Single Origin   │  170112619.61 │   94799818.74 │  75312800.87 │                44.27 │
│ Bulk Commercial │  271838831.01 │  217735951.53 │  54102879.48 │                 19.9 │
│ Capsules        │  108875076.22 │   66516571.55 │  42358504.67 │                38.91 │
│ Decaf           │   90642545.08 │   58167547.01 │  32474998.07 │                35.83 │
└─────────────────┴───────────────┴───────────────┴──────────────┴──────────────────────┘
---Answers:
---House Blend is the largest profit contributor. It generates approximately 107.15 million in gross profit,
---the highest of all five product lines, supported by revenue of 279.53 million.
---Single Origin is the most profitable in percentage terms. Its gross margin of 44.27% means that approximately 44.27 cents of every revenue rand remains 
---after cost of goods sold. This is the strongest margin among the five product lines.

*Task 3
memory D ---checking if both column names in tables to avoid errors
memory D DESCRIBE sizwe_ar_ledger;
Parser Error:
syntax error at or near "DESCRIBE"
memory D DESCRIBE sizwe_customers;
┌────────────────────────┐
│    sizwe_customers     │
│                        │
│ customer_id    varchar │
│ trading_name   varchar │
│ channel        varchar │
│ segment        varchar │
│ province       varchar │
│ credit_limit   bigint  │
│ payment_terms  bigint  │
│ onboarded_date date    │
│ rep_id         varchar │
└────────────────────────┘
memory D DESCRIBE sizwe_ar_ledger;
┌─────────────────────────┐
│     sizwe_ar_ledger     │
│                         │
│ customer_id     varchar │
│ invoice_no      varchar │
│ invoice_date    date    │
│ due_date        date    │
│ invoice_amount  double  │
│ amount_settled  double  │
│ settlement_date date    │
│ payment_terms   bigint  │
└─────────────────────────┘

Task 3: The collections problem

-- Analyse invoice settlement and outstanding balances by channel.

WITH invoice_details AS (
    SELECT
        c.channel,
        ar.customer_id,
        ar.invoice_date,
        ar.settlement_date,
        ar.invoice_amount,
        COALESCE(ar.amount_settled, 0) AS amount_settled,
        GREATEST(
            ar.invoice_amount - COALESCE(ar.amount_settled, 0),
            0
        ) AS outstanding_amount
    FROM sizwe_ar_ledger AS ar
    JOIN sizwe_customers AS c
        ON ar.customer_id = c.customer_id
),
channel_collections AS (
    SELECT
        channel,
        COUNT(*) AS invoice_count,

        SUM(
            CASE
                WHEN outstanding_amount = 0 THEN 1
                ELSE 0
            END
        ) AS settled_invoices,

        SUM(
            CASE
                WHEN outstanding_amount > 0 THEN 1
                ELSE 0
            END
        ) AS open_invoices,

        AVG(
            CASE
                WHEN outstanding_amount = 0
                 AND settlement_date IS NOT NULL
                THEN DATE_DIFF(
                    'day',
                    invoice_date,
                    settlement_date
                )
                ELSE NULL
            END
        ) AS average_days_to_settle,

        SUM(outstanding_amount) AS total_outstanding

    FROM invoice_details
    GROUP BY channel
)
SELECT
    channel,
    invoice_count,
    settled_invoices,
    open_invoices,
    ROUND(average_days_to_settle, 2) AS average_days_to_settle,
    ROUND(total_outstanding, 2) AS total_outstanding
FROM channel_collections
ORDER BY total_outstanding DESC;
┌──────────────┬───────────────┬──────────────────┬───┬────────────────────────┬───────────────────┐
│   channel    │ invoice_count │ settled_invoices │ … │ average_days_to_settle │ total_outstanding │
│   varchar    │     int64     │      int128      │ … │         double         │      double       │
├──────────────┼───────────────┼──────────────────┼───┼────────────────────────┼───────────────────┤
│ Wholesale    │         28944 │            25490 │ … │                  68.68 │        87848227.2 │
│ Subscription │         19200 │            19156 │ … │                   3.85 │         751178.89 │
└──────────────┴───────────────┴──────────────────┴───┴────────────────────────┴───────────────────┘

---Answers:
---The results show that Wholesale is the biggest collections problem, 
---with approximately 87.85 million outstanding and an average settlement time of 68.68 days.

Task 4: The ten accounts that matter most
	memory D WITH customer_revenue AS (
             SELECT
                 c.customer_id,
                 c.trading_name,
                 c.segment,
                 c.province,
                 STRING_AGG(DISTINCT r.rep_name, ', ') AS sales_representative,
                 SUM(sl.line_revenue) AS fy2025_revenue
             FROM sizwe_customers AS c
             JOIN sizwe_sales_orders AS so
                 ON c.customer_id = so.customer_id
             JOIN sizwe_sales_lines AS sl
                 ON so.order_id = sl.order_id
             LEFT JOIN sizwe_reps AS r
                 ON so.rep_id = r.rep_id
             WHERE so.order_date >= DATE '2024-07-01'
               AND so.order_date < DATE '2025-07-01'
             GROUP BY
                 c.customer_id,
                 c.trading_name,
                 c.segment,
                 c.province
         )
         SELECT
             trading_name,
             segment,
             province,
             COALESCE(sales_representative, 'Unassigned') AS sales_representative,
             ROUND(fy2025_revenue, 2) AS fy2025_revenue
         FROM customer_revenue
         ORDER BY fy2025_revenue DESC
         LIMIT 10;
┌────────────────────────┬──────────────────┬───────────────┬──────────────────────┬────────────────┐
│      trading_name      │     segment      │   province    │ sales_representative │ fy2025_revenue │
│        varchar         │     varchar      │    varchar    │       varchar        │     double     │
├────────────────────────┼──────────────────┼───────────────┼──────────────────────┼────────────────┤
│ Halvane Retail Group   │ Grocery Chain    │ Western Cape  │ Kagiso Mkhize        │    38399999.89 │
│ Highveld Deli 85       │ Restaurant Group │ Free State    │ Karabo Mokoena       │     3380200.33 │
│ Table Bay Foods 280    │ Independent Cafe │ KwaZulu-Natal │ Karabo van Wyk       │      3333678.0 │
│ Umhlanga Fresh 108     │ Restaurant Group │ Gauteng       │ Sipho Steyn          │     3246754.35 │
│ Kalahari Kitchen 42    │ Independent Cafe │ Gauteng       │ Chantal Ismail       │     2320923.25 │
│ Ridgeway Foods 308     │ Independent Cafe │ KwaZulu-Natal │ Chantal Adams        │     2320555.37 │
│ Boland Bakery 91       │ Independent Cafe │ Free State    │ Karabo Zwane         │     2280097.99 │
│ The Daily Grind 219    │ Hotel Group      │ Western Cape  │ Nomsa Botha          │     2134607.32 │
│ Midrand Market 293     │ Independent Cafe │ KwaZulu-Natal │ Chantal Ismail       │     2024456.98 │
│ Bloom Coffee House 275 │ Hotel Group      │ Gauteng       │ Karabo Zwane         │     1934391.39 │
└────────────────────────┴──────────────────┴───────────────┴──────────────────────┴────────────────┘
  10 rows                                                                                 5 columns

Task 5: A Commercial Gap

	memory D WITH wholesale_revenue AS (
             SELECT
                 c.customer_id,
                 c.trading_name,
                 c.segment,
                 c.province,
                 SUM(sl.line_revenue) AS fy2025_revenue
             FROM sizwe_customers AS c
             JOIN sizwe_sales_orders AS so
                 ON c.customer_id = so.customer_id
             JOIN sizwe_sales_lines AS sl
                 ON so.order_id = sl.order_id
             WHERE c.channel = 'Wholesale'
               AND so.order_date >= DATE '2024-07-01'
               AND so.order_date < DATE '2025-07-01'
               AND NOT EXISTS (
                   SELECT 1
                   FROM sizwe_trade_promotions AS tp
                   WHERE tp.customer_id = c.customer_id
               )
             GROUP BY
                 c.customer_id,
                 c.trading_name,
                 c.segment,
                 c.province
         )
         SELECT
             trading_name,
             segment,
             province,
             ROUND(fy2025_revenue, 2) AS fy2025_revenue
         FROM wholesale_revenue
         ORDER BY fy2025_revenue DESC
         LIMIT 15;
┌────────────────────────┬──────────────────┬───────────────┬────────────────┐
│      trading_name      │     segment      │   province    │ fy2025_revenue │
│        varchar         │     varchar      │    varchar    │     double     │
├────────────────────────┼──────────────────┼───────────────┼────────────────┤
│ Umhlanga Fresh 108     │ Restaurant Group │ Gauteng       │     3246754.35 │
│ Kalahari Kitchen 42    │ Independent Cafe │ Gauteng       │     2320923.25 │
│ Ridgeway Foods 308     │ Independent Cafe │ KwaZulu-Natal │     2320555.37 │
│ Midrand Market 293     │ Independent Cafe │ KwaZulu-Natal │     2024456.98 │
│ Bloom Coffee House 275 │ Hotel Group      │ Gauteng       │     1934391.39 │
│ Corner Perk 34         │ Independent Cafe │ Limpopo       │     1789101.24 │
│ Highveld Deli 28       │ Independent Cafe │ Gauteng       │     1784241.16 │
│ Bloom Coffee House 306 │ Restaurant Group │ Gauteng       │     1768628.67 │
│ Kalahari Kitchen 348   │ Independent Cafe │ KwaZulu-Natal │     1706226.51 │
│ Zebra Cafe 201         │ Grocery Chain    │ Free State    │     1650310.21 │
│ Highveld Deli 305      │ Independent Cafe │ Free State    │     1411766.53 │
│ Zebra Cafe 337         │ Grocery Chain    │ Gauteng       │     1349749.34 │
│ Table Bay Foods 291    │ Independent Cafe │ Gauteng       │     1257658.95 │
│ Ridgeway Foods 125     │ Restaurant Group │ Gauteng       │     1221325.75 │
│ Corner Perk 248        │ Hotel Group      │ KwaZulu-Natal │     1205124.53 │
└────────────────────────┴──────────────────┴───────────────┴────────────────┘
  15 rows                                                          4 columns

---Answers:
---The results show that Umhlanga Fresh 108 is the highest-revenue Wholesale customer without a trade promotion,
---generating approximately 3.25 million, followed by Kalahari Kitchen 42 at 2.32 million and Ridgeway Foods 308 at 2.32 million;
---I recommend targeting these customers first with tailored trade promotions to encourage repeat purchases and increase revenue.

Task 6: Are the sales representatives hitting target?
	memory D WITH rep_performance AS (
             SELECT
                 r.rep_id,
                 r.rep_name,
                 r.territory,
                 r.target_monthly,
                 COALESCE(SUM(sl.line_revenue), 0) / 12.0
                     AS actual_monthly_average
             FROM sizwe_reps AS r
             LEFT JOIN sizwe_sales_orders AS so
                 ON r.rep_id = so.rep_id
                 AND so.order_date >= DATE '2024-07-01'
                 AND so.order_date < DATE '2025-07-01'
             LEFT JOIN sizwe_sales_lines AS sl
                 ON so.order_id = sl.order_id
             GROUP BY
                 r.rep_id,
                 r.rep_name,
                 r.territory,
                 r.target_monthly
         )
         SELECT
             rep_id,
             rep_name,
             territory,
             target_monthly,
             ROUND(actual_monthly_average, 2)
                 AS actual_monthly_average,
             ROUND(
                 100.0 * actual_monthly_average
                 / NULLIF(target_monthly, 0),
                 2
             ) AS target_achievement_pct
         FROM rep_performance
         ORDER BY target_achievement_pct DESC NULLS LAST;
┌─────────┬──────────────────┬─────────────────┬───┬────────────────────────┬────────────────────────┐
│ rep_id  │     rep_name     │    territory    │ … │ actual_monthly_average │ target_achievement_pct │
│ varchar │     varchar      │     varchar     │ … │         double         │         double         │
├─────────┼──────────────────┼─────────────────┼───┼────────────────────────┼────────────────────────┤
│ R-016   │ Karabo van Wyk   │ Gauteng South   │ … │             2252880.96 │                 250.32 │
│ R-001   │ Kagiso Mkhize    │ Gauteng North   │ … │             4996325.67 │                 249.82 │
│ R-018   │ Johan Maluleke   │ KwaZulu-Natal   │ … │             2184885.21 │                 242.77 │
│ R-010   │ Anele Naidoo     │ Western Cape    │ … │             2011837.24 │                 223.54 │
│ R-007   │ Anele Zwane      │ Northern Region │ … │             1846514.09 │                 205.17 │
│ R-009   │ Karabo Mokoena   │ Gauteng South   │ … │             2365324.98 │                 197.11 │
│ R-012   │ Anele Ismail     │ Eastern Cape    │ … │             2299147.69 │                  191.6 │
│ R-013   │ Chantal Ismail   │ Central Region  │ … │             2285301.19 │                 190.44 │
│ R-006   │ Pieter Pillay    │ Central Region  │ … │             2068510.95 │                 172.38 │
│ R-002   │ Nomsa Botha      │ Gauteng South   │ … │             2377843.54 │                 158.52 │
│ R-017   │ Kagiso Dlamini   │ Western Cape    │ … │             2018850.46 │                 134.59 │
│ R-004   │ Chantal Adams    │ KwaZulu-Natal   │ … │             1940122.04 │                 129.34 │
│ R-003   │ Karabo Zwane     │ Western Cape    │ … │             2512055.06 │                  125.6 │
│ R-015   │ Sibusiso Nkosi   │ Gauteng North   │ … │              1778548.0 │                 118.57 │
│ R-005   │ Bongani Mahlangu │ Eastern Cape    │ … │             2321162.58 │                 116.06 │
│ R-014   │ Anele Botha      │ Northern Region │ … │              1616477.8 │                 107.77 │
│ R-011   │ Sipho Steyn      │ KwaZulu-Natal   │ … │             1959822.17 │                  97.99 │
│ R-008   │ Johan Naidoo     │ Gauteng North   │ … │              1164392.3 │                  77.63 │
└─────────┴──────────────────┴─────────────────┴───┴────────────────────────┴────────────────────────┘
  18 rows                                                                        6 columns (5 shown)

Task 7: The shape of the year
	WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', so.order_date)::DATE AS sales_month,
        SUM(sl.line_revenue) AS monthly_revenue
    FROM sizwe_sales_orders AS so
    JOIN sizwe_sales_lines AS sl
        ON so.order_id = sl.order_id
    WHERE so.order_date >= DATE '2023-07-01'
      AND so.order_date < DATE '2025-07-01'
    GROUP BY DATE_TRUNC('month', so.order_date)::DATE
),
monthly_trends AS (
    SELECT
        sales_month,
        monthly_revenue,

        LAG(monthly_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue,

        AVG(monthly_revenue) OVER (
            ORDER BY sales_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS rolling_3_month_average
    FROM monthly_revenue
)
SELECT
    sales_month,
    ROUND(monthly_revenue, 2) AS monthly_revenue,
    ROUND(
        100.0 * (monthly_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS month_on_month_change_pct,
    ROUND(rolling_3_month_average, 2) AS rolling_3_month_average
FROM monthly_trends
ORDER BY sales_month;
┌─────────────┬─────────────────┬───────────────────────────┬─────────────────────────┐
│ sales_month │ monthly_revenue │ month_on_month_change_pct │ rolling_3_month_average │
│    date     │     double      │          double           │         double          │
├─────────────┼─────────────────┼───────────────────────────┼─────────────────────────┤
│ 2023-07-01  │     41051471.75 │                      NULL │             41051471.75 │
│ 2023-08-01  │     39607744.34 │                     -3.52 │             40329608.05 │
│ 2023-09-01  │     36807779.06 │                     -7.07 │             39155665.05 │
│ 2023-10-01  │     35784805.69 │                     -2.78 │              37400109.7 │
│ 2023-11-01  │     34370162.62 │                     -3.95 │             35654249.12 │
│ 2023-12-01  │     29872699.78 │                    -13.09 │             33342556.03 │
│ 2024-01-01  │     31255621.08 │                      4.63 │             31832827.83 │
│ 2024-02-01  │     35156025.63 │                     12.48 │             32094782.16 │
│ 2024-03-01  │     37287497.58 │                      6.06 │             34566381.43 │
│ 2024-04-01  │     37950728.75 │                      1.78 │             36798083.99 │
│ 2024-05-01  │     40372504.38 │                      6.38 │             38536910.24 │
│ 2024-06-01  │     41482956.81 │                      2.75 │             39935396.65 │
│ 2024-07-01  │     44577702.77 │                      7.46 │             42144387.99 │
│ 2024-08-01  │     43053627.21 │                     -3.42 │              43038095.6 │
│ 2024-09-01  │     40013872.74 │                     -7.06 │             42548400.91 │
│ 2024-10-01  │     39014595.93 │                      -2.5 │             40694031.96 │
│ 2024-11-01  │     37435415.91 │                     -4.05 │             38821294.86 │
│ 2024-12-01  │     32609167.66 │                    -12.89 │             36353059.83 │
│ 2025-01-01  │     34184711.27 │                      4.83 │             34743098.28 │
│ 2025-02-01  │     38246732.89 │                     11.88 │             35013537.27 │
│ 2025-03-01  │      40504297.3 │                       5.9 │             37645247.15 │
│ 2025-04-01  │     41326872.55 │                      2.03 │             40025967.58 │
│ 2025-05-01  │     43905063.28 │                      6.24 │             41912077.71 │
│ 2025-06-01  │     45127963.84 │                      2.79 │             43453299.89 │
└─────────────┴─────────────────┴───────────────────────────┴─────────────────────────┘
  24 rows                                                                   4 columns
---Answers:
---Revenue generally declines from July towards December, then recovers from January through June in both years.
---December is Sizwe Coffee’s quietest month, with the lowest revenue recorded in December 2023 at approximately 29.87 million.

Task 8: Why has the margin moved?
	WITH product_line_revenue AS (
    SELECT
        p.product_line,
        CASE
            WHEN so.order_date < DATE '2024-07-01'
                THEN 'FY2024'
            ELSE 'FY2025'
        END AS financial_year,
        SUM(sl.line_revenue) AS revenue,
        SUM(sl.cogs) AS cost_of_goods
    FROM sizwe_sales_orders AS so
    JOIN sizwe_sales_lines AS sl
        ON so.order_id = sl.order_id
    JOIN sizwe_products AS p
        ON sl.sku = p.sku
    WHERE so.order_date >= DATE '2023-07-01'
      AND so.order_date < DATE '2025-07-01'
    GROUP BY
        p.product_line,
        CASE
            WHEN so.order_date < DATE '2024-07-01'
                THEN 'FY2024'
            ELSE 'FY2025'
        END
),
line_metrics AS (
    SELECT
        product_line,
        financial_year,
        revenue,
        cost_of_goods,
        100.0 * (revenue - cost_of_goods)
            / NULLIF(revenue, 0) AS gross_margin_pct,
        100.0 * revenue
            / NULLIF(
                SUM(revenue) OVER (
                    PARTITION BY financial_year
                ),
                0
            ) AS revenue_share_pct
    FROM product_line_revenue
)
SELECT
    product_line,

    ROUND(MAX(CASE WHEN financial_year = 'FY2024'
        THEN revenue END), 2) AS fy2024_revenue,

    ROUND(MAX(CASE WHEN financial_year = 'FY2024'
        THEN gross_margin_pct END), 2) AS fy2024_gross_margin_pct,

    ROUND(MAX(CASE WHEN financial_year = 'FY2024'
        THEN revenue_share_pct END), 2) AS fy2024_revenue_share_pct,

    ROUND(MAX(CASE WHEN financial_year = 'FY2025'
        THEN revenue END), 2) AS fy2025_revenue,

    ROUND(MAX(CASE WHEN financial_year = 'FY2025'
        THEN gross_margin_pct END), 2) AS fy2025_gross_margin_pct,

    ROUND(MAX(CASE WHEN financial_year = 'FY2025'
        THEN revenue_share_pct END), 2) AS fy2025_revenue_share_pct

FROM line_metrics
GROUP BY product_line
ORDER BY product_line;
┌─────────────────┬────────────────┬───┬────────────────┬─────────────────────────┬───────────────────────┐
│  product_line   │ fy2024_revenue │ … │ fy2025_revenue │ fy2025_gross_margin_pct │ fy2025_revenue_share… │
│     varchar     │     double     │ … │     double     │         double          │        double         │
├─────────────────┼────────────────┼───┼────────────────┼─────────────────────────┼───────────────────────┤
│ Bulk Commercial │   110338581.35 │ … │   161500249.66 │                   19.91 │                 33.65 │
│ Capsules        │     56822349.5 │ … │    52052726.72 │                   38.79 │                 10.84 │
│ Decaf           │    46300477.47 │ … │    44342067.61 │                   35.81 │                  9.24 │
│ House Blend     │   141746471.48 │ … │   137784477.42 │                   38.34 │                 28.71 │
│ Single Origin   │    85792117.67 │ … │    84320501.94 │                   44.31 │                 17.57 │
└─────────────────┴────────────────┴───┴────────────────┴─────────────────────────┴───────────────────────┘
  5 rows                                                                              7 columns (5 shown)

---Answers:
---The gross margin declined from 34.7% in FY2024 to 33.0% in FY2025 mainly because Bulk Commercial, which had a relatively low gross margin of 19.91% in FY2025,
---increased its revenue significantly from 110.34 million to 161.50 million and accounted for 33.65% of FY2025 revenue.
---This meant a larger share of sales came from a low-margin product line, putting downward pressure on the overall margin. Revenue also declined for House Blend,
---from 141.75 million to 137.78 million, while the other product lines experienced smaller revenue declines, further contributing to the challenge of maintaining overall profitability.
	




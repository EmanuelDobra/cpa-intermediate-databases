-- Assign 3 Script 
-- Emanuel Dobra, April 20 2021

SELECT *
FROM sales_totals;

-- 1
SELECT COUNT(DISTINCT(rep_id)) as "Number of Sales Reps"
FROM sales_totals;

-- 2
SELECT COUNT(sales_total) as numberOfSalesReps2016, 
		ROUND(AVG(sales_total),0) as avgSales2016BySalesrep,
        ROUND(SUM(sales_total),0) as totalSales2016
FROM sales_totals
WHERE sales_year = 2016;

-- 3
SELECT DISTINCT(rep_id), ROUND(SUM(sales_total),0) as RepTotal
FROM sales_totals
GROUP BY rep_id WITH ROLLUP;

-- 4
SELECT *
FROM sales_totals
WHERE sales_total < (SELECT AVG(sales_total) FROM sales_totals)
ORDER BY rep_id, sales_total;

-- 5
SELECT rep_id, sales_year, ROUND(SUM(sales_total),0) as RepTotal
FROM sales_totals
GROUP BY rep_id, sales_year WITH ROLLUP;

-- 6
SELECT rep_id, ROUND(SUM(sales_total),0) as RepTotal
FROM sales_totals
GROUP BY rep_id
HAVING RepTotal > 1000000;

-- 7
SELECT rep_first_name, rep_last_name, ROUND(SUM(sales_total),0) as RepTotal
FROM sales_totals st
	JOIN sales_reps sp
    ON st.rep_id = sp.rep_id
GROUP BY rep_first_name
HAVING RepTotal > 1000000;

-- 8
SELECT CONCAT(rep_first_name, rep_last_name) as "Sales Rep",
		sr.rep_id as "Sales Rep Number", 
        COUNT(DISTINCT(sales_year)) as "Number of Years with Sales"
FROM sales_reps sr
	JOIN sales_totals st
    ON sr.rep_id = st.rep_id
GROUP BY st.rep_id;

-- 9 a)
CREATE TABLE customered LIKE customers; 
INSERT customered SELECT * FROM customers;

-- 9 b)
INSERT INTO customered(customer_id, customer_first_name) 
VALUES (25, "Emanuel");

-- 10
UPDATE customered
SET customer_city = "Kingston"
WHERE customer_id = 25;
-- SET SQL_SAFE_UPDATES = 0;

-- 11
DELETE FROM customered
WHERE customer_id = 25; 

-- 12
UPDATE customered
SET customer_state = "ON"
WHERE customer_state = "WA";

-- 13
CREATE INDEX repLName ON customered(customer_last_name);

-- 14
SHOW INDEXES FROM customered;

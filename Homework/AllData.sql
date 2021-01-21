/*Homework 1*/
SELECT * 
FROM om.customers;

SELECT * 
FROM om.orders
ORDER BY customer_id;


-- Emanuel Wk1 
SELECT * 
FROM om.customers 
JOIN om.orders
ON om.customers.customer_id = om.orders.customer_id;





 

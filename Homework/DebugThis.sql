-- Week 2 debugging practice using the ex (examples) database and the customers table

SELECT * FROM customers;


-- Question 1    display customers last name, state, and city; sorted by city within state

SELECT customer_last_name, customer_state, customer_city
FROM customers
ORDER BY customer_city;


-- Question 2  display all columns for only customers that are in Georgia (GA) or Washington (WA)

SELECT *
FROM customers
WHERE customer_state = 'GA' OR customer_state = 'WA'; -- (alt) WHERE customer_state IN ('GA', 'WA'); 


-- Question 3      display customer's last name, address, city for customers that live on a street.

SELECT customer_last_name, customer_address, customer_city
FROM customers
WHERE customer_address LIKE '%St%';









/* Comment Block */
-- Comment
/*
USE database
SELECT data (* for all)
FROM table
WHERE condition (LIKE string, BETWEEN x AND y, < > = !=)
ORDER BY column (DESC for descending order)

*/
USE om;

-- Write a query to display all rows in the items table in the om database 

SELECT *
FROM items;

-- display artist & title for prices more than 15
-- sort by price, highest to lowest

SELECT artist, title
FROM items
WHERE unit_price > 15
ORDER BY unit_price DESC;

-- Display all columns and only unit prices from 15-17
SELECT * 
FROM items
WHERE unit_price BETWEEN 15 AND 17;

-- display title and artist for titles ending in letters 'es'
SELECT title, artist
FROM items
WHERE title LIKE '%es';
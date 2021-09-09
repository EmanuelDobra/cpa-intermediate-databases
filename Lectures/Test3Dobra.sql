DROP DATABASE IF EXISTS test3ed;    
CREATE DATABASE test3ed;
USE test3ed;

CREATE TABLE department
(
  departNum		INT           PRIMARY KEY,
  departName    VARCHAR(50)   NOT NULL
 );

INSERT INTO department VALUES 
(1,'Finance'),
(2,'Human Resources'),
(3,'IT'),
(4,'Sales'),
(5,'Shipping');

CREATE TABLE employee
(
  employeeID    	INT               PRIMARY KEY,
  empLName          VARCHAR(35),
  empFName          VARCHAR(35),
  empHourlyRate		DECIMAL(5,2),
  departNum			INT,
  
  CONSTRAINT depart_fk_empl
     FOREIGN KEY (departNum)
	 REFERENCES department(departNum)
   
);

INSERT INTO employee VALUES 
(1,'Smith',		'Cindy',	72, 2),
(2,'Jones',		'Elmer',	63.45,4),
(3,'Simonian',	'Ralph',	32,1),
(4,'Hernandez',	'Olivia',	76.25,1),
(5,'Aaronsen',	'Robert',	NULL,3),
(6,'Watson',	'Denise',	120.23,2),
(7,'Hardy',		'Thomas',	55,3),
(8,'Leary',		'Rhea',		64,5),
(9,'Locario',	'Paulo',	32,5),
(10,'Simpson',  'Robin',   40.20,2),
(11,'Simpson',	'Danny',   19.25,2),
(12,'Liu',		'Allie',   39.45,3);

/*
-- 1
SELECT MAX(empHourlyRate) as highest_rate, COUNT(employeeID) as num_employees, COUNT(empHourlyRate) as num_employees_assigned_hourly_rate
FROM employee;

-- 2
SELECT empLName, empFName, empHourlyRate
FROM employee
WHERE empHourlyRate > (SELECT AVG(empHourlyRate) FROM employee);

-- 3
SELECT departNum, COUNT(employeeID) as num_employees
FROM employee
GROUP BY departNum WITH ROLLUP;

-- 4 
SELECT departName, empLName, empFName # added empFName to fit the results in the instructions
FROM department d
	JOIN employee e
    WHERE d.departNum = e.departNum; 

-- 5
SELECT departName, AVG(empHourlyRate) as Average_Hourly_Rate, COUNT(employeeID) as num_employees
FROM department d
	JOIN employee e
    WHERE d.departNum = e.departNum
GROUP BY departName WITH ROLLUP; # Added with rollup to fit the results in the instructions

-- 6
SELECT departName, AVG(empHourlyRate) as Average_Hourly_Rate
FROM department d
	JOIN employee e
    ON d.departNum = e.departNum
WHERE empHourlyRate > 50
GROUP BY departName
HAVING Average_Hourly_Rate > 75;

-- 7
UPDATE employee
SET empHourlyRate=empHourlyRate*1.1;
-- SET SQL_SAFE_UPDATES = 0;

-- 8 a 
CREATE INDEX IDX_empLName ON employee(empLName);

-- 8 b 
SHOW INDEXES FROM employee;

-- 8 c 
DROP INDEX IDX_empLName ON employee;

-- 9
DELETE FROM employee
WHERE departNum = 5 AND empHourlyRate < 50;

-- 10 
INSERT INTO employee(employeeID, empFName, empLname)
VALUES (13, "Emanuel", "Dobra");
*/

-- 11
# Over the summer I plan to start working full time at my job 
# that I am currently a contractor for. Boring summer, I know, but I do enjoy my job ^_^

/*
-- left join and where .... is NULL
select programType 
from program p
	left join members m
		on p.programID = m.programID
where m.programID IS NULL;
*/

-- Week 8 join examples  ex (examples) database
-- refer to joins diagaram in week7 blackboard

SELECT * FROM departments;		-- 5 rows department# 1-5

SELECT * FROM employees;		-- 9 rows emp# 1-9

SELECT department_name AS dept_name,
		d.department_number AS d_dept_no,
        e.department_number AS e_dept_no,
        last_name
FROM departments d 
		JOIN employees e  -- simple join = inner join
	ON d.department_number = e.department_number
ORDER BY dept_name;


 -- ---------------------------------------------------------------
 -- #2 left outer join, displays all from departments table (becuase dp is first and this is left outer join)
 
    SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        LEFT JOIN employees e 
        ON d.department_number = e.department_number
	Order by dept_name; 
    
    
 -- -------------------------------------------------------------
 -- #3 right outer join, displays all from employees table (because emp is second and this is right outer join)
 
  SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        RIGHT JOIN employees e 
        ON d.department_number = e.department_number
ORDER BY dept_name;


-- ----------------------------------------------------------------
-- #4 MySQL doen't support FULL OUTER JOUN, so we have this workaround with the union keyword
-- p. 145 FULL OUTER JOIN 

   SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        LEFT JOIN employees e 
        ON d.department_number = e.department_number
UNION
    SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        RIGHT JOIN employees e 
        ON d.department_number = e.department_number
ORDER BY dept_name;


--  -------------------------------------------------------------
-- #5
   SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        LEFT JOIN employees e 
        ON d.department_number = e.department_number
	WHERE e.department_number IS NULL
UNION 
    SELECT department_name AS dept_name,
           d.department_number AS d_dept_no,
           e.department_number AS e_dept_no,
           last_name
    FROM departments d 
        RIGHT JOIN employees e 
        ON d.department_number = e.department_number
	WHERE d. department_number IS NULL
ORDER BY dept_name;

/* DATAYPES:
p233 chart
> Character 		- text, special chars, or numbers that you don't do math calculations on, ie. phone#, SIN, ZIPCODE
> Numeric			- no decimal point (integers) OR decimals (double, float) 
> DATE and TIME 	-
> Large object LOB 	- images, sound
> spacial 			- gps coordinates
> JSON 				- Javascript object notation
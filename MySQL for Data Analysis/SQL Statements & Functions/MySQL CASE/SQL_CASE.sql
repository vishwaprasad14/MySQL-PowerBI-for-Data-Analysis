/* The CASE statement in MySQL allows you to perform conditional logic within SQL queries. It works similarly to if-then-else statements in programming languages. 
The CASE statement can be used in various parts of a query, such as SELECT, UPDATE, and ORDER BY clauses. 
Here are some examples demonstrating how to use CASE statements in MySQL */

/* Assume the tables with the following columns:
Employees Table

id (integer)
first_name (varchar)
last_name (varchar)
department_id (integer)
salary (decimal)
hire_date (date)
Departments Table

department_id (integer)
department_name (varchar) */

/* Using CASE in a SELECT Statement */
/* Categorize each employee's salary into 'Low', 'Medium', or 'High' based on the salary value */
SELECT 
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary < 50000 THEN 'Low'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category
FROM employees;

/* Map department_id to department names */
SELECT 
    first_name,
    last_name,
    salary,
    CASE department_id
        WHEN 1 THEN 'Sales'
        WHEN 2 THEN 'Marketing'
        WHEN 3 THEN 'IT'
        ELSE 'Other'
    END AS department_name
FROM employees;


/* Using CASE in an UPDATE Statement */
/* Increase salaries by different percentages based on the department */
UPDATE employees
SET salary = CASE
    WHEN department_id = 1 THEN salary * 1.10  -- 10% increase for Sales
    WHEN department_id = 2 THEN salary * 1.05  -- 5% increase for Marketing
    ELSE salary
END;


/* Using CASE in an ORDER BY Clause */
/* Order employees first by 'Low' salary, then 'Medium' salary, and then 'High' salary */
SELECT 
    first_name,
    last_name,
    salary
FROM employees
ORDER BY 
    CASE
        WHEN salary < 50000 THEN 1
        WHEN salary BETWEEN 50000 AND 100000 THEN 2
        ELSE 3
    END;
    
    
/* Using CASE in a WHERE Clause */
/* Filter employees based on custom salary thresholds for different departments */
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE 
    CASE
        WHEN department_id = 1 THEN salary > 60000
        WHEN department_id = 2 THEN salary > 50000
        ELSE salary > 40000
    END;


/*Using CASE in an Aggregate Function */
/* Count the number of employees in different salary ranges */
SELECT 
    COUNT(CASE WHEN salary < 50000 THEN 1 END) AS low_salary_count,
    COUNT(CASE WHEN salary BETWEEN 50000 AND 100000 THEN 1 END) AS medium_salary_count,
    COUNT(CASE WHEN salary > 100000 THEN 1 END) AS high_salary_count
FROM employees;


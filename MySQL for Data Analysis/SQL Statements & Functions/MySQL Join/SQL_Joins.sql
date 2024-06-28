/* JOINs are used to combine rows from two or more tables based on related columns. Here are the different types of joins in MySQL using two tables: employees and departments */
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

/* INNER JOIN
An INNER JOIN returns only the rows that have matching values in both tables */

/*  Retrieve employees along with their department names */
SELECT e.id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

/* LEFT JOIN (or LEFT OUTER JOIN)
A LEFT JOIN returns all rows from the left table (employees), and the matched rows from the right table (departments). 
If there is no match, NULL values are returned for columns from the right table */

/* Retrieve all employees, including those who are not assigned to any department */
SELECT e.id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

/* RIGHT JOIN (or RIGHT OUTER JOIN)
A RIGHT JOIN returns all rows from the right table (departments), and the matched rows from the left table (employees). 
If there is no match, NULL values are returned for columns from the left table */

/* Retrieve all departments, including those that do not have any employees */
SELECT e.id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

/* FULL OUTER JOIN
MySQL does not support the FULL OUTER JOIN directly, but it can be simulated using a UNION of LEFT JOIN and RIGHT JOIN */

/* Retrieve all employees and all departments, including those that do not have matches in the other table */
SELECT e.id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id

UNION

SELECT e.id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

/* CROSS JOIN
A CROSS JOIN returns the Cartesian product of the two tables, i.e., all possible combinations of rows */

/* Retrieve all combinations of employees and departments */
SELECT e.id, e.first_name, e.last_name, d.department_name
FROM employees e
CROSS JOIN departments d;

/* SELF JOIN
A SELF JOIN is a regular join, but the table is joined with itself */

/* Retrieve employees along with their managers */
/* Hint - assume there is a manager_id column in the employees table */
SELECT e1.id AS employee_id, e1.first_name AS employee_first_name, e2.id AS manager_id, e2.first_name AS manager_first_name
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.id;




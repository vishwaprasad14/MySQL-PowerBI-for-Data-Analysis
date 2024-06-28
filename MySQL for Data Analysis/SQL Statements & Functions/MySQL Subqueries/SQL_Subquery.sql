/* Subqueries in MySQL are nested queries within another SQL query. They are used to perform operations that are more complex and cannot be achieved with a single query. 
Here are examples of different types of subqueries using the employees and departments tables */

/* Table Structures
employees Table
id (integer)
first_name (varchar)
last_name (varchar)
department_id (integer)
salary (decimal)
hire_date (date)

departments Table
department_id (integer)
department_name (varchar) */

/* Subqueries in the SELECT Clause
A subquery can be used in the SELECT clause to return a single value for each row */

/* Select employees with their department names */
SELECT 
    id,
    first_name,
    last_name,
    salary,
    (SELECT department_name FROM departments WHERE department_id = employees.department_id) AS department_name
FROM employees;


/* Subqueries in the WHERE Clause
Subqueries are often used in the WHERE clause to filter results based on a query */

/* Select employees with a salary above the average salary */
SELECT id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


/* Subqueries in the FROM Clause
A subquery can be used in the FROM clause to create a temporary table */

/*Select the average salary by department */
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

SELECT department_id, average_salary
FROM (
    SELECT department_id, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
) AS avg_salaries;


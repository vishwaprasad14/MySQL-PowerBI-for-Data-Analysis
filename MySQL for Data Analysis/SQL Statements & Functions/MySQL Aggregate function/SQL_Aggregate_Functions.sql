/* Aggregate functions in MySQL are used to perform calculations on multiple rows of a table's column and return a single value */
/* Common aggregate functions include COUNT, SUM, AVG, MIN, and MAX */

/* Count Employees in a Sales Department */ 
SELECT COUNT(*) AS sales_employees
FROM employees
WHERE department = 'Sales';


/* Find total Salary in a Sales Department */
SELECT SUM(salary) AS total_sales_salary
FROM employees
WHERE department = 'Sales';

/* Find total Salary by Department */
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

/* Find Departments with Total Salary Greater than 200,000 */
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING total_salary > 200000;
/* HAVING clause is used to filter groups after the GROUP BY clause */


/* Find Average Salary in a Sales Department */
SELECT AVG(salary) AS average_sales_salary
FROM employees
WHERE department = 'Sales';

/* Find Average Salary by Department */
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

/* Find Maximum Salary of All Employees */
SELECT MAX(salary) AS maximum_salary
FROM employees;

/* Find Minimum Salary of All Employees */
SELECT MIN(salary) AS minimum_salary
FROM employees;

/* Find multiple aggregate functions in a single query */
SELECT department, 
       COUNT(*) AS number_of_employees, 
       SUM(salary) AS total_salary, 
       AVG(salary) AS average_salary, 
       MIN(salary) AS minimum_salary, 
       MAX(salary) AS maximum_salary
FROM employees
GROUP BY department;




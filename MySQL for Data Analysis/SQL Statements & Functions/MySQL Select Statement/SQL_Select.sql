/* SELECT statement is used to fetch data from a database. 
Here are the examples including different clauses and options you can use.
	Syntax:
    SELECT column1, column2,
	FROM table_name
	WHERE condition
	GROUP BY column
	HAVING condition
	ORDER BY column
	LIMIT number;
    
Assume a table named employees with the following columns:

id (integer)
first_name (varchar)
last_name (varchar)
department (varchar)
salary (decimal)
hire_date (date)
*/


/* Retrieve all columns from the employees table */
SELECT * FROM employees;

/* Retrieve only the first_name, last_name, and department columns */
SELECT first_name, last_name, department FROM employees;

/* Retrieve the first_name and last_name of employees who work in the Sales department 
Hint - Use Where clause */
SELECT first_name, last_name FROM employees WHERE department = 'Sales';

/* Retrieve the first_name, last_name, and salary of employees, ordered by salary in descending order
Hint - Use ORDER BY */
SELECT first_name, last_name, salary FROM employees ORDER BY salary DESC;

/* Retrieve the number of employees in each department 
Hint - Use GROUP BY */
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

/*  Retrieve departments where the average salary is greater than 50,000 
Hint - Use HAVING with GROUP BY */
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

/* Retrieve the first 10 rows from the employees table 
Hint - Use LIMIT */
SELECT * FROM employees LIMIT 10;

/* Retrieve the first_name, last_name, department, and salary of the top 5 employees with salaries greater than 60,000, ordered by their hire date in ascending order
Hint - Use Where clause, ORDER BY, LIMIT */ 
SELECT first_name, last_name, department, salary
FROM employees
WHERE salary > 60000
ORDER BY hire_date ASC
LIMIT 5;

/* Select the employees with a salary greater than 50000 */
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE salary > 50000;

/* Select the employees with last name Smith */ 
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE last_name = 'Smith';

/* Select the employees with a salary between 40000 AND 60000 */
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE salary BETWEEN 40000 AND 60000;

/* Select the employees from IT and HR departments */
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE department IN ('IT', 'HR');

/* Select the employees whose last name starts with letter "S" */
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE last_name LIKE 'S%';

/* Select the employees with first name as John in Finance Department*/
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE first_name = 'John' AND department = 'Finance';

/*  Select the employees in the 'Marketing' department with a salary greater than 60000 */
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE department = 'Marketing' AND salary > 60000;













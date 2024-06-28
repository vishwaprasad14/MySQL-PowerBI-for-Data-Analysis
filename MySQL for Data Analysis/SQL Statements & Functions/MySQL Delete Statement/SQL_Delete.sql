/* The DELETE statement in MySQL is used to remove rows from a table. Here are the examples of DELETE statement in different scenarios */

/* Delete the row from the employees table where the id is 1 */
DELETE FROM employees
WHERE id = 1;

/* Delete all rows where the department is 'Sales' and the salary is less than 50000 */
DELETE FROM employees
WHERE department = 'Sales' AND salary < 50000;

/* Deletes all rows from the employees table. Note that this does not reset the auto-increment counter if there is one */
DELETE FROM employees;

/* Delet using subquery */
/* Delete all rows in the employees table where the department matches the department name of the department with department_id 3 in the departments table */
DELETE FROM employees
WHERE department = (SELECT department_name FROM departments WHERE department_id = 3);

/*Deleting Rows with a Limit*/
/* Delete the first 5 rows from the employees table, ordered by the hire_date in ascending order */
DELETE FROM employees
ORDER BY hire_date ASC
LIMIT 5;
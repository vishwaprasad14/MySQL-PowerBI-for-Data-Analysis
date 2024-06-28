/* The UPDATE statement in MySQL is used to modify existing records in a table. Here are various examples of how to use the UPDATE statement with different conditions and techniques */
/* update the salary of the employee with id 1 to 58000 */
UPDATE employees
SET salary = 58000
WHERE id = 1;

/* update the first_name, last_name, and salary of the employee with id 1 */
UPDATE employees
SET first_name = 'Jonathan', last_name = 'Doe', salary = 60000
WHERE id = 1;

/* update the department to 'Sales' and salary to 62000 for employees who are in the 'Marketing' department and have a salary less than 60000 */
UPDATE employees
SET department = 'Sales', salary = 62000
WHERE department = 'Marketing' AND salary < 60000;

/* Using Subqueries in Update */ 
/* Increase the salary by 10% for employees in the department named 'IT' */
UPDATE employees
SET salary = salary * 1.1
WHERE department = (SELECT department FROM departments WHERE department_name = 'IT');

/* Updating with a Case Statement */
/* update the salary based on the department: a 10% increase for 'Sales', a 5% increase for 'Marketing', and no change for other departments */
UPDATE employees
SET salary = CASE
    WHEN department = 'Sales' THEN salary * 1.10
    WHEN department = 'Marketing' THEN salary * 1.05
    ELSE salary
END;





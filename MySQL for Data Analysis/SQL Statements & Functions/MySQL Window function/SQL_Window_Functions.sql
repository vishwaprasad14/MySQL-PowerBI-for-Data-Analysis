/* Window functions in MySQL allow to perform calculations across a set of table rows that are related to the current row. 
This is similar to aggregate functions, but unlike aggregate functions, window functions do not cause rows to become grouped into a single output row—the rows retain their separate identities. 
Here are examples of various window functions using the employees table */

/* Assume the tables with the following columns:
Employees Table

id (integer)
first_name (varchar)
last_name (varchar)
department_id (integer)
salary (decimal)
hire_date (date) */

/* ROW_NUMBER() Function
The ROW_NUMBER() function assigns a unique sequential integer to rows within a partition of a result set, starting with 1 for the first row in each partition */

/* Assign row numbers to employees ordered by salary */ 
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;


/* RANK() Function
The RANK() function assigns a rank to each row within a partition of a result set. 
The rank of a row is one plus the number of ranks that come before it. 
The same rank is assigned to rows with equal values, leaving gaps in the ranking sequence */

/* Rank employees by salary within each department */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS Dept_rank
FROM employees;


/* DENSE_RANK() Function
The DENSE_RANK() function assigns ranks to rows within the same partition of a result set, similar to RANK(). 
However, DENSE_RANK() leaves no gaps in the ranking sequence when there are ties */

/* Find the Dense rank of employees by salary within each department */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank
FROM employees;


/* NTILE() Function
The NTILE() function distributes the rows in an ordered partition into a specified number of approximately equal groups, 
and assigns a number to each group, starting from 1 */

/* Divide employees into 4 salary quartiles */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    NTILE(4) OVER (ORDER BY salary DESC) AS quartile
FROM employees;


/* LAG() and LEAD() Functions
The LAG() function provides access to a row at a specified physical offset that comes before the current row in the window. 
The LEAD() function provides access to a row at a specified physical offset that follows the current row in the window */

/* Compare each employee's salary with the previous employee's salary */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    LAG(salary, 1) OVER (ORDER BY salary) AS prev_salary, 
    LEAD(salary, 1) OVER (ORDER BY salary) AS next_salary
FROM employees;


/* FIRST_VALUE() and LAST_VALUE() Functions
The FIRST_VALUE() function returns the first value in an ordered set of values, and the LAST_VALUE() function returns the last value */

/* Get the highest and lowest salaries in each department */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS highest_salary, 
    LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS lowest_salary
FROM employees;


/* SUM() Function as a Window Function
The SUM() function can be used as a window function to calculate cumulative totals */

/* Calculate the cumulative salary for each employee, ordered by hire date */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    SUM(salary) OVER (ORDER BY hire_date) AS cumulative_salary
FROM employees;


/* AVG() Function as a Window Function
The AVG() function calculates the average value of a set of values */

/* Calculate the running average salary for each employee */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    AVG(salary) OVER (ORDER BY hire_date) AS running_avg_salary
FROM employees;


/* Combining Window Functions */

/* Calculate various statistics for employees by department */
SELECT 
    id, 
    first_name, 
    last_name, 
    department_id, 
    salary, 
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank,
    NTILE(4) OVER (PARTITION BY department_id ORDER BY salary DESC) AS quartile,
    LAG(salary, 1) OVER (PARTITION BY department_id ORDER BY salary) AS prev_salary,
    LEAD(salary, 1) OVER (PARTITION BY department_id ORDER BY salary) AS next_salary,
    SUM(salary) OVER (PARTITION BY department_id ORDER BY salary) AS cumulative_salary,
    AVG(salary) OVER (PARTITION BY department_id ORDER BY salary) AS running_avg_salary
FROM employees;




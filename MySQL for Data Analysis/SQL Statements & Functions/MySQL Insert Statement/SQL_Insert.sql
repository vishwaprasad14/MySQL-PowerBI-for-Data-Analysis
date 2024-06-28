/* INSERT statements in MySQL can involve inserting multiple rows, inserting data from one table to another */
/* To Insert Multiple Rows */ 
INSERT INTO employees (id, first_name, last_name, department, salary, hire_date)
VALUES
    (1, 'John', 'Doe', 'Sales', 55000.00, '2020-05-15'),
    (2, 'Jane', 'Smith', 'Marketing', 62000.00, '2019-03-22'),
    (3, 'Michael', 'Brown', 'IT', 75000.00, '2018-07-11');
    
/* To copy data from one table to another */
/* Assume that another table called new_employees with the same structure as employees */
INSERT INTO new_employees (id, first_name, last_name, department, salary, hire_date)
SELECT id, first_name, last_name, department, salary, hire_date
FROM employees
WHERE hire_date > '2020-01-01';
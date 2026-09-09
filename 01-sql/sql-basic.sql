```sql
-- ============================================================
-- SQL BASICS - DATA ENGINEERING JOURNEY
-- ============================================================
-- Author: Avinash
-- Database: MySQL
--
-- Topics Covered:
-- CREATE TABLE
-- INSERT
-- SELECT
-- DISTINCT
-- WHERE
-- ORDER BY
-- LIMIT
-- ALTER TABLE
-- UPDATE
-- GROUP BY
-- HAVING
-- BETWEEN
-- LIKE
-- Aggregate Functions
-- Subqueries
-- ============================================================


-- ============================================================
-- 1. CREATE TABLE
-- ============================================================

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_name VARCHAR(50),
    age INT
);


-- ============================================================
-- 2. INSERT EMPLOYEE DATA
-- ============================================================

INSERT INTO employee (
    employee_id,
    employee_name,
    salary,
    department_name,
    age
)
VALUES
(1, 'Rahul', 60000, 'HR', 27),
(2, 'Priya', 55000, 'HR', 26),
(3, 'Arjun', 65000, 'Finance', 28),
(4, 'Sneha', 75000, 'IT', 30),
(5, 'Kiran', 50000, 'Sales', 25);


-- ============================================================
-- 3. SELECT
-- ============================================================

-- Display all employees

SELECT *
FROM employee;


-- Display employee names

SELECT employee_name
FROM employee;


-- Display employee names and salaries

SELECT employee_name, salary
FROM employee;


-- ============================================================
-- 4. DISTINCT
-- ============================================================

-- Display unique departments

SELECT DISTINCT department_name
FROM employee;


-- ============================================================
-- 5. WHERE CLAUSE
-- ============================================================

-- Employees with salary greater than 50,000

SELECT employee_name
FROM employee
WHERE salary > 50000;


-- Employees working in the IT department

SELECT employee_name, salary
FROM employee
WHERE department_name = 'IT';


-- ============================================================
-- 6. ORDER BY
-- ============================================================

-- Sort employees by salary from highest to lowest

SELECT *
FROM employee
ORDER BY salary DESC;


-- Sort employees by salary from lowest to highest

SELECT *
FROM employee
ORDER BY salary ASC;


-- ============================================================
-- 7. ORDER BY + LIMIT
-- ============================================================

-- Find the employee with the highest salary

SELECT employee_name, salary
FROM employee
ORDER BY salary DESC
LIMIT 1;


-- Find the top 2 highest salaries

SELECT employee_name, salary
FROM employee
ORDER BY salary DESC
LIMIT 2;


-- ============================================================
-- 8. AGGREGATE FUNCTIONS
-- ============================================================

-- Count total employees

SELECT COUNT(*) AS total_employees
FROM employee;


-- Calculate total salary

SELECT SUM(salary) AS total_salary
FROM employee;


-- Calculate average salary

SELECT AVG(salary) AS average_salary
FROM employee;


-- Find the highest salary

SELECT MAX(salary) AS highest_salary
FROM employee;


-- Find the lowest salary

SELECT MIN(salary) AS lowest_salary
FROM employee;


-- ============================================================
-- 9. ALTER TABLE - ADD COLUMN
-- ============================================================

-- Add email column

ALTER TABLE employee
ADD COLUMN employee_email VARCHAR(100);


-- Check table structure

DESCRIBE employee;


-- ============================================================
-- 10. UPDATE EMAIL
-- ============================================================

UPDATE employee
SET employee_email = 'rahul@gmail.com'
WHERE employee_id = 1;

UPDATE employee
SET employee_email = 'priya@gmail.com'
WHERE employee_id = 2;

UPDATE employee
SET employee_email = 'arjun@gmail.com'
WHERE employee_id = 3;

UPDATE employee
SET employee_email = 'sneha@gmail.com'
WHERE employee_id = 4;

UPDATE employee
SET employee_email = 'kiran@gmail.com'
WHERE employee_id = 5;


-- Display updated data

SELECT *
FROM employee;


-- ============================================================
-- 11. ALTER TABLE - ADD GENDER
-- ============================================================

ALTER TABLE employee
ADD COLUMN gender VARCHAR(20);


-- ============================================================
-- 12. UPDATE GENDER
-- ============================================================

UPDATE employee
SET gender = 'Male'
WHERE employee_id = 1;

UPDATE employee
SET gender = 'Female'
WHERE employee_id = 2;

UPDATE employee
SET gender = 'Male'
WHERE employee_id = 3;

UPDATE employee
SET gender = 'Female'
WHERE employee_id = 4;

UPDATE employee
SET gender = 'Male'
WHERE employee_id = 5;


-- Display updated table

SELECT *
FROM employee;


-- ============================================================
-- 13. COMPARISON OPERATORS
-- ============================================================

-- Display employees who are not male

SELECT
    employee_name,
    department_name,
    employee_email,
    salary
FROM employee
WHERE gender != 'Male';


-- ============================================================
-- 14. BETWEEN
-- ============================================================

-- Employees whose age is between 25 and 30

SELECT employee_name, age
FROM employee
WHERE age BETWEEN 25 AND 30;


-- Employees whose salary is between 50,000 and 70,000

SELECT employee_name, salary
FROM employee
WHERE salary BETWEEN 50000 AND 70000;


-- ============================================================
-- 15. LIKE
-- ============================================================

-- Employees whose name contains the letter 'a'

SELECT
    employee_name,
    salary,
    gender,
    department_name
FROM employee
WHERE employee_name LIKE '%a%';


-- Employees whose name starts with 'A'

SELECT employee_name
FROM employee
WHERE employee_name LIKE 'A%';


-- ============================================================
-- 16. GROUP BY
-- ============================================================

-- Count employees in each department

SELECT
    department_name,
    COUNT(*) AS employee_count
FROM employee
GROUP BY department_name;


-- Calculate average salary for each department

SELECT
    department_name,
    AVG(salary) AS average_salary
FROM employee
GROUP BY department_name;


-- Calculate total salary for each department

SELECT
    department_name,
    SUM(salary) AS total_salary
FROM employee
GROUP BY department_name;


-- Find highest salary in each department

SELECT
    department_name,
    MAX(salary) AS highest_salary
FROM employee
GROUP BY department_name;


-- ============================================================
-- 17. HAVING
-- ============================================================

-- Departments having more than one employee

SELECT
    department_name,
    COUNT(*) AS employee_count
FROM employee
GROUP BY department_name
HAVING COUNT(*) > 1;


-- Departments whose average salary is greater than 60,000

SELECT
    department_name,
    AVG(salary) AS average_salary
FROM employee
GROUP BY department_name
HAVING AVG(salary) > 60000;


-- Departments whose total salary is greater than 100,000

SELECT
    department_name,
    SUM(salary) AS total_salary
FROM employee
GROUP BY department_name
HAVING SUM(salary) > 100000;


-- ============================================================
-- 18. INSERT A NEW EMPLOYEE
-- ============================================================

INSERT INTO employee (
    employee_id,
    employee_name,
    salary,
    department_name,
    age,
    employee_email,
    gender
)
VALUES (
    6,
    'Avinash',
    85000,
    'Manager',
    21,
    'avinash@gmail.com',
    'Male'
);


-- Display complete table

SELECT *
FROM employee;


-- ============================================================
-- 19. SECOND HIGHEST SALARY
-- ============================================================

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee
);


-- ============================================================
-- 20. FINAL TABLE
-- ============================================================

SELECT *
FROM employee;


-- ============================================================
-- SQL BASICS COMPLETED
-- ============================================================
-- Next Topic:
-- JOINS
-- ============================================================
```


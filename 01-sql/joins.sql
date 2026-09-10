# SQL Joins Practice

## Data Engineering Journey

This file contains my SQL JOIN practice using MySQL.

Topics covered:

* INNER JOIN
* INNER JOIN + WHERE
* INNER JOIN + ORDER BY
* INNER JOIN + GROUP BY
* INNER JOIN + HAVING
* LEFT JOIN
* LEFT JOIN + WHERE
* LEFT JOIN + GROUP BY
* LEFT JOIN + IS NULL
* LEFT JOIN + COALESCE

---

# 1. Create Employees Table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50)
);
```

##Insert Employee Data

```sql
INSERT INTO employees
(emp_id, employee_name, dept_id, salary, city)
VALUES
(1, 'Ravi', 101, 50000, 'Hyderabad'),
(2, 'Priya', 102, 40000, 'Chennai'),
(3, 'Arjun', 101, 60000, 'Hyderabad'),
(4, 'Sneha', 103, 45000, 'Mumbai'),
(5, 'Kiran', 101, 55000, 'Chennai'),
(6, 'Anu', 105, 42000, 'Hyderabad'),
(7, 'Rahul', 104, 65000, 'Delhi');
```

## View Employees

```sql
SELECT *
FROM employees;
```

---

# 2. Department Table

```sql
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    city VARCHAR(50)
);
```

## Insert Department Data

```sql
INSERT INTO department
(dept_id, department_name, city)
VALUES
(101, 'IT', 'Hyderabad'),
(102, 'HR', 'Chennai'),
(103, 'Sales', 'Mumbai'),
(104, 'Finance', 'Delhi'),
(106, 'Marketing', 'Bangalore');
```

## View Departments

```sql
SELECT *
FROM department;
```

---

# 3. INNER JOIN

## Q1. Display employee name and department name

```sql
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id;
```

---

## Q2. INNER JOIN + WHERE

Display employees whose salary is greater than 45,000.

```sql
SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 45000;
```

---

## Q3. INNER JOIN + ORDER BY

Display employees and their departments, sorted by salary from highest to lowest.

```sql
SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;
```

---

## Q4. INNER JOIN + WHERE

Display employees who work in Hyderabad.

```sql
SELECT e.employee_name,
       d.department_name,
       e.city
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
WHERE e.city = 'Hyderabad';
```

---

## Q5. INNER JOIN + Department Filter

Display employees from the IT department, sorted by salary.

```sql
SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
WHERE d.department_name = 'IT'
ORDER BY e.salary DESC;
```

---

## Q6. INNER JOIN + GROUP BY + SUM

Find the total salary for each department.

```sql
SELECT d.department_name,
       SUM(e.salary) AS total_salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.department_name;
```

---

## Q7. INNER JOIN + GROUP BY + COUNT

Count the number of employees in each department.

```sql
SELECT d.department_name,
       COUNT(e.employee_name) AS employee_count
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.department_name;
```

---

## Q8. INNER JOIN + GROUP BY + AVG

Find the average salary for each department.

```sql
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.department_name;
```

---

## Q9. INNER JOIN + GROUP BY + HAVING

Find departments where the average salary is greater than 50,000.

```sql
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM employees e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 50000;
```

---

# 4. LEFT JOIN

## Q1. Display all employees and their department names

```sql
SELECT e.employee_name,
       d.department_name
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id;
```

---

## Q2. LEFT JOIN + WHERE

Display all employees whose salary is greater than 45,000.

```sql
SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 45000;
```

---

## Q3. Find employees without a matching department

```sql
SELECT e.employee_name,
       e.dept_id,
       d.department_name
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id
WHERE d.department_name IS NULL;
```

Expected employee:

```text
Anu
```

---

## Q4. Count employees by department

```sql
SELECT d.department_name,
       COUNT(e.employee_name) AS employee_count
FROM employees e
LEFT JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.department_name;
```

---

## Q5. Find departments with no employees

```sql
SELECT d.department_name
FROM department d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.employee_name IS NULL;
```

Expected department:

```text
Marketing
```

---

## Q6. Calculate total salary for every department

This also includes departments that have no employees.

```sql
SELECT d.department_name,
       COALESCE(SUM(e.salary), 0) AS total_salary
FROM department d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.department_name;
```

`COALESCE()` changes `NULL` to `0`.

Therefore, Marketing will have:

```text
Marketing | 0
```

---

# JOIN Concepts Learned

## INNER JOIN

Returns only matching records from both tables.

```text
INNER JOIN
   ↓
Matching records only
```

## LEFT JOIN

Returns all records from the left table and matching records from the right table.

```text
LEFT JOIN
   ↓
All LEFT + Matching RIGHT
```

## RIGHT JOIN

Returns all records from the right table and matching records from the left table.

```text
RIGHT JOIN
   ↓
All RIGHT + Matching LEFT
```

---

# SQL Clause Order

The basic order I learned:

```text
SELECT
FROM
JOIN
ON / USING
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

Easy way to remember:

```text
FROM
  ↓
JOIN
  ↓
ON
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
ORDER BY
  ↓
LIMIT
```

---

# Progress

* ✅ SQL Basics
* ✅ INNER JOIN
* ✅ LEFT JOIN
* 🔄 RIGHT JOIN
* ⏳ FULL OUTER JOIN
* ⏳ SELF JOIN
* ⏳ CROSS JOIN
* ⏳ Advanced SQL

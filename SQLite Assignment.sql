CREATE TABLE Departments(
id INTEGER PRIMARY KEY,
dept_name TEXT
)

CREATE TABLE Employees(
id INTEGER PRIMARY KEY,
name TEXT,
dept_id INTEGER,
salary INTEGER,
hire_date date,
FOREIGN KEY(dept_id) REFERENCES Departments(id)
)

INSERT INTO Departments(id, dept_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales')

INSERT INTO Employees (id, name, dept_id, salary, hire_date) VALUES
(1, 'Alice', 1, 55000, '2019-01-15'),
(2, 'Bob', 2, 72000, '2018-03-20'),
(3, 'Charlie', 2, 68000, '2020-06-30'),
(4, 'Diana', 3, 50000, '2021-08-01'),
(5, 'Eve', 1, 52000, '2022-01-12');

SELECT * FROM Employees;

SELECT e.name
FROM Employees e
JOIN Departments d ON e.dept_id = d.id
WHERE d.dept_name = 'HR';

UPDATE Employees 
SET salary = 55000
WHERE name = 'Eve';

DELETE FROM Employees
WHERE id = 4;

SELECT e.id, e.name, e.salary, d.dept_name 
FROM Employees e
JOIN Departments d ON e.dept_id = d.id;

SELECT d.dept_name, count(e.dept_id) as emp_cnt
FROM Departments d
LEFT JOIN Employees e ON e.dept_id = d.id
GROUP BY d.id;

SELECT d.dept_name, avg(e.salary) as avg_salary
FROM Departments d
LEFT JOIN Employees e ON e.dept_id = d.id
GROUP BY d.id;

SELECT * FROM Employees WHERE hire_date > '2020-01-01';

SELECT * FROM Employees ORDER BY salary desc;

SELECT name, salary FROM Employees
WHERE salary > (SELECT avg(salary) FROM Employees);

CREATE VIEW EmpDetails AS
SELECT e.name, d.dept_name, e.salary
FROM Employees e
JOIN Departments d on e.dept_id = d.id;
SELECT * FROM EmpDetails;

CREATE INDEX idx_hire_date ON Employees(hire_date);
SELECT * FROM Employees
WHERE hire_date > '2020-01-01'
ORDER BY hire_date;

WITH DeptSalary AS(
SELECT dept_id, sum(salary) as total_salary FROM Employees
GROUP BY dept_id
)
SELECT * FROM DeptSalary WHERE total_salary > 100000;

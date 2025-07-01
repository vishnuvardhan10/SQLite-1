create table Departments(id INTEGER PRIMARY KEY,
name TEXT);

CREATE TABLE Employees(id INTEGER PRIMARY KEY, 
name TEXT,
dept_id INTEGER,
salary INTEGER,
hire_date date);

insert into Departments values(1, 'HR')
insert into Departments values(2, 'Engineering'), (3, 'Marketing')

insert into Employees values(1, 'Alice', 2, 80000, '2020-05-20'),
(2, 'Bob', 1, 50000, '2021-02-15'), (3, 'Charlie', 2, 95000, '2019-11-10'), (4, 'Diana', 3, 60000, '2022-08-01'),
(5, 'Eve', 2, 78000, '2023-01-12')

select e.id as emp_id, e.name as emp_name, d.name as dept_name
FROM Employees e
JOIN Departments d 
ON e.dept_id = d.id;

SELECT name
FROM Employees
where salary > (select avg(salary) from Employees);

WITH EngineeringSalary as(
SELECT e.id, e.name, e.salary, d.name as dept_name 
FROM Employees e
JOIN Departments d ON e.dept_id = d.id
where d.name = 'Engineering' and salary > 80000
)
select * from EngineeringSalary;

SELECT row_number() OVER (ORDER BY salary desc) as row_num,
id, name, salary
FROM Employees;

SELECT rank() OVER (ORDER BY salary desc) as rank,
id, name, salary
FROM Employees;


EXPLAIN QUERY PLAN
SELECT e.name, d.name
FROM Employees e
JOIN Departments d ON e.dept_id = d.id;



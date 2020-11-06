-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--Import first
CREATE TABLE Department (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR(500)   NOT NULL,
    PRIMARY KEY (dept_no)
);

--Import Second
CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR(500)   NOT NULL,
    PRIMARY KEY (title_id)
);

--Import Third
CREATE TABLE Employee (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(500)   NOT NULL,
    last_name VARCHAR(500)   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

--Import Fourth
CREATE TABLE Dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department (dept_no)
);

--Import Fifth
CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

--Import Sixth
CREATE TABLE Dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

SELECT * FROM department;

SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
employee.sex,
salaries.salary
FROM employee
LEFT JOIN salaries
ON employee.emp_no = salaries.emp_no
ORDER BY emp_no


SELECT employee.first_name,
employee.last_name,
employee.hire_date
FROM employee
WHERE date_part('year', hire_date) = 1986 


SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
dept_manager.emp_no,
dept_manager.dept_no,
department.dept_name
FROM dept_manager
LEFT JOIN department
ON department.dept_no = dept_manager.dept_no
LEFT JOIN employee
ON dept_manager.emp_no = employee.emp_no
ORDER BY employee.emp_no;


SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
dept_emp.dept_no,
department.dept_name
FROM dept_emp
LEFT JOIN department
ON department.dept_no = dept_emp.dept_no
LEFT JOIN employee
ON dept_emp.emp_no = employee.emp_no



SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
dept_emp.dept_no,
department.dept_name
FROM dept_emp
LEFT JOIN department
ON department.dept_no = dept_emp.dept_no
LEFT JOIN employee
ON dept_emp.emp_no = employee.emp_no
WHERE department.dept_name = 'Sales';


SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
dept_emp.dept_no,
department.dept_name
FROM dept_emp
LEFT JOIN department
ON department.dept_no = dept_emp.dept_no
LEFT JOIN employee
ON dept_emp.emp_no = employee.emp_no
WHERE department.dept_name = 'Sales' OR department.dept_name = 'Development' ;


SELECT last_name, COUNT(*) AS frequency
FROM employee
GROUP BY last_name
ORDER BY frequency DESC;

--Selecting Salaries
SELECT employee.emp_no, 
employee.last_name,
employee.first_name,
employee.sex,
salaries.salary
FROM employee
LEFT JOIN salaries
ON employee.emp_no = salaries.emp_no
ORDER BY emp_no

--Employees in 1986
SELECT employee.first_name,
employee.last_name,
employee.hire_date
FROM employee
WHERE date_part('year', hire_date) = 1986

--Department Managers
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

--Employee Departments
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


--Hercules with last name B
SELECT employee.first_name,
employee.last_name
FROM employee
WHERE employee.first_name = 'Hercules' AND last_name like 'B%'


--Employees in Sales
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

--Employees in Development or Sales
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

--Name frequency
SELECT last_name, COUNT(*) AS frequency
FROM employee
GROUP BY last_name
ORDER BY frequency DESC;
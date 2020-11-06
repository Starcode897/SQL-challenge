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


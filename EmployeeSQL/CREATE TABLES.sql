-- SQL Challenge Employee Schema

-- The Output Code from QuickDBD did not work. I had to alter the code for each table to make it work
CREATE TABLE "titles" (
    	title_id VARCHAR PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE "department_names" (
    	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE "employee_data" (
    	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE "employee_department_codes" (
    	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department_names(dept_no)
);

CREATE TABLE "dept_manager" (
    	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES department_names(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no)
);

CREATE TABLE "salaries" (
    	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee_data(emp_no)
);






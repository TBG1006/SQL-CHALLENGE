-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee_data.emp_no, employee_data.last_name, employee_data.first_name, employee_data.sex, salaries.salary
FROM employee_data
JOIN salaries ON employee_data.emp_no = salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee_data
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, department_names.dept_name, dept_manager.emp_no, employee_data.last_name, employee_data.first_name
FROM dept_manager
JOIN department_names ON dept_manager.dept_no = department_names.dept_no
JOIN employee_data ON dept_manager.emp_no = employee_data.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employee_data.emp_no, employee_data.last_name, employee_data.first_name, department_names.dept_name
FROM employee_data
JOIN employee_department_codes ON employee_data.emp_no = employee_department_codes.emp_no
JOIN department_names ON employee_department_codes.dept_no = department_names.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employee_data
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM department_names;
-- The department number of Sales department is d007
SELECT employee_data.emp_no, employee_data.last_name, employee_data.first_name, department_names.dept_name
FROM employee_data
JOIN employee_department_codes ON employee_data.emp_no = employee_department_codes.emp_no
JOIN department_names ON employee_department_codes.dept_no = department_names.dept_no
WHERE department_names.dept_no = 'd007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM department_names;
-- The department numbers of Sales and Development departments are d007 and d005
SELECT employee_data.emp_no, employee_data.last_name, employee_data.first_name, department_names.dept_name
FROM employee_data
JOIN employee_department_codes ON employee_data.emp_no = employee_department_codes.emp_no
JOIN department_names ON employee_department_codes.dept_no = department_names.dept_no
WHERE department_names.dept_no = 'd005' or department_names.dept_no = 'd007';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employee_data
GROUP BY last_name
ORDER BY "Frequency count" DESC;
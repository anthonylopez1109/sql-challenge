
-- list the employee number, last name, first name, sex, and salary of each employee

SELECT e.emp_no AS "Employee Number",
e.last_name AS "Last Name", 
e.first_name "First Name", 
e.sex AS "Sex",
s.salary AS "Salary"
	FROM employees e
		INNER JOIN salaries s
		ON (e.emp_no = s.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
first_name AS "First Name",
last_name AS "Last Name",
hire_date AS "Hire Date"
	FROM employees
		WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
d.dept_no AS "Department Number",
d.dept_name AS "Department Name",
e.emp_no AS "Employee number",
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM departments d
	INNER JOIN dept_manager dm
	ON (d.dept_no = dm.dept_no)
		INNER JOIN employees e
		ON (dm.emp_no = e.emp_no);


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no AS "Department Number",
e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department Name"
FROM employees e
	INNER JOIN dept_emp de
	ON (e.emp_no = de.emp_no)
		INNER JOIN departments d
		ON (de.dept_no = d.dept_no);


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name AS "First Name",
last_name AS "Last Name",
sex AS "Sex"
FROM employees
	WHERE first_name = 'Hercules'
	AND last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name AS "Department Name",
e.emp_no AS "Employee Number", 
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM departments d
	INNER JOIN dept_emp dn
	ON (d.dept_no = dn.dept_no)
		INNER JOIN employees e
		ON (dn.emp_no = e.emp_no)
			WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_name AS "Department Name",
e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM employees e
	INNER JOIN dept_emp de
	ON (e.emp_no = de.emp_no)
		INNER JOIN departments d
		ON (de.dept_no = d.dept_no)
			WHERE d.dept_name IN ('Sales', 'Development');



--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
last_name, 
COUNT(*) AS "Frequency Count"
FROM employees 
	GROUP BY last_name
		ORDER BY last_name DESC;


-- Verify the data imported correctly
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 2. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT depts.dept_no, depts.dept_name, emps.emp_no, emps.last_name, emps.first_name
FROM departments AS depts
INNER JOIN dept_manager AS dm
ON depts.dept_no=dm.dept_no
INNER JOIN employees AS emps
ON dm.emp_no=emps.emp_no;

-- 3. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM employees AS emps
INNER JOIN dept_emp AS de
ON emps.emp_no=de.emp_no
INNER JOIN departments AS depts
ON de.dept_no=depts.dept_no;

-- 4. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

-- 5. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM employees AS emps
INNER JOIN dept_emp AS de
ON emps.emp_no=de.emp_no
INNER JOIN departments AS depts
ON de.dept_no=depts.dept_no
WHERE dept_name='Sales';

-- 6. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emps.emp_no, emps.last_name, emps.first_name, depts.dept_name
FROM employees AS emps
INNER JOIN dept_emp AS de
ON emps.emp_no=de.emp_no
INNER JOIN departments AS depts
ON de.dept_no=depts.dept_no
WHERE dept_name='Sales'
OR dept_name='Development';

-- 7. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Frequency of Occurrence"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
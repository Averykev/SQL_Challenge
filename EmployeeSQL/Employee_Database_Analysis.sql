--1.) List the following: employee number, last name, first name, sex, salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no=salaries.emp_no;


--2.)  List the following: first name, last name, hire date for employees hired in 1986

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--3.)  List the manager of each department with the following: department number, department name, mangager employee number, last name, first name

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
FROM departments
JOIN dept_manager ON departments.dept_no=dept_manager.dept_no
JOIN employees ON dept_manager.emp_no=employees.emp_no;


--4.)  List the department of each employee with the following:  employee number, last name, first name, and department name

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;


--5.)  List first name, last name, and sex for employees whose first name is "Hercules" and last name begins with "B"

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6.)  List all employees in Sales Department, including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


--7.)  List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


--8.)  In descending order, list the frequency count of employee last names...i.e. how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC; 

--Employee details
select employees.emp_no,last_name,first_name, gender, salary
FROM employees JOIN salaries on employees.emp_no = salaries.emp_no;

--Employees hired in 1986
SELECT hire_date, emp_no, last_name, first_name FROM employees 
WHERE hire_date > '1986-01-01' and hire_date < '1986-12-31'
--Manager of each department
select dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, from_date, to_date 
FROM dept_manager JOIN employees on dept_manager.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_manager.dept_no;
select * FROM dept_manager
--Department of each employee 
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees inner JOIN dept_manager on employees.emp_no = dept_manager.emp_no
inner JOIN departments on dept_manager.dept_no = departments.dept_no;
--Emplyees with first name "Hercules" and last name starting with "B"
select * from employees
WHERE first_name='Hercules' and last_name 
like 'B%';
--Employees in the sales department
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp JOIN employees on dept_emp.emp_no = employees.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';
--All employees in sales and development departments along with employee number
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp join employees on dept_emp.emp_no = employees.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no 
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development';
--Frequency count of employee last name in descending order
select last_name, count (last_name) as count_lastname
FROM employees
group by last_name
order by count_lastname desc;

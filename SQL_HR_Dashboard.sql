/****** Script for SelectTopNRows command from SSMS  ******/

-- JOIN all 4 tables
SELECT *
FROM [Empoloyee_Database].[dbo].[employee$] e
INNER JOIN [Empoloyee_Database].[dbo].[salaries$] s
	ON e.employeeID = s.employeeID
INNER JOIN [Empoloyee_Database].[dbo].[department$] d
	ON e.departmentID = d.departmentID
INNER JOIN [Empoloyee_Database].[dbo].[jobtitle$] j
	ON e.employeeID = j.employeeID


-- Count number of total employees 
SELECT count(employeeID) AS total_employees
FROM [Empoloyee_Database].[dbo].[employee$]


-- Show the first name, last name and their job title of the employee
SELECT e.firstname, e.lastname, j.jobtitle
FROM [Empoloyee_Database].[dbo].[employee$] e
INNER JOIN [Empoloyee_Database].[dbo].[jobtitle$] j
	ON e.employeeID = j.employeeID


-- Show all employee first and last name as well as their ID and the department they belong in
SELECT e.employeeID, firstname, lastname, d.employeedepartment
FROM [Empoloyee_Database].[dbo].[employee$] e
INNER JOIN [Empoloyee_Database].[dbo].[department$] d
	ON e.departmentID = d.departmentID


-- Show the count of employees in each department
SELECT d.employeedepartment, count(e.employeeID) AS num_employee_dpt
FROM [Empoloyee_Database].[dbo].[employee$] e
INNER JOIN [Empoloyee_Database].[dbo].[department$] d
ON e.departmentID = d.departmentID
GROUP BY
	d.employeedepartment


-- Show total salary per department
SELECT d.employeedepartment, sum(s.salaryamount) as total_salary_per_dpt
FROM [Empoloyee_Database].[dbo].[employee$] e
INNER JOIN [Empoloyee_Database].[dbo].[salaries$] s
	ON e.employeeID = s.employeeID
INNER JOIN [Empoloyee_Database].[dbo].[department$] d
	ON e.departmentID = d.departmentID
GROUP BY
	d.employeedepartment

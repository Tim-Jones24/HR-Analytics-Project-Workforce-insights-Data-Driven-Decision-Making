--Creating Employee Table----
CREATE TABLE employee
(EmpID INT,Hired_Date DATE,
Leave_Date DATE,Gender VARCHAR(10),
Marital_Status VARCHAR(15),JobTitleID INT,
Job_Title VARCHAR(25),Salary FLOAT,
DepartmentID INT,Department VARCHAR(25),
JobCategoryID INT,Job_Category VARCHAR(25))
--Fetching all records------
SELECT EmpID,Hired_Date,Leave_Date,
       Gender,Marital_Status,JobTitleID,
       Job_Title,Salary,DepartmentID,Department,
       JobCategoryID,Job_Category
FROM employee
---Modifying Hired_Date & Leave Date to remove time----
ALTER TABLE employee
ALTER COLUMN Hired_Date DATE
ALTER TABLE employee
ALTER COLUMN Leave_Date DATE
/*.Creating Dimension Tables and inserting Values.*/
---Job Title---
CREATE TABLE job_title
(ID INT PRIMARY KEY,Job_Title VARCHAR(25))
----inserting values
INSERT INTO job_title(ID, Job_Title)
SELECT DISTINCT
       JobTitleID,
	   Job_Title
FROM employee
---Department----
CREATE TABLE department 
(ID INT PRIMARY KEY, Department VARCHAR(25))
--inserting values---
INSERT INTO department (ID, Department)
SELECT DISTINCT
       DepartmentID,
	   Department
FROM employee
----Job Category-----
CREATE TABLE job_category
(ID INT PRIMARY KEY, Job_Category VARCHAR(25))
--inserting values---
INSERT INTO job_category (ID, Job_Category)
SELECT DISTINCT
       JobCategoryID,
	   Job_Category
FROM employee
----salary---
CREATE TABLE salary 
(EMPID BIGINT PRIMARY KEY, Salary float)
---inserting values----
INSERT INTO salary (EMPID, Salary)
SELECT DISTINCT
       EmpID,
	   Salary
FROM employee
--Creating a Relationship between employee table and dimension tables----
--Job_Title---
ALTER TABLE employee
ADD CONSTRAINT FK_JobTitleID 
FOREIGN KEY (JobTitleID)
REFERENCES  job_title(ID)
---Department----
ALTER TABLE employee
ADD CONSTRAINT FK_DepartmentID 
FOREIGN KEY (DepartmentID)
REFERENCES  department(ID)
---job Category---
ALTER TABLE employee
ADD CONSTRAINT FK_JobCategoryID
FOREIGN KEY (JobCategoryID)
REFERENCES  job_category(ID)
---Salary---
ALTER TABLE employee
ADD CONSTRAINT FK_EmpID
FOREIGN KEY (EmpID)
REFERENCES  salary(EMPID)
/*.Fetching out all records of Dimension Tables .*/
SELECT*
FROM department
----
SELECT*
FROM job_category
------
SELECT*
FROM job_title
---
SELECT*
FROM salary
/*.Business Questions .*/
--1. Which employees have salary higher than the average salary of the marketing department.--------
SELECT EmpID,Gender,Job_Title
FROM employee
WHERE Salary > (
SELECT Avg(Salary)
FROM employee
WHERE Department='Marketing'
)
----2. Which departments have average salary lower than the average salary of employees in the Manager's Job Title--------
SELECT Department
FROM employee
GROUP BY Department
HAVING Avg(Salary) < (
SELECT Avg(Salary)
FROM employee
WHERE Job_Category in ('Management')
)
---3. Which employees have been with the company longer than the average tenure of employees in the Sales department?-----
SELECT *
FROM employee
WHERE Datediff(DAY,Hired_Date,
Leave_Date) > (
SELECT Avg(Datediff(DAY,Hired_Date,Leave_Date))
FROM employee
WHERE Department='Sales'
)
--4. Which Job Categories have a higher average salary than the average salary of employees in the IT department?-----
SELECT Job_Category
FROM employee
GROUP BY Job_Category
HAVING Avg(Salary)> (
SELECT Avg(Salary)
FROM employee
WHERE Department='Information Technology')
--5. Which employees have a salary higher than the average salary of employees in the same job category?-----
SELECT*
FROM employee
WHERE Salary > (
SELECT Avg(Salary)
FROM employee e
WHERE e.Job_Category=e.Job_Category
)
/*.6. Which departments have a lower average employee count 
than the average employee count of departments with more than 10 employees.*/
SELECT Department
FROM employee
GROUP BY Department
HAVING Count(EmpID) < (
SELECT Avg(EmployeeCount)
FROM ( SELECT Department,
Count(EmpID) AS EmployeeCount
FROM employee
GROUP BY Department
HAVING Count(EmpID) > 10 )
AS LowPopulation
)
----7. Which Job Titles have a higher average salary than the average salary of Job titles with more than 5 employees?----
SELECT Job_Title
FROM employee
GROUP BY Job_Title
HAVING Avg(Salary) > (
SELECT Avg(Average_Salary) 
FROM ( SELECT Job_Title,
Avg(Salary) AS Average_Salary
FROM employee
GROUP BY Job_Title
HAVING Count(Job_Title)>5)
AS High_Earners
)
----8. Which employees have been with the company longer than the average tenure of emmployees in the same department?
SELECT*
FROM employee
WHERE Datediff(DAY,Hired_Date,Leave_Date) > (
SELECT Avg(Datediff(DAY,Hired_Date,Leave_Date))
FROM employee e
WHERE e.Department=e.Department
)
-----9. Rank Employees by Salary within each Department-----
SELECT EmpID,Department,Salary,
Dense_Rank() OVER (
PARTITION BY Department
ORDER BY Salary DESC
)AS SalaryRank
FROM employee
ORDER BY Department, Salary DESC
---10. What is the Rank of each department by its average salary and total employees?----
SELECT Department,
Round(Avg(Salary),0) AS Average_Salary,
Count(EmpID) AS Total_Employees,
Rank() OVER (ORDER BY Round(Avg(Salary),0) DESC,
Count(EmpID) DESC) as Department_Rank
FROM employee
GROUP BY Department
----11. What is the rank of each job category by its average salary?-----
SELECT Job_Category,
Round(Avg(Salary),0) AS Average_Salary,
Rank() OVER (ORDER BY Round(Avg(Salary),0)
DESC) AS Job_Category_Rank
FROM employee
GROUP BY Job_Category
---12. Which job category has the highest employee turnover rate?----
SELECT Job_Category,
Count(Leave_Date) AS Total_Turn_Over
FROM employee
WHERE Leave_Date is not null
GROUP BY Job_Category
ORDER BY Total_Turn_Over DESC
---13. What is the average salary for employees in each department?-----
SELECT Department,
Round(Avg(Salary),2) AS Average_Salary
FROM employee
GROUP BY Department
ORDER BY Average_Salary DESC;
----14. What is the distribution of Employees by marital status and gender?----
SELECT Marital_Status,Gender,
Count(EmpID) AS Total_Employees
FROM employee
GROUP BY Marital_Status,Gender
ORDER BY Total_Employees DESC
---15. Comparing the department average tenure(time spent with the company) which department has the lead?-----
SELECT Department,
Avg(Datediff(Day,Hired_Date,Leave_Date)) AS Average_Tenure
FROM employee
GROUP BY Department
ORDER BY Average_Tenure DESC
----16. How many employees have left the company in the past year from each department?--------
SELECT Department, Count(EmpID) AS Total_Employees
FROM employee
WHERE Leave_Date >= DateAdd(Year,-1,GetDate())
GROUP BY Department
ORDER BY Total_Employees DESC;
----17. What is the percentage of employees in each department who are Male/Female?--------
SELECT Department,
Sum(CASE WHEN Gender='Male' THEN 1 ELSE 0 END) * 
100.00/ Count(EmpID) AS Female_Percentage,
Sum(CASE WHEN Gender='Female' THEN 1 ElSE 0 END) *
100.00/ Count(EmpID) as Male_Percentage
FROM employee
GROUP BY Department
ORDER BY Department;
----- 18. Derive the Average Salary across Job Titles
SELECT Job_Title, 
Round(Avg(Salary),0) AS Average_Salary
FROM employee
GROUP BY Job_Title
ORDER BY Average_Salary DESC
---19. Total Employees by department
SELECT Department,Count(EmpID) as Total_Employee
FROM employee
GROUP BY Department
ORDER BY Total_Employee DESC





USE AdventureWorks2012
SELECT * FROM HumanResources.Department

SELECT * FROM HumanResources.Department
WHERE GroupName LIKE 'Manufacturing'

SELECT * FROM HumanResources.Employee
WHERE OrganizationLevel IN (2,3) AND JobTitle LIKE '%Control%' AND BirthDate BETWEEN '1/1/1970' AND '1/1/1980'


-- Deep dive of Queries
--Calculator colums or agregators to add a new column equivalent of groupby in Python

SELECT Name, ListPrice, ListPrice+10 AS ADJUSTED_LIST_PRICE INTO Production.Product_2 FROM Production.Product
--If you wnat to create a temporary table, you use #temptable after the INTO statement
SELECT * FROM Production.Product_2

SELECT OrganizationLevel,Gender,VacationHours INTO #calc FROM HumanResources.Employee 

SELECT * FROM #calc

SELECT VacationHours, VacationHours+1 AS Adjusted_Hours FROM #calc

SELECT Gender,Gender+ 'Cool' AS Modified_String FROM #calc

--DELETE DATA FROm TABLE

DELETE FROM #calc WHERE OrganizationLevel=1

--UPDAte Statement
SELECT * FROM Production.Product_2

UPDATE Production.Product_2
SET Name = 'Blade_NEW'
WHERE Name LIKE 'Blade'

--Create a new table
SELECT OrganizationLevel,Gender,VacationHours INTO HumanResources.Employee_2 FROM HumanResources.Employee 

SELECT * FROM HumanResources.Employee

UPDATE HumanResources.Employee_2 SET Gender = 'C' WHERE Gender ='F'

---Joining these tables


--Joining tables
SELECT BusinessEntityID,OrganizationLevel,JobTitle,Gender INTO HumanResources.Data_Frame1 FROM HumanResources.Employee
SELECT BusinessEntityID,SalariedFlag,VacationHours,SickLeaveHours INTO HumanResources.Data_Frame2 FROM HumanResources.Employee

SELECT * FROM HumanResources.Data_Frame1
SELECT * FROM HumanResources.Data_Frame2

SELECT JobTitle, HumanResources.Data_Frame2.BusinessEntityID, HumanResources.Data_Frame2.SalariedFlag, HumanResources.Data_Frame2.SickLeaveHours, HumanResources.Data_Frame2.VacationHours FROM HumanResources.Data_Frame1
CROSS JOIN HumanResources.Data_Frame2 

SELECT * FROM HumanResources.Data_Frame2

CREATE TABLE HumanResources.MyEmployee (EmployeeID INT, First_Name varchar(20), Last_Name varchar(20))

INSERT INTO HumanResources.MyEmployee VALUES (1, 'Carlos', 'Pazos')
INSERT INTO HumanResources.MyEmployee VALUES (2, 'Logan', 'Griffith')
INSERT INTO HumanResources.MyEmployee VALUES (3, 'Calisto', 'Pazos')

CREATE TABLE HumanResources.MySalary (EmployeeID INT, Salary FLOAT)

INSERT INTO HumanResources.MySalary VALUES (1, 10000)
INSERT INTO HumanResources.MySalary VALUES (2, 20000)
INSERT INTO HumanResources.MySalary VALUES (3, 80000)

--Inner Join
SELECT*FROM HumanResources.MyEmployee
SELECT*FROM HumanResources.MySalary

SELECT A.First_Name, A.Last_Name, B.Salary FROM HumanResources.MyEmployee A
INNER JOIN HumanResources.MySalary B ON
A.EmployeeID=B.EmployeeID

--Left Outer Join
CREATE TABLE HumanResources.MyPhone (EmployeeID INT, Phone VARCHAR(50))
INSERT INTO HumanResources.MyPhone VALUES (1,'512-357-190')
INSERT INTO HumanResources.MyPhone VALUES (2,'816-578-892')

SELECT*FROM HumanResources.MyPhone
SELECT*FROM HumanResources.MyEmployee

SELECT A.First_Name, A.Last_Name,B.Phone FROM HumanResources.MyEmployee A
LEFT OUTER JOIN HumanResources.MyPhone B ON
A.EmployeeID=B.EmployeeID

--Right Outer Join
SELECT*FROM HumanResources.MyPhone
SELECT*FROM HumanResources.MyEmployee

SELECT A.First_Name, A.Last_Name,B.Phone FROM HumanResources.MyEmployee A
RIGHT OUTER JOIN HumanResources.MyPhone B ON
A.EmployeeID=B.EmployeeID

--FULL Join
SELECT*FROM HumanResources.MyPhone
SELECT*FROM HumanResources.MyEmployee

SELECT A.First_Name, A.Last_Name,B.Phone FROM HumanResources.MyEmployee A
FULL OUTER JOIN HumanResources.MyPhone B ON
A.EmployeeID=B.EmployeeID

--Croos Join
SELECT*FROM HumanResources.MyPhone
SELECT*FROM HumanResources.MyEmployee

SELECT A.First_Name, A.Last_Name,B.Phone
INTO HumanResources.CrossTable
FROM HumanResources.MyEmployee A
CROSS JOIN HumanResources.MyPhone B 

SELECT * FROM HumanResources.CrossTable






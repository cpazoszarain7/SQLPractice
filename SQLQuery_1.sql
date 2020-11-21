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


USE [AdventureWorks2012];

SELECT P.Name,EMAILADDRESS,PhoneNumber, T.PhoneNumberTypeID
FROM [Person].[ContactType] P,[Person].[EmailAddress],[Person].[PersonPhone],[Person].[PhoneNumberType] T;

SELECT * FROM SALES.SalesOrderHeader WHERE OrderDate= '2011-05-31';

SELECT * FROM [Sales].[SalesOrderDetail] WHERE DATEPART(MM,ModifiedDate)= 5 AND DATEPART(YY,ModifiedDate)=2011;

SELECT SUM(ORDERQTY) FROM [Sales].[SalesOrderDetail] WHERE DATEPART(MM,ModifiedDate)= 5 AND DATEPART(YY,ModifiedDate)=2011;

SELECT DATEPART(MM,ModifiedDate), SUM(ORDERQTY) FROM [Sales].[SalesOrderDetail] WHERE DATEPART(YY,ModifiedDate)=2011 
GROUP BY MONTH(ModifiedDate) ORDER BY SUM(ORDERQTY) ASC;

SELECT * FROM [Person].[Person];

SELECT * FROM [Sales].[SalesPerson];

SELECT BusinessEntityID,FirstName,LastName  FROM [Person].[Person] WHERE FirstName ='Gustavo' and LastName='Achong';

SELECT FirstName,LastName, SALESYTD FROM [Person].[Person] , [Sales].[SalesPerson] 
WHERE FirstName ='Gustavo' and LastName='Achong';

SELECT SUM(SALESYTD) FROM [Person].[Person] P, [Sales].[SalesPerson] S
WHERE FirstName ='Gustavo' and LastName='Achong';



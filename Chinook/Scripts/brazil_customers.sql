--Provide a query only showing the Customers from Brazil.
SELECT FirstName + ' ' + LastName AS FullName,
	   CustomerId,
	   Country
FROM Customer
WHERE Country IN ('Brazil','USA');


SELECT FirstName, LastName, CustomerId, Country
FROM Customer
WHERE Country = 'Brazil'

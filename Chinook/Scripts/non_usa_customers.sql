﻿-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName + ' ' + LastName AS FullName,
	   CustomerId,
	   Country
FROM Customer
WHERE NOT Country = 'USA';


SELECT CustomerId, FirstName, LastName, Country 
FROM Customer
WHERE Country <> 'USA';
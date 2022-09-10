--Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT i.InvoiceId,
       i.Total,
       c.FirstName + ' ' + c.LastName AS CustomerName,
       c.Country,
       e.FirstName + ' ' + e.LastName AS RepName
FROM Invoice i
LEFT JOIN Customer c ON c.CustomerId = i.CustomerId
LEFT JOIN Employee e ON e.EmployeeId = c.SupportRepId;


SELECT *
FROM Employee e
INNER JOIN Customer c ON e.EmployeeID = c.SupportRepId
INNER JOIN Invoice i ON i.CustomerId = c.CustomerId


SELECT i.InvoiceId, i.BillingCountry,
	i.Total AS InvoiceTotal, 
	c.FirstName + ' ' + c.LastName AS CustomerName, 
	e.FirstName + ' ' + e.LastName AS Agent
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId

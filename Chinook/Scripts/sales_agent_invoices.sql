--Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT i.InvoiceId,
       e.FirstName + ' ' + e.LastName AS RepName
FROM Invoice i
INNER JOIN Customer c ON i.CustomerId = c.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
ORDER BY RepName, InvoiceId;

Select (s.FirstName+' '+s.LastName) AS AgentName, InvoiceId, InvoiceDate, Total
From Employee s
join Customer c ON c.SupportRepId = s.EmployeeId
join Invoice i ON i.CustomerId = c.CustomerId
--Where SupportRepId = s.EmployeeId
--Group By (s.FirstName+' '+s.LastName),InvoiceId, InvoiceDate, Total
Order by AgentName Asc, InvoiceId Desc

--Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.FirstName + ' ' + c.LastName AS FullName,
	   i.InvoiceId,
	   i.InvoiceDate,
	   i.BillingCountry
FROM Customer c
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country = 'Brazil';


SELECT c.FirstName + ' ' + c.LastName AS CustomerName, 
	i.InvoiceDate, i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country = 'Brazil'

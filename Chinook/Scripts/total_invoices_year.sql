--How many Invoices were there in 2009 and 2011?
SELECT YEAR(InvoiceDate) AS 'Year',
       COUNT(*) AS 'Count'
FROM Invoice
GROUP BY YEAR(InvoiceDate)
HAVING YEAR(InvoiceDate) IN (2009, 2011);

SELECT COUNT(InvoiceDate) as NumberOfInvoices, 
			 DATEPART(YEAR, InvoiceDate) as [Year]
FROM Invoice
WHERE InvoiceDate between '2009/1/1' AND '2009/12/31'
OR InvoiceDate between '2011/1/1' AND '2011/12/31'
GROUP BY DATEPART(YEAR, InvoiceDate)

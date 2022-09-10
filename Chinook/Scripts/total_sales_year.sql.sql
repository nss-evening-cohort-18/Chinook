--What are the respective total sales for each of those years?
SELECT YEAR(InvoiceDate) AS 'Year',
       COUNT(*) AS 'Count',
       SUM(Total) AS Total
FROM Invoice
GROUP BY YEAR(InvoiceDate)
HAVING YEAR(InvoiceDate) IN (2009, 2011);




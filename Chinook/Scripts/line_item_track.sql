--Provide a query that includes the purchased track name with each invoice line item.
SELECT il.InvoiceLineId,
       t.Name
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Album al ON al.Album
ORDER BY il.InvoiceLineId
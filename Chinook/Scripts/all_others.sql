--Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resultant table.
SELECT pl.PlaylistId,
	   pl.Name,
       COUNT(*) AS TrackCount
FROM Playlist pl
INNER JOIN PlaylistTrack plt ON pl.PlaylistId = plt.PlaylistId
GROUP BY pl.PlaylistId, pl.Name

SELECT *
FROM PlaylistTrack
WHERE PlaylistId = 5

--tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
SELECT t.Name,
	   al.Title,
	   mt.Name,
	   g.Name,
	   t.Composer,
	   t.Milliseconds,
	   t.Bytes,
	   t.UnitPrice
FROM Track t
INNER JOIN Album al ON al.AlbumId = t.AlbumId
INNER JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
INNER JOIN Genre g ON g.GenreId = t.GenreId;

--invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.
SELECT i.*,
       COUNT(*) AS InvoiceLineCount
FROM Invoice i
INNER JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total

--sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.
SELECT e.FirstName,
       e.LastName,
	   SUM(Total) AS TotalSales
FROM Invoice i
INNER JOIN Customer c ON c.CustomerId = i.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
GROUP BY e.FirstName, e.LastName

--top_2009_agent.sql: Which sales agent made the most in sales in 2009? HINT: TOP
SELECT TOP 1 e.FirstName,
       e.LastName,
	   Year(i.InvoiceDate) AS FY,
	   SUM(Total) AS TotalSales
FROM Invoice i
INNER JOIN Customer c ON c.CustomerId = i.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
GROUP BY e.FirstName, e.LastName, Year(i.InvoiceDate)
HAVING Year(i.InvoiceDate) = 2009
ORDER BY TotalSales DESC;

SELECT e.FirstName,
       e.LastName,
	   Year(i.InvoiceDate) AS FY,
	   SUM(Total) AS TotalSales
FROM Invoice i
INNER JOIN Customer c ON c.CustomerId = i.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
WHERE Year(i.InvoiceDate) = 2009
GROUP BY e.FirstName, e.LastName, Year(i.InvoiceDate)

top_agent.sql: Which sales agent made the most in sales over all?
SELECT TOP 1 e.FirstName,
       e.LastName,
	   SUM(Total) AS TotalSales
FROM Invoice i
INNER JOIN Customer c ON c.CustomerId = i.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
GROUP BY e.FirstName, e.LastName
ORDER BY TotalSales DESC

sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.
SELECT e.FirstName,
       e.LastName,
	   COUNT(*) AS CustomerCount
FROM Employee e
INNER JOIN Customer c ON c.SupportRepId = e.EmployeeId
GROUP BY e.FirstName, e.LastName

sales_per_country.sql: Provide a query that shows the total sales per country.
SELECT BillingCountry,
	   SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry

top_country.sql: Which country's customers spent the most?
SELECT TOP 1 BillingCountry,
	   SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC

top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

SELECT t.Name,
       COUNT(*) AS TimesPurchased
FROM Invoice i
INNER JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
INNER JOIN Track t ON t.TrackId = il.TrackId
WHERE YEAR(i.InvoiceDate) = 2013
GROUP BY t.Name
ORDER BY TimesPurchased DESC;

top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.
SELECT TOP 5 t.Name,
       COUNT(*) AS TimesPurchased
FROM Invoice i
INNER JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
INNER JOIN Track t ON t.TrackId = il.TrackId
GROUP BY t.Name
ORDER BY TimesPurchased DESC;

top_3_artists.sql: Provide a query that shows the top 3 best selling artists.
SELECT TOP 3 ar.Name,
       COUNT(*) AS TimesPurchased
FROM Invoice i
INNER JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
INNER JOIN Track t ON t.TrackId = il.TrackId
INNER JOIN Album al ON al.AlbumId = t.AlbumId
INNER JOIN Artist ar ON ar.ArtistId = al.ArtistId
GROUP BY ar.Name
ORDER BY TimesPurchased DESC;

top_media_type.sql: Provide a query that shows the most purchased Media Type.
SELECT mt.Name,
       COUNT(*) AS TimesPurchased
FROM Invoice i
INNER JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
INNER JOIN Track t ON t.TrackId = il.TrackId
INNER JOIN MediaType mt on mt.MediaTypeId = t.MediaTypeId
GROUP BY mt.Name
ORDER BY TimesPurchased DESC;
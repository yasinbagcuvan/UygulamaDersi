SELECT
	c.ContactName,
	c.City
FROM 
	Customers as c
where 
--c.ContactName like 'A%' or c.ContactName like 'D%' or c.ContactName like 'E%'
c.ContactName like '[ADE]%'
GO

SELECT
	c.ContactName,
	c.City
FROM 
	Customers as c
where 
	c.ContactName like '[B-H]%' 
	GO

SELECT
	c.ContactName,
	c.City
FROM 
	Customers as c
where 
	--c.ContactName like '[^AC]%' 
	c.ContactName not like '[AC]%' 
	GO


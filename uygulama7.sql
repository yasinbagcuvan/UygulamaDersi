select od.UnitPrice  from [Order Details] as od where od.UnitPrice > ( select  avg(UnitPrice) from [Order Details])
go

select top(1) p.ProductName,MAX(od.UnitPrice)  from [Order Details] as od 
inner join Products as p on p.ProductID=od.ProductID
group by p.ProductName order by MAX(od.UnitPrice) desc
go

select distinct(p.ProductName) from Products as p 
inner join [Order Details] as od on p.ProductID=od.ProductID
go

select p.ProductName from Products as p 
full outer join [Order Details] as od on p.ProductID=od.ProductID
where od.ProductID is null
group by p.ProductName
go

select o.ShipVia,s.CompanyName , count(*) from Orders as o
inner join Shippers as s on s.ShipperID=o.ShipVia
group by o.ShipVia,s.CompanyName 
go 

select Top(1) c.CustomerID,c.ContactName, max((od.Quantity*od.UnitPrice)*(1-od.Discount)) from Customers as c 
inner join Orders as o on o.CustomerID=c.CustomerID
inner join [Order Details]as od on o.OrderID=od.OrderID
where c.Country like 'Brazil'
group by c.ContactName, c.CustomerID order by max((od.Quantity*od.UnitPrice)*(1-od.Discount))
desc
go

  select p.ProductName,c.CategoryName,p.UnitPrice,(p.UnitPrice*0.18+(p.UnitPrice)) from Products as p 
  inner join Categories as c on c.CategoryID=p.CategoryID
  group by p.ProductName,c.CategoryName,p.UnitPrice
  go

  create function KDVHesapla(@KDVFark decimal(5,2))  
  returns decimal(5,2)
  as
  begin
  declare @kdv decimal(5,2)
  set @kdv = (@KDVFark*0.18+(@KDVFark))
  return @kdv
  end;
  
  select p.ProductName,c.CategoryName,p.UnitPrice, dbo.KDVHesapla(p.UnitPrice)  from Products as p 
  inner join Categories as c on c.CategoryID=p.CategoryID
  group by p.ProductName,c.CategoryName,p.UnitPrice,dbo.KDVHesapla(p.UnitPrice)
  go

  Alter function KDVHesapla(@KDVFark decimal(5,2))  
  returns decimal(5,2)
  as
  begin
  declare @kdv decimal(5,2)
  set @kdv = (@KDVFark*0.20+(@KDVFark))
  return @kdv
  end;
  go


  select p.ProductName,c.CategoryName,p.UnitPrice, dbo.KDVHesapla(p.UnitPrice)  from Products as p 
  inner join Categories as c on c.CategoryID=p.CategoryID
  group by p.ProductName,c.CategoryName,p.UnitPrice,dbo.KDVHesapla(p.UnitPrice)
  go

  create function KDVHesapla2(@KDVFark decimal(5,2), @KategoriID int)  
  returns decimal(5,2)
  as
  begin
   declare @kdv decimal(5,2)
  if @KategoriID = 1
  set @kdv = (@KDVFark*0.20+(@KDVFark))
  else 
  set @kdv = (@KDVFark*0.18+(@KDVFark))
  return @kdv
  end;
  go

  select ProductName,c.CategoryName,p.UnitPrice, dbo.KDVHesapla2(p.UnitPrice,c.CategoryID)  from Products as p 
  inner join Categories as c on c.CategoryID=p.CategoryID
  group by p.ProductName,c.CategoryName,p.UnitPrice,dbo.KDVHesapla2(p.UnitPrice,c.CategoryID)
  go

  alter function ABC(@gelenChar nvarchar(1))
  returns table 
  as 
  return (select*from Customers as c where c.ContactName like @gelenChar+'%')
  go

  select * from dbo.ABC('M')




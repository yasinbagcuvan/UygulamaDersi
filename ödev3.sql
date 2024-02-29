alter function AyHesapla(@tarih date)
returns int
as
begin
declare @tarih1 int
Set @tarih1 = DATEDIFF(MONTH,@tarih,GETDATE())
return @tarih1 
end;
go

select dbo.AyHesapla('12-03-2023')
go

select e.FirstName, dbo.AyHesapla(e.HireDate)[Geçen Ay] from Employees as e 
go

alter function ikiTarihFark(@tarih date,@tarih1 date)
returns int
as
begin
declare @tarih2 int
Set @tarih2 = DATEDIFF(DAY,@tarih,@tarih1)
return @tarih2 
end;
go


select dbo.ikiTarihFark(o.OrderDate,o.ShippedDate) from Orders as o 
GO

CREATE function ABC(@gelenChar nvarchar(1))
  returns table 
  as 
  return (select*from Employees as c where c.FirstName like @gelenChar+'%')
  go

  select * from dbo.ABC('M')
  GO



  create procedure prcOrtalama1
  as
  select (SUM(o.UnitPrice) - MAX(o.UnitPrice) - MIN(o.UnitPrice)) / (COUNT(*) - 2) from [Order Details] as o
  go

   exec prcOrtalama1


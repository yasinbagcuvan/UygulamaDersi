Select o.EmployeeID, COUNT(*)[sipariþ Sayýsý] from Orders as o 
group by o.EmployeeID order by Count(*)desc
go

select p.CategoryID, Count(*) from  Products as p 
group by  p.CategoryID order by  COUNT(*) desc
go

Select o.OrderID, sum(o.Quantity)[Toplam Miktar] 
from [Order Details] as o 
group by o.OrderID order by sum(o.Quantity) desc
go

select o.ProductID,sum(o.Quantity)[Miktar Toplamý] 
from  [Order Details] as o
group by o.ProductID order by sum(o.Quantity)asc
go

select * from Products where CategoryID=7

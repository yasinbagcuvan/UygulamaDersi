--use [TR-NorthWind]
--go

--create table Test2Tablo(

--	Id int primary key,
--	UserName nvarchar(30),
--	Salary money,
--	BirthDate date

--)

--insert Test2Tablo values(1,'Sümeyye',900.00,'1983-2-4')
--insert Test2Tablo values(2,'Yasin',1200.00,'1998-1-1')
--insert Test2Tablo values(3,'Furkan',888.00,'1996-2-4')
--insert Test2Tablo values(4,'Burak',2500.00,'1981-2-4')
--insert Test2Tablo values(5,'Hivda',700.00,'1971-2-4')

--select Year(GETDATE())-YEAR(BirthDate) as [Yaþ], t.UserName from Test2Tablo as t where Year(GETDATE())-YEAR(BirthDate) > 30

--select Year(GETDATE())-YEAR(BirthDate) as [Yas], t.UserName from Test2Tablo as t 
--delete from Test2Tablo where Year(GETDATE())-YEAR(BirthDate) > 40

--select t.Salary, t.UserName from Test2Tablo as t where t.Salary > 1000

--select * from Test2Tablo

--select top(5) c.BirimFiyati, c.UrunAdi from Urunler as c where c.BirimFiyati > 10
--order by c.BirimFiyati DESC

--select count(*) from Urunler as c where c.BirimFiyati > 100
--select Sum(c.HedefStokDuzeyi) from Urunler as c where c.BirimFiyati > 100
--select c.UrunAdi, c.HedefStokDuzeyi from Urunler as c where c.HedefStokDuzeyi < (select avg(x.HedefStokDuzeyi) from Urunler as x)

select sum(PersonelID) from Personeller as p where  YEAR(p.DogumTarihi) > (select avg(YEAR(x.DogumTarihi)) from Personeller as x)
--select PersonelID from Personeller as p where  Year(getdate())-YEAR(p.DogumTarihi) < (select avg(YEAR(x.DogumTarihi)) from Personeller as x)
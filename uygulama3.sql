select sum(HedefStokDuzeyi) from Urunler
select count(*) from Urunler where KategoriID=1
select Avg(HedefStokDuzeyi) from Urunler where KategoriID=1 
select MIN(HedefStokDuzeyi) from Urunler where KategoriID=1 

select u.UrunAdi, k.KategoriAdi  from Urunler as u inner join Kategoriler as k on u.KategoriID = k.KategoriID 
go

select u.UrunAdi,t.SirketAdi,k.KategoriAdi,t.Telefon from Urunler as u 
inner join Kategoriler as k on u.KategoriID = k.KategoriID 
inner join Tedarikciler as t on u.TedarikciID=t.TedarikciID
go

select  q.Adi[Personel],q.BagliCalistigiKisi,p.Adi[Amir]  from Personeller as p 
inner join Personeller as q on p.PersonelID=q.BagliCalistigiKisi
go

select b.BolgeTanimi, bo.TerritoryTanimi from Bolge as b 
inner join Bolgeler as bo on b.BolgeID=bo.BolgeID
go

select count(HedefStokDuzeyi), u.KategoriID from Urunler as u
inner join Kategoriler as k on u.KategoriID=k.KategoriID
group by u.KategoriID
go

select COUNT(*), p.PersonelID from Satislar as p
group by p.PersonelID
go


select COUNT(*), p.Adi from Personeller as p
inner join Satislar as sd on (sd.PersonelID=p.PersonelID) where p.PersonelID>5 and p.Adi like '%a%'
group by p.Adi
having count(*) > 50
go

select count(*)[Adet], k.KategoriAdi from Kategoriler as k 
inner join Urunler as u on k.KategoriID = u.KategoriID where u.KategoriID > 3
group by k.KategoriAdi
having count(*) >4
go


use NorthWindTR
go



select sum(p.HedefStokDuzeyi) from Urunler as p where KategoriID = (select x.KategoriID from Kategoriler as x where KategoriAdi='Beverages')

select * from Kategoriler
go

select distinct MusteriID from Satislar where SatisID in
(select SatisID from [Satis Detaylari] as sd where sd.UrunID in 
(select UrunID from Urunler where KategoriID =
(select KategoriID from Kategoriler where KategoriAdi='Beverages')))

select Adi  from Personeller where PersonelID  in 
(select  PersonelID from Satislar where SatisID  in
(select SatisID from [Satis Detaylari] as sd where sd.UrunID in 
(select UrunID from Urunler where KategoriID =
(select KategoriID from Kategoriler where KategoriAdi ='Beverages'))))


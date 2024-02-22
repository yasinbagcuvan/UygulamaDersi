select u.SevkAdi, u.SevkAdresi, p.Adi from Satislar as u 
inner join Personeller as p on p.PersonelID=u.PersonelID
where len(SevkAdresi)>20 and u.PersonelID=1
go

select 
power((SQRT((BirimFiyati*Miktar))),3), 
p.Adi,
u.SatisID 
from Satislar as u 
inner join Personeller as p on p.PersonelID=u.PersonelID
inner join [Satis Detaylari] as sd on u.SatisID=sd.SatisID
where p.PersonelID=2
go

select 
power((SQRT((BirimFiyati*Miktar)-(BirimFiyati*Miktar*Ýndirim))),3), 
p.Adi,
u.SatisID 
from Satislar as u 
inner join Personeller as p on p.PersonelID=u.PersonelID
inner join [Satis Detaylari] as sd on u.SatisID=sd.SatisID
where p.PersonelID=2
go

select k.KategoriID,COUNT(*)[Urun Adet] from Urunler as u 
inner join Kategoriler as k on u.KategoriID=k.KategoriID
group by k.KategoriID
go

select k.KategoriAdi,COUNT(*)[Urun Adet] from Urunler as u 
inner join Kategoriler as k on u.KategoriID=k.KategoriID
group by k.KategoriAdi
go

select u.UrunAdi,t.Faks from Tedarikciler as t
inner join Urunler as u on u.TedarikciID=t.TedarikciID
where t.Faks is not null
go

select m.MusteriAdi from Satislar as s 
inner join Musteriler as m on m.MusteriID=s.MusteriID
inner join Personeller as p on p.PersonelID=s.PersonelID
where p.Adi = 'Nancy' and YEAR(s.SatisTarihi) > 1997
go

select sum(u.HedefStokDuzeyi*BirimFiyati) from Tedarikciler as t 
inner join Urunler as u on u.TedarikciID=t.TedarikciID
inner join Kategoriler as k on k.KategoriID=u.KategoriID
where  t.SirketAdi like '%Ltd.%' and KategoriAdi ='seafood'
go

select top(1) p.Adi +' '+ p.SoyAdi, count(*) as c from Personeller as p 
inner join Satislar as s on p.PersonelID=s.PersonelID 
--where p.Adi like 'm%'
group by p.Adi +' '+ p.SoyAdi
order by c DESC









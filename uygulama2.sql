create database UygulamaDB
go

use UygulamaDB

create table Ogretmen(

ID int primary key identity,
Adi nvarchar(33) not null
)
go

create table Sýnýf(

SýnýfFK int unique not null,
Bilgi nvarchar(100)
constraint Sýnýf_Ogretmen_FK foreign key (SýnýfFK) references Ogretmen(ID)
)
go 

create table Ogrenci(

ID int primary key identity,
Adi nvarchar(33) not null,
OgrenciFK int unique not null,
constraint Ogrenci_Ogretmen_FK foreign key (OgrenciFK) references Sýnýf(SýnýfFK)
)
go

insert into Sýnýf values(1,'ANK16')
insert into Ogretmen values('Hasan',1)
insert into Ogrenci values('Yasin',2)
insert into Ogrenci values('Furkan',3)
insert into Ogrenci values('Burak',4)





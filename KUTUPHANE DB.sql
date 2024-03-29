CREATE DATABASE KUTUPHANEDB
GO 

USE KUTUPHANEDB
GO

CREATE TABLE KULLANICILAR(

ID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(20)

)
GO

CREATE TABLE SALON(
ID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(20)
)
GO

CREATE TABLE KATEGORI(
ID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(15)
)
GO

CREATE TABLE KITAP(
ID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(20),
KITAP_FK INT NOT NULL,
KATEGORI_FK INT NOT NULL,
CONSTRAINT SALON_KITAP_FK FOREIGN KEY (KITAP_FK) REFERENCES SALON(ID),
CONSTRAINT KATEGORI_KITAP_FK FOREIGN KEY (KATEGORI_FK) REFERENCES KATEGORI(ID)
)
GO

CREATE TABLE ODUNC(
KITAP_FK INT NOT NULL,
KULLANICI_FK INT NOT NULL,
STATUS1 INT NOT NULL,
ALINMATARIHI DATETIME DEFAULT GETDATE(),
CONSTRAINT ODUNC_KULLANICI_FK FOREIGN KEY (KULLANICI_FK) REFERENCES KULLANICILAR(ID),
CONSTRAINT ODUNC_KITAP_FK FOREIGN KEY (KITAP_FK) REFERENCES KITAP(ID)
)
GO




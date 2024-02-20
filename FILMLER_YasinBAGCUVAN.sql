CREATE DATABASE FILMdb
GO

USE FILMdb
GO

CREATE TABLE FILMLER(
FILMID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(20),
)
GO

CREATE TABLE KATEGORILER(
KATEGORIID INT PRIMARY KEY IDENTITY,
KATEGORI NVARCHAR(20),

)
GO 

CREATE TABLE FILMTURLERI(
TURU NVARCHAR(20),
FILM_FK INT UNIQUE NOT NULL,
KATEGORIFK INT UNIQUE NOT NULL
CONSTRAINT fiLMfk FOREIGN KEY (FILM_FK) REFERENCES FILMLER(FILMID),
CONSTRAINT catefk FOREIGN KEY (KATEGORIFK) REFERENCES KATEGORILER(KATEGORIID)
)
GO

CREATE TABLE YONETMENLER(
YONETMENID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(25),
YONETMEN_FK INT UNIQUE NOT NULL
)
GO



CREATE TABLE YONETME(
FILMLER_FK INT UNIQUE NOT NULL,
YONETMEN_FK INT UNIQUE NOT NULL,
CONSTRAINT YONETME_FILM_FK FOREIGN KEY (FILMLER_FK) REFERENCES FILMLER(FILMID),
CONSTRAINT YONETME_YONETMEN_FK FOREIGN KEY (YONETMEN_FK) REFERENCES YONETMENLER(YONETMENID)
)
GO

CREATE TABLE OYUNCULAR(
OYUNCULARID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(25)

)
GO

CREATE TABLE OYNAMA(
FILMLER_FK INT UNIQUE NOT NULL,
OYYUNCULAR_FK INT UNIQUE NOT NULL,
CONSTRAINT OYNAMA_FILMLER_FK FOREIGN KEY (FILMLER_FK) REFERENCES FILMLER(FILMID),

CONSTRAINT OYNAMA_OYUNCULAR_FK FOREIGN KEY (OYYUNCULAR_FK) REFERENCES OYUNCULAR(OYUNCULARID)
)
GO

CREATE TABLE KULLANICILAR(
KULLANICILARID INT PRIMARY KEY IDENTITY,
ADI NVARCHAR(25)
)
GO



CREATE TABLE FAVORILER(
KULLANICILAR_FK INT UNIQUE NOT NULL,
FILMLER_FK INT UNIQUE NOT NULL,
CONSTRAINT FAVORILER_FILMLER_FK FOREIGN KEY (FILMLER_FK) REFERENCES FILMLER(FILMID),
CONSTRAINT FAVORILER_KULLANICILAR_FK FOREIGN KEY (KULLANICILAR_FK) REFERENCES KULLANICILAR(KULLANICILARID)
)
GO



CREATE TABLE YORUMYAPMA(
FILMLER_FK  INT UNIQUE NOT NULL,
KULLANICILAR_FK INT UNIQUE NOT NULL,
CONSTRAINT YORUMYAPMA_KULLANICILAR_FK FOREIGN KEY (KULLANICILAR_FK) REFERENCES KULLANICILAR(KULLANICILARID),
CONSTRAINT YORUMYAPMA_KFILMLER_FK FOREIGN KEY (FILMLER_FK) REFERENCES FILMLER(FILMID)
)
GO



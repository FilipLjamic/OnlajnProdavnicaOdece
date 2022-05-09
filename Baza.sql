CREATE DATABASE OnlajnProdavnicaOdece

USE OnlajnProdavnicaOdece

CREATE TABLE Proizvod
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Naziv NVARCHAR(100) NOT NULL,
	Opis NVARCHAR(1000),
	Cena FLOAT NOT NULL,
	Kolicina INT NOT NULL DEFAULT(0),
	DatumNastanka DATE NOT NULL,
	DatumIzmene DATE
)

CREATE TABLE Tag
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Naziv NVARCHAR(50) NOT NULL,
	Opis NVARCHAR(100),
)

CREATE TABLE ProizvodTag
(
	ProizvodId INT FOREIGN KEY REFERENCES Proizvod(Id) NOT NULL,
	TagId INT FOREIGN KEY REFERENCES Tag(Id) NOT NULL,
	PRIMARY KEY (ProizvodId, TagId)
)

CREATE TABLE Narudzbina
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	StatusNarudzbine NVARCHAR(50) NOT NULL DEFAULT('U obradi'),
	UkupnaCena INT,
	Ime NVARCHAR(50) NOT NULL,
	Prezime NVARCHAR(50) NOT NULL,
	Telefon NVARCHAR(15) NOT NULL,
	Mejl NVARCHAR(50) NOT NULL,
	Adresa NVARCHAR(100) NOT NULL,
	Grad NVARCHAR(50) NOT NULL,
	Drzava NVARCHAR(50) NOT NULL,
	DatumNastanka DATE NOT NULL,
	Komentar NVARCHAR(1000)
)

CREATE TABLE ProizvodNarudzbina
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	ProizvodId INT FOREIGN KEY REFERENCES Proizvod(Id) NOT NULL,
	NarudzbinaId INT FOREIGN KEY REFERENCES Narudzbina(Id) NOT NULL,
	Kolicina INT NOT NULL DEFAULT(1)
)
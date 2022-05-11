DROP DATABASE OnlajnProdavnicaOdece
go
CREATE DATABASE OnlajnProdavnicaOdece
go
USE OnlajnProdavnicaOdece
go
/***************Kreiranje tabela***************/
go
CREATE TABLE Korisnik
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Ime NVARCHAR(50)NOT NULL,
	Prezime NVARCHAR(50) NOT NULL,
	Telefon NVARCHAR(15) NOT NULL,
	Mejl NVARCHAR(50) NOT NULL,
	Lozinka NVARCHAR(50) NOT NULL,
	jeAdmin BIT NOT NULL DEFAULT('FALSE')
)
go
CREATE TABLE Slika
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	SlikaRef NVARCHAR(MAX) NOT NULL DEFAULT('https://drive.google.com/uc?id=1Li5JXl8vw0wmos72YA_1s_egWnIyRsi6'),
	Naziv NVARCHAR(50) NOT NULL DEFAULT('Slika')
)
go
CREATE TABLE Proizvod
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Naziv NVARCHAR(100) NOT NULL,
	Opis NVARCHAR(1000),
	Cena FLOAT NOT NULL,
	Kolicina INT NOT NULL DEFAULT(0),
	DatumNastanka DATE NOT NULL,
	DatumIzmene DATE,
	SlikaId INT FOREIGN KEY REFERENCES Slika(Id) DEFAULT(1),
)
go
CREATE TABLE Tag
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	Naziv NVARCHAR(50) NOT NULL,
	Opis NVARCHAR(100),
)
go
CREATE TABLE ProizvodTag
(
	ProizvodId INT FOREIGN KEY REFERENCES Proizvod(Id) NOT NULL,
	TagId INT FOREIGN KEY REFERENCES Tag(Id) NOT NULL,
	PRIMARY KEY (ProizvodId, TagId)
)
go
CREATE TABLE Narudzbina
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	KorisnikID INT FOREIGN KEY REFERENCES Korisnik(Id) NOT NULL,
	StatusNarudzbine NVARCHAR(50) NOT NULL DEFAULT('U obradi'),
	UkupnaCena INT,
	Adresa NVARCHAR(100) NOT NULL,
	Grad NVARCHAR(50) NOT NULL,
	Drzava NVARCHAR(50) NOT NULL,
	DatumNastanka DATE NOT NULL,
	Komentar NVARCHAR(1000)
)
go
CREATE TABLE ProizvodNarudzbina
(
	Id INT IDENTITY(1, 1) PRIMARY KEY,
	ProizvodId INT FOREIGN KEY REFERENCES Proizvod(Id) NOT NULL,
	NarudzbinaId INT FOREIGN KEY REFERENCES Narudzbina(Id) NOT NULL,
	Kolicina INT NOT NULL DEFAULT(1)
)
go
/**/
go
/***************Stored procedure***************/
go
/**********Korisnik**********/
go
CREATE PROC KorisnikEmailProvera
@Mejl NVARCHAR(50),
@Lozinka NVARCHAR(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS(SELECT TOP 1 Mejl FROM Korisnik
	WHERE Mejl = @Mejl AND Lozinka = @Lozinka)
	BEGIN
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC KorisnikInsert
@Ime NVARCHAR(50),
@Prezime NVARCHAR(50),
@Telefon NVARCHAR(15),
@Mejl NVARCHAR(50),
@Lozinka NVARCHAR(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 Mejl FROM Korisnik
	WHERE Mejl = @Mejl)
		RETURN 1;
	ELSE
		INSERT INTO Korisnik(Ime, Prezime, Telefon, Mejl, Lozinka)
		VALUES(@Ime, @Prezime, @Telefon, @Mejl, @Lozinka)
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC KorisnikUpdate
@Mejl NVARCHAR(50),
@Lozinka NVARCHAR(50)
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 Mejl FROM Korisnik
	WHERE Mejl = @Mejl)
	BEGIN
		UPDATE Korisnik SET Lozinka = @Lozinka WHERE Mejl = @Mejl 
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC KorisnikDelete
@Mejl NVARCHAR(50)
AS
BEGIN TRY
	DELETE FROM Korisnik WHERE Mejl = @Mejl
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**********Tag***********/
go
CREATE PROC TagInsert
@Naziv NVARCHAR(50),
@Opis NVARCHAR(100) = NULL
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 Naziv FROM Tag
	WHERE Naziv = @Naziv)
		RETURN 1;
	ELSE
		INSERT INTO Tag(Naziv, Opis)
		VALUES(@Naziv, @Opis)
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC TagUpdate
@Naziv NVARCHAR(50),
@Opis NVARCHAR(100) = NULL
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 Naziv FROM Tag
	WHERE Naziv = @Naziv)
	BEGIN
		UPDATE Tag SET Opis = @Opis WHERE Naziv = @Naziv
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC TagDelete
@Naziv NVARCHAR(50)
AS
BEGIN TRY
	DELETE FROM Tag WHERE Naziv = @Naziv
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**********Slika**********/
go
CREATE PROC SlikaInsert
@Naziv NVARCHAR(50) = 'Slika',
@SlikaRef NVARCHAR(MAX) = 'https://drive.google.com/uc?id=1Li5JXl8vw0wmos72YA_1s_egWnIyRsi6'
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	INSERT INTO Slika(Naziv, SlikaRef)
	VALUES(@Naziv, @SlikaRef)
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
/*SlikaUpdate nema*/
go
/**/
go
CREATE PROC SlikaDelete
@Id INT
AS
BEGIN TRY
	DELETE FROM Slika WHERE Id = @Id
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**********Proizvod**********/
go
CREATE PROC ProizvodInsert
@Naziv NVARCHAR(100),
@Opis NVARCHAR(1000),
@Cena FLOAT,
@Kolicina INT,
@SlikaId INT = 1
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	INSERT INTO Proizvod(Naziv, Opis, Cena, Kolicina, DatumNastanka, SlikaId)
	VALUES(@Naziv, @Opis, @Cena, @Kolicina, CONVERT(date, GETDATE()), @SlikaId)
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC ProizvodUpdate
@Id INT,
@Naziv NVARCHAR(100),
@Opis NVARCHAR(1000),
@Cena FLOAT,
@Kolicina INT,
@SlikaId INT
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 Naziv FROM Proizvod
	WHERE Id = @Id)
	BEGIN
		UPDATE Proizvod
		SET
		Naziv = @Naziv,
		Opis = @Opis,
		Cena = @Cena,
		Kolicina = @Kolicina,
		SlikaId = @SlikaId,
		DatumIzmene = CONVERT(date, GETDATE())
		WHERE Id = @Id
		RETURN 0;
	END
	RETURN 1;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
CREATE PROC ProizvodDelete
@Id INT
AS
BEGIN TRY
	DELETE FROM Proizvod WHERE Id = @Id
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**********ProizvodTag**********/
go
CREATE PROC ProizvodTagInsert
@ProizvodId INT,
@TagId INT
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
	IF EXISTS (SELECT TOP 1 * FROM ProizvodTag
	WHERE ProizvodId = @ProizvodId AND TagId = @TagId)
		RETURN 1;
	ELSE
		INSERT INTO ProizvodTag(ProizvodId, TagId)
		VALUES(@ProizvodId, @TagId)
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go
/*ProizvodTagUpdate nema*/
go
/**/
go
CREATE PROC ProizvodTagDelete
@ProizvodId INT,
@TagId INT
AS
BEGIN TRY
	DELETE FROM ProizvodTag 
	WHERE ProizvodId = @ProizvodId AND TagId = @TagId
	RETURN 0;
END TRY
BEGIN CATCH
	RETURN @@ERROR;
END CATCH
go
/**/
go






INSERT INTO Slika DEFAULT VALUES

INSERT INTO Proizvod (Naziv, Cena, DatumNastanka)
VALUES
('Patike', 8000, '2022-2-2'),
('Majica', 600, '2022-2-2'),
('Carape', 300, '2022-2-2'),
('Jakna', 7000, '2022-2-2'),
('Farmerke', 3000, '2022-2-2'),
('Duks', 3000, '2022-2-2'),
('Cipele', 10000, '2022-2-2');
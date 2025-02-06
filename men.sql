create database men
use men


create table Klub(
id INT IDENTITY(1,1) PRIMARY KEY,
naziv nvarchar (20),
reg_broj_kluba int
)

create table Opis(
id INT IDENTITY(1,1) PRIMARY KEY,
pozicija nvarchar (20),
cena int,
br_opisa int
)

drop table opis

create table Menadzer(
id INT IDENTITY(1,1) PRIMARY KEY,
ime NVARCHAR(20),
prezime NVARCHAR(30),
reg_broj_menadzera int
)

create table Igrac(
id INT IDENTITY(1,1) PRIMARY KEY,
ime NVARCHAR(20),
prezime NVARCHAR(30),
menadzer_id INT FOREIGN KEY REFERENCES Menadzer(id),
klub_id INT FOREIGN KEY REFERENCES klub(id),
opis_id INT FOREIGN KEY REFERENCES opis(id),
reg_broj_igraca int
)

insert into Klub(naziv,reg_broj_kluba)
values('CZV',1)

insert into opis(pozicija, cena,br_opisa)
values('napadac', 50,1)

insert into menadzer(ime, prezime,reg_broj_menadzera)
values('Uros', 'Milicevic',1)

insert into igrac (ime,prezime,menadzer_id,opis_id,klub_id,reg_broj_igraca)
values('Aleksandar','Katai',1,1,1,1)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Store Procedure

--INSERT
go
CREATE PROC Klub_Insert
@naziv nvarchar(50),
@reg_broj_kluba int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 naziv FROM klub
    WHERE reg_broj_kluba = @reg_broj_kluba  )
    Return 1
    else
    Insert Into klub(naziv,reg_broj_kluba)
    Values(@naziv,@reg_broj_kluba)
        RETURN 0;
END TRY
   
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
go


go
CREATE PROC Opis_Insert
@pozicija nvarchar(50),
@cena int,
@br_opisa int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 pozicija,cena FROM opis
    WHERE br_opisa = @br_opisa  )
    Return 1
    else
    Insert Into opis(pozicija,cena,br_opisa)
    Values(@pozicija,@cena,@br_opisa)
        RETURN 0;
END TRY
   
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
go



go
CREATE PROC Menadzer_Insert
@ime nvarchar(50),
@prezime nvarchar(50),
@reg_broj_menadzera int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 ime , prezime FROM menadzer
    WHERE reg_broj_menadzera = @reg_broj_menadzera  )
    Return 1
    else
    Insert Into menadzer(ime,prezime,reg_broj_menadzera)
    Values(@ime,@prezime,@reg_broj_menadzera)
        RETURN 0;
END TRY
   
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
go




go
CREATE PROC Igrac_Insert
@ime nvarchar(50),
@prezime nvarchar(50),
@menadzer_id int,
@opis_id int,
@klub_id int,
@reg_broj_igraca int
AS
SET LOCK_TIMEOUT 3000;
BEGIN TRY
IF EXISTS (SELECT TOP 1 ime,prezime,menadzer_id,opis_id,klub_id FROM igrac
    WHERE reg_broj_igraca = @reg_broj_igraca  )
    Return 1
    else
    Insert Into igrac(ime,prezime,menadzer_id,opis_id,klub_id,reg_broj_igraca)
    Values(@ime,@prezime,@menadzer_id ,@opis_id ,@klub_id ,@reg_broj_igraca)
        RETURN 0;
END TRY
   
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
go

-- UPDATE
GO
Create PROC Klub_Update
@naziv nvarchar(50),
@reg_broj_kluba int
AS
SET LOCK_TIMEOUT 3000;
-- provera da li postoji kategorija
BEGIN TRY
    IF EXISTS (SELECT TOP 1 naziv FROM klub
    WHERE reg_broj_kluba = @reg_broj_kluba  )

    BEGIN
   
    Update klub  Set naziv=@naziv where reg_broj_kluba=@reg_broj_kluba
        RETURN 0;
    END
    RETURN -1;
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO




GO
Create PROC Opis_Update
@pozicija nvarchar(50),
@cena int,
@br_opisa int
AS
SET LOCK_TIMEOUT 3000;
-- provera da li postoji kategorija
BEGIN TRY
    IF EXISTS (SELECT TOP 1 pozicija,cena FROM opis
    WHERE br_opisa = @br_opisa  )

    BEGIN
   
    Update opis  Set pozicija=@pozicija , cena=@cena where br_opisa=@br_opisa
        RETURN 0;
    END
    RETURN -1;
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO




GO
Create PROC Menadzer_Update
@ime nvarchar(50),
@prezime nvarchar(50),
@reg_broj_menadzera int
AS
SET LOCK_TIMEOUT 3000;
-- provera da li postoji kategorija
BEGIN TRY
    IF EXISTS (SELECT TOP 1 ime,prezime FROM menadzer
    WHERE reg_broj_menadzera = @reg_broj_menadzera  )

    BEGIN
   
    Update menadzer  Set ime=@ime, prezime=@prezime where reg_broj_menadzera=@reg_broj_menadzera
        RETURN 0;
    END
    RETURN -1;
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO




GO
Create PROC Igrac_Update
@ime nvarchar(50),
@prezime nvarchar(50),
@menadzer_id int,
@opis_id int,
@klub_id int,
@reg_broj_igraca int
AS
SET LOCK_TIMEOUT 3000;
-- provera da li postoji kategorija
BEGIN TRY
    IF EXISTS (SELECT TOP 1 ime,prezime,menadzer_id,opis_id,klub_id FROM Igrac
    WHERE reg_broj_igraca = @reg_broj_igraca  )

    BEGIN
   
    Update igrac  Set ime=@ime,prezime=@prezime,menadzer_id=@menadzer_id,opis_id=@opis_id,klub_id=@klub_id where reg_broj_igraca=@reg_broj_igraca
        RETURN 0;
    END
    RETURN -1;
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO


--DELETE
GO
Create Proc Klub_Delete
@reg_broj_kluba int
as
Begin TRY
Delete from klub where reg_broj_kluba=@reg_broj_kluba
RETURN 0
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO


GO
Create Proc Opis_Delete
@br_opisa int
as
Begin TRY
Delete from opis where br_opisa=@br_opisa
RETURN 0
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO




GO
Create Proc Menadzer_Delete
@reg_broj_menadzera nvarchar(100)
as
Begin TRY
Delete from menadzer where reg_broj_menadzera=@reg_broj_menadzera
RETURN 0
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO




GO
Create Proc Igraca_Delete
@reg_broj_igraca nvarchar(100)
as
Begin TRY
Delete from igrac where reg_broj_igraca=@reg_broj_igraca
RETURN 0
END TRY
BEGIN CATCH
    RETURN @@ERROR;
END CATCH
GO



select * from klub

select * from opis

select * from Menadzer

select * from igrac
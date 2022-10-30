--1. Creamos la base de datos
drop database if exists tiendaInformatica;
create database tiendaInformatica;
USE tiendaInformatica;

--2. Crear las tablas 
create table Fabricantes(
	Id_CodigoF int Primary Key identity(1,1) not null,
	Nombre varchar(50) not null,

);

create table Articulos (
	Id_Articulos int Primary Key identity(1,1) not null,
	Nombre varchar(50) not null,
	Precio float not null,
	Id_CodigoF int

	constraint FK_Id_CodigoF Foreign Key (Id_CodigoF) references Fabricantes (Id_CodigoF)
);


-- INSERTANDO DATOS
--Datos de la tabla Fabricantes
Insert into Fabricantes values('Asus');
Insert into Fabricantes values('Lenovo');
Insert into Fabricantes values('Hewlett-Packard');
Insert into Fabricantes values('Samsung');
Insert into Fabricantes values('Seagate');
Insert into Fabricantes values('Crucial');
Insert into Fabricantes values('Gigabyte');
Insert into Fabricantes values('Huawei');
Insert into Fabricantes values('Xiaomi');

--Datos de la tabla Artículos
INSERT INTO Articulos VALUES('Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO Articulos VALUES('Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO Articulos VALUES('Disco SSD 1 TB', 150.99, 4);
INSERT INTO Articulos VALUES('GeForce GTX 1050Ti', 185, 7);
INSERT INTO Articulos VALUES('GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO Articulos VALUES('Monitor 24 LED Full HD', 202, 1);
INSERT INTO Articulos VALUES('Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO Articulos VALUES('Portátil Yoga 520', 559, 2);
INSERT INTO Articulos VALUES('Portátil Ideapd 320', 444, 2);
INSERT INTO Articulos VALUES('Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO Articulos VALUES('Impresora HP Laserjet Pro M26nw', 180, 3);

-- Ejmplos del uso de IF, WHILE, CASE


--1)
DECLARE @interaciones INT;
SET @interaciones = 0;

WHILE @interaciones < 5
	BEGIN
		SELECT TOP(1) * FROM ARTICULOS ORDER BY NEWID()
		SET @interaciones = @interaciones + 1
	END 


--2)

DECLARE @cantidad INT;
SET @cantidad = (SELECT COUNT(*) FROM Articulos WHERE Id_CodigoF = 3)

SELECT 
	CASE @cantidad
	WHEN 1 THEN 'SOLO CUENTA CON UN REGISTRO'
	WHEN 2 THEN 'TIENE 2 REGISTROS'
	

	ELSE 'NADA'

END

-- 3)
DECLARE @logitud INT, @visto INT, @nombre_fabricante varchar(100);
SET @logitud = (SELECT COUNT(*) FROM Fabricantes )
SET @visto = 0;
SET @nombre_fabricante = 'TOSHIBA';

WHILE @visto < @logitud
	BEGIN
	

		SELECT 
			CASE (SELECT TOP(1) Nombre FROM Fabricantes ORDER BY NEWID())
			WHEN @nombre_fabricante THEN 'YA ESTA REGISTRADO'
			ELSE 'NO HAY REGISTO'

	

		END

		SET @visto = @visto + 1
	END


-- 4)
DECLARE @logitud1 INT, @visto1 INT, @nombre_fabricante1 varchar(100);
SET @logitud1 = (SELECT COUNT(*) FROM Fabricantes )
SET @visto1 = 0;
SET @nombre_fabricante1 = 'TOSHIBA';

WHILE @visto1 < @logitud1
	BEGIN
		SET @visto1 = @visto1 + 1
		IF  @nombre_fabricante1 = (SELECT TOP(1) Nombre FROM Fabricantes WHERE Id_CodigoF = @visto1)
			print('YA ESTA REGISTRADO')
		ELSE
			INSERT INTO Fabricantes Values(@nombre_fabricante1)
			print('YA FUE REGISTRADO')
			BREAK
	

		

		
	END



	

		


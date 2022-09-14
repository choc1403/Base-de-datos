--1. Creamos la base de datos
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

-- SENTENCIAS DE LA HOJA DE TRABAJO
-- 1)
SELECT Nombre,	CONCAT('$ ', Precio/7.5) AS Dolar, CONCAT('€ ',Precio/7.94) AS Euro FROM Articulos;

-- 2)
SELECT UPPER(Nombre) As Nombre, Precio FROM Articulos;

-- 3)
SELECT LOWER(Nombre) As Nombre, Precio FROM Articulos;

-- 4)
SELECT Nombre, SUBSTRING(UPPER(Nombre), 1,2) + SUBSTRING(LOWER(Nombre), 3,25) AS Nombre FROM Fabricantes;

-- 5)
SELECT Nombre, ROUND(Precio,1) AS Precio FROM Articulos;

-- 6)
SELECT Nombre, ROUND(Precio,0) AS Precio FROM Articulos;

-- 7)
SELECT F.Id_CodigoF As Codigo_Fabricante
FROM Articulos AS A, Fabricantes AS F WHERE A.Id_CodigoF = F.Id_CodigoF ORDER BY F.Id_CodigoF ASC;

-- 8)
SELECT DISTINCT F.Id_CodigoF As Codigo_Fabricante
FROM Articulos AS A, Fabricantes AS F WHERE A.Id_CodigoF = F.Id_CodigoF ORDER BY F.Id_CodigoF ASC;

-- 9)
SELECT Nombre FROM Fabricantes ORDER BY Nombre ASC;

-- 10)
SELECT Nombre FROM Fabricantes ORDER BY Nombre DESC;

-- 11)
SELECT Nombre, Precio FROM Articulos ORDER BY Nombre ASC, Precio DESC;

-- 12)
SELECT TOP 5 * FROM Fabricantes;

-- 13) 
SELECT TOP 2 * FROM Fabricantes WHERE Id_CodigoF >= 4;

-- 14)
SELECT TOP 5 Nombre, Precio FROM Articulos ORDER BY Precio ASC;

-- 15)
SELECT TOP 5 Nombre, Precio FROM Articulos ORDER BY Precio DESC;

-- 16)
SELECT Nombre, Precio FROM Articulos WHERE Id_CodigoF = 2;

-- 17)
SELECT Nombre FROM Articulos WHERE Precio <= 120;

-- 18)
SELECT Nombre FROM Articulos WHERE Precio >= 400;

-- 19)
SELECT Nombre FROM Articulos WHERE Precio < 400;

-- 20)
SELECT Nombre FROM Articulos WHERE Precio >= 80 OR Precio <=300;

-- 21)
SELECT Nombre FROM Articulos WHERE Precio BETWEEN 60 AND 200;

-- 22)
SELECT Nombre FROM Articulos WHERE Precio > 200 AND Id_CodigoF = 6;

-- 23)
SELECT Nombre, Precio FROM Articulos WHERE Id_CodigoF%2 != 0 AND Id_CodigoF != 7;

-- 24)
SELECT Nombre, Precio FROM Articulos WHERE Id_CodigoF IN(1,3,5);

-- 25)
SELECT Nombre, Precio*100 AS Centimos FROM Articulos;

--26)
SELECT Nombre FROM Fabricantes WHERE Nombre LIKE 's%';

--27)
SELECT Nombre FROM Fabricantes WHERE Nombre LIKE '%e';

--28)
SELECT Nombre FROM Fabricantes WHERE Nombre LIKE '%w%';

--29)
SELECT Nombre FROM Fabricantes WHERE LEN(Nombre) = 4;

--30)
SELECT Nombre FROM Articulos WHERE Nombre LIKE '%Portátil%';

--31)
SELECT Nombre FROM Articulos WHERE Nombre LIKE '%Monitor%' AND Precio < 215;

--32)
SELECT Nombre, Precio FROM Articulos WHERE Precio >= 180 ORDER BY Precio ASC;
SELECT Nombre, Precio FROM Articulos WHERE Precio >= 180 ORDER BY Precio DESC;

--33)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF;

--34)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF ORDER BY Nombre_Fabricante ASC;

--35)
SELECT 
	A.Id_Articulos AS Codigo_Producto, A.Nombre AS Nombre_Producto, 
	F.Id_CodigoF AS Codigo_Fabricante, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF;

--36)
SELECT TOP(1)
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF ORDER BY A.Precio ASC;

--37)
SELECT TOP(1)
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF ORDER BY A.Precio DESC;

--38)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre LIKE '%LENOVO%';

--39)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre LIKE '%Crucial%' AND A.Precio > 200;

--40)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre IN ('Asus','Hewlett-Packard','Seagate');

--41)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre IN ('Asus','Hewlett-Packard','Seagate');

--42)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre LIKE '%E';

--43)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE F.Nombre LIKE '%W%';

--44)
SELECT 
	A.Nombre AS Nombre_Producto, A.Precio, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF WHERE A.Precio >= 180 ORDER BY A.Precio DESC, F.Nombre ASC;

--45)
SELECT 
	DISTINCT F.Id_CodigoF, F.Nombre AS Nombre_Fabricante
FROM Articulos AS A
INNER JOIN Fabricantes As F ON A.Id_CodigoF = F.Id_CodigoF;
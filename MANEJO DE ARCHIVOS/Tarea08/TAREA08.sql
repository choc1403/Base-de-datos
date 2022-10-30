-- Creacion de la base de datos

DROP DATABASE IF EXISTS Ventas;
CREATE DATABASE Ventas;
USE Ventas;

-- Creacion de las tablas para la base de datos
CREATE TABLE Comercial(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Apellido2 VARCHAR(100),
    Ciudad VARCHAR(100),
    Comision FLOAT

);


CREATE TABLE Cliente(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Apellido2 VARCHAR(100),
    Ciudad VARCHAR(100),
    Categoria INT 

);


CREATE TABLE Pedido(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Cantidad DECIMAL(11,2),
    Fecha DATE,
    id_cliente INT NOT NULL,
    id_comercial INT NOT NULL

    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE,
    CONSTRAINT fk_comercial FOREIGN KEY (id_comercial) REFERENCES Comercial(Id) ON DELETE CASCADE

);

-- Insertando datos a las tablas
INSERT INTO Cliente (Nombre, Apellido, Apellido2, Ciudad, Categoria) 
VALUES  ('Aarón', 'Rivero', 'Gómez', 'Almería', 100),
        ('Adela', 'Salas', 'Díaz', 'Granada', 200),
        ('Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
        ('Adrián', 'Suárez', 'Jaén',NULL, 300),
        ('Marcos', 'Loyola', 'Méndez', 'Almería',200),
        ('María', 'Santana', 'Moreno', 'Cádiz', 100),
        ('Pilar', 'Ruiz', 'Sevilla', NULL, 300),
        ('Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
        ('Guillermo', 'López', 'Gómez', 'Granada', 225),
        ('Daniel', 'Santana', 'Loyola','Sevilla', 125);

INSERT INTO Comercial (Nombre, Apellido, Apellido2, Ciudad, Comision)
VALUES  ('Daniel', 'Sáez', 'Vega', NULL, 0.15),
        ('Juan', 'Gómez', 'López', NULL, 0.13),
        ('Diego','Flores', 'Salas', NULL,0.11),
        ('Marta','Herrera', 'Gil', NULL,0.14),
        ('Antonio','Carretero', 'Ortega', NULL,0.12),
        ('Manuel','Domínguez', 'Hernández', NULL,0.13),
        ('Antonio','Vega', 'Hernández', NULL,0.11),
        ('Alfredo','Ruiz', 'Flores', NULL,0.05);

INSERT INTO Pedido (Cantidad,Fecha,id_cliente,id_comercial) 
VALUES  (150.5, '2017-10-05', 5, 2),
        (270.65, '2016-09-10', 1, 5),
        (65.26, '2017-10-05', 2, 1),
        (110.5, '2016-08-17', 8, 3),
        (948.5, '2017-09-10', 5, 2),
        (2400.6, '2016-07-27', 7, 1),
        (5760, '2015-09-10', 2, 1),
        (1983.43, '2017-10-10', 4, 6),
        (2480.4, '2016-10-10', 8, 3),
        (250.45, '2015-06-27', 8, 2),
        (75.29, '2016-08-17', 3, 7),
        (3045.6, '2017-04-25', 2, 1),
        (545.75, '2019-01-25', 6, 1),
        (145.82, '2017-02-02', 6, 1),
        (370.85, '2019-03-11', 1, 5),
        (2389.23, '2019-03-11', 1, 5);


-- Sentecias
-- a)
SELECT * FROM PEDIDO ORDER BY Fecha DESC;

-- b)
SELECT TOP (2) * FROM PEDIDO ORDER BY Cantidad DESC;

-- c)
SELECT DISTINCT
C.Id, C.Nombre, C.Apellido, C.Ciudad
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C ON C.Id = P.id_cliente ; 

-- d)
SELECT * FROM Pedido WHERE Fecha LIKE '%2017%' AND Cantidad > 500;

-- e)
SELECT Nombre, Apellido FROM Comercial WHERE Comision IN(0.05,0.11);

-- F)
SELECT TOP(1) Comision FROM Comercial ORDER BY Comision DESC;

-- G)
INSERT INTO Cliente (Nombre, Apellido, Apellido2, Ciudad, Categoria) 
VALUES  ('Aaran', 'Rivero', NULL, 'Almería', 100);

SELECT Nombre, CONCAT(Apellido,' ', Apellido2) AS Apellidos FROM Cliente WHERE Apellido2 != 'NULL' ORDER BY Apellidos ASC,Nombre ASC;


-- h)
SELECT Nombre FROM Cliente WHERE Nombre LIKE 'a%n' OR Nombre LIKE 'P%' ORDER BY Nombre ASC;

-- I)
SELECT Nombre FROM Cliente WHERE Nombre NOT LIKE 'a%' ORDER BY Nombre ASC;

-- J)
SELECT DISTINCT Nombre FROM Comercial WHERE Nombre LIKE '%el' OR Nombre LIKE '%O' ORDER BY Nombre ASC;

-- K)
SELECT DISTINCT
C.Id, C.Nombre, CONCAT(C.Apellido, ' ', C.Apellido2) AS Apellido
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C ON C.Id = P.id_cliente ORDER BY C.Nombre ASC ; 


-- I)
SELECT DISTINCT
C.Nombre,CONCAT(C.Apellido, ' ', C.Apellido2) AS Apellido, C.Ciudad,
P.Cantidad, P.Fecha
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C ON C.Id = P.id_cliente ORDER BY C.Nombre ASC;

-- M)
SELECT DISTINCT
C.Nombre,CONCAT(C.Apellido, ' ', C.Apellido2) AS Apellido,
P.Cantidad, P.Fecha
FROM PEDIDO AS P
INNER JOIN Comercial AS C ON C.Id = P.id_comercial ORDER BY C.Nombre; 

-- N)
SELECT DISTINCT
CL.Nombre, CONCAT(CL.Apellido, ' ', CL.Apellido2) AS Apellidos,
C.Nombre, CONCAT(C.Apellido, ' ', C.Apellido2) AS Apellido,
P.Cantidad, P.Fecha
FROM PEDIDO AS P, Comercial AS C, Cliente AS CL
WHERE CL.Id = P.id_cliente AND C.Id = P.id_comercial;


-- K)
SELECT Cliente.Nombre, CONCAT(Cliente.Apellido, ' ', Cliente.Apellido2) AS Apellidos,
Pedido.Fecha, Pedido.Cantidad
FROM Pedido, Cliente 
WHERE Cliente.Id = Pedido.id_cliente AND Fecha LIKE '%2017%' AND Cantidad >= 300 AND Cantidad <=1000 ;


-- L)
SELECT DISTINCT
C.Nombre, 
CONCAT(C.Apellido, ' ', C.Apellido2) AS Apellido

FROM 
PEDIDO AS P, 
Comercial AS C, 
Cliente AS CL
WHERE C.Id = P.id_comercial AND CL.Id = 6 ;


-- M)
SELECT DISTINCT
Cl.Nombre
FROM 
PEDIDO AS P, 
Comercial AS C, 
Cliente AS CL
WHERE CL.Id = P.id_cliente AND C.Id = 1;

--n)
SELECT DISTINCT
Cliente.Nombre
FROM Cliente
INNER JOIN Pedido ON  Pedido.id_cliente != Cliente.Id;

--O)
SELECT DISTINCT
Comercial.Nombre
FROM Comercial
INNER JOIN Pedido ON  Pedido.id_cliente != Comercial.Id;
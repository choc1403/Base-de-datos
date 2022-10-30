-- Creacion de la base de datos
-- Creacion en el motor de base de datos de MYSQL   

DROP DATABASE IF EXISTS Ventas;
CREATE DATABASE Ventas;
USE Ventas;

-- Creacion de las tablas para la base de datos
CREATE TABLE Comercial(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Apellido2 VARCHAR(100),
    Ciudad VARCHAR(100),
    Comision FLOAT

);


CREATE TABLE Cliente(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Apellido2 VARCHAR(100),
    Ciudad VARCHAR(100),
    Categoria INT 

);


CREATE TABLE Pedido(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Cantidad DECIMAL(11,2),
    Fecha DATE,
    id_cliente INT NOT NULL,
    id_comercial INT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE,
    FOREIGN KEY (id_comercial) REFERENCES Comercial(Id) ON DELETE CASCADE

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
SELECT * FROM PEDIDO ORDER BY Cantidad DESC LIMIT 2;
-- CREACION DE LA BASE DE DATOS
DROP DATABASE IF EXISTS COMPRAS;
CREATE DATABASE COMPRAS;
use COMPRAS;


-- CREACION DE LA TABLAS
CREATE TABLE Producto(
	Id INT PRIMARY KEY,
	nombre_producto VARCHAR(25) NOT NULL,
	Precio DECIMAL(5,2) NOT NULL
);

CREATE TABLE Estado(
	Id INT PRIMARY KEY IDENTITY(1,1),
	nombre_estado VARCHAR(25) NOT NULL
);

CREATE TABLE Cliente(
	Id INT PRIMARY KEY,
	id_estado INT NOT NULL,
	nombre_cliente VARCHAR(25) NOT NULL

	CONSTRAINT fk_estado FOREIGN KEY (id_estado) REFERENCES Estado(Id) ON DELETE CASCADE
);

CREATE TABLE Orden(
	Id INT PRIMARY KEY,
	id_cliente INT NOT NULL,
	Fecha DATE DEFAULT current_timestamp
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE
);

CREATE TABLE detalle_orden(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_orden INT NOT NULL,
	id_producto INT NOT NULL,
	Cantidad INT NOT NULL,	

	CONSTRAINT fk_orden FOREIGN KEY (id_orden) REFERENCES Orden(Id) ON DELETE CASCADE,
	CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES Producto(Id) ON DELETE CASCADE
);

-- AGREGANDO INFORMACION
INSERT INTO Estado VALUES('Caracas'),
('Coro'),
('Maracay');


INSERT INTO Producto VALUES(3786,'Red', 35),
(4011,'Raqueta',65),
(9132,'Paq-3',4.75),
(5794,'Paq-6', 5),
(3141,'Funda', 10);


INSERT INTO Cliente VALUES(101,1,'Martin'),
(107,2, 'Herman'),
(110,3, 'Pedro');


INSERT INTO Orden VALUES(2301,101, '2011/02/23'),
(2302,107,'2011/02/25'),
(2303,110,'2011/02/27');

INSERT INTO detalle_orden VALUES(2301,3786,3),
(2301,4011,6),
(2301,9132,8),
(2302,5794,4),
(2303,4011,2),
(2303,3141,2);

-- MOSTRAR INFORMACION
SELECT * FROM Estado;
SELECT * FROM Producto;

SELECT 
	cl.id, 
	cl.nombre_cliente, 
	e.nombre_estado 
FROM Cliente AS cl 
INNER JOIN Estado AS e ON cl.id_estado = e.Id;

SELECT 
	det.id_orden,
	ord.Fecha,	
	cl.nombre_cliente,
	e.nombre_estado,	
	pr.nombre_producto,
	det.cantidad,
	pr.Precio

FROM detalle_orden AS det
INNER JOIN Orden AS ord ON det.id_orden = ord.Id
INNER JOIN Cliente AS cl ON ord.id_cliente = cl.Id
INNER JOIN Estado AS e ON cl.id_estado = e.Id
INNER JOIN Producto AS pr ON det.id_producto = pr.Id

SELECT 
	det.id_orden,
	ord.Fecha,
	cl.Id,
	cl.nombre_cliente,
	e.nombre_estado,
	pr.Id,
	pr.nombre_producto,
	det.cantidad,
	pr.Precio

FROM detalle_orden AS det
INNER JOIN Orden AS ord ON det.id_orden = ord.Id
INNER JOIN Cliente AS cl ON ord.id_cliente = cl.Id
INNER JOIN Estado AS e ON cl.id_estado = e.Id
INNER JOIN Producto AS pr ON det.id_producto = pr.Id


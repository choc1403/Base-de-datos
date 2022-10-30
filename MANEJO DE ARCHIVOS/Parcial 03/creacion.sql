-- CREACION DE LA BASE DE DATOS
DROP DATABASE IF EXISTS Jardineria;
CREATE DATABASE Jardineria;

USE Jardineria;

-- CREACION DE LAS TABLAS
CREATE TABLE gama_producto(
	Id VARCHAR(50) PRIMARY KEY,
	descripcion_texto TEXT,
	descripcion_html TEXT,
	imagen VARCHAR(256)


);


CREATE TABLE Producto(
	Id VARCHAR(15) PRIMARY KEY,
	Nombre VARCHAR(70),
	Gama VARCHAR(50),
	Dimensiones VARCHAR(25),
	Proveedor VARCHAR(50),
	Descripcion TEXT,
	cantidad_en_stock SMALLINT,
	precio_venta DECIMAL(15,2),
	precio_proveedor DECIMAL(15,2)

	FOREIGN KEY (Gama) REFERENCES gama_producto (Id) ON DELETE CASCADE


);


CREATE TABLE Oficina(
	Id VARCHAR(10) PRIMARY KEY,
	Ciudad VARCHAR(30),
	Pais VARCHAR(50),
	Region VARCHAR(50),
	codigo_postal VARCHAR(10),
	Telefono VARCHAR(20),
	linea_direccion1 VARCHAR(50),
	linea_direccion2 VARCHAR(50)
	

);


CREATE TABLE Empleado(
	Id INT PRIMARY KEY,
	Nombre VARCHAR(50),
	Apellido1 VARCHAR(50),
	Apellido2 VARCHAR(50),
	Extension VARCHAR(10),
	Email VARCHAR(100),
	codigo_oficina VARCHAR(10),
	codigo_jefe INT,
	Puesto VARCHAR(50)

	FOREIGN KEY (codigo_oficina) REFERENCES Oficina(Id) ON DELETE CASCADE,
	FOREIGN KEY (codigo_jefe) REFERENCES Empleado(Id) 
);


CREATE TABLE Cliente(
	Id INT PRIMARY KEY,
	nombre_cliente VARCHAR(50),
	nombre_contacto VARCHAR(30),
	apellido_contacto VARCHAR(30),
	Telefono VARCHAR(15),
	Fax VARCHAR(15),
	linea_direccion1 VARCHAR(50),
	linea_direccion2 VARCHAR(50),
	Ciudad VARCHAR(50),
	Region VARCHAR(50),
	Pais VARCHAR(50),
	codigo_postal VARCHAR(10),
	codigo_empleado_rep_ventas INT,
	limite_credito DECIMAL(15,2)

	FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES Empleado(Id) ON DELETE CASCADE
);


CREATE TABLE Pago(	
    codigo_cliente INT,
    forma_pago VARCHAR(40),
    Id INT PRIMARY KEY,	
	fecha_pago DATE,
	total DECIMAL(15,2)

	FOREIGN KEY (codigo_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE
);


CREATE TABLE Pedido(
	Id INT PRIMARY KEY,
	fecha_pedido DATE,
	fecha_espera DATE,
	fecha_entrega DATE,
	Estado VARCHAR(15),
	Comentarios TEXT,
	codigo_cliente INT

	FOREIGN KEY (codigo_cliente) REFERENCES Cliente (Id) ON DELETE CASCADE

);


CREATE TABLE detalle_pedido(
	Id INT PRIMARY KEY IDENTITY(1,1),
    codigo_pedido INT,
    codigo_producto VARCHAR(15),		
	Cantidad INT,
	precio_unidad DECIMAL(15,2),
	numero_linea SMALLINT

	FOREIGN KEY (codigo_producto) REFERENCES Producto (Id) ON DELETE CASCADE,
	FOREIGN KEY (codigo_pedido) REFERENCES Pedido (Id) 

);


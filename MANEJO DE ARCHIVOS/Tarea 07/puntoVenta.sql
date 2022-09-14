-- CREACION DE LA BASE DE DATOS
DROP DATABASE IF EXISTS punto_venta;

CREATE DATABASE punto_venta;

USE punto_venta;

-- CREACION DE LAS TABLAS

CREATE TABLE Categoria(
	Id INT PRIMARY KEY IDENTITY(1,1),
	nombre_categoria VARCHAR(25) NOT NULL UNIQUE

);


CREATE TABLE Producto(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_categoria INT NOT NULL,
	nombre_producto VARCHAR(25) NOT NULL UNIQUE,
	Descripcion TEXT,
	Precio DECIMAL(5,2) NOT NULL,
	Imagen IMAGE NOT NULL

	CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(Id) ON DELETE CASCADE

);


CREATE TABLE Identificador(
	Id INT PRIMARY KEY IDENTITY(1,1),
	nombre_identificador VARCHAR(25) NOT NULL UNIQUE
);


CREATE TABLE Ciudad(
	Id INT PRIMARY KEY IDENTITY(1,1),
	nombre_ciudad VARCHAR(25) NOT NULL UNIQUE
);


CREATE TABLE Cliente(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_ciudad INT NOT NULL,
	id_identificador INT NOT NULL,
	nombre_cliente VARCHAR(25) NOT NULL,
	apellido_cliente VARCHAR(25) NOT NULL,
	Direccion VARCHAR(75) NOT NULL,
	numero_telefono VARCHAR(12) NOT NULL,
	fecha_nacimiento DATE NOT NULL

	CONSTRAINT fk_ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(Id) ON DELETE CASCADE,
	CONSTRAINT fk_identificador FOREIGN KEY (id_identificador) REFERENCES Identificador(Id) ON DELETE CASCADE
);


CREATE TABLE tipo_usuario(
	Id INT PRIMARY KEY IDENTITY(1,1),
	tipo_usuario VARCHAR(25) NOT NULL UNIQUE

);


CREATE TABLE Usuario(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_tipoUsuario INT NOT NULL,
	nombre_usuario VARCHAR(25) NOT NULL,
	apellido_usuario VARCHAR(25) NOT NULL,
	Username VARCHAR(50) NOT NULL,
	correo_electronico VARCHAR(50) NOT NULL,
	Clave VARCHAR(50) NOT NULL,
	Imagen image

	CONSTRAINT fk_tipo FOREIGN KEY (id_tipoUsuario) REFERENCES tipo_usuario(Id) ON DELETE CASCADE
);


CREATE TABLE Factura(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_cliente INT NOT NULL,
	id_usuario INT NOT NULL,
	Subtotal DECIMAL(5,2) NOT NULL,
	Iva DECIMAL(3,2) NOT NULL DEFAULT 0.12,
	Total DECIMAL(5,2) NOT NULL,
	fecha_creacion DATE DEFAULT current_timestamp

	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(Id) ON DELETE CASCADE,
	CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(Id) ON DELETE CASCADE

);


CREATE TABLE detalle_factura(
	Id INT PRIMARY KEY IDENTITY(1,1),
	id_factura INT NOT NULL,
	id_producto INT NOT NULL,
	Cantidad INT NOT NULL
	CONSTRAINT fk_factura FOREIGN KEY (id_factura) REFERENCES Factura(Id) ON DELETE CASCADE,
	CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES Producto(Id) ON DELETE CASCADE

);
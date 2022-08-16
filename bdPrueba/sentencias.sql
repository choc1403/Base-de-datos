DROP DATABASE IF EXISTS bdPrueba;

CREATE DATABASE IF NOT EXISTS bdPrueba;

USE bdPrueba;

CREATE TABLE Persona(
    id_persona INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    usuario VARCHAR(25) UNIQUE NOT NULL,
    contra VARCHAR(25) NOT NULL,
    correo VARCHAR(25) UNIQUE NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESC Persona;

INSERT INTO Persona(nombre, apellido, usuario, correo, contra)
    VALUES('JUAN','CHOC','JCHOC','eloicx@gmail.com','wua');

SELECT * FROM Persona;
-- SENTENCIAS SQL PARA SQLSERVER
DROP DATABASE IF EXISTS Colegio

CREATE DATABASE Colegio

USE Colegio

CREATE TABLE Alumnos(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(75) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_de_regisro DATETIME DEFAULT current_timestamp

)

CREATE TABLE Asignatura(
    Id INT PRIMARY KEY IDENTITY(1,1),
    nombre_asignatura VARCHAR(50) NOT NULL,
    fecha_de_regisro DATETIME DEFAULT current_timestamp

)

CREATE TABLE Profesor(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Direccion VARCHAR(75) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    nivel_academico VARCHAR(25) NOT NULL

)

CREATE TABLE Inscripcion(
    Id INT PRIMARY KEY IDENTITY(1,1),
    id_asignatura INT NOT NULL,
    id_alumno INT NOT NULL,
    id_profesor INT NOT NULL,
    fecha_de_regisro DATETIME DEFAULT current_timestamp

    CONSTRAINT fk_asignatura FOREIGN KEY (id_asignatura) REFERENCES Asignatura(Id) ON DELETE CASCADE,
    CONSTRAINT fk_alumno FOREIGN KEY (id_alumno) REFERENCES Alumnos(Id) ON DELETE CASCADE,
    CONSTRAINT fk_profesor FOREIGN KEY (id_profesor) REFERENCES Profesor(Id) ON DELETE CASCADE
)

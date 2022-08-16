DROP DATABASE IF EXISTS bdAdivinador;

CREATE DATABASE IF NOT EXISTS bdAdivinador;

USE bdAdivinador;

CREATE TABLE IF NOT EXISTS PreguntasPredeterminadas(
    idPregunta INT UNSIGNED PRIMARY KEY,
    pregunta VARCHAR(50) NOT NULL,
    nodoPadre INT UNSIGNED NOT NULL DEFAULT 0,
    nodoIzquierdo INT UNSIGNED NOT NULL DEFAULT 0,
    nodoDerecho INT UNSIGNED NOT NULL DEFAULT 0

);

CREATE TABLE IF NOT EXISTS Aves(
    idAve INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idPregunta INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (idPregunta) REFERENCES PreguntasPredeterminadas(idPregunta) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Acuaticos(
    idAcuatico INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idPregunta INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (idPregunta) REFERENCES PreguntasPredeterminadas(idPregunta) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Mamiferos(
    idMamifero INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idPregunta INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (idPregunta) REFERENCES PreguntasPredeterminadas(idPregunta) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Reptiles(
    idReptil INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idPregunta INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (idPregunta) REFERENCES PreguntasPredeterminadas(idPregunta) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Anfibios(
    idAve INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idPregunta INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL UNIQUE,

    FOREIGN KEY (idPregunta) REFERENCES PreguntasPredeterminadas(idPregunta) ON DELETE CASCADE
);


DESC PreguntasPredeterminadas;
DESC Aves;
DESC Acuaticos;
DESC Mamiferos;
DESC Reptiles;
DESC Anfibios;


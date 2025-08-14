```sql
-- 1. Crear la base de datos
CREATE DATABASE Biblioteca;

-- 2. Usar la base de datos recién creada
USE Biblioteca;

-- 3. Crear la tabla Libros
CREATE TABLE Libros (
    numLibro INT NOT NULL,
    Isbn INT NOT NULL,
    Titulo VARCHAR(20) NOT NULL,
    Auto VARCHAR(30) NOT NULL,
    PRIMARY KEY (numLibro),
    UNIQUE (Isbn),
    CHECK (numLibro > 0),
    CHECK (Isbn > 0),
    CHECK (CHAR_LENGTH(Titulo) >= 3),
    CHECK (Auto REGEXP '^[A-Za-z áéíóúÁÉÍÓÚñÑ]+$')
);

-- 4. Crear la tabla Lector
CREATE TABLE Lector (
    numeroLector INT NOT NULL,
    numMembresia INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(15) NOT NULL,
    Apellido2 VARCHAR(15) NULL,
    PRIMARY KEY (numeroLector),
    UNIQUE (numMembresia),
    CHECK (numeroLector > 0),
    CHECK (numMembresia > 0),
    CHECK (CHAR_LENGTH(Nombre) >= 3),
    CHECK (CHAR_LENGTH(Apellido1) >= 3)
);

-- 5. Crear la tabla Presta
CREATE TABLE Presta (
    numLibro INT NOT NULL,
    numLector INT NOT NULL,
    PRIMARY KEY (numLibro, numLector),
    FOREIGN KEY (numLibro) REFERENCES Libros(numLibro),
    FOREIGN KEY (numLector) REFERENCES Lector(numeroLector),
    CHECK (numLibro > 0),
    CHECK (numLector > 0)
);
```sql
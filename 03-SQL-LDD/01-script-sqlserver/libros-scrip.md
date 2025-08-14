```sql
-- 1. Crear la base de datos
CREATE DATABASE Biblioteca;
GO

-- 2. Usar la base de datos recién creada
USE Biblioteca;
GO

-- 3. Crear la tabla Libros
CREATE TABLE Libros (
    numLibro INT NOT NULL,
    Isbn INT NOT NULL,
    Titulo NVARCHAR(20) NOT NULL,
    Auto NVARCHAR(30) NOT NULL,
    CONSTRAINT PK_Libros PRIMARY KEY (numLibro),
    CONSTRAINT UQ_Libros_Isbn UNIQUE (Isbn),
    CONSTRAINT CK_Libros_numLibro CHECK (numLibro > 0),
    CONSTRAINT CK_Libros_Isbn CHECK (Isbn > 0),
    CONSTRAINT CK_Libros_Titulo CHECK (LEN(Titulo) >= 3),
    CONSTRAINT CK_Libros_Auto CHECK (Auto NOT LIKE '%[^A-Za-z áéíóúÁÉÍÓÚñÑ]%')
);
GO

-- 4. Crear la tabla Lector
CREATE TABLE Lector (
    numeroLector INT NOT NULL,
    numMembresia INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(15) NOT NULL,
    Apellido2 NVARCHAR(15) NULL,
    CONSTRAINT PK_Lector PRIMARY KEY (numeroLector),
    CONSTRAINT UQ_Lector_numMembresia UNIQUE (numMembresia),
    CONSTRAINT CK_Lector_numeroLector CHECK (numeroLector > 0),
    CONSTRAINT CK_Lector_numMembresia CHECK (numMembresia > 0),
    CONSTRAINT CK_Lector_Nombre CHECK (LEN(Nombre) >= 3),
    CONSTRAINT CK_Lector_Apellido1 CHECK (LEN(Apellido1) >= 3)
);
GO

-- 5. Crear la tabla Presta
CREATE TABLE Presta (
    numLibro INT NOT NULL,
    numLector INT NOT NULL,
    CONSTRAINT PK_Presta PRIMARY KEY (numLibro, numLector),
    CONSTRAINT FK_Presta_Libros FOREIGN KEY (numLibro) REFERENCES Libros(numLibro),
    CONSTRAINT FK_Presta_Lector FOREIGN KEY (numLector) REFERENCES Lector(numeroLector),
    CONSTRAINT CK_Presta_numLibro CHECK (numLibro > 0),
    CONSTRAINT CK_Presta_numLector CHECK (numLector > 0)
);
GO
```sql
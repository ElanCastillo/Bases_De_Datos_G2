```sql
-- Creación de la base de datos Academia 
CREATE DATABASE Academia;
GO

USE Academia;
GO

-- Tabla Estudiantes (fiel al diccionario)
CREATE TABLE Estudiantes (
    numMatri INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(10) NOT NULL,
    Apellido2 NVARCHAR(10) NULL,
    CONSTRAINT PK_Estudiantes PRIMARY KEY (numMatri),
    CONSTRAINT UQ_numMatri UNIQUE (numMatri),
    CONSTRAINT CK_numMatri CHECK (numMatri > 0),
    CONSTRAINT CK_Nombre CHECK (LEN(Nombre) >= 3),
    CONSTRAINT CK_Apellido1 CHECK (LEN(Apellido1) >= 3)
);
GO

-- Tabla Curso (fiel al diccionario)
CREATE TABLE Curso (
    CodigoCurso INT NOT NULL,
    NombreDelCurso NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_Curso PRIMARY KEY (CodigoCurso),
    CONSTRAINT UQ_CodigoCurso UNIQUE (CodigoCurso),
    CONSTRAINT CK_CodigoCurso CHECK (CodigoCurso > 0),
    CONSTRAINT CK_NombreDelCurso CHECK (LEN(NombreDelCurso) >= 3)
);
GO

-- Tabla Inscripto (fiel al diccionario)
CREATE TABLE Inscripto (
    NumMatri INT NOT NULL,
    CodigoCur INT NOT NULL,
    CONSTRAINT PK_Inscripto PRIMARY KEY (NumMatri, CodigoCur),
    CONSTRAINT FK_Inscripto_Estudiantes FOREIGN KEY (NumMatri) 
        REFERENCES Estudiantes(numMatri),
    CONSTRAINT FK_Inscripto_Curso FOREIGN KEY (CodigoCur) 
        REFERENCES Curso(CodigoCurso),
    CONSTRAINT CK_NumMatri CHECK (NumMatri > 0),
    CONSTRAINT CK_CodigoCur CHECK (CodigoCur > 0)
);
GO
```sql
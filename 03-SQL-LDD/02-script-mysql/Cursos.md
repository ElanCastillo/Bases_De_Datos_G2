```sql

CREATE DATABASE IF NOT EXISTS Academia
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE Academia;

-- Table: Estudiantes
CREATE TABLE Estudiantes (
    numMatri INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(10) NOT NULL,
    Apellido2 VARCHAR(10) NULL,
    PRIMARY KEY (numMatri)
) ENGINE=InnoDB;

-- Table: Curso
CREATE TABLE Curso (
    CodigoCurso INT NOT NULL,
    NombreDelCurso VARCHAR(20) NOT NULL,
    PRIMARY KEY (CodigoCurso)
) ENGINE=InnoDB;

-- Table: Inscripto
CREATE TABLE Inscripto (
    NumMatri INT NOT NULL,
    CodigoCur INT NOT NULL,
    PRIMARY KEY (NumMatri, CodigoCur),
    CONSTRAINT FK_Inscripto_Estudiante FOREIGN KEY (NumMatri) REFERENCES Estudiantes(numMatri)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Inscripto_Curso FOREIGN KEY (CodigoCur) REFERENCES Curso(CodigoCurso)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Ensure foreign key checks are enabled
SET FOREIGN_KEY_CHECKS = 1;
```sql
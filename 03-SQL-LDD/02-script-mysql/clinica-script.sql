REATE DATABASE IF NOT EXISTS Clinica
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE Clinica;

-- Tabla: Doctor
CREATE TABLE Doctor (
    IdDoctor INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(10) NOT NULL,
    Apellido2 VARCHAR(10) NULL,
    PRIMARY KEY (IdDoctor)
) ENGINE=InnoDB;

-- Tabla: Paciente
CREATE TABLE Paciente (
    IdPaciente INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20) NULL,
    PRIMARY KEY (IdPaciente)
) ENGINE=InnoDB;

-- Tabla: Atiende
CREATE TABLE Atiende (
    IdDoctor INT NOT NULL,
    IdPaciente INT NOT NULL,
    Diagnostico VARCHAR(30) NOT NULL,
    Fecha DATE NOT NULL,
    PRIMARY KEY (IdDoctor, IdPaciente),
    CONSTRAINT FK_Atiende_Doctor FOREIGN KEY (IdDoctor) REFERENCES Doctor(IdDoctor)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Atiende_Paciente FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;


SET FOREIGN_KEY_CHECKS = 1;
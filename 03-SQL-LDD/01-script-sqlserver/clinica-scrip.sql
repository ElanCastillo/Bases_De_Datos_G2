-- Crear la base de datos
CREATE DATABASE ClinicaMedica;
GO

-- Usar la base de datos
USE ClinicaMedica;
GO

-- Crear tabla Doctor
CREATE TABLE Doctor (
    IdDoctor INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(10) NOT NULL,
    Apellido2 NVARCHAR(10) NULL,
    CONSTRAINT PK_Doctor PRIMARY KEY (IdDoctor),
    CONSTRAINT CK_Doctor_IdDoctor CHECK (IdDoctor > 0),
    CONSTRAINT CK_Doctor_Nombre CHECK (LEN(Nombre) >= 3),
    CONSTRAINT CK_Doctor_Apellido1 CHECK (LEN(Apellido1) >= 3),
    CONSTRAINT UQ_Doctor_IdDoctor UNIQUE (IdDoctor)
);
GO

-- Crear tabla Paciente
CREATE TABLE Paciente (
    IdPaciente INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20) NULL,
    CONSTRAINT PK_Paciente PRIMARY KEY (IdPaciente),
    CONSTRAINT CK_Paciente_IdPaciente CHECK (IdPaciente > 0),
    CONSTRAINT CK_Paciente_Nombre CHECK (LEN(Nombre) >= 3),
    CONSTRAINT CK_Paciente_Apellido1 CHECK (LEN(Apellido1) >= 3),
    CONSTRAINT UQ_Paciente_IdPaciente UNIQUE (IdPaciente)
);
GO

-- Crear tabla Atiende
CREATE TABLE Atiende (
    IdDoctor INT NOT NULL,
    IdPaciente INT NOT NULL,
    Diagnostico NVARCHAR(30) NOT NULL,
    Fecha DATE NOT NULL,
    CONSTRAINT PK_Atiende PRIMARY KEY (IdDoctor, IdPaciente),
    CONSTRAINT FK_Atiende_Doctor FOREIGN KEY (IdDoctor) REFERENCES Doctor(IdDoctor),
    CONSTRAINT FK_Atiende_Paciente FOREIGN KEY (IdPaciente) REFERENCES Paciente(IdPaciente),
    CONSTRAINT CK_Atiende_Diagnostico CHECK (LEN(Diagnostico) >= 3),
    CONSTRAINT CK_Atiende_Fecha CHECK (Fecha <= GETDATE())
);
GO
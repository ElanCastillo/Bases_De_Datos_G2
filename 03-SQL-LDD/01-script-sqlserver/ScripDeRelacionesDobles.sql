-- Crear bd
CREATE DATABASE bdmorgan;
Go
USE bdmorgan;
Go

CREATE TABLE empleados(
IdEmpleado int not null identity(1,1),
Nombre varchar(50) not null,
Apellido1 varchar(20) not null,
Apelldio2 varchar(20),
edad int not null,
estatus char(1) not null default 'A',
IdDepto int not null,
);
GO

ALTER TABLE Empleado
ADD jef int;
GO

--Restriciones
ALTER TABLE Empleado
ADD CONSTRAINT  pk_empleado
Check(edad between 18 and 60);
Go


ALTER TABLE Empleado
ADD CONSTRAINT fk_Empleado_EmplJefe
FOREIGN KEY(jef)
REFERENCES Empleado(IdEmpleado);
Go

--Crear Tabla dpartamento
CREATE TABLE Departamentos
(
IdDepart int not null identity(1,1),
NombreDepto varchar(20) not null,
IdEmpleado int not null,
CONSRAINT pk_depto
Primary key(IdDepart)
);
GO
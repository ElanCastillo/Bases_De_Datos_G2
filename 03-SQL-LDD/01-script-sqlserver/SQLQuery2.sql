--Crear Base De Datos
CREATE DATABASE empresacucha;
GO
--Utilizar la base de datos
USE empresacucha;
GO

--Crear tabla empleados
CREATE TABLE empleados(
IdEmpleado int not null IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Puesto varchar(20),
FechaIngreso date,
Salario decimal(10,2),
CONSTRAINT pk_empleado
PRIMARY KEY(IdEmpleado)
);

--Crear la tabla Departmanentos
CREATE TABLE départamentos(
IdDepto int not null primary key,
NombreDepto Varchar(50)
);
GO

--Agregar una columna a la tabla empleados
ALTER TABLE Empleados
ADD CorreoElectronico varchar(20) null;
GO

/*
De la tabla empleados
Modificar un tipo de dato de la tabla
*/


--Renombrar columna correoElectronico de
--la tabla empleados

EXECUTE sp_rename
			'Empleados.CorreoElectronico',
			'Email','COLUMN';
GO



--Agregar una columna a empleados para foreing key
ALTER TABLE Empleados
ADD IdDepto int;
GO

--Agregar un constraint de foreign key
ALTER TABLE Empleados
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY (IdDepto)
REFERENCES départamentos(IdDepto);
GO

--Agregar un constraint a salario
ALTER TABLE Empleados
ADD CONSTRAINT chk_salario
CHECK(salario>=100 and salario<=100000);
GO

--Agregar un constraint unique al nombre del
--departamento

ALTER TABLE départamentos
ADD CONSTRAINT unique_nombredepto
UNIQUE (Nombredepto);
Go

--Eliminar el constraint de foreing key
ALTER TABLE Empleados
DROP  CONSTRAINT fk_empleado_depto;

--Eliminar la primary key de empleados
ALTER TABLE Empleados
DROP CONSTRAINT pk_empleado;

--Eliminar la primary key de depatamentos
ALTER TABLE départamentos
DROP CONSTRAINT PK__départam__7AEC424ECD37E7E2

SELECT * FROM empleados;
GO

--Eliminar columna
ALTER TABLE Empleados
DROP COLUMN Email;
Go

--Eliminar tabla
DROP TABLE départamentos;
Go

DROP TABLE empleados;
Go
```sql

-- Lengujae SQL--LDD (create, alter, drop)

--Crear la base de datos empresag2
CREATE DATABASE empresag2;
GO

-- Utilizar la base de datos
USE empresag2;

--Crear la tabla categorias
CREATE TABLE categorias
(
CategoriaId int primary key,
nombreategoria nvarchar(30) not null unique
);
Go

-- Crear tabla empleado
CREATE TABLE Empleado
(
EmpleadoId int not null identity(1,1),
Nombre nvarchar(20) not null,
Apellidopaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo bit not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chk_sexo
CHECK(sexo in('M','F'))
);
Go

--Insertar en Categorias
INSERT INTO categorias(CategoriaId,nombreategoria)
VALUES(1,'CARNES FRIAS');

INSERT INTO categorias(CategoriaId,nombreategoria)
VALUES(2,'VINOS Y LICORES');
GO

SELECT * FROM categorias;

--INSERTAR EMPLEADO
INSERT INTO Empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
VALUES ('Monico','Panfilo','sdfsfsdfs','23435335','M',1);
go

INSERT INTO Empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
VALUES ('Sarai','Victoria','tretrten','2','M',1);

SELECT * FROM Empleado;
```sql

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
VALUES ('Sarai','Victoria','tretrten','56579','F',1);
Go

SELECT * FROM Empleado;
Go

-- creacion de primary keys compuestas
CREATE TABLE Tabla1(
Tabla1id1 int not null,
Tabla1id2 int not null,
Nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY(Tabla1id1, Tabla1id2)
);
GO

--Razon de cardinalidad 1:N
CREATE TABLE tabla2(
Tabla2id int not null identity(1,1),
Nombre varchar(20),
Tabla1id1 int,
Tabla1id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY(Tabla2id),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY(Tabla1id1,Tabla1id2)
REFERENCES Tabla1(Tabla1id1,Tabla1id2)
);


--Razon de cardinalidad 1:! (Fidelidad)
CREATE TABLE employee
(
Id int not null identity(1,1),
Nombre varchar(20) not null,
Ap1 varchar(15) not null,
Ap2 varchar(15),
Sexo char(1)not null,
Salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY(Id),
CONSTRAINT chk_sexo2
CHECK(sexo in('M','F')),
CONSTRAINT chk_salario
CHECK (Salario>0.0)
);
Go

CREATE TABLE Department(
Id int not null identity(1,1),
NombreProyecto  varchar(20) not null,
Ubicacion varchar (15) not null,
FechaInicio Date not null,
IdEmployee int not null,
CONSTRAINT pk_department
PRIMARY KEY(Id),
CONSTRAINT unique_nombreproyecto
UNIQUE(NombreProyecto),
CONSTRAINT unique_idemployee
UNIQUE(IdEmployee),
CONSTRAINT fk_despartment_employee
FOREIGN KEY (IdEmployee)
REFERENCES Employee(Id)

);


--Razon de cardinalodad M:N

CREATE TABLE ProYect(
proyectid int not null identity(1,1),
NameProyect varchar(20) not null,
CONSTRAINT pk_proyect
PRIMARY KEY(proyectid),
CONSTRAINT Unique_nameproyect
UNIQUE(nameProyect)
);
GO

CREATE TABLE Works_ON(
EmployeeID int not null,
ProjectId int not null,
Horas int not null,
CONSTRAINT pk_works_on
PRIMARY KEY(EmployeeId,ProjectId),
CONSTRAINT fk_works_on_Employee
FOREIGN KEY(EmployeeId)
REFERENCES Employee(Id),
CONSTRAINT fk_works_on_Project
FOREIGN KEY(ProjectId)
REFERENCES Proyect(proyectid)
);
Go

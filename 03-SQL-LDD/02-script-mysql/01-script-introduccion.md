```
##Lengujae SQL--LDD (create, alter, drop)

##Crear la base de datos empresag2
CREATE DATABASE empresag2;


-- Utilizar la base de datos
USE empresag2;

##Crear la tabla categorias
CREATE TABLE categorias
(
CategoriaId int primary key,
nombreategoria nvarchar(30) not null unique
);


##Crear tabla empleado
CREATE TABLE Empleado
(
EmpleadoId int not null auto_increment,
Nombre nvarchar(20) not null,
Apellidopaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo boolean not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chk_sexo
CHECK(sexo in('M','F'))
);

drop table empleado;
##Insertar en Categorias
INSERT INTO categorias(CategoriaId,nombreategoria)
VALUES(1,'CARNES FRIAS');

INSERT INTO categorias(CategoriaId,nombreategoria)
VALUES(2,'VINOS Y LICORES');

SELECT * FROM categorias;

##INSERTAR EMPLEADO
INSERT INTO Empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
VALUES ('Monico','Panfilo','sdfsfsdfs','23435335','M',1);

INSERT INTO Empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
VALUES ('Sarai','Victoria','tretrten','56579','F',1);


SELECT * FROM Empleado;


-- creacion de primary keys compuestas
CREATE TABLE Tabla1(
Tabla1id1 int not null,
Tabla1id2 int not null,
Nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY(Tabla1id1, Tabla1id2)
);

CREATE TABLE tabla2(
Tabla2id int not null auto_increment,
Nombre varchar(20),
Tabla1id1 int,
Tabla1id2 int,
CONSTRAINT pk_tabla2
PRIMARY KEY(Tabla2id),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY(Tabla1id1,Tabla1id2)
REFERENCES Tabla1(Tabla1id1,Tabla1id2)
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
```
--Crear la base de taos bdrestricciones

CREATE DATABASE bdretricciones;

--Utilizar la base de datos bdretricciones
USE bdretricciones;

--Crear la tabla categorias sin restrcciones

CREATE TABLE categoria (
categoriaid int null,
nombre nvarchar(50)
)

--Revisar los datos de la tabla categoria
SELECT * FROM categoria;

--Agregar un registro a la tabla categoria
INSERT INTO categoria
VALUES (1,'Carnes Frias');

INSERT INTO categoria
VALUES (2,'Linea Blanca');

INSERT INTO categoria
VALUES (1,'Dulces');

--Eliminar todos los datos de la tabla categoria
DELETE FROM categoria;

--Eliminar la tabla categorias
DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key(categoriaid)
);

----
CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar(50) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unico_nombrecategoria
unique(nombrecategoria)
);
INSERT INTO categoria
VALUES (1,'Carnes Frias');

INSERT INTO categoria
VALUES (2,'Linea Blanca');

INSERT INTO categoria
VALUES (4,'Dulces');

--Crear la tabla productos
CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000),
constraint chk_existencia
check(existencia>0)
)

INSERT INTO productos
VALUES(1, 'Don Julio',3000,56);

INSERT INTO productos
VALUES(1, 'Don Julio2',3000,56);

INSERT INTO productos
VALUES(3, 'Don Julio',3000,56);

INSERT INTO productos
VALUES(4, 'Terrible Mezcal',1800,56);

INSERT INTO productos
VALUES(5, 'Terrible Mezcalito',1,3001);
)
SELECT * FROM productos;


DELETE FROM productos;
DROP TABLE productos;

CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
categoriaid int,
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000),
constraint chk_existencia
check(existencia>0)
);

select * FROM categoria

INSERT INTO productos
VALUES(1,'Mazapan',10,100,3);

INSERT INTO productos
VALUES(2,'Piruli',10,100,null);

INSERT INTO productos
VALUES(3,'Transformer',100,450,7)

DELETE productos

DROP TABLE productos

CREATE TABLE productos(
productoid int not null,
nombreproducto nvarchar(50) not null,
precio money not null,
existencia int not null,
categoriaid int,
primary key(productoid),
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000),
constraint chk_existencia
check(existencia>0),
constraint fk_producto_categoria
foreign  key(categoriaid)
references categoria(categoriaid)
);
 select * from categoria






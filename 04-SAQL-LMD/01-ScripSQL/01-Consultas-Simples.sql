--SQL-LMD(insert,delete,update,,select)

USE NORTHWND;
GO

SELECT * 
FROM Categories;

SELECT *
FROM Products;

SELECT *
FROM Suppliers;

SELECT *
FROM Customers;

SELECT *
FROM Employees;

SELECT *
FROM Shippers;

SELECT *
FROM ORDERS;

SELECT *
FROM [Order Details];

--Proyeccion
SELECT CustomerID,CompanyName,City
FROM Customers;

--Alias de columna
SELECT CustomerID AS 'Numero Empleado',
CompanyName Empresa,
City AS Ciudad,
ContactName AS [Nombre del Contacto]
FROM Customers;

--Alias de Tabla
SELECT Customers.CustomerID AS [Numero Clientes],
	Customers.CompanyName AS [Empresa],
	Customers.ContactName AS [Nombre del Contacto]
FROM Customers;

SELECT c.CustomerID AS [Numero Clientes],
	c.CompanyName AS [Empresa],
	c.ContactName AS [Nombre del Contacto]
FROM Customers AS c;

SELECT c.CustomerID AS [Numero Clientes],
	c.CompanyName AS [Empresa],
	c.ContactName AS [Nombre del Contacto]
FROM Customers c;

--Campo Calculado
SELECT *,(UnitPrice*Quantity) AS [Total]
FROM [Order Details];

SELECT od.OrderID AS [Numero de Orden],
od.ProductId AS [Numero Producto],
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice*Quantity) AS [Total]
FROM [Order Details] AS od;

--Seleccionar todos loa productos que
--pertenezcan a la categoria 1 y su valor total de los productos
SELECT * 
FROM
Products
WHERE CategoryID=1;

--Total productos
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) as [Costo]
FROM 
Products AS p
Where CategoryID = 1;

--Seleccionar todos los productos de la 
--categoria Condiments
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) as [Costo]
FROM 
Products AS p
Where CategoryID = 2;

--Seleccionar todos los productos
--que su precio sea mayor a 40.3
SELECT *
FROM Products;

Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.UnitPrice AS [Precio]
FROM 
Products AS p
Where p.UnitPrice>40.3;


--Seleccionar todos los productos
--que su precio sea mayor o igual a 40
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.UnitPrice AS [Precio]
FROM 
Products AS p
Where p.UnitPrice>=40

Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio]

FROM 
Products AS p
Where p.CategoryID !=3;

--Seleccionar todas las ordenes
--Que sean de brazil Rio De Janeiro 
--Mostrando solo el numero de orden 
--Fecha de Orden,Pais de envio,
--Y la ciudad y su tranpostista

SELECT *
FROM Customers;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipCity='Rio de Janeiro';

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipRegion is null;

--Seleccionar todas las ordendes ,
SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE ShipRegion is not null;

--Seleccionar todas las ordenes enviadas
--brazil,alemania y mexico;
Select *
FROM Orders;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE(o.ShipCountry='Mexico'
or o.ShipCountry ='Germany'
or o.ShipCountry='Brazil')
and o,ShipRegion is  null,
ORDER BY o.ShipCountry ASC, o.ShipCity DESC;

--Seleccionar todas las ordenedes 
--Francia ,Alemania  Argentina (clasue -in)
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany','France','Argentina');

--sELECCIONAR Todos los prodcutos
--Descontinuados o con precio mayor a 50
--Y Ordenados por el precio	
SELECT *
FROM Products;

SELECT p.ProductID,p.ProductName,
p.Discontinued,p.UnitPrice
FROM Products as p
WHERE p.Discontinued =1 or
p.UnitPrice>50
ORDER BY p.UnitPrice DESC;


select GETDATE()

SELECT DATEPART(year,'2025-07-23');
SELECT DATEPART(year,GETDATE());
SELECT DATEPART(yy,GETDATE());
SELECT DATEPART(yyyy,GETDATE());
SELECT DATEPART(q,GETDATE());

--Sellecionar todas las ordens que se realizaron 
SELECT OrderID,OrderDate,ShipCity,ShipCountry,DATEPART(yyyy, OrderDate) AS [Año]
FROM Orders
WHERE DATEPART(yy,OrderDate)=1998;

--Seleccionar todas las ordenes que se hicieron en el trimestre del año
SELECT OrderID,OrderDate,ShipCity,ShipCountry,
DATEPART(yyyy, OrderDate) AS [Año],
DATENAME(MONTH,OrderDate) AS 'Nombre del Mes',
DATEPART(MONTH,orderDate) AS [Numero del Mes],
DATENAME(DAY,OrderDate) AS 'Nombre del Dia'
FROM Orders
WHERE DATEPART(q,OrderDate)=3;

--Seleccionar los paises de nuestros clientes
SELECT DISTINCT Country
FROM Customers
ORDER BY Country;


--Seleccionar todos los paises y ciudades unicas de los provedores
SELECT DISTINCT Suppliers.Country,
Suppliers.City
FROM Suppliers

--Mostrar las fechas distintas de compras
SELECT DISTINCT OrderDate
FROM Orders;
--Mostarar las categorias distintas de los productos
SELECT DISTINCT ProductName CategoryID
FROM Products;

SELECT ProductName,CategoryID
FROM Products
Order by CategoryID;

--Anotar todas los ordenes con mas de 30 dias de la fecha  requerida hasta la fecha actual
SELECT OrderDate,RequiredDate,
datediff(day,OrderDate,RequiredDate)as 'Dias'
FROM  Orders


--Seleccionar todos los pedidios cuyo el precio unitario tenga un impuesto del 20% Se mayor a 30
SELECT *
FROM Products
WHERE UnitPrice*1.20>30;
--Selecionar todas las ordenes es mayor a 100
SELECT *,(UnitPrice * Quantity)AS total
FROM
[Order Details]
WHERE (UnitPrice * Quantity)>100;

--Text de Range(between)
SELECT *
FROM Products
WHERE UnitPrice >=20 and UnitPrice<=30;

SELECT *
FROM Products
WHERE UnitPrice between 20 and 30;

--Utilizar la base de datos bdejemplo2
USE BDEJEMPLO2;
USE NORTHWND;
--Listar  los diferentes puestos de los representantes
SELECT DISTINCT Puesto
FROM Representantes;

--SELECCIONAR LOS PAISESEN DONDE TENEMOS CLIENTES
SELECT distinct country
FROM customers;

SELECT distinct  country, city
FROM customers
order by country;

--Listar los 5 pedidos con importe mas alto
SELECT TOP 5 Num_Pedido,Fecha_Pedido,Fab,Producto,Cantidad,Importe
FROM Pedidos
order by 6 DESC;

SELECT TOP 5 Num_Pedido,Fecha_Pedido,Fab,Producto,Cantidad,Importe AS [Total]
FROM Pedidos
order by [Total]  DESC;
--MYSQL 
--SELECT Num_Pedido,Fecha_Pedido,Fab,Producto,Cantidad,Importe
--FROM Pedidos
--ORDER BY peido DESC
--LIMIT 5;

--Test de Encaje de Patrones
--Seleccioar todos los clientes que comiencen con s
SELECT *
FROM Clientes
WHERE Empresa like 'Ac%';

SELECT *
FROM Clientes
WHERE Empresa like '%L';

SELECT *
FROM Clientes
WHERE Empresa like '%er%';

SELECT *
FROM Clientes
WHERE Empresa like '_A%';

SELECT *
FROM Clientes
WHERE Empresa like '[A-D]%';

SELECT *
FROM Clientes
WHERE Empresa like '[abcx]%';

SELECT *
FROM Clientes
WHERE Empresa like '[^abcx]%';

SELECT *
FROM Clientes
WHERE Empresa like '_organ';

insert into clientes
values
(22126,'Morgan',108,678),
(2117,'Porgan',108,778);

--Hallar todos los representantes que o bien ;
--a)trabajan en Daimiel,Navarra o Castellon, o bien
--b)No tiene jefe y esta contratados desde Junio de 19888;
--c)Súperan su cuota pero tiene ventas de 600000 o menos

SELECT Nombre,Jefe,Cuota,Ventas,Fecha_Contrato
FROM REPRESENTANTES
WHERE (Oficina_Rep IN (22,11,12))
OR 
(JEFE IS NULL AND Fech_Contrato>='1988-06-01')
OR 
(Ventas > CUOTA AND NOT VENTAS>600000)
ORDER BY VENTAS DESC;

--INNER JOIN
Select Nombre,Jefe,Cuota,Ventas,Fecha_Contrato
FROM
REPRESENTANTES AS r
INNER JOIN
OFICIONAS AS o
On o.Oficiona=r.Oficina_Rep
WHERE (o.Ciudad  IN ('Navarra','Castellon','Daniel'))
OR 
(JEFE IS NULL AND Fech_Contrato>='1988-06-01')
OR 
(Ventas > CUOTA AND NOT VENTAS>600000)
ORDER BY r.VENTAS DESC;

--Listar todos los pedidos ,mostrando el numero de pedidio,
--importe,nombre y limite de credito del cliente
SELECT p.Numero_Pedido,
    p.Importe,
    c.Nombre,
    c.Limite_Credito
FROM clientes  as c
INNER JOIN pedidos AS p
ON c.Num_Cli=p.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
AND empresa LIKE 'A%'
ORDER BY Importe DESC;

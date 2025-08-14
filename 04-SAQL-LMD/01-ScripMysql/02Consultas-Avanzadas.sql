--Consultas Avanzadas con joins
--Seleccionar los productos incluyendo su caegoria y el proveedor
--que lo surte

SELECT ProductID,ProductName,UnitPrice,UnitsInStock,CategoryID,
SupplierID
FROM Products;

SELECT ProductID AS[Numero Producto],
ProductName AS [Nombre Producto],
UnitPrice AS [Precio],
UnitsInStock AS [Existenci],
CategoryID AS [Categoria],
SupplierID AS [Provvedor]
FROM Products;

SELECT *
FROM Products
JOIN Categories
ON products.CategoryID=categories.CategoryID;

SELECT *
FROM Products AS [Pr]
JOIN Categories AS ca
ON Pr.CategoryID=ca.CategoryID;

SELECT Pr.ProductID AS[Numero Producto],
Pr.ProductName AS [Nombre Producto],
Pr.UnitPrice AS [Precio],
Pr.UnitsInStock AS [Existencia],
ca.CategoryName AS [Categoria],
su.CompanyName AS [Prpvedoor]
FROM Products AS [Pr]
JOIN Categories AS ca
ON Pr.CategoryID=ca.CategoryID
JOIN Suppliers  AS [su]
On pr.SupplierID = su.SupplierID;

SELECT Pr.ProductID AS[Numero Producto],
Pr.ProductName AS [Nombre Producto],
Pr.UnitPrice AS [Precio],
Pr.UnitsInStock AS [Existencia],
ca.CategoryName AS [Categoria],
su.CompanyName AS [Prpvedoor]
FROM Products AS [Pr]
JOIN Categories AS ca
ON Pr.CategoryID=ca.CategoryID
JOIN Suppliers  AS [su]
On pr.SupplierID = su.SupplierID;


USE pruebajoins;

SELECT * FROM Categorias;
SELECT * FROM Productos;

SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Categorias as c
LEFT OUTER  JOIN Productos AS p
ON c.idcategoria = p.idcategoria;

--Mostrar todas las categorias  que no tienen productos asignados
SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Categorias as c
LEFT OUTER  JOIN Productos AS p
ON c.idcategoria = p.idcategoria
WHERE p.idproductos IS NULL;


SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Categorias as c
LEFT OUTER  JOIN Productos AS p
ON c.idcategoria = p.idcategoria
WHERE c.idcategoria IS NULL;

SELECT c.idcategoria,c.Nombre,p.Nombre,p.Precio
FROM Productos as p
FULL JOIN Productos AS c
ON c.idcategoria = p.idcategoria;

--Listar las oficionas y los nombres y puestos de sus jefes
SELECT 
    Pr.ProductID AS [Número Producto],
    Pr.ProductName AS [Nombre Producto],
    Pr.UnitPrice AS [Precio],
    Pr.UnitsInStock AS [Existencia],
    ca.CategoryName AS [Categoría],
    su.CompanyName AS [Proveedor]
FROM Products AS Pr
JOIN Categories AS ca ON Pr.CategoryID = ca.CategoryID
JOIN Suppliers AS su ON Pr.SupplierID = su.SupplierID;


--Listar las oficinas y los nombre y puestos de sus jefes,
--con  un objetivo superior a 600000
SELECT o.ciudad,r.nombre,r.puesto
FROM oficinas as o
INNER JOIN REPRESENTANTES AS r
or r.Num

--Listar todos los pedidos,mostrando el numero de pedidio,
--el importe y la descripcion de los productos
USE BDEJEMPLO2;
SELECT p.Num_Pedido  AS [Numero de Pedido],
p.Importe AS [Total],
pr.Descripcion AS [Nombre Producto]
FROM pedidos as p
INNER JOIN Productos as pr
ON pr.Id_fab=p.Fab 
AND pr.Id_producto = p.Producto;


--Listar los pedidios superiores (Importe)  a 25000 incluyendo el numero de
--pedidio, importe el nombre del representante que tomo la nota del
--pedido y el nombre del cliente
SELECT pe.Num_Pedido AS [Numero Pedidio],
pe.Importe AS [Total],
rp.Nombre AS [Nombre Representante],
cli.Empresa AS [Nombre Empresa]
FROM Pedidos AS pe
INNER JOIN Clientes AS cli
ON pe.Cliente=cli.Num_Cli
INNER JOIN Representantes AS rp
ON rp.Num_Empl=pe.Rep
WHERE pe.Importe > 25000;

--Listar los pedidios superiores (Importe)  a 25000 ,
--mostrando el numero de pedidio,
-- el nombre del cliente que lo encargo y el nombre del represenatnte
--asignado al clientes
SELECT pe.Num_Pedido AS [Numero Pedido],
       pe.Importe AS [Total],
       cli.Nombre AS [Nombre Cliente],
       rp.Nombre AS [Nombre Representante]
FROM Pedidos AS pe
INNER JOIN Clientes AS cli
    ON pe.Cliente = cli.Num_Cli
INNER JOIN Representantes AS rp
    ON rp.Num_Empl = pe.Rep
WHERE pe.Importe > 25000;

--Listar los pedidios superiores a 25000,mostrando el numero de pedido
--el nombre del cliente que lo encargo, el representante del cliente y 
--la oficina en la que trabaj el representatnte


--Listar los nombres de los empleados y sus jefes
SELECT sub.Nombre AS [Empleado],
jefe.Nombre AS [Jefe]
FROM Representantes as jefe
INNER JOIN Representantes sub
ON jefe.Num_Empl=SUB.Jefe


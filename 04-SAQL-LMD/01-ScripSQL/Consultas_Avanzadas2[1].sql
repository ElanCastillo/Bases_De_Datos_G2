--Listar oficinas, nombres y puestos de sus jefes
SELECT 
    o.Oficina AS [Oficina],
    r.Nombre AS [Jefe],
    r.Puesto AS [Puesto del Jefe]
FROM Oficinas AS o
INNER JOIN Representantes AS r ON o.Jef = r.Num_Empl;

--Oficinas con objetivo mayor a 600000
SELECT 
    o.Oficina AS [Oficina],
    r.Nombre AS [Jefe],
    r.Puesto,
    o.Objetivo
FROM Oficinas AS o
INNER JOIN Representantes AS r ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;

--Pedidos con número, importe y descripción del producto
SELECT 
    p.Num_Pedido AS [Número de Pedido],
    p.Importe,
    pr.Descripcion AS [Producto]
FROM Pedidos AS p
INNER JOIN Productos AS pr ON p.Producto = pr.Id_producto;

--Pedidos con importe > 25000 + nombre del representante y cliente
SELECT 
    p.Num_Pedido AS [Número de Pedido],
    p.Importe,
    r.Nombre AS [Representante],
    c.Empresa AS [Cliente]
FROM Pedidos AS p
INNER JOIN Representantes AS r ON p.Rep = r.Num_Empl
INNER JOIN Clientes AS c ON p.Cliente = c.Num_Cli
WHERE p.Importe > 25000;

/*
Listar los pedidos superiores a 25000, incluyendo el numero de pedido, 
importe, el nombre del representante que tomo la nota delpedido y el 
nombre del cliente
Listar los pedidos superiores a 25000, mostrando el numero de pedido el nombre del cliente que lo encargó y el nombre del representante
*/
SELECT 
    p.Num_Pedido AS [Número de Pedido],
    p.Importe,
    c.Empresa AS [Cliente],
    r.Nombre AS [Representante]
FROM Pedidos AS p
INNER JOIN Clientes AS c ON p.Cliente = c.Num_Cli
INNER JOIN Representantes AS r ON p.Rep = r.Num_Empl
WHERE p.Importe > 25000;
/*
LISTAR LOS PEDIDOS SUPERIORES A 2500,MOSTRANDO EL NUMERO
DEL PEDIDO EL NOMBRE DEL CLIENTE QUE LO ENCARGO EL REPRESENTANTE
DEL CLIENTE Y LA OFICINA  EN QUE TRABAJA EL REPRESENTANTE 
*/

SELECT 
    p.Num_Pedido AS [Número de Pedido],
    c.Empresa AS [Cliente],
    r.Nombre AS [Representante],
    o.Oficina AS [Oficina del Representante]
FROM Pedidos AS p
INNER JOIN Clientes AS c ON p.Cliente = c.Num_Cli
INNER JOIN Representantes AS r ON p.Rep = r.Num_Empl
INNER JOIN Oficinas AS o ON r.Oficina_Rep = o.Oficina
WHERE p.Importe > 25000;


-- LISTAR LOS NOMBRES DE L0S EMPLEADOS Y SUS JEFES 
SELECT 
    e.Nombre AS [Empleado],
    j.Nombre AS [Jefe]
FROM Representantes AS e
LEFT JOIN Representantes AS j ON e.Jefe = j.Num_Empl;

select AVG (cuota) AS [RENDIMIENTO MEDIO DE LAS CUOTAS]
FROM Representantes;

--cual es la cuota mayor
select MAX (cuota) AS [CUOTA MAYOR]
FROM Representantes;


--cual es la cuota menor 
select MIN (cuota) AS [CUOTA MENOR]
FROM Representantes;

--cual es la cuota mayor y menor 
select MIN (cuota) AS [CUOTA MAYOR],
 MAX (cuota) AS [CUOTA MAYOR]
FROM Representantes;

--SELECIONAR LA FECHA DE PEDIDO MAS ANTIGUA 

SELECT 
    MIN(Fecha_Pedido) AS [Fecha más antigua]
FROM Pedidos;

-- calcular el rendimiento en ventas de los representantes
-- Rendimiento acumulado por representante
SELECT
    r.Num_Empl,
    r.Nombre,
    r.Cuota,
    SUM(p.Importe) AS Ventas,
    CAST(100.0 * SUM(p.Importe) / NULLIF(r.Cuota, 0) AS DECIMAL(10,2)) AS RendimientoPct
FROM Representantes AS r
LEFT JOIN Pedidos AS p
    ON p.Rep = r.Num_Empl
-- Opcional: limitar por fecha
-- AND p.Fecha_Pedido BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY r.Num_Empl, r.Nombre, r.Cuota
ORDER BY RendimientoPct DESC;

SELECT 
    Nombre,
    VENTAS,
    CUOTA,
    CAST(100.0 * VENTAS / NULLIF(CUOTA, 0) AS DECIMAL(10,2)) AS [Rendimiento de Ventas %]
FROM Representantes
WHERE CUOTA <> 0 AND VENTAS IS NOT NULL;




-- Calcular el rendimiento medio de ventas
SELECT 
    CAST(
        AVG(100.0 * VENTAS / NULLIF(CUOTA, 0)) 
        AS DECIMAL(10,2)
    ) AS [Rendimiento Medio de Ventas %]
FROM Representantes
WHERE CUOTA <> 0 AND VENTAS IS NOT NULL;

--CUAL SON LAS CUOTAS Y VENTAS TOTALES DE TODOS LOS REPRESENTANTES 
-- Cuotas y ventas totales de todos los representantes
SELECT
    SUM(CUOTA)  AS [Cuota Total],
    SUM(VENTAS) AS [Ventas Totales]
FROM Representantes;

--CUAL ES EL IMPORTE TOTAL DE PEDIDOS DE BRUNO ARTEAGA 
-- Importe total de pedidos de Bruno Arteaga
SELECT 
    r.Nombre,
    SUM(p.Importe) AS [Importe Total de Pedidos]
FROM Pedidos AS p
INNER JOIN Representantes AS r
    ON p.Rep = r.Num_Empl
WHERE r.Nombre = 'Bruno Arteaga'
GROUP BY r.Nombre;

SELECT 
    r.Nombre,
    COUNT(p.Num_Pedido) AS [Cantidad de Pedidos],
    SUM(p.Importe) AS [Importe Total de Pedidos]
FROM Pedidos AS p
INNER JOIN Representantes AS r
    ON p.Rep = r.Num_Empl
WHERE r.Nombre = 'Bruno Arteaga'
GROUP BY r.Nombre;

--CUANTOS REPRESENTANTES EXEDEN SU CUOTA**
SELECT 
    COUNT(*) AS [Representantes que exceden su cuota]
FROM Representantes
WHERE VENTAS > CUOTA;

-- Contar pedidos con importe mayor a 25000
SELECT 
    COUNT(*) AS [Pedidos > 25000]
FROM Pedidos
WHERE Importe > 25000;


-- Contar cuántos puestos distintos tienen los representantes
-- Listar puestos y cuántos representantes tiene cada uno
-- Contar cuántos puestos distintos tienen los representantes
SELECT 
    COUNT(DISTINCT Puesto) AS [Cantidad de Puestos]
FROM Representantes;

-- Promedio por rep: incluye reps sin pedidos y match sin acentos
-- Importe medio, fecha inicial y fecha final de pedidos por representante
SELECT 
    r.Nombre AS [Representante],
    COUNT(p.Num_Pedido) AS [#Pedidos],
    COALESCE(
        CAST(AVG(CAST(p.Importe AS DECIMAL(18,2))) AS DECIMAL(10,2)),
        0.00
    ) AS [Importe Medio],
    MIN(p.Fecha_Pedido) AS [Fecha Inicial],
    MAX(p.Fecha_Pedido) AS [Fecha Final]
FROM Representantes r
LEFT JOIN Pedidos p
    ON p.Rep = r.Num_Empl
WHERE LTRIM(RTRIM(r.Nombre)) COLLATE Latin1_General_CI_AI 
      IN ('Tomas Saz', 'Maria Jimenez', 'Pablo Cruz')
GROUP BY r.Nombre
ORDER BY [Importe Medio] DESC;


-- Rango de cuotas por oficina con ciudad
SELECT o.Ciudad,r.Nombre,MAX(r.Cuota),Min(r.Cuota),
(MAX(r.Cuota)-Min(r.Cuota))
FROM Representantes AS r
INNER JOIN Oficinas AS o
    ON o.Oficina = r.Oficina_Rep
GROUP BY o.Ciudad, r.Nombre
ORDER BY o.Ciudad;


USE NORTHWND;

/*
1)Seleccionar el ingreso total por cliente en 1997 y ordenado 
por el ingreso de forma descendente
*/

SELECT SUM(od.Quantity * od.UnitPrice*(1-od.Discount)) AS [Ingreso]
FROM [Order Details] AS od

SELECT *
FROM [Order Details]




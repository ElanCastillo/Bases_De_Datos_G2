#Tipos de Datos en SQLServer

---
## Tipos de Datos en Numericos

**Hola**
# 📚 Tipos de Datos en SQL Server

A continuación se presentan los tipos de datos más comunes en SQL Server, organizados por categoría y con una breve descripción de su utilidad.

| Categoría             | Tipo de Dato            | Descripción / Para qué sirve                                       |
|-----------------------|--------------------------|--------------------------------------------------------------------|
| 🔢 Números Enteros     | `INT`                    | Enteros de -2,147,483,648 a 2,147,483,647                         |
|                       | `BIGINT`                 | Enteros grandes, hasta ±9 cuatrillones                           |
|                       | `SMALLINT`               | Enteros pequeños, de -32,768 a 32,767                             |
|                       | `TINYINT`                | Enteros de 0 a 255                                                 |
|                       | `BIT`                    | Booleano (0 o 1)                                                   |
| 🔣 Números Decimales   | `DECIMAL(p,s)`           | Decimales con precisión (p) y escala (s) definidas               |
|                       | `NUMERIC(p,s)`           | Igual que `DECIMAL`                                                |
|                       | `FLOAT(n)`               | Decimales en notación científica, mayor rango                     |
|                       | `REAL`                   | Similar a `FLOAT`, pero menos preciso                             |
| 📅 Fechas y Tiempos    | `DATE`                   | Solo fecha (AAAA-MM-DD)                                           |
|                       | `TIME`                   | Solo hora (HH:MM:SS)                                              |
|                       | `DATETIME`               | Fecha y hora (desde 1753 a 9999)                                  |
|                       | `DATETIME2`              | Fecha y hora con mayor precisión que `DATETIME`                   |
|                       | `SMALLDATETIME`          | Fecha y hora con menor precisión (hasta minuto)                   |
|                       | `DATETIMEOFFSET`         | Fecha y hora con zona horaria                                     |
| 🧾 Cadenas de Texto     | `CHAR(n)`                | Cadena de longitud fija                                           |
|                       | `VARCHAR(n)`             | Cadena de longitud variable                                       |
|                       | `TEXT`                   | Texto largo (obsoleto, usar `VARCHAR(MAX)`)                       |
|                       | `NCHAR(n)`               | Igual que `CHAR`, pero admite caracteres Unicode                  |
|                       | `NVARCHAR(n)`            | Igual que `VARCHAR`, pero admite Unicode                          |
|                       | `NTEXT`                  | Texto largo en Unicode (obsoleto)                                 |
| 🧠 Tipos Binarios       | `BINARY(n)`              | Datos binarios de longitud fija                                   |
|                       | `VARBINARY(n)`           | Binarios de longitud variable                                     |
|                       | `IMAGE`                  | Datos binarios grandes (obsoleto)                                 |
| 🎲 Otros Tipos         | `UNIQUEIDENTIFIER`       | GUIDs (identificadores globales únicos)                           |
|                       | `SQL_VARIANT`            | Almacena cualquier tipo de dato excepto `TEXT`, `IMAGE`, etc.    |
|                       | `XML`                    | Datos en formato XML                                              |
|                       | `CURSOR`                 | Referencia a un cursor de base de datos                           |
|                       | `TABLE`                  | Almacena resultados temporales como una tabla                     |



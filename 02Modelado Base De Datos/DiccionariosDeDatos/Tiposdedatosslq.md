# 🐬 Tipos de Datos en MySQL

| Tipo de Dato       | Descripción                                         | Características Principales                                                                 |
|--------------------|-----------------------------------------------------|---------------------------------------------------------------------------------------------|
| `TINYINT`          | Entero muy pequeño                                  | Rango: -128 a 127 (con signo), 0 a 255 (sin signo)                                         |
| `SMALLINT`         | Entero pequeño                                      | Rango: ±32 mil                                                                              |
| `MEDIUMINT`        | Entero mediano                                      | Rango: ±8 millones                                                                          |
| `INT` o `INTEGER`  | Entero estándar                                     | Rango: ±2 mil millones                                                                      |
| `BIGINT`           | Entero grande                                       | Rango: ±9 quintillones                                                                      |
| `DECIMAL(p,s)`     | Número fijo con precisión                           | Se usa para dinero o datos exactos; precisión configurable                                  |
| `FLOAT(p,s)`       | Punto flotante (simple)                             | Aproximado, impreciso                                                                      |
| `DOUBLE` o `REAL`  | Punto flotante (doble)                              | Mayor precisión que `FLOAT`                                                                |
| `CHAR(n)`          | Cadena de longitud fija                             | Máx. 255 caracteres                                                                         |
| `VARCHAR(n)`       | Cadena de longitud variable                         | Máx. 65,535 caracteres (dependiendo del conjunto de caracteres)                           |
| `TEXT`             | Texto largo                                         | Hasta 65,535 caracteres                                                                    |
| `TINYTEXT`         | Hasta 255 caracteres                                | Usado para textos pequeños                                                                 |
| `DATE`             | Solo fecha                                          | Rango: 1000-01-01 a 9999-12-31                                                              |
| `DATETIME`         | Fecha y hora                                        | Precisión hasta microsegundos                                                              |
| `TIMESTAMP`        | Fecha y hora con zona UTC                           | Actualiza automáticamente si se configura                                                  |
| `TIME`             | Solo tiempo (hh:mm:ss)                              | Rango: -838:59:59 a 838:59:59                                                               |
| `YEAR`             | Año en formato de 4 dígitos                         | De 1901 a 2155                                                                             |
| `BOOLEAN`          | Alias de `TINYINT(1)`                               | Acepta `TRUE` y `FALSE`                                                                    |
| `BLOB`             | Binario grande                                      | Usado para archivos o imágenes                                                             |
| `ENUM`             | Conjunto de valores definidos                       | Muy útil para valores controlados (ej: 'Activo', 'Inactivo')                              |
| `SET`              | Lista de valores permitidos                         | Se pueden seleccionar múltiples valores de una lista predefinida                          |
| `JSON`             | Almacena datos en formato JSON                      | Disponible desde MySQL 5.7                                                                 |

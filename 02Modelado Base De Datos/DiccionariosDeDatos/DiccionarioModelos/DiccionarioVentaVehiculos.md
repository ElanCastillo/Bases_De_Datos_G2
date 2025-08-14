##Diccionario venta Vehiculos
# 📘 Diccionario de Datos – Plantilla General
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                    |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|---------------|--------------------------------|
| NoSucursal  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | ID único de la sucursal        |
| Nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Nombre de la sucursal          |
| Ubicacion   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Dirección o ubicación general  |



##Tablas Carros
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                     | Referencia a           | Descripción                        |
|---------------|--------------|--------|-----|-----|------|--------|-------------------------------------------|-------------------------|------------------------------------|
| NoVehiculo    | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                       | -                       | ID único del vehículo              |
| Placa         | NCHAR        | 6      | ❌  | ❌  | ❌   | ✅     | Formato tipo "ABC123"                     | -                       | Placa del vehículo                 |
| Marca         | NCHAR        | 15     | ❌  | ❌  | ❌   | ❌     | Solo letras                               | -                       | Marca del vehículo                 |
| Modelo        | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                                         | -                       | Modelo del vehículo                |
| Año           | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Año BETWEEN 1980 AND 2050)         | -                       | Año del vehículo                   |
| NumClientes   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                       | Cliente(NumClientes)     | Cliente propietario del vehículo   |
| NumSucursal   | INT          | -      | ❌  | ✅  | ❌   | ❌     | > 0                                       | Sucursal(NoSucursal)     | Sucursal asignada al vehículo     |


##Tabla Cliente
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK             | Referencia a | Descripción                |
|-------------|--------------|--------|-----|-----|------|--------|-----------------------------------|---------------|----------------------------|
| NumClientes | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                               | -             | ID único del cliente       |
| Nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Nombre del cliente         |
| Apellido1   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Primer apellido            |
| Apellido2   | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | -                                 | -             | Segundo apellido           |
| Curp        | NCHAR        | 18     | ❌  | ❌  | ❌   | ✅     | Longitud fija de 18               | -             | CURP del cliente           |
| Telefono    | NCHAR        | 12     | ❌  | ❌  | ❌   | ❌     | Solo números                      | -             | Teléfono del cliente       |
| Calle       | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Calle del domicilio        |
| Numero      | INT          | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Numero > 0)                | -             | Número exterior            |
| Cuidad      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                     | -             | Ciudad del cliente         |

##Sucursal
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                    |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|---------------|--------------------------------|
| NoSucursal  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | ID único de la sucursal        |
| Nombre      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Nombre de la sucursal          |
| Ubicacion   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                      | -             | Dirección o ubicación general  |





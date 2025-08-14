### 🧾 Tabla: `Paciente`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Paciente|NVARCHAR|20|✅|❌|❌|✅|Longitud > 5|-|Identificador del paciente|
|Correo|NVARCHAR|20|❌|❌|❌|✅|Formato de correo|-|Correo electrónico del paciente|
|FechaN|DATE|-|❌|❌|❌|❌|-|-|Fecha de nacimiento|
|CURP|NVARCHAR|18|❌|❌|❌|✅|Longitud fija|-|Clave única de registro|
|NumSeguro|INT|-|❌|❌|❌|❌|> 0|-|Número de seguro social|
|Nombre|NVARCHAR|15|❌|❌|❌|❌|Longitud >= 3|-|Nombre del paciente|
|Ap|NVARCHAR|15|❌|❌|❌|❌|-|-|Primer apellido|
|Ap2|NVARCHAR|15|❌|❌|✅|❌|-|-|Segundo apellido (opcional)|
|Colonia|NVARCHAR|15|❌|❌|❌|❌|-|-|Colonia del domicilio|
|Numero|INT|-|❌|❌|❌|❌|> 0|-|Número del domicilio|
|Calle|NVARCHAR|15|❌|❌|❌|❌|-|-|Calle del domicilio|


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

### 🧾 Tabla: `Tratamiento`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Tratamiento|INT|-|✅|❌|❌|✅|> 0|-|Identificador del tratamiento|
|Nombre|NVARCHAR|20|❌|❌|❌|❌|-|-|Nombre del tratamiento|
|Duracion|TIME|-|❌|❌|❌|❌|-|-|Duración del tratamiento|
|Costo|NVARCHAR|5|❌|❌|❌|❌|CHECK(Costo > 0)|-|Costo del tratamiento|
|Estatus|NVARCHAR|200|❌|❌|❌|❌|-|-|Estado del tratamiento|

### 🧾 Tabla: `Odontologo`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Odontologo|INT|-|✅|❌|❌|✅|> 0|-|Identificador del odontólogo|
|Cedula|NVARCHAR|20|❌|❌|❌|✅|-|-|Cédula profesional|
|Nombre|NVARCHAR|30|❌|❌|❌|❌|-|-|Nombre del odontólogo|
|Id_Cita|INT|-|❌|✅|❌|❌|-|Cita(Id_Cita)|Cita asociada al odontólogo|

### 🧾 Tabla: `AplicacionTratamiento`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Aplicacion|INT|-|✅|❌|❌|✅|> 0|-|Identificador de la aplicación|
|Fecha|DATE|-|❌|❌|❌|❌|-|-|Fecha de aplicación|
|Observaciones|NVARCHAR|200|❌|❌|✅|❌|-|-|Observaciones del tratamiento|
|Id_Paciente|INT|-|❌|✅|❌|❌|-|Paciente(Id_Paciente)|Paciente atendido|
|Id_Tratamiento|INT|-|❌|✅|❌|❌|-|Tratamiento(Id_Tratamiento)|Tratamiento aplicado|
|Id_Odontologo|INT|-|❌|✅|❌|❌|-|Odontologo(Id_Odontologo)|Odontólogo responsable|

### 🧾 Tabla: `Factura`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Factura|INT|-|✅|❌|❌|✅|> 0|-|Identificador de la factura|
|Fecha|DATE|-|❌|❌|❌|❌|-|-|Fecha de emisión|
|MetodoPago|NVARCHAR|15|❌|❌|❌|❌|-|-|Método de pago utilizado|
|Monto|NVARCHAR|5|❌|❌|❌|❌|CHECK(Monto > 0)|-|Monto total|
|EstadoPago|NVARCHAR|15|❌|❌|❌|❌|-|-|Estado del pago|

### 🧾 Tabla: `Cita`

| Campo | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción |
|-------|---------------|--------|----|----|------|--------|------------------------|---------------|-------------|
|Id_Cita|INT|-|✅|❌|❌|✅|> 0|-|Identificador de la cita|
|Estatus|NVARCHAR|30|❌|❌|❌|❌|-|-|Estado actual de la cita|
|Motivo|NVARCHAR|30|❌|❌|❌|❌|-|-|Motivo de la cita|
|Fecha|DATE|-|❌|❌|❌|❌|-|-|Fecha de la cita|
|Hora|DATE|-|❌|❌|❌|❌|-|-|Hora de la cita|
|Id_Odontologo|INT|-|❌|✅|❌|❌|-|Odontologo(Id_Odontologo)|Odontólogo asignado|


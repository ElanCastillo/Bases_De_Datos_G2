##Doctor
| Campo      | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK     | Referencia a | Descripción                    |
|------------|--------------|--------|-----|-----|------|--------|----------------------------|---------------|--------------------------------|
| IdDoctor   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                        | -             | Identificador del doctor       |
| Nombre     | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3              | -             | Nombre del doctor              |
| Apellido1  | NVARCHAR     | 10     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3              | -             | Primer apellido del doctor     |
| Apellido2  | NVARCHAR     | 10     | ❌  | ❌  | ✅   | ❌     | -                          | -             | Segundo apellido (opcional)    |

##Paciente
| Campo      | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK     | Referencia a | Descripción                      |
|------------|--------------|--------|-----|-----|------|--------|----------------------------|---------------|----------------------------------|
| IdPaciente | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                        | -             | Identificador del paciente       |
| Nombre     | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3              | -             | Nombre del paciente              |
| Apellido1  | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3              | -             | Primer apellido del paciente     |
| Apellido2  | NVARCHAR     | 20     | ❌  | ❌  | ✅   | ❌     | -                          | -             | Segundo apellido (opcional)      |


##Atiende
| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK         | Referencia a           | Descripción                                |
|--------------|--------------|--------|-----|-----|------|--------|------------------------------|------------------------|--------------------------------------------|
| IdDoctor     | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                          | Doctor(IdDoctor)       | Doctor que atendió al paciente             |
| IdPaciente   | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                          | Paciente(IdPaciente)   | Paciente que fue atendido                  |
| Diagnostico  | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3                | -                      | Diagnóstico médico proporcionado           |
| Fecha        | DATE         | -      | ❌  | ❌  | ❌   | ❌     | CHECK (Fecha <= GETDATE())   | -                      | Fecha en que se realizó la atención        |


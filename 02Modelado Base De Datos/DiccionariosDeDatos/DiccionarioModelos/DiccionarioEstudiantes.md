##Estudiantes
| Campo      | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK     | Referencia a | Descripción                      |
|------------|--------------|--------|-----|-----|------|--------|----------------------------|---------------|----------------------------------|
| numMatri   | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                        | -             | Número de matrícula (ID único)  |
| Nombre     | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud mínima de 3       | -             | Nombre del estudiante           |
| Apellido1  | NVARCHAR     | 10     | ❌  | ❌  | ❌   | ❌     | Longitud mínima de 3       | -             | Primer apellido                 |
| Apellido2  | NVARCHAR     | 10     | ❌  | ❌  | ✅   | ❌     | -                          | -             | Segundo apellido (opcional)    |


##Curso
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK     | Referencia a | Descripción                      |
|-----------------|--------------|--------|-----|-----|------|--------|----------------------------|---------------|----------------------------------|
| CodigoCurso     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                        | -             | Código identificador del curso  |
| NombreDelCurso  | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud mínima de 3       | -             | Nombre o título del curso       |


##Inscripto
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a            | Descripción                            |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|--------------------------|----------------------------------------|
| NumMatri    | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                    | Estudiante(numMatri)     | Matrícula del estudiante inscrito      |
| CodigoCur   | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                    | Curso(CodigoCurso)       | Curso al que está inscrito el alumno   |

##Libros
| Campo     | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                      |
|-----------|--------------|--------|-----|-----|------|--------|------------------------|---------------|----------------------------------|
| numLibro  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | Identificador único del libro    |
| Isbn      | INT          | -      | ❌  | ❌  | ❌   | ✅     | Debe ser positivo      | -             | Código ISBN del libro            |
| Titulo    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Título del libro                 |
| Auto      | NVARCHAR     | 30     | ❌  | ❌  | ❌   | ❌     | Solo letras             | -             | Autor del libro                  |


##Lector
| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                         |
|--------------|--------------|--------|-----|-----|------|--------|------------------------|---------------|-------------------------------------|
| numeroLector | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | ID único del lector                 |
| numMembresia | INT          | -      | ❌  | ❌  | ❌   | ✅     | Debe ser positivo      | -             | Número de membresía del lector     |
| Nombre       | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Nombre del lector                   |
| Apellido1    | NVARCHAR     | 15     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Primer apellido                     |
| Apellido2    | NVARCHAR     | 15     | ❌  | ❌  | ✅   | ❌     | -                      | -             | Segundo apellido (opcional)        |


##Presta
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                           |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|----------------------|---------------------------------------|
| numLibro    | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                    | Libro(numLibro)      | Relaciona al libro prestado           |
| numLector   | INT          | -      | ✅  | ✅  | ❌   | ❌     | > 0                    | Lector(numeroLector) | Relaciona al lector que lo recibe     |

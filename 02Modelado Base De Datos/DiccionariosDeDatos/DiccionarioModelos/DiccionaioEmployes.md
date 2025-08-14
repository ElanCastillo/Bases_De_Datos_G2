### Tabla: `Employee`

| Campo     | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción                  |
|-----------|--------------|--------|-----|-----|------|--------|-------------------------|---------------|------------------------------|
| Ssn       | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | Identificador del empleado   |
| Name      | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Primer nombre del empleado   |
| Fname     | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Segundo nombre del empleado  |
| LastName  | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 3          | -             | Apellido del empleado        |
| Address   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | Longitud >= 5          | -             | Dirección del empleado       |
| Salary    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | CHECK(Salary > 0)      | -             | Salario del empleado         |
| Sex       | NVARCHAR     | 10     | ❌  | ❌  | ❌   | ❌     | 'M' o 'F'              | -             | Sexo del empleado            |
| Birthdate | DATE         | -      | ❌  | ❌  | ❌   | ❌     | Fecha válida           | -             | Fecha de nacimiento          |

---

### Tabla: `Department`

| Campo   | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a    | Descripción                   |
|---------|--------------|--------|-----|-----|------|--------|-------------------------|------------------|-------------------------------|
| Name    | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                       | -                | Nombre del departamento       |
| Number  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -                | ID del departamento           |
| Location| NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                       | -                | Ubicación del departamento    |
| Manager | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                       | Employee(Ssn)    | Gerente del departamento      |

---

### Tabla: `Manage`

| Campo             | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a        | Descripción                    |
|------------------|--------------|--------|-----|-----|------|--------|-------------------------|----------------------|--------------------------------|
| SSnEmploye       | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Employee(Ssn)        | Empleado que administra        |
| DepartmenNumber  | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Department(Number)   | Departamento asignado          |

---

### Tabla: `WORKS_FOR`

| Campo               | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                    |
|--------------------|--------------|--------|-----|-----|------|--------|-------------------------|-----------------------|--------------------------------|
| Employee.Dno       | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Employee(Ssn)         | Empleado que trabaja           |
| Departmane.Number  | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Department(Number)    | Departamento asignado          |

---

### Tabla: `CONTROLS`

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a       | Descripción                  |
|----------------|--------------|--------|-----|-----|------|--------|-------------------------|---------------------|------------------------------|
| DepartmaenNum  | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Department(Number)  | Departamento responsable     |
| Project.Numer  | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Proyect(NumberPro)  | Proyecto asignado            |

---

### Tabla: `WORKS_ON`

| Campo            | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a       | Descripción                  |
|------------------|--------------|--------|-----|-----|------|--------|-------------------------|---------------------|------------------------------|
| hours            | INT          | -      | ❌  | ❌  | ❌   | ❌     | >= 0                   | -                   | Horas trabajadas             |
| Employee.Ssn     | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Employee(Ssn)       | Empleado asignado            |
| ProyectNumber    | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Proyect(NumberPro)  | Proyecto asignado            |

---

### Tabla: `Proyect`

| Campo      | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción             |
|------------|--------------|--------|-----|-----|------|--------|-------------------------|---------------|-------------------------|
| NamePro    | NVARCHAR     | -      | ❌  | ❌  | ❌   | ❌     | -                       | -             | Nombre del proyecto     |
| NumberPro  | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                    | -             | Identificador del proyecto |
| Location   | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                       | -             | Ubicación del proyecto  |

---

### Tabla: `Dependent`

| Campo        | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción              |
|--------------|--------------|--------|-----|-----|------|--------|-------------------------|---------------|--------------------------|
| Name         | NVARCHAR     | 209    | ✅  | ❌  | ❌   | ❌     | -                       | -             | Nombre del dependiente   |
| RelationShip | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | -                       | -             | Relación con el empleado |
| Sex          | NVARCHAR     | 20     | ❌  | ❌  | ❌   | ❌     | 'M' o 'F'              | -             | Sexo del dependiente     |
| Birthdate    | DATE         | -      | ❌  | ❌  | ❌   | ❌     | Fecha válida           | -             | Fecha de nacimiento      |

---

### Tabla: `DEPARTAMENS_OF`

| Campo | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a     | Descripción              |
|-------|--------------|--------|-----|-----|------|--------|-------------------------|-------------------|--------------------------|
| Ssn   | INT          | -      | ✅  | ✅  | ❌   | ❌     | -                       | Employee(Ssn)     | ID del empleado          |
| Name  | NVARCHAR     | 20     | ✅  | ❌  | ❌   | ❌     | -                       | -                 | Nombre del departamento  |

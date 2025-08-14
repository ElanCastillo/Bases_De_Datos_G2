```sql
-- 2. Crear la base de datos con collation UTF-8
CREATE DATABASE EmployeeManagementSystem 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 3. Usar la base de datos
USE EmployeeManagementSystem;

-- 4. Tabla Employee (Empleado)
CREATE TABLE IF NOT EXISTS Employee (
    Ssn INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Fname VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    Dno INT NULL,
    PRIMARY KEY (Ssn),
    UNIQUE KEY (Ssn),
    CONSTRAINT CHK_Employee_Ssn CHECK (Ssn > 0),
    CONSTRAINT CHK_Employee_Names CHECK (
        CHAR_LENGTH(Name) >= 3 AND 
        CHAR_LENGTH(Fname) >= 3 AND 
        CHAR_LENGTH(LastName) >= 3
    ),
    CONSTRAINT CHK_Employee_Address CHECK (CHAR_LENGTH(Address) >= 5),
    CONSTRAINT CHK_Employee_Salary CHECK (Salary > 0),
    CONSTRAINT CHK_Employee_Sex CHECK (Sex IN ('M', 'F', 'O'))
) ENGINE = InnoDB;

-- 5. Tabla Department (Departamento)
CREATE TABLE IF NOT EXISTS Department (
    Number INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Location VARCHAR(20) NOT NULL,
    ManagerSsn INT NULL,
    PRIMARY KEY (Number),
    UNIQUE KEY (Number),
    UNIQUE KEY (Name),
    CONSTRAINT FK_Department_Employee FOREIGN KEY (ManagerSsn) 
        REFERENCES Employee(Ssn)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT CHK_Department_Number CHECK (Number > 0)
) ENGINE = InnoDB;

-- 6. Relación Employee-Department
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department 
FOREIGN KEY (Dno) REFERENCES Department(Number)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- 7. Tabla Project (Proyecto)
CREATE TABLE IF NOT EXISTS Project (
    NumberPro INT NOT NULL,
    NamePro VARCHAR(50) NOT NULL,
    Location VARCHAR(20) NOT NULL,
    DepartmentNum INT NOT NULL,
    PRIMARY KEY (NumberPro),
    UNIQUE KEY (NumberPro),
    UNIQUE KEY (NamePro),
    CONSTRAINT FK_Project_Department FOREIGN KEY (DepartmentNum) 
        REFERENCES Department(Number)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT CHK_Project_Number CHECK (NumberPro > 0)
) ENGINE = InnoDB;

-- 8. Tabla Dependent (Dependiente)
CREATE TABLE IF NOT EXISTS Dependent (
    EmployeeSsn INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Relationship VARCHAR(20) NOT NULL,
    Sex CHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    PRIMARY KEY (EmployeeSsn, Name),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (EmployeeSsn) 
        REFERENCES Employee(Ssn)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT CHK_Dependent_Sex CHECK (Sex IN ('M', 'F', 'O'))
) ENGINE = InnoDB;

-- 9. Tabla Works_On (Trabaja en)
CREATE TABLE IF NOT EXISTS Works_On (
    EmployeeSsn INT NOT NULL,
    ProjectNumber INT NOT NULL,
    Hours INT NOT NULL DEFAULT 0,
    PRIMARY KEY (EmployeeSsn, ProjectNumber),
    CONSTRAINT FK_Works_On_Employee FOREIGN KEY (EmployeeSsn) 
        REFERENCES Employee(Ssn)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Works_On_Project FOREIGN KEY (ProjectNumber) 
        REFERENCES Project(NumberPro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT CHK_Works_On_Hours CHECK (Hours >= 0)
) ENGINE = InnoDB;

-- 10. Tabla Manage (Administra)
CREATE TABLE IF NOT EXISTS Manage (
    EmployeeSsn INT NOT NULL,
    DepartmentNumber INT NOT NULL,
    StartDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (EmployeeSsn, DepartmentNumber),
    CONSTRAINT FK_Manage_Employee FOREIGN KEY (EmployeeSsn) 
        REFERENCES Employee(Ssn)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Manage_Department FOREIGN KEY (DepartmentNumber) 
        REFERENCES Department(Number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 11. Tabla Controls (Controla)
CREATE TABLE IF NOT EXISTS Controls (
    DepartmentNumber INT NOT NULL,
    ProjectNumber INT NOT NULL,
    PRIMARY KEY (DepartmentNumber, ProjectNumber),
    CONSTRAINT FK_Controls_Department FOREIGN KEY (DepartmentNumber) 
        REFERENCES Department(Number)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Controls_Project FOREIGN KEY (ProjectNumber) 
        REFERENCES Project(NumberPro)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;

-- 12. Tabla Departments_Of (Departamentos de)
CREATE TABLE IF NOT EXISTS Departments_Of (
    EmployeeSsn INT NOT NULL,
    DepartmentName VARCHAR(20) NOT NULL,
    PRIMARY KEY (EmployeeSsn, DepartmentName),
    CONSTRAINT FK_Departments_Of_Employee FOREIGN KEY (EmployeeSsn) 
        REFERENCES Employee(Ssn)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;
```sql
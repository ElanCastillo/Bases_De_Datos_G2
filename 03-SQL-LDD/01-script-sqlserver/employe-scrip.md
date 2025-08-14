```sql
-- Crear la base de datos
CREATE DATABASE EmployeeManagementSystem;
GO

USE EmployeeManagementSystem;
GO

-- Tabla Employee (Empleado)
CREATE TABLE Employee (
    Ssn INT NOT NULL,
    Name NVARCHAR(20) NOT NULL,
    Fname NVARCHAR(20) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Address NVARCHAR(20) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Sex NCHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    Dno INT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY (Ssn),
    CONSTRAINT CK_Employee_Ssn CHECK (Ssn > 0),
    CONSTRAINT UQ_Employee_Ssn UNIQUE (Ssn),
    CONSTRAINT CK_Employee_Names CHECK (LEN(Name) >= 3 AND LEN(Fname) >= 3 AND LEN(LastName) >= 3),
    CONSTRAINT CK_Employee_Address CHECK (LEN(Address) >= 5),
    CONSTRAINT CK_Employee_Salary CHECK (Salary > 0),
    CONSTRAINT CK_Employee_Sex CHECK (Sex IN ('M', 'F', 'O'))
);
GO

-- Tabla Department (Departamento)
CREATE TABLE Department (
    Number INT NOT NULL,
    Name NVARCHAR(20) NOT NULL,
    Location NVARCHAR(20) NOT NULL,
    ManagerSsn INT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (Number),
    CONSTRAINT FK_Department_Employee FOREIGN KEY (ManagerSsn) REFERENCES Employee(Ssn),
    CONSTRAINT CK_Department_Number CHECK (Number > 0),
    CONSTRAINT UQ_Department_Number UNIQUE (Number),
    CONSTRAINT UQ_Department_Name UNIQUE (Name)
);
GO

-- Agregar FK de Employee a Department
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department FOREIGN KEY (Dno) REFERENCES Department(Number);
GO

-- Tabla Project (Proyecto)
CREATE TABLE Project (
    NumberPro INT NOT NULL,
    NamePro NVARCHAR(50) NOT NULL,
    Location NVARCHAR(20) NOT NULL,
    DepartmentNum INT NOT NULL,
    CONSTRAINT PK_Project PRIMARY KEY (NumberPro),
    CONSTRAINT FK_Project_Department FOREIGN KEY (DepartmentNum) REFERENCES Department(Number),
    CONSTRAINT CK_Project_Number CHECK (NumberPro > 0),
    CONSTRAINT UQ_Project_Number UNIQUE (NumberPro),
    CONSTRAINT UQ_Project_Name UNIQUE (NamePro)
);
GO

-- Tabla Dependent (Dependiente)
CREATE TABLE Dependent (
    EmployeeSsn INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Relationship NVARCHAR(20) NOT NULL,
    Sex NCHAR(1) NOT NULL,
    Birthdate DATE NOT NULL,
    CONSTRAINT PK_Dependent PRIMARY KEY (EmployeeSsn, Name),
    CONSTRAINT FK_Dependent_Employee FOREIGN KEY (EmployeeSsn) REFERENCES Employee(Ssn),
    CONSTRAINT CK_Dependent_Sex CHECK (Sex IN ('M', 'F', 'O'))
);
GO

-- Tabla Works_On (Trabaja_en)
CREATE TABLE Works_On (
    EmployeeSsn INT NOT NULL,
    ProjectNumber INT NOT NULL,
    Hours INT NOT NULL DEFAULT 0,
    CONSTRAINT PK_Works_On PRIMARY KEY (EmployeeSsn, ProjectNumber),
    CONSTRAINT FK_Works_On_Employee FOREIGN KEY (EmployeeSsn) REFERENCES Employee(Ssn),
    CONSTRAINT FK_Works_On_Project FOREIGN KEY (ProjectNumber) REFERENCES Project(NumberPro),
    CONSTRAINT CK_Works_On_Hours CHECK (Hours >= 0)
);
GO

-- Tabla Manage (Administra)
CREATE TABLE Manage (
    EmployeeSsn INT NOT NULL,
    DepartmentNumber INT NOT NULL,
    StartDate DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Manage PRIMARY KEY (EmployeeSsn, DepartmentNumber),
    CONSTRAINT FK_Manage_Employee FOREIGN KEY (EmployeeSsn) REFERENCES Employee(Ssn),
    CONSTRAINT FK_Manage_Department FOREIGN KEY (DepartmentNumber) REFERENCES Department(Number)
);
GO

-- Tabla Controls (Controla)
CREATE TABLE Controls (
    DepartmentNumber INT NOT NULL,
    ProjectNumber INT NOT NULL,
    CONSTRAINT PK_Controls PRIMARY KEY (DepartmentNumber, ProjectNumber),
    CONSTRAINT FK_Controls_Department FOREIGN KEY (DepartmentNumber) REFERENCES Department(Number),
    CONSTRAINT FK_Controls_Project FOREIGN KEY (ProjectNumber) REFERENCES Project(NumberPro)
);
GO

-- Tabla Departments_Of (Departamentos_de)
CREATE TABLE Departments_Of (
    EmployeeSsn INT NOT NULL,
    DepartmentName NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_Departments_Of PRIMARY KEY (EmployeeSsn, DepartmentName),
    CONSTRAINT FK_Departments_Of_Employee FOREIGN KEY (EmployeeSsn) REFERENCES Employee(Ssn)
);
GO
```sql
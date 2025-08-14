```sql
-- Crear la base de datos
CREATE DATABASE VentaVehiculos;
GO

USE VentaVehiculos;
GO

-- Tabla Sucursal
CREATE TABLE Sucursal (
    NoSucursal INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Ubicacion NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_Sucursal PRIMARY KEY (NoSucursal),
    CONSTRAINT CK_Sucursal_NoSucursal CHECK (NoSucursal > 0),
    CONSTRAINT UQ_Sucursal_NoSucursal UNIQUE (NoSucursal)
);
GO

-- Tabla Cliente
CREATE TABLE Cliente (
    NumClientes INT NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20) NULL,
    Curp NCHAR(18) NOT NULL,
    Telefono NCHAR(12) NOT NULL,
    Calle NVARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Ciudad NVARCHAR(20) NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (NumClientes),
    CONSTRAINT CK_Cliente_NumClientes CHECK (NumClientes > 0),
    CONSTRAINT UQ_Cliente_NumClientes UNIQUE (NumClientes),
    CONSTRAINT UQ_Cliente_Curp UNIQUE (Curp),
    CONSTRAINT CK_Cliente_Nombre CHECK (LEN(Nombre) >= 3),
    CONSTRAINT CK_Cliente_Apellido1 CHECK (LEN(Apellido1) >= 3),
    CONSTRAINT CK_Cliente_Telefono CHECK (Telefono NOT LIKE '%[^0-9]%'),
    CONSTRAINT CK_Cliente_Numero CHECK (Numero > 0),
    CONSTRAINT CK_Cliente_Ciudad CHECK (LEN(Ciudad) >= 3)
);
GO

-- Tabla Carros
CREATE TABLE Carros (
    NoVehiculo INT NOT NULL,
    Placa NCHAR(6) NOT NULL,
    Marca NCHAR(15) NOT NULL,
    Modelo NVARCHAR(20) NOT NULL,
    Año INT NOT NULL,
    NumClientes INT NOT NULL,
    NumSucursal INT NOT NULL,
    CONSTRAINT PK_Carros PRIMARY KEY (NoVehiculo),
    CONSTRAINT FK_Carros_Cliente FOREIGN KEY (NumClientes) REFERENCES Cliente(NumClientes),
    CONSTRAINT FK_Carros_Sucursal FOREIGN KEY (NumSucursal) REFERENCES Sucursal(NoSucursal),
    CONSTRAINT CK_Carros_NoVehiculo CHECK (NoVehiculo > 0),
    CONSTRAINT UQ_Carros_NoVehiculo UNIQUE (NoVehiculo),
    CONSTRAINT UQ_Carros_Placa UNIQUE (Placa),
    CONSTRAINT CK_Carros_Placa CHECK (Placa LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'),
    CONSTRAINT CK_Carros_Marca CHECK (Marca NOT LIKE '%[^A-Z]%'),
    CONSTRAINT CK_Carros_Año CHECK (Año BETWEEN 1980 AND 2050)
);
GO
```sql
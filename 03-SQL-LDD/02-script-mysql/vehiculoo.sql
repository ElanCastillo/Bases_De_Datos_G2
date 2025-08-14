-- Crear la base de datos
CREATE DATABASE VentaVehiculos;

USE VentaVehiculos;

-- Tabla Sucursal
CREATE TABLE Sucursal (
    NoSucursal INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Ubicacion VARCHAR(20) NOT NULL,
    PRIMARY KEY (NoSucursal),
    CONSTRAINT CK_Sucursal_NoSucursal CHECK (NoSucursal > 0),
    CONSTRAINT UQ_Sucursal_NoSucursal UNIQUE (NoSucursal)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    NumClientes INT NOT NULL,
    Nombre VARCHAR(20) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20),
    Curp CHAR(18) NOT NULL,
    Telefono CHAR(12) NOT NULL,
    Calle VARCHAR(50) NOT NULL,
    Numero INT NOT NULL,
    Ciudad VARCHAR(20) NOT NULL,
    PRIMARY KEY (NumClientes),
    CONSTRAINT CK_Cliente_NumClientes CHECK (NumClientes > 0),
    CONSTRAINT UQ_Cliente_NumClientes UNIQUE (NumClientes),
    CONSTRAINT UQ_Cliente_Curp UNIQUE (Curp),
    CONSTRAINT CK_Cliente_Nombre CHECK (CHAR_LENGTH(Nombre) >= 3),
    CONSTRAINT CK_Cliente_Apellido1 CHECK (CHAR_LENGTH(Apellido1) >= 3),
    CONSTRAINT CK_Cliente_Telefono CHECK (Telefono REGEXP '^[0-9]+$'),
    CONSTRAINT CK_Cliente_Numero CHECK (Numero > 0),
    CONSTRAINT CK_Cliente_Ciudad CHECK (CHAR_LENGTH(Ciudad) >= 3)
);

-- Tabla Carros
CREATE TABLE Carros (
    NoVehiculo INT NOT NULL,
    Placa CHAR(6) NOT NULL,
    Marca CHAR(15) NOT NULL,
    Modelo VARCHAR(20) NOT NULL,
    Año INT NOT NULL,
    NumClientes INT NOT NULL,
    NumSucursal INT NOT NULL,
    PRIMARY KEY (NoVehiculo),
    FOREIGN KEY (NumClientes) REFERENCES Cliente(NumClientes),
    FOREIGN KEY (NumSucursal) REFERENCES Sucursal(NoSucursal),
    CONSTRAINT CK_Carros_NoVehiculo CHECK (NoVehiculo > 0),
    CONSTRAINT UQ_Carros_NoVehiculo UNIQUE (NoVehiculo),
    CONSTRAINT UQ_Carros_Placa UNIQUE (Placa),
    CONSTRAINT CK_Carros_Placa CHECK (Placa REGEXP '^[A-Z]{3}[0-9]{3}$'),
    CONSTRAINT CK_Carros_Marca CHECK (Marca REGEXP '^[A-Z]+$'),
    CONSTRAINT CK_Carros_Año CHECK (Año BETWEEN 1980 AND 2050)
);
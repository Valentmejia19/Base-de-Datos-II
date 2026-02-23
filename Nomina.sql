CREATE DATABASE NominaDB;
GO

USE NominaDB;
GO

CREATE TABLE Departamentos (
    IdDepartamento INT PRIMARY KEY IDENTITY(1,1),
    NombreDepartamento VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(100)
);
GO

CREATE TABLE Cargos (
    IdCargo INT PRIMARY KEY IDENTITY(1,1),
    NombreCargo VARCHAR(100) NOT NULL,
    SalarioBase DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE Empleados (
    IdEmpleado INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Documento VARCHAR(20) UNIQUE NOT NULL,
    FechaIngreso DATE NOT NULL,
    IdDepartamento INT NOT NULL,
    IdCargo INT NOT NULL,
    Estado VARCHAR(20) DEFAULT 'Activo',
    FOREIGN KEY (IdDepartamento) REFERENCES Departamentos(IdDepartamento),
    FOREIGN KEY (IdCargo) REFERENCES Cargos(IdCargo)
);
GO

CREATE TABLE Nomina (
    IdNomina INT PRIMARY KEY IDENTITY(1,1),
    IdEmpleado INT NOT NULL,
    FechaPago DATE NOT NULL,
    SalarioBase DECIMAL(10,2) NOT NULL,
    Bonificaciones DECIMAL(10,2) DEFAULT 0,
    Descuentos DECIMAL(10,2) DEFAULT 0,
    TotalPagar AS (SalarioBase + Bonificaciones - Descuentos),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
);
GO

INSERT INTO Departamentos (NombreDepartamento, Ubicacion)
VALUES 
('Recursos Humanos', 'Piso 1'),
('Sistemas', 'Piso 2'),
('Contabilidad', 'Piso 3');
GO

INSERT INTO Cargos (NombreCargo, SalarioBase)
VALUES
('Gerente', 5000000),
('Desarrollador', 3500000),
('Auxiliar Contable', 2000000);
GO

INSERT INTO Empleados 
(Nombre, Apellido, Documento, FechaIngreso, IdDepartamento, IdCargo)
VALUES
('Carlos', 'Ramirez', '12345678', '2022-01-10', 2, 2),
('Ana', 'Martinez', '87654321', '2021-05-15', 1, 1),
('Luis', 'Gomez', '11223344', '2023-03-01', 3, 3);
GO

INSERT INTO Nomina 
(IdEmpleado, FechaPago, SalarioBase, Bonificaciones, Descuentos)
VALUES
(1, '2024-01-30', 3500000, 200000, 100000),
(2, '2024-01-30', 5000000, 500000, 250000),
(3, '2024-01-30', 2000000, 100000, 50000);
GO

SELECT 
    E.IdEmpleado,
    E.Nombre,
    E.Apellido,
    D.NombreDepartamento,
    C.NombreCargo,
    C.SalarioBase
FROM Empleados E
INNER JOIN Departamentos D ON E.IdDepartamento = D.IdDepartamento
INNER JOIN Cargos C ON E.IdCargo = C.IdCargo;
GO

SELECT 
    E.Nombre,
    E.Apellido,
    N.FechaPago,
    N.SalarioBase,
    N.Bonificaciones,
    N.Descuentos,
    N.TotalPagar
FROM Nomina N
INNER JOIN Empleados E ON N.IdEmpleado = E.IdEmpleado;
GO

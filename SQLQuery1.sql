CREATE DATABASE VentasDB;

USE VentasDB;
CREATE TABLE Clientes (
    id_clientes INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
    ciudad VARCHAR(50),
    telefono VARCHAR(15)
);

CREATE TABLE Productos (
    id_productos INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto VARCHAR(50),
    precio DECIMAL(10,2),
    stock  INT 
);

CREATE TABLE Ventas (
    id_ventas INT IDENTITY(1,1) PRIMARY KEY,
    id_clientes INT,
    id_producto INT,
    cantidad INT,
    fecha date,
    FOREIGN KEY (id_clientes) REFERENCES Clientes(id_clientes),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_productos),

);


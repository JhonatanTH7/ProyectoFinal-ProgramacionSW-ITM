CREATE DATABASE LosTorresFerreterosSAS;
GO
USE LosTorresFerreterosSAS;
GO

--CREATE TABLE Departamento (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(50) NOT NULL
--);

--CREATE TABLE Ciudad (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(50) NOT NULL,
--id_departamento INT NOT NULL,
--FOREIGN KEY (id_departamento) REFERENCES Departamento(codigo)
--);

--CREATE TABLE TipoDocumento (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(30) NOT NULL
--);

--CREATE TABLE TipoPersona (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(30) NOT NULL
--);

--CREATE TABLE Persona (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(80) NOT NULL,
--documento VARCHAR(20) NOT NULL,
--telefono VARCHAR(25) NOT NULL,
--direccion VARCHAR(60) NOT NULL,
--id_tipopersona INT NOT NULL,
--id_tipodocumento INT NOT NULL,
--FOREIGN KEY (id_tipopersona) REFERENCES TipoPersona(codigo),
--FOREIGN KEY (id_tipodocumento) REFERENCES TipoDocumento(codigo)
--);

--CREATE TABLE Cliente (
--codigo INT PRIMARY KEY IDENTITY,
--contacto_adicional VARCHAR(25),
--id_persona INT NOT NULL,
--FOREIGN KEY (id_persona) REFERENCES Persona(codigo)
--);

--CREATE TABLE Sede (
--codigo INT PRIMARY KEY IDENTITY,
--telefono VARCHAR(25) NOT NULL,
--direccion VARCHAR(60) NOT NULL,
--id_cliente INT NOT NULL,
--id_ciudad INT NOT NULL,
--FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo),
--FOREIGN KEY (id_ciudad) REFERENCES Ciudad(codigo)
--);

--CREATE TABLE Empleado (
--codigo INT PRIMARY KEY IDENTITY,
--cargo VARCHAR(30) NOT NULL,
--id_persona INT NOT NULL,
--FOREIGN KEY (id_persona) REFERENCES Persona(codigo)
--);

--CREATE TABLE Alquiler (
--codigo INT PRIMARY KEY IDENTITY,
--fecha DATE NOT NULL,
--id_cliente INT NOT NULL,
--id_empleado INT NOT NULL,
--FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo),
--FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo),
--);

--CREATE TABLE Marca (
--codigo INT PRIMARY KEY IDENTITY,
--nombre VARCHAR(40) NOT NULL
--);

--CREATE TABLE Equipo (
--codigo INT PRIMARY KEY IDENTITY,
--existencia INT NOT NULL,
--valor_dia MONEY NOT NULL,
--valor_unitario MONEY NOT NULL,
--descripcion VARCHAR(150),
--caracteristicas VARCHAR(255) NOT NULL,
--id_marca INT NOT NULL,
--FOREIGN KEY (id_marca) REFERENCES Marca(codigo)
--);

--CREATE TABLE AlquilerEquipo (
--codigo INT PRIMARY KEY IDENTITY,
--cantidad INT NOT NULL,
--fecha_retorno DATE NOT NULL,
--valor_dia_acordado MONEY NOT NULL,
--id_alquiler INT NOT NULL,
--id_equipo INT NOT NULL,
--FOREIGN KEY (id_alquiler) REFERENCES Alquiler(codigo),
--FOREIGN KEY (id_equipo) REFERENCES Equipo(codigo)
--);

--USE master;
--GO
--DROP DATABASE LosTorresFerreterosSAS;
--GO


---------------------------------------------------------------------------------------------

CREATE TABLE Cliente (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE TipoDocumento (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE TipoCliente (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Telefono (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE TipoTelefono (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Usuario (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Empleado (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Cargo (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Marca (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE TipoProducto (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Producto (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Prestamo (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE DetallesPrestamo (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Direccion (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Ciudad (
codigo INT PRIMARY KEY NOT NULL
);

CREATE TABLE Departamento (
codigo INT PRIMARY KEY NOT NULL
);
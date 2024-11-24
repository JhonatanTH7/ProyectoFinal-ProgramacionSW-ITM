CREATE DATABASE LosTorresFerreterosSAS;
GO
USE LosTorresFerreterosSAS;
GO

---------------------------------------------------------------------------------------------

CREATE TABLE TipoDocumento (
codigo INT PRIMARY KEY NOT NULL,
nombre_tipodocumento VARCHAR(50) NOT NULL
);

CREATE TABLE Cargo (
codigo INT PRIMARY KEY NOT NULL,
nombre_cargo VARCHAR(80) NOT NULL
);

CREATE TABLE Genero (
codigo INT PRIMARY KEY NOT NULL,
nombre_genero VARCHAR(20) NOT NULL
);

CREATE TABLE TipoCliente (
codigo INT PRIMARY KEY NOT NULL,
nombre_tipocliente VARCHAR(30) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
);

CREATE TABLE Departamento (
codigo INT PRIMARY KEY NOT NULL,
nombre_departamento VARCHAR(50) NOT NULL
);

CREATE TABLE Marca (
codigo INT PRIMARY KEY NOT NULL,
nombre_marca VARCHAR(50) NOT NULL
);

CREATE TABLE TipoProducto (
codigo INT PRIMARY KEY NOT NULL,
nombre_tipoproducto VARCHAR(50) NOT NULL
);

CREATE TABLE TipoTelefono (
codigo INT PRIMARY KEY NOT NULL,
nombre_tipotelefono VARCHAR(30) NOT NULL
);

CREATE TABLE Empleado (
codigo INT PRIMARY KEY NOT NULL,
nombre VARCHAR(100) NOT NULL,
numero_documento INT NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_empleado INT NOT NULL,
id_cargo INT NOT NULL,
id_genero INT NOT NULL,
id_tipodocumento INT NOT NULL
);

ALTER TABLE Empleado ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_cargo) REFERENCES Cargo(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_genero) REFERENCES Genero(codigo)
ALTER TABLE Empleado ADD FOREIGN KEY (id_tipodocumento) REFERENCES TipoDocumento(codigo)

CREATE TABLE Usuario (
codigo INT PRIMARY KEY NOT NULL,
usuario VARCHAR(30) UNIQUE NOT NULL,
contrasenia VARCHAR(30) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo),
);

CREATE TABLE Ciudad (
codigo INT PRIMARY KEY NOT NULL,
nombre_ciudad VARCHAR(50) NOT NULL,
id_departamento INT NOT NULL,
FOREIGN KEY (id_departamento) REFERENCES Departamento(codigo)
);

CREATE TABLE Cliente (
codigo INT PRIMARY KEY NOT NULL,
nombre_cliente VARCHAR(100) NOT NULL,
numero_documento INT NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipodocumento INT NOT NULL,
id_tipocliente INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY (id_tipodocumento) REFERENCES TipoDocumento(codigo),
FOREIGN KEY (id_tipocliente) REFERENCES TipoCliente(codigo),
FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo)
);

CREATE TABLE Telefono (
codigo INT PRIMARY KEY NOT NULL,
numero_telefono VARCHAR(30) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipotelefono INT NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY (id_tipotelefono) REFERENCES TipoTelefono(codigo),
FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo)
);

CREATE TABLE Sede (
codigo INT PRIMARY KEY NOT NULL,
direccion VARCHAR(80) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_ciudad INT NOT NULL,
id_cliente INT NOT NULL,
FOREIGN KEY (id_ciudad) REFERENCES Ciudad(codigo),
FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo)
);

CREATE TABLE Producto (
codigo INT PRIMARY KEY NOT NULL,
existencia INT NOT NULL,
valor_dia INT NOT NULL,
valor_unitario INT NOT NULL,
descripcion VARCHAR(150) NOT NULL,
caracteristicas VARCHAR(255) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipoproducto INT NOT NULL,
id_marca INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY (id_tipoproducto) REFERENCES TipoProducto(codigo),
FOREIGN KEY (id_marca) REFERENCES Marca(codigo),
FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo),
);

CREATE TABLE Prestamo (
codigo INT PRIMARY KEY NOT NULL,
fecha DATE NOT NULL,
porcentaje_iva DECIMAL(4,2) NOT NULL,
subtotal INT NOT NULL,
valor_total INT NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo),
FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo),
);

CREATE TABLE DetallesPrestamo (
codigo INT PRIMARY KEY NOT NULL,
cantidad INT NOT NULL,
fecha_retorno DATE NOT NULL,
porcentaje_descuento DECIMAL(4,2) NULL,
retornado BIT DEFAULT 0 NOT NULL,
id_producto INT NOT NULL,
id_prestamo INT NOT NULL,
FOREIGN KEY (id_producto) REFERENCES Producto(codigo),
FOREIGN KEY (id_prestamo) REFERENCES Prestamo(codigo),
);


--USE master;
--GO
--DROP DATABASE LosTorresFerreterosSAS;
--GO
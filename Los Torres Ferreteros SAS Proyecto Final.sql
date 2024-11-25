CREATE DATABASE LosTorresFerreterosSAS;
GO
USE LosTorresFerreterosSAS;
GO

---------------------------------------------------------------------------------------------




-- Creación de tablas

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
nombre_tipocliente VARCHAR(50) NOT NULL,
activo BIT DEFAULT 1 NOT NULL
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

CREATE TABLE Ciudad (
codigo INT PRIMARY KEY NOT NULL,
nombre_ciudad VARCHAR(50) NOT NULL,
id_departamento INT NOT NULL
);

CREATE TABLE Empleado (
codigo INT PRIMARY KEY NOT NULL,
nombre VARCHAR(100) NOT NULL,
numero_documento INT NOT NULL,
numero_telefono VARCHAR(30) NOT NULL,
direccion VARCHAR(80) NOT NULL,
fecha_nacimiento VARCHAR(30) NOT NULL,
salario INT NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
es_usuario BIT DEFAULT 0 NOT NULL,
id_empleado INT NOT NULL,
id_cargo INT NOT NULL,
id_genero INT NOT NULL,
id_tipodocumento INT NOT NULL,
id_ciudad INT NOT NULL,
);

CREATE TABLE Usuario (
codigo INT PRIMARY KEY NOT NULL,
usuario VARCHAR(30) UNIQUE NOT NULL,
contrasenia VARCHAR(30) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_empleado INT NOT NULL
);

CREATE TABLE Cliente (
codigo INT PRIMARY KEY NOT NULL,
nombre_cliente VARCHAR(100) NOT NULL,
numero_documento INT NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipodocumento INT NOT NULL,
id_tipocliente INT NOT NULL,
id_empleado INT NOT NULL
);

CREATE TABLE Telefono (
codigo INT PRIMARY KEY NOT NULL,
numero_telefono VARCHAR(30) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipotelefono INT NOT NULL,
id_cliente INT NOT NULL
)

CREATE TABLE Sede (
codigo INT PRIMARY KEY NOT NULL,
direccion VARCHAR(80) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_ciudad INT NOT NULL,
id_cliente INT NOT NULL
);

CREATE TABLE Producto (
codigo INT PRIMARY KEY NOT NULL,
existencia INT NOT NULL,
valor_dia INT NOT NULL,
descripcion VARCHAR(150) NOT NULL,
caracteristicas VARCHAR(255) NOT NULL,
activo BIT DEFAULT 1 NOT NULL,
id_tipoproducto INT NOT NULL,
id_marca INT NOT NULL,
id_empleado INT NOT NULL
);

CREATE TABLE Prestamo (
codigo INT PRIMARY KEY NOT NULL,
fecha VARCHAR(30) NOT NULL,
subtotal INT NOT NULL,
valor_total INT NOT NULL,
id_cliente INT NOT NULL,
id_empleado INT NOT NULL
);

CREATE TABLE DetallesPrestamo (
codigo INT PRIMARY KEY NOT NULL,
cantidad INT NOT NULL,
valor_unitario INT NOT NULL,
fecha_retorno VARCHAR(30) NOT NULL,
porcentaje_descuento DECIMAL(4,2) NULL,
porcentaje_iva DECIMAL(4,2) NOT NULL,
retornado BIT DEFAULT 0 NOT NULL,
id_producto INT NOT NULL,
id_prestamo INT NOT NULL
);




-- Creación claves foráneas 

ALTER TABLE Empleado ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_cargo) REFERENCES Cargo(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_genero) REFERENCES Genero(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_tipodocumento) REFERENCES TipoDocumento(codigo);
ALTER TABLE Empleado ADD FOREIGN KEY (id_ciudad) REFERENCES Ciudad(codigo);
ALTER TABLE Usuario ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE Ciudad ADD FOREIGN KEY (id_departamento) REFERENCES Departamento(codigo);
ALTER TABLE Cliente ADD FOREIGN KEY (id_tipodocumento) REFERENCES TipoDocumento(codigo);
ALTER TABLE Cliente ADD FOREIGN KEY (id_tipocliente) REFERENCES TipoCliente(codigo);
ALTER TABLE Cliente ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE Telefono ADD FOREIGN KEY (id_tipotelefono) REFERENCES TipoTelefono(codigo);
ALTER TABLE Telefono ADD FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Sede ADD FOREIGN KEY (id_ciudad) REFERENCES Ciudad(codigo);
ALTER TABLE Sede ADD FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Producto ADD FOREIGN KEY (id_tipoproducto) REFERENCES TipoProducto(codigo);
ALTER TABLE Producto ADD FOREIGN KEY (id_marca) REFERENCES Marca(codigo);
ALTER TABLE Producto ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE Prestamo ADD FOREIGN KEY (id_cliente) REFERENCES Cliente(codigo);
ALTER TABLE Prestamo ADD FOREIGN KEY (id_empleado) REFERENCES Empleado(codigo);
ALTER TABLE DetallesPrestamo ADD FOREIGN KEY (id_producto) REFERENCES Producto(codigo);
ALTER TABLE DetallesPrestamo ADD FOREIGN KEY (id_prestamo) REFERENCES Prestamo(codigo);





-- Inserción de datos

INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (1, 'Cédula de Ciudadanía');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (2, 'Tarjeta de Identidad');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (3, 'Cédula de Extranjería');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (4, 'Pasaporte');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (5, 'Registro Civil');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (6, 'NIT');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (7, 'PEP (Permiso Especial de Permanencia)');
INSERT INTO TipoDocumento (codigo, nombre_tipodocumento) VALUES (8, 'Permiso por Protección Temporal');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (1, 'Asesor de Ventas');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (2, 'Encargado de Inventarios');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (3, 'Técnico en Mantenimiento de Equipos');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (4, 'Coordinador de Logística');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (5, 'Auxiliar de Almacén');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (6, 'Cajero');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (7, 'Supervisor de Tienda');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (8, 'Gerente de Tienda');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (9, 'Mensajero / Recolector de Equipos');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (10, 'Atención al Cliente');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (11, 'Analista de Facturación');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (12, 'Operador de Equipos Pesados');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (13, 'Supervisor de Seguridad');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (14, 'Auxiliar de Mantenimiento');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (15, 'Asistente Administrativo');
INSERT INTO Cargo (codigo, nombre_cargo) VALUES (16, 'Gerente de Sistemas');
INSERT INTO Genero (codigo, nombre_genero) VALUES (1, 'Masculino');
INSERT INTO Genero (codigo, nombre_genero) VALUES (2, 'Femenino');
INSERT INTO Genero (codigo, nombre_genero) VALUES (3, 'No Binario');
INSERT INTO Genero (codigo, nombre_genero) VALUES (4, 'Prefiero no decirlo');
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (1, 'Persona Natural', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (2, 'Sociedad Anónima (S.A.)', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (3, 'Sociedad por Acciones Simplificada (S.A.S.)', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (4, 'Sociedad Limitada (Ltda.)', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (5, 'Empresa Unipersonal (E.U.)', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (6, 'Cooperativa', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (7, 'Fundación', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (8, 'Asociación', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (9, 'Sociedad Colectiva', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (10, 'Sociedad en Comandita Simple', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (11, 'Sociedad en Comandita por Acciones', 1);
INSERT INTO TipoCliente (codigo, nombre_tipocliente, activo) VALUES (12, 'Entidad Gubernamental', 1);
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (1, 'Amazonas');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (2, 'Antioquia');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (3, 'Arauca');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (4, 'Atlántico');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (5, 'Bolívar');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (6, 'Boyacá');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (7, 'Caldas');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (8, 'Caquetá');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (9, 'Casanare');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (10, 'Cauca');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (11, 'Cesar');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (12, 'Chocó');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (13, 'Córdoba');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (14, 'Cundinamarca');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (15, 'Guainía');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (16, 'Guaviare');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (17, 'Huila');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (18, 'La Guajira');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (19, 'Magdalena');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (20, 'Meta');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (21, 'Nariño');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (22, 'Norte de Santander');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (23, 'Putumayo');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (24, 'Quindío');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (25, 'Risaralda');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (26, 'San Andrés y Providencia');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (27, 'Santander');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (28, 'Sucre');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (29, 'Tolima');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (30, 'Valle del Cauca');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (31, 'Vaupés');
INSERT INTO Departamento (codigo, nombre_departamento) VALUES (32, 'Vichada');
INSERT INTO Marca (codigo, nombre_marca) VALUES (1, 'Bosch');
INSERT INTO Marca (codigo, nombre_marca) VALUES (2, 'Makita');
INSERT INTO Marca (codigo, nombre_marca) VALUES (3, 'DeWalt');
INSERT INTO Marca (codigo, nombre_marca) VALUES (4, 'Stanley');
INSERT INTO Marca (codigo, nombre_marca) VALUES (5, 'Hitachi');
INSERT INTO Marca (codigo, nombre_marca) VALUES (6, 'Black+Decker');
INSERT INTO Marca (codigo, nombre_marca) VALUES (7, 'Hilti');
INSERT INTO Marca (codigo, nombre_marca) VALUES (8, 'Karcher');
INSERT INTO Marca (codigo, nombre_marca) VALUES (9, 'Ryobi');
INSERT INTO Marca (codigo, nombre_marca) VALUES (10, 'Honda Power Equipment');
INSERT INTO Marca (codigo, nombre_marca) VALUES (11, 'Milwaukee');
INSERT INTO Marca (codigo, nombre_marca) VALUES (12, 'Stihl');
INSERT INTO Marca (codigo, nombre_marca) VALUES (13, 'Caterpillar');
INSERT INTO Marca (codigo, nombre_marca) VALUES (14, 'Generac');
INSERT INTO Marca (codigo, nombre_marca) VALUES (15, 'Husqvarna');
INSERT INTO Marca (codigo, nombre_marca) VALUES (16, 'Toro');
INSERT INTO Marca (codigo, nombre_marca) VALUES (17, 'Echo');
INSERT INTO Marca (codigo, nombre_marca) VALUES (18, 'Fiskars');
INSERT INTO Marca (codigo, nombre_marca) VALUES (19, 'Porter-Cable');
INSERT INTO Marca (codigo, nombre_marca) VALUES (20, 'Craftsman');
INSERT INTO TipoProducto (codigo, nombre_tipoproducto) VALUES (1, 'Mecánico');
INSERT INTO TipoProducto (codigo, nombre_tipoproducto) VALUES (2, 'Eléctrico');
INSERT INTO TipoTelefono (codigo, nombre_tipotelefono) VALUES (1, 'Celular');
INSERT INTO TipoTelefono (codigo, nombre_tipotelefono) VALUES (2, 'Fijo Residencial');
INSERT INTO TipoTelefono (codigo, nombre_tipotelefono) VALUES (3, 'Fijo Comercial');
INSERT INTO TipoTelefono (codigo, nombre_tipotelefono) VALUES (4, 'Fax');
INSERT INTO TipoTelefono (codigo, nombre_tipotelefono) VALUES (5, 'PBX');
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (1, 'Leticia', 1);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (2, 'Medellín', 2); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (3, 'Arauca', 3);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (4, 'Barranquilla', 4);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (5, 'Cartagena', 5); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (6, 'Tunja', 6); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (7, 'Manizales', 7);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (8, 'Florencia', 8); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (9, 'Yopal', 9); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (10, 'Popayán', 10); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (11, 'Valledupar', 11); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (12, 'Quibdó', 12); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (13, 'Montería', 13);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (14, 'Fusagasugá', 14); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (15, 'Inírida', 15); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (16, 'San José del Guaviare', 16); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (17, 'Neiva', 17); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (18, 'Riohacha', 18); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (19, 'Santa Marta', 19);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (20, 'Villavicencio', 20);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (21, 'Pasto', 21); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (22, 'Cúcuta', 22); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (23, 'Mocoa', 23); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (24, 'Armenia', 24); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (25, 'Pereira', 25);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (26, 'San Andrés', 26); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (27, 'Bucaramanga', 27); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (28, 'Sincelejo', 28);
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (29, 'Ibagué', 29); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (30, 'Cali', 30); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (31, 'Mitú', 31); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (32, 'Puerto Carreño', 32); 
INSERT INTO Ciudad (codigo, nombre_ciudad, id_departamento) VALUES (33, 'Bogotá', 14); 
INSERT INTO Empleado (codigo, nombre, numero_documento, numero_telefono, direccion, salario, fecha_nacimiento, es_usuario, activo, id_tipodocumento, id_ciudad, id_genero, id_cargo, id_empleado) VALUES (1, 'ADMIN', 1234567, 7654321, 'DIRECCION DEL ADMIN', 2500000, '2002-04-16', 1, 1, 1, 2, 1, 16, 1);
INSERT INTO Empleado (codigo, nombre, numero_documento, numero_telefono, direccion, salario, fecha_nacimiento, es_usuario, activo, id_tipodocumento, id_ciudad, id_genero, id_cargo, id_empleado) VALUES (2, 'Alejando Castro', 1234567, 7654321, 'Cra 450a 187 - 45 #24', 2500000, '1999-04-16', 0, 1, 1, 2, 1, 3, 1);
INSERT INTO Usuario (codigo, activo, usuario, contrasenia, id_empleado) VALUES (1, 1, 'ADMIN', 'ADMIN123', 1);
INSERT INTO Cliente (codigo, nombre_cliente, numero_documento, activo, id_tipodocumento, id_tipocliente, id_empleado) VALUES (1, 'Carlos Ramírez', 123456789, 1, 1, 1, 1);
INSERT INTO Cliente (codigo, nombre_cliente, numero_documento, activo, id_tipodocumento, id_tipocliente, id_empleado) VALUES (2, 'Constructora Ávila S.A.S.', 900123456, 1, 6, 3, 1);
INSERT INTO Cliente (codigo, nombre_cliente, numero_documento, activo, id_tipodocumento, id_tipocliente, id_empleado) VALUES (3, 'Luisa Fernández', 987654321, 1, 1, 1, 1);
INSERT INTO Telefono (codigo, numero_telefono, activo, id_tipotelefono, id_cliente) VALUES (1, '3216549870', 1, 1, 1);
INSERT INTO Telefono (codigo, numero_telefono, activo, id_tipotelefono, id_cliente) VALUES (2, '6013456789', 1, 3, 2);
INSERT INTO Telefono (codigo, numero_telefono, activo, id_tipotelefono, id_cliente) VALUES (3, '3201234567', 1, 1, 3);
INSERT INTO Sede (codigo, direccion, activo, id_ciudad, id_cliente) VALUES (1, 'Carrera 15 #45-67', 1, 33, 2);
INSERT INTO Sede (codigo, direccion, activo, id_ciudad, id_cliente) VALUES (2, 'Calle 23 #12-34', 1, 2, 1);
INSERT INTO Sede (codigo, direccion, activo, id_ciudad, id_cliente) VALUES (3, 'Avenida 68 #90-12', 1, 30, 3);
INSERT INTO Producto (codigo, existencia, valor_dia, descripcion, caracteristicas, activo, id_tipoproducto, id_marca, id_empleado) VALUES (1, 10, 50000, 'Taladro percutor', '800W, velocidad ajustable, mango ergonómico', 1, 1, 2, 1)
INSERT INTO Producto (codigo, existencia, valor_dia, descripcion, caracteristicas, activo, id_tipoproducto, id_marca, id_empleado) VALUES (2, 5, 200000, 'Generador eléctrico', '5kW, arranque eléctrico, gasolina', 1, 2, 13, 1)
INSERT INTO Producto (codigo, existencia, valor_dia, descripcion, caracteristicas, activo, id_tipoproducto, id_marca, id_empleado) VALUES (3, 15, 75000, 'Amoladora angular', '600W, disco de 115mm, motor de larga vida', 1, 1, 1, 1)
INSERT INTO Prestamo (codigo, fecha, subtotal, valor_total, id_cliente, id_empleado) VALUES (1, '2024-11-25', 300000, 357000, 1, 1);
INSERT INTO Prestamo (codigo, fecha, subtotal, valor_total, id_cliente, id_empleado) VALUES (2, '2024-11-24', 1200000, 1428000, 2, 1);
INSERT INTO Prestamo (codigo, fecha, subtotal, valor_total, id_cliente, id_empleado) VALUES (3, '2024-11-20', 225000, 267750, 3, 1);
INSERT INTO DetallesPrestamo (codigo, cantidad, valor_unitario, fecha_retorno, porcentaje_descuento, porcentaje_iva, retornado, id_producto, id_prestamo) VALUES (1, 2, 50000, '2024-11-28', 0.00, 19.00, 0, 1, 1);
INSERT INTO DetallesPrestamo (codigo, cantidad, valor_unitario, fecha_retorno, porcentaje_descuento, porcentaje_iva, retornado, id_producto, id_prestamo) VALUES (2, 3, 200000, '2024-11-26', 0.00, 19.00, 0, 2, 2);
INSERT INTO DetallesPrestamo (codigo, cantidad, valor_unitario, fecha_retorno, porcentaje_descuento, porcentaje_iva, retornado, id_producto, id_prestamo) VALUES (3, 1, 75000, '2024-11-23', 0.00, 19.00, 0, 3, 3);

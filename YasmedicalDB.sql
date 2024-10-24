DROP DATABASE IF EXISTS YassMedical;
CREATE DATABASE YassMedical;
USE YassMedical;

CREATE TABLE `Proveedor` (
  `rut` varchar(12) unique,
  `razon_social` varchar(60) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`rut`)
);

CREATE TABLE `suministra` (
  `rut_proveedor` varchar(12) NOT NULL,
  `fecha_suministro` date NOT NULL
);
-- FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut)

CREATE TABLE `Productos` (
  `codigo` varchar(15) unique,
  `rut_proveedor` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` varchar(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`)
);
  -- FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut)

CREATE TABLE `Vendedores` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `n°_factura` int NOT NULL,
  PRIMARY KEY (`rut`)
);
-- FOREIGN KEY (n°_factura) REFERENCES Facturas(n°_factura)

CREATE TABLE `Facturas` (
  `n°_factura` int NOT NULL auto_increment,
  `rut_cliente` varchar(12) NOT NULL,
  `cod_producto` varchar(15) NOT NULL ,
  `valor_producto` decimal(10, 2) NOT NULL,
  `iva` decimal(10, 2 ) default 0.19,
  PRIMARY KEY (`n°_factura`)
);
-- FOREIGN KEY (cod_poducto) REFERENCES Productos(codigo)
-- FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut),

CREATE TABLE `Clientes` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`rut`)
);

ALTER TABLE Suministra ADD CONSTRAINT rut_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE Productos ADD CONSTRAINT Rut_Prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE Vendedores ADD CONSTRAINT factura_N° FOREIGN KEY (n°_factura) REFERENCES Facturas(n°_factura);
ALTER TABLE Facturas ADD CONSTRAINT client_rut FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut);
ALTER TABLE Facturas ADD CONSTRAINT poduct_cod FOREIGN KEY (cod_poducto) REFERENCES Productos(codigo);





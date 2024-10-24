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

CREATE TABLE `Productos` (
  `codigo` varchar(15) unique,
  `rut_proveedor` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` varchar(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `Vendedores` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `n°_factura` int NOT NULL,
  PRIMARY KEY (`rut`)
);

CREATE TABLE `Facturas` (
  `n°_factura` int NOT NULL auto_increment,
  `rut_cliente` varchar(12) NOT NULL,
  `cod_producto` varchar(15) NOT NULL ,
  `valor_producto` decimal(10, 2) NOT NULL,
  `iva` decimal(10, 2 ) default 0.19,
  PRIMARY KEY (`n°_factura`)
);

CREATE TABLE `Clientes` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`rut`)
);

ALTER TABLE Suministra ADD CONSTRAINT rut_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE Productos ADD CONSTRAINT IDNumber_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE Vendedores ADD CONSTRAINT factura_N° FOREIGN KEY (n°_factura) REFERENCES Facturas(n°_factura);
ALTER TABLE Facturas ADD CONSTRAINT client_rut FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut);
ALTER TABLE Facturas ADD CONSTRAINT product_ID FOREIGN KEY (cod_producto) REFERENCES Productos(codigo);





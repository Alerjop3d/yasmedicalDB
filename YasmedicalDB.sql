CREATE DATABASE YassMedical;
USE YassMedical;

CREATE TABLE `Proveedor` (
  `rut` varchar(12) unique,
  `razon_social` varchar(60) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`rut`)
);

CREATE TABLE `suministra` (
   `id_suministra` INT AUTO_INCREMENT,
  `rut_proveedor` varchar(12) NOT NULL,
  `fecha_suministro` date NOT NULL,
   `codigo` varchar(15) NOT NULL,
   PRIMARY KEY (id_suministra)
);

CREATE TABLE `Productos` (
  `codigo` varchar(15) unique,
  `descripcion` varchar(100) NOT NULL,
  `stock` INT NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigo`)
);

CREATE TABLE `Vendedores` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,  
  PRIMARY KEY (`rut`)
);

CREATE TABLE `Facturas` (
  `n°_factura` int NOT NULL auto_increment,
  `rut_cliente` varchar(12) NOT NULL,
  `cod_producto` varchar(15) NOT NULL ,
  `valor_producto` decimal(10, 2) NOT NULL,
  `rut` varchar(12) NOT NULL,
   cantidad INT NOT NULL,
  PRIMARY KEY (`n°_factura`)
);

CREATE TABLE `Clientes` (
  `rut` varchar(12) unique,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `email` varchar(60) NOT NULL,
  PRIMARY KEY (`rut`)
);

ALTER TABLE Suministra ADD CONSTRAINT rut_prov FOREIGN KEY (rut_proveedor) REFERENCES Proveedor(rut);
ALTER TABLE Suministra ADD CONSTRAINT cod_prod FOREIGN KEY (codigo) REFERENCES Productos(codigo);
ALTER TABLE Facturas ADD CONSTRAINT rut_vendedor FOREIGN KEY (rut) REFERENCES Vendedores(rut);
ALTER TABLE Facturas ADD CONSTRAINT client_rut FOREIGN KEY (rut_cliente) REFERENCES Clientes(rut);
ALTER TABLE Facturas ADD CONSTRAINT product_ID FOREIGN KEY (cod_producto) REFERENCES Productos(codigo);




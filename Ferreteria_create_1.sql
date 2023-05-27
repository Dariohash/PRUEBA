-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-26 15:11:31.351
CREATE DATABASE FERRETERIA;
go
use FERRETERIA;
-- tables
-- Table: Asesor
CREATE TABLE Asesor (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    Napellido varchar(65)  NOT NULL,
    Nespecialidad varchar(65)  NOT NULL,
    NUMdni int  NOT NULL,
    CONSTRAINT Asesor_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Asesoria
CREATE TABLE Asesoria (
    Ccodigo int  NOT NULL,
    Dfecha_registro date  NOT NULL,
    Dfecha_asesoria date  NOT NULL,
    Tasunto varchar(65)  NOT NULL,
    Cliente_Ccodigo int  NOT NULL,
    Asesor_Ccodigo int  NOT NULL,
    CONSTRAINT Asesoria_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Categoria
CREATE TABLE Categoria (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Cliente
CREATE TABLE Cliente (
    Ccodigo int  NOT NULL,
    Tdireccion varchar(65)  NOT NULL,
    Tcorreo varchar(65)  NOT NULL,
    NUMtelefono int  NOT NULL,
    Distrito_Ccodigo int  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Delivery
CREATE TABLE Delivery (
    Ccodigo int  NOT NULL,
    Dfecha_envio date  NOT NULL,
    Encargado_Ccodigo int  NOT NULL,
    Distrito_Ccodigo int  NOT NULL,
    CONSTRAINT Delivery_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Detalle_delivery
CREATE TABLE Detalle_delivery (
    Delivery_Ccodigo int  NOT NULL,
    Venta_Ccodigo int  NOT NULL,
    CONSTRAINT Detalle_delivery_pk PRIMARY KEY  (Delivery_Ccodigo)
);

-- Table: Detalle_venta
CREATE TABLE Detalle_venta (
    Venta_Ccodigo int  NOT NULL,
    Producto_Ccodigo int  NOT NULL,
    NUMunidades int  NOT NULL,
    Mimporte money  NOT NULL,
    CONSTRAINT Detalle_venta_pk PRIMARY KEY  (Producto_Ccodigo,Venta_Ccodigo)
);

-- Table: Distrito
CREATE TABLE Distrito (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    CONSTRAINT Distrito_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Encargado
CREATE TABLE Encargado (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    Napellido varchar(65)  NOT NULL,
    NUMdni int  NOT NULL,
    NUMplaca int  NOT NULL,
    CONSTRAINT Encargado_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Factura
CREATE TABLE Factura (
    Ccodigo int  NOT NULL,
    Msubtotal money  NOT NULL,
    Mtotal money  NOT NULL,
    Migv money  NOT NULL,
    Tipod_comprobante_Ccodigo int  NOT NULL,
    CONSTRAINT Factura_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Marca
CREATE TABLE Marca (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    CONSTRAINT Marca_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Oferta
CREATE TABLE Oferta (
    Ccodigo int  NOT NULL,
    Mdescuento money  NOT NULL,
    Dfecha_inicio date  NOT NULL,
    Dfecha_fin date  NOT NULL,
    Tdescripcion varchar(65)  NOT NULL,
    Producto_Ccodigo int  NOT NULL,
    CONSTRAINT Oferta_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Persona_Juridica
CREATE TABLE Persona_Juridica (
    Cliente_Ccodigo int  NOT NULL,
    NnombreEmpresa varchar(65)  NOT NULL,
    NUMruc int  NOT NULL,
    CONSTRAINT Persona_Juridica_pk PRIMARY KEY  (Cliente_Ccodigo)
);

-- Table: Persona_Natural
CREATE TABLE Persona_Natural (
    Cliente_Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    NUMdni int  NOT NULL,
    Napellido varchar(65)  NOT NULL,
    CONSTRAINT Persona_Natural_pk PRIMARY KEY  (Cliente_Ccodigo)
);

-- Table: Producto
CREATE TABLE Producto (
    Ccodigo int  NOT NULL,
    Nnombre varchar(65)  NOT NULL,
    Tdescripcion varchar(65)  NOT NULL,
    Mprecio money  NOT NULL,
    NUMstock int  NOT NULL,
    Categoria_Ccodigo int  NOT NULL,
    Proveedor_Ccodigo int  NOT NULL,
    Marca_Ccodigo int  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Proveedor
CREATE TABLE Proveedor (
    Ccodigo int  NOT NULL,
    Nnombre_empresa varchar(65)  NOT NULL,
    NUMtelefono int  NOT NULL,
    Tdireccion varchar(65)  NOT NULL,
    Nnombre_contacto varchar(65)  NOT NULL,
    Distrito_Ccodigo int  NOT NULL,
    CONSTRAINT Proveedor_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Recibo
CREATE TABLE Recibo (
    Ccodigo int  NOT NULL,
    Mtotal money  NOT NULL,
    Tipod_comprobante_Ccodigo int  NOT NULL,
    CONSTRAINT Recibo_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Registro_sorteo
CREATE TABLE Registro_sorteo (
    Sorteo_Ccodigo int  NOT NULL,
    Venta_Ccodigo int  NOT NULL,
    CONSTRAINT Registro_sorteo_pk PRIMARY KEY  (Venta_Ccodigo)
);

-- Table: Sorteo
CREATE TABLE Sorteo (
    Ccodigo int  NOT NULL,
    Ncampania varchar(65)  NOT NULL,
    Dfecha_inicio date  NOT NULL,
    Dfecha_fin date  NOT NULL,
    CONSTRAINT Sorteo_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Tipod_comprobante
CREATE TABLE Tipod_comprobante (
    Ccodigo int  NOT NULL,
    Ntipocomprobante varchar(65)  NOT NULL,
    CONSTRAINT Tipod_comprobante_pk PRIMARY KEY  (Ccodigo)
);

-- Table: Venta
CREATE TABLE Venta (
    Ccodigo int  NOT NULL,
    NUMcomprobante int  NOT NULL,
    Dfecha_emision date  NOT NULL,
    Dhora_emision date  NOT NULL,
    Cliente_Ccodigo int  NOT NULL,
    Tipod_comprobante_Ccodigo int  NOT NULL,
    CONSTRAINT Venta_pk PRIMARY KEY  (Ccodigo)
);

-- foreign keys
-- Reference: Asesoria_Asesor (table: Asesoria)
ALTER TABLE Asesoria ADD CONSTRAINT Asesoria_Asesor
    FOREIGN KEY (Asesor_Ccodigo)
    REFERENCES Asesor (Ccodigo);

-- Reference: Asesoria_Cliente (table: Asesoria)
ALTER TABLE Asesoria ADD CONSTRAINT Asesoria_Cliente
    FOREIGN KEY (Cliente_Ccodigo)
    REFERENCES Cliente (Ccodigo);

-- Reference: Cliente_Distrito (table: Cliente)
ALTER TABLE Cliente ADD CONSTRAINT Cliente_Distrito
    FOREIGN KEY (Distrito_Ccodigo)
    REFERENCES Distrito (Ccodigo);

-- Reference: Delivery_Distrito (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Distrito
    FOREIGN KEY (Distrito_Ccodigo)
    REFERENCES Distrito (Ccodigo);

-- Reference: Delivery_Encargado (table: Delivery)
ALTER TABLE Delivery ADD CONSTRAINT Delivery_Encargado
    FOREIGN KEY (Encargado_Ccodigo)
    REFERENCES Encargado (Ccodigo);

-- Reference: Detalle_delivery_Delivery (table: Detalle_delivery)
ALTER TABLE Detalle_delivery ADD CONSTRAINT Detalle_delivery_Delivery
    FOREIGN KEY (Delivery_Ccodigo)
    REFERENCES Delivery (Ccodigo);

-- Reference: Detalle_delivery_Venta (table: Detalle_delivery)
ALTER TABLE Detalle_delivery ADD CONSTRAINT Detalle_delivery_Venta
    FOREIGN KEY (Venta_Ccodigo)
    REFERENCES Venta (Ccodigo);

-- Reference: Detalle_venta_Producto (table: Detalle_venta)
ALTER TABLE Detalle_venta ADD CONSTRAINT Detalle_venta_Producto
    FOREIGN KEY (Producto_Ccodigo)
    REFERENCES Producto (Ccodigo);

-- Reference: Detalle_venta_Venta (table: Detalle_venta)
ALTER TABLE Detalle_venta ADD CONSTRAINT Detalle_venta_Venta
    FOREIGN KEY (Venta_Ccodigo)
    REFERENCES Venta (Ccodigo);

-- Reference: Factura_Tipod_comprobante (table: Factura)
ALTER TABLE Factura ADD CONSTRAINT Factura_Tipod_comprobante
    FOREIGN KEY (Tipod_comprobante_Ccodigo)
    REFERENCES Tipod_comprobante (Ccodigo);

-- Reference: Oferta_Producto (table: Oferta)
ALTER TABLE Oferta ADD CONSTRAINT Oferta_Producto
    FOREIGN KEY (Producto_Ccodigo)
    REFERENCES Producto (Ccodigo);

-- Reference: Persona_Juridica_Cliente (table: Persona_Juridica)
ALTER TABLE Persona_Juridica ADD CONSTRAINT Persona_Juridica_Cliente
    FOREIGN KEY (Cliente_Ccodigo)
    REFERENCES Cliente (Ccodigo);

-- Reference: Persona_Natural_Cliente (table: Persona_Natural)
ALTER TABLE Persona_Natural ADD CONSTRAINT Persona_Natural_Cliente
    FOREIGN KEY (Cliente_Ccodigo)
    REFERENCES Cliente (Ccodigo);

-- Reference: Producto_Categoria (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Categoria
    FOREIGN KEY (Categoria_Ccodigo)
    REFERENCES Categoria (Ccodigo);

-- Reference: Producto_Marca (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Marca
    FOREIGN KEY (Marca_Ccodigo)
    REFERENCES Marca (Ccodigo);

-- Reference: Producto_Proveedor (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT Producto_Proveedor
    FOREIGN KEY (Proveedor_Ccodigo)
    REFERENCES Proveedor (Ccodigo);

-- Reference: Proveedor_Distrito (table: Proveedor)
ALTER TABLE Proveedor ADD CONSTRAINT Proveedor_Distrito
    FOREIGN KEY (Distrito_Ccodigo)
    REFERENCES Distrito (Ccodigo);

-- Reference: Recibo_Tipod_comprobante (table: Recibo)
ALTER TABLE Recibo ADD CONSTRAINT Recibo_Tipod_comprobante
    FOREIGN KEY (Tipod_comprobante_Ccodigo)
    REFERENCES Tipod_comprobante (Ccodigo);

-- Reference: Registro_sorteo_Sorteo (table: Registro_sorteo)
ALTER TABLE Registro_sorteo ADD CONSTRAINT Registro_sorteo_Sorteo
    FOREIGN KEY (Sorteo_Ccodigo)
    REFERENCES Sorteo (Ccodigo);

-- Reference: Registro_sorteo_Venta (table: Registro_sorteo)
ALTER TABLE Registro_sorteo ADD CONSTRAINT Registro_sorteo_Venta
    FOREIGN KEY (Venta_Ccodigo)
    REFERENCES Venta (Ccodigo);

-- Reference: Venta_Cliente (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Cliente
    FOREIGN KEY (Cliente_Ccodigo)
    REFERENCES Cliente (Ccodigo);

-- Reference: Venta_Tipod_comprobante (table: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Tipod_comprobante
    FOREIGN KEY (Tipod_comprobante_Ccodigo)
    REFERENCES Tipod_comprobante (Ccodigo);

-- End of file.


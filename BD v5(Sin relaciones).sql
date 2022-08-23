create database quickness_vitality;
use database quickness_vitality;

create table usuarios
(
    id_usuario int(4) auto_increment primary key,
    nombres varchar(30) not null,
    apellidos varchar(30) not null,
    documento varchar (13) not null,
    contrasena varchar(50) not null,
    direccion varchar (30) not null,
    telefono varchar(15) not null,
    id_tipo_documento int (2) not null
);

create table tipo_doc
(
    id_tipo_doc int (2) auto_increment primary key,
    tipo_doc varchar(5)
);

create table permisos
(
    id_permiso int(5) auto_increment primary key,
    documento varchar(13) not null,
    id_rol int (2) not null 
);

create table roles
(
    id_rol int(2) auto_increment primary key,
    rol varchar(15) not null
);

create table tipo_producto
(
    id_tipo_producto int(3) auto_increment primary key,
    tipo_producto varchar (25) not null
);

create table productos
(
    id_producto int(10) auto_increment primary key,
    cod_producto varchar(20) not null,
    valor varchar(10) not null,
    marca varchar(20) not null,
    fk_id_tipo_producto int(3),
    fk_id_proveedor int(3)
);

create table historial
(
    id_historial int(8) auto_increment primary key,
    cod_producto varchar(20) not null,
    entrada varchar (5) not null,
    salida varchar (5)not null
);

create table proveedor 
(
    id_proveedor int (3) auto_increment primary key,
    nit varchar(20) not null,
    nombre_proveedor varchar(30) not null
);




insert into usuarios values 
    ('p1','Francisco Manuel','','','','','')
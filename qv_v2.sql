create database Quickness_Vitality_v2;

create table tipo_documento
(
tdoc varchar (10) not null,
desc_tdoc varchar (30) not null,
estado_tdoc boolean not null,
primary key (tdoc)
);

create table sesion
(
    usu_login varchar (30),
    contraseña varchar (35),
    primary key (usu_login)
);

create table persona
(
    pk_fk_tdoc varchar(10),
    id_persona int,
    pk_fk_usu_login varchar (30),
    nom_persona varchar (25) not null,
    nom2_persona varchar(25) null,
    apellido_persona varchar(25) null,
    apellido2_persona varchar(25) null,
    direccion_persona varchar(45) not null,
    primary key (pk_fk_tdoc, id_persona, pk_fk_usu_login),
    foreign key (pk_fk_tdoc) REFERENCES tipo_documento (tdoc),
    foreign key (pk_fk_usu_login) references sesion (usu_login)
);

create table roles 
(
cod_rol int,
desc_rol varchar (30) not null,
primary key (cod_rol)
);

create table persona_has_roles 
(
    persona_tdoc varchar(10),
    persona_id int,
    persona_rol int,
    estado_rol boolean not null,
    primary key (persona_tdoc, persona_id, persona_rol),
    foreign key (persona_tdoc, persona_id) REFERENCES persona (pk_fk_tdoc, id_persona),
    foreign key (persona_rol) REFERENCES roles (cod_rol)
);

create table factura
(
n_factura int not null,
fecha_factura DATE not null,
subtotaL DOUBLE not null,
iva DOUBLE not null,
total_factura DOUBLE not null,
primary key (n_factura)
);

create table tipo_producto
(
tipo_prod varchar (20) not null,
estado_tprod boolean not null,
primary key (tipo_prod)
);

create table proveedor
(
id_proveedor int not null,
tdoc_proveedor varchar (10),
telefono_sede BIGINT not null,
primary key (id_proveedor, tdoc_proveedor),
foreign key (tdoc_proveedor, id_proveedor) references persona (pk_fk_tdoc, id_persona)
);

create table marcas 
(
    id_marca varchar (5),
    nom_marca varchar (45) not null,
    actividad boolean not null,
    primary key (id_marca)
);

create table productos 
(
cod_producto varchar (10) not null, 
nom_producto varchar (45) not null,
valor_producto DOUBLE not null,
cantidad_disp int not null,
fk_marca_id varchar (5) not null,
fk_proveedor_id int not null,
fk_tipo_prod varchar (20) not null,
primary key (cod_producto),
foreign key (fk_tipo_prod) references tipo_producto (tipo_prod),
foreign key (fk_proveedor_id) references proveedor (id_proveedor),
foreign key (fk_marca_id) references marcas (id_marca)
);

create table factura_productos
(
    fk_pk_n_factura int,
    fk_pk_cod_producto varchar (10),
    cantidad_prod int not null,
    valor_prod_cant double not null,
    primary key (fk_pk_n_factura, fk_pk_cod_producto),
    foreign key (fk_pk_n_factura) references factura (n_factura),
    foreign key (fk_pk_cod_producto) references productos (cod_producto)
);

create table contador
(
tdoc_contador varchar (30) not null,
id_contador int not null,
primary key (tdoc_contador, id_contador),
foreign key (tdoc_contador, id_contador) references persona (pk_fk_tdoc, id_persona)
);

create table administrador
(
tdoc_administrador varchar (30) not null,
id_administrador int not null,
primary key (tdoc_administrador, id_administrador),
foreign key (tdoc_administrador, id_administrador) references persona (pk_fk_tdoc, id_persona)
);

create table auxiliar 
(
tdoc_auxiliar varchar (10) not null,
id_auxiliar int not null,
sueldo_auxiliar DOUBLE not null, 
primary key (tdoc_auxiliar, id_auxiliar),
foreign key (tdoc_auxiliar, id_auxiliar) references persona (pk_fk_tdoc, id_persona)
);

create table factura_compra
(
n_factura_comp int,
administrador_tdoc varchar(10) not null,
administrador_id int not null,
proveedor_tdoc varchar(10) not null,
proveedor_id int not null,
primary key (n_factura_comp),
foreign key (n_factura_comp) references factura (n_factura),
foreign key (administrador_tdoc, administrador_id) references administrador (tdoc_administrador, id_administrador),
foreign key (proveedor_tdoc, proveedor_id) references proveedor (tdoc_proveedor,id_proveedor)
);

create table factura_venta
(
n_factura_vent int not null,
auxiliar_tdoc_v varchar (10) not null,
auxiliar_id_v int not null,
primary key (n_factura_vent),
foreign key (n_factura_vent) references factura (n_factura),
foreign key (auxiliar_tdoc_v, auxiliar_id_v) references auxiliar (tdoc_auxiliar, id_auxiliar)
);
create database Quickness_Vitality_v3;

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
    telefono bigint not null,
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

create table persona_roles 
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
observacion_fact varchar (150) not null,
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
actividad boolean not null,
primary key (id_proveedor, tdoc_proveedor),
foreign key (tdoc_proveedor, id_proveedor) references persona (pk_fk_tdoc, id_persona)
);

create table marcas 
(
    id_marca varchar (5),
    nom_marca varchar (45) not null,
    primary key (id_marca)
);

create table productos 
(
cod_producto varchar (10) not null, 
nom_producto varchar (45) not null,
valor_producto DOUBLE not null,
cantidad_disp int not null,
costo double not null,
fk_marca_id varchar (5) not null,
fk_proveedor_id int not null,
fk_tipo_prod varchar (20) not null,
observacion_prod varchar (150) not null,
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
pago_conta double not null,
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
cant_prods_comp int not null,
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

insert into tipo_documento values
('1025525109','TI','0'), /*samuel*/
('1025142224','TI','0'), /*kevin*/
('1104695264','CC','0'), /*nicoll*/
('1023365027','CC','0'), /*cristian*/
('1074958472','CC','0'); /*loren*/

insert into sesion values
('sscortes9@misena.edu.co','sc1234'),
('kabarrera42@misena.edu.co','kb1234'),
('nyavendano46@misena.edu.co','na1234'),
('casolano72@misena.edu.co','cs1234'),
('ljalvarez274@misena.edu.co','la1234');

insert into roles values 
('501','Administrador'),
('502','Proveedor'),
('503','Contador'),
('504','Auxiliar');

insert into persona values
('1025525109','1001','sscortes9@misena.edu.co','Samuel','Steban','Cortes','Arevalo','Calle 44 sur #72-22','3507930509'),
('1025142224','1002','kabarrera42@misena.edu.co','Kevin','Andres','Barrera','Arias','Calle 8C #87B-75 Ca 87','3508389976'),
('1104695264','1003','nyavendano46@misena.edu.co','Nicoll','Yuliana','Avendaño','Morales','Cra 2 este #2-04','3138291580'),
('1023365027','1004','casolano72@misena.edu.co','Cristian','Andres','Solano','Duarte','Calle 67f #65a-2','3134056307'),
('1074958472','1005','ljalvarez274@misena.edu.co','Loren','Juliana','Alvarez','Florido','Cra 58 #163-55','3115396816');

insert into persona_roles values
('1025525109','1001','504','0'), /*samuel*/
('1025142224','1002','504','0'), /*kevin*/
('1104695264','1003','502','0'), /*nicoll*/
('1023365027','1004','501','0'), /*cristian*/
('1074958472','1005','503','0'); /*loren*/

insert into marcas values
('201','gsk'),
('202','MK'),
('203','Bayer'),
('204','Advil'),
('205','Abbott');

insert into tipo_producto values
('Medicamento','0'),
('Popular','0'),
('Cosmetico','0'),
('Droga_blanca','0');

insert into proveedor values
('1003','1104695264','3138291580','0'); 

insert into contador values
('1074958472','1005','1000000');

insert into administrador values
('1023365027','1004');

insert into auxiliar values
('1025525109','1001','1500000'),
('1025142224','1002','1500000');

insert into productos values
('p1001','Aspirina','1000','50','800','203','1003','Medicamento','...'),
('p1002','Alca-Seltzer','1000','50','800','203','1003','Medicamento','...'),
('p1003','Dolex','1500','100','1300','201','1003','Medicamento','...'),
('p1004','Dolex forte','1800','100','1600','201','1003','Medicamento','...'),
('p1005','Acetaminofen','1500','200','1300','202','1003','Medicamento','...'),
('p1006','Metocarbamol/Ibuprofeno','2500','200','2300','202','1003','Medicamento','...'),
('p1007','Advil Max','1500','100','1300','204','1003','Medicamento','...'),
('p1008','Advil Ultra','1500','100','1300','204','1003','Medicamento','...'),
('p1009','Sevedol','2000','100','1800','205','1003','Medicamento','...'),
('p1010','Gastrum','3000','50','2800','205','1003','Medicamento','...');

insert into factura values
('1101','2022-02-15','2500','475','2975','...'), 
('1102','2022-02-23','3300','627','3927','...'),  
('1103','2022-03-04','2000','380','2380','...'),  
('1104','2022-03-06','4000','760','4760','...'),  
('1105','2022-04-16','3500','665','4165','...'),  
('1106','2022-04-03','4000','760','4760','...'),  
('1107','2022-05-06','4000','760','4760','...'),  
('1108','2022-05-02','1500','285','1785','...'),  
('1109','2022-06-28','3300','627','3927','...'),  
('1110','2022-06-14','3000','570','3570','...');  

insert into factura_productos values
('1101','p1001','1','1000'),
('1101','p1005','1','1500'),
('1102','p1004','1','1800'),
('1102','p1007','1','1500'),
('1103','p1009','1','2000'),
('1104','p1002','1','1000'),
('1104','p1010','1','3000'),
('1105','p1005','1','1500'),
('1105','p1008','1','1500'),
('1106','p1003','1','1500'),
('1106','p1006','1','2500'),
('1107','p1001','1','1000'),
('1107','p1005','1','1500'),
('1107','p1007','1','1500'),
('1108','p1005','1','1500'),
('1109','p1004','1','1800'),
('1109','p1008','1','1500'),
('1110','p1010','1','3000');

insert into factura_compra values 
('1101','1023365027','1004','1104695264','1003','2'),
('1102','1023365027','1004','1104695264','1003','2'),
('1103','1023365027','1004','1104695264','1003','1'),
('1104','1023365027','1004','1104695264','1003','2'),
('1105','1023365027','1004','1104695264','1003','2');

insert into factura_venta values
('1106','1025525109','1001'),
('1107','1025142224','1002'),
('1108','1025525109','1001'),
('1109','1025142224','1002'),
('1110','1025525109','1001');
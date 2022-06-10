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
('1025525109','1001','sscortes9@misena.edu.co','Samuel','Steban','Cortes','Arevalo','Calle 44 sur #72-22'),
('1025142224','1002','kabarrera42@misena.edu.co','Kevin','Andres','Barrera','Arias','Calle 8C #87B-75 Ca 87'),
('1104695264','1003','nyavendano46@misena.edu.co','Nicoll','Yuliana','Avendaño','Morales','Cra 2 este #2-04'),
('1023365027','1004','casolano72@misena.edu.co','Cristian','Andres','Solano','Duarte','Calle 67f #65a-2'),
('1074958472','1005','ljalvarez274@misena.edu.co','Loren','Juliana','Alvarez','Florido','Cra 58 #163-55');

insert into persona_has_roles values
('1025525109','1001','504','0'), /*samuel*/
('1025142224','1002','504','0'), /*kevin*/
('1104695264','1003','502','0'), /*nicoll*/
('1023365027','1004','501','0'), /*cristian*/
('1074958472','1005','503','0'); /*loren*/

insert into marcas values
('201','gsk','0'),
('202','MK','0'),
('203','Bayer','0'),
('204','Advil','0'),
('205','Abbott','0');

insert into tipo_producto values
('Medicamento','0'),
('Popular','0'),
('Cosmetico','0'),
('Droga_blanca','0');

insert into proveedor values
('1003','1104695264','3138291580'); 

insert into contador values
('1074958472','1005');

insert into administrador values
('1023365027','1004');

insert into auxiliar values
('1025525109','1001','1500000'),
('1025142224','1002','1500000');

insert into productos values
('p1001','Aspirina','1000','50','203','1003','Medicamento'),
('p1002','Alca-Seltzer','1000','50','203','1003','Medicamento'),
('p1003','Dolex','1500','100','201','1003','Medicamento'),
('p1004','Dolex forte','1800','100','201','1003','Medicamento'),
('p1005','Acetaminofen','1500','200','202','1003','Medicamento'),
('p1006','Metocarbamol/Ibuprofeno','2500','200','202','1003','Medicamento'),
('p1007','Advil Max','1500','100','204','1003','Medicamento'),
('p1008','Advil Ultra','1500','100','204','1003','Medicamento'),
('p1009','Sevedol','2000','100','205','1003','Medicamento'),
('p1010','Gastrum','3000','50','205','1003','Medicamento');

insert into factura values
('1101','2022-02-15','2500','475','2975'), 
('1102','2022-02-23','3300','627','3927'),  
('1103','2022-03-04','2000','380','2380'),  
('1104','2022-03-06','4000','760','4760'),  
('1105','2022-04-16','3500','665','4165'),  
('1106','2022-04-03','4000','760','4760'),  
('1107','2022-05-06','4000','760','4760'),  
('1108','2022-05-02','1500','285','1785'),  
('1109','2022-06-28','3300','627','3927'),  
('1110','2022-06-14','3000','570','3570');  

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
('1101','1023365027','1004','1104695264','1003'),
('1102','1023365027','1004','1104695264','1003'),
('1103','1023365027','1004','1104695264','1003'),
('1104','1023365027','1004','1104695264','1003'),
('1105','1023365027','1004','1104695264','1003');

insert into factura_venta values
('1106','1025525109','1001'),
('1107','1025142224','1002'),
('1108','1025525109','1001'),
('1109','1025142224','1002'),
('1110','1025525109','1001');
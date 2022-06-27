SET FOREIGN_KEY_CHECKS=0;

create table departamentos(
	codDepto VARCHAR(4) not null,
    nombreDepto VARCHAR(20) not null,
    ciudad VARCHAR(15) not null,
    codDirector VARCHAR(12) not null,
    PRIMARY KEY (codDepto)
);

INSERT INTO departamentos (codDepto, nombreDepto, ciudad, codDirector)
values
	('1000','GERENCIA','CIUDAD REAL','31.840.269'),
	('1500','PRODUCCIÓN','CIUDAD REAL','16.211.383'),
	('2000','VENTAS','CIUDAD REAL','31.178.144'),
	('2100','VENTAS','BARCELONA','16.211.383'),
	('2200','VENTAS','VALENCIA','16.211.383'),
	('2300','VENTAS','MADRID','16.759.060'),
	('3000','INVESTIGACIÓN','CIUDAD REAL','16.759.060'),
	('3500','MERCADEO','CIUDAD REAL','22.222.222'),
	('4000','MANTENIMIENTO','CIUDAD REAL','333.333.333'),
	('4100','MANTENIMIENTO','BARCELONA','16.759.060'),
	('4200','MANTENIMIENTO','VALENCIA','16.759.060'),
	('4300','MANTENIMIENTO','MADRID','16.759.060');

drop table empleados;

create table empleados(
	nDIEmp VARCHAR(12) not null,
    nomEmp VARCHAR(30) not null,
    sexEmp CHAR(1) not null,
    fecNac DATE not null,
    fecIncorporacion DATE not null,
    salEmp FLOAT not null,
    comisionE FLOAT not null,
    cargoE VARCHAR(15) not null,
    jefeID VARCHAR(12),
    codDepto VARCHAR(4) not null,
    PRIMARY KEY(nDIEmp),
    foreign key (codDepto) references departamentos(codDepto),
    CONSTRAINT foreign key (jefeID) references empleados(nDIEmp) ON UPDATE CASCADE 
);

INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comisionE, cargoE, jefeID, codDepto)
values
	('1.130.222','José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222','3500'),
	('1.130.333','Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144','2000'),
	('1.130.444','Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144','2000'),
	('1.130.555','Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144','2200'),
	('1.130.666','Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144','2300'),
	('1.130.777','Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333','4000'),
	('1.130.782','Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383','1500'),
	('1.751.219','Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144','2100'),
	('11.111.111','Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333','4200'),
	('16.211.383','Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269','1500'),
	('16.759.060','Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269','3000'),
	('19.709.802','William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060','3000'),
	('22.222.222','Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269','3500'),
	('22.222.333','Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269','3500'),
	('31.174.099','Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269','1000'),
	('31.178.144','Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269','2000'),
	('31.840.269','María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,'1000'),
	('333.333.333','Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269','4000'),
	('333.333.334','Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060','3000'),
	('333.333.335','Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060','3000'),
	('333.333.336','Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383','1500'),
	('333.333.337','Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144','2100'),
	('444.444','Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333','4300'),
	('737.689','Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2300'),
	('768.782','Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2200'),
	('888.888','Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333','4100');
    
    SELECT * FROM empleados;
    SELECT * FROM departamentos;
    SELECT * FROM empleados WHERE cargoE = 'Secretaria';
    SELECT nomEmp, salEmp FROM empleados;
    SELECT * FROM empleados WHERE cargoE = 'Vendedor' ORDER BY nomEmp asc;
    SELECT distinct nombreDepto FROM departamentos;
    SELECT nomEmp, cargoE, salEmp FROM empleados ORDER BY salEmp asc;
    SELECT salEmp, comisionE FROM empleados WHERE codDepto = 2000 ORDER BY comisionE asc;
    SELECT distinct comisionE FROM empleados;
    SELECT nomEmp, salEmp, (salEmp + 500000) as 'pago estimado' FROM empleados WHERE codDepto = 3000 ORDER BY nomEmp asc;
    SELECT nomEmp, salEmp, comisionE FROM empleados WHERE comisionE > salEmp;
	SELECT nomEmp, salEmp, comisionE FROM empleados WHERE comisionE <= (salEmp * 30) / 100;
	SELECT nomEmp as 'Nombre', cargoE as 'Cargo' FROM empleados;
    SELECT nDIEmp, salEmp, comisionE FROM empleados WHERE nDIEmp > '19.709.802';
    SELECT nomEmp, cargoE from empleados where lower(nomEmp) > 'j' and lower(nomEmp) < 'z' ORDER BY nomEmp asc;
    SELECT salEmp, comisionE, (salEmp + comisionE) as 'Salario total', nDIEmp from empleados WHERE comisionE > 1000000 ORDER BY nDIEmp; 
	SELECT salEmp, comisionE, (salEmp + comisionE) as 'Salario total', nDIEmp from empleados WHERE comisionE = 0 ORDER BY nDIEmp; 
    SELECT nomEmp from empleados WHERE lower(nomEmp) not like "%ma%";
    SELECT nombreDepto from departamentos WHERE lower(nombreDepto) != 'ventas' and lower(nombreDepto) != 'investigación' and lower(nombreDepto) != 'mantenimiento';
    SELECT e.nomEmp, d.nombreDepto from empleados e inner join departamentos d on e.codDepto = d.codDepto 
    where e.cargoE = 'Secretaria' or e.cargoE = 'Vendedor' and 
    lower(d.nombreDepto) not in ('produccion') and e.salEmp > 1000000 ORDER BY e.fecIncorporacion asc;
    SELECT * FROM empleados where char_length(nomEmp) = 11;
	SELECT * FROM empleados where char_length(nomEmp) < 11;
    SELECT e.nomEmp, d.nombreDepto, e.salEmp from empleados e inner join departamentos d on e.codDepto = d.codDepto where e.nomEmp like 'M%'  and
    e.salEmp > 800000 and d.nombreDepto = 'Ventas';
    SELECT nomEmp, salEmp, comisionE from empleados where salEmp > (comisionE / 2) and salEmp < comisionE;
    SELECT nomEmp, max(salEmp) as 'Salario mayor' from empleados;
    SELECT comisionE, count(comisionE) as 'Num empleados' from empleados group by comisionE;
    SELECT max(nomEmp) as 'Mayor alfabeticamente' from empleados;
    SELECT max(salEmp) as 'Salario mayor', min(salEmp) as 'Salario menor', (max(salEmp) - min(salEmp)) as 'Diferencia' from empleados;
    SELECT codDepto, sexEmp, count(*) from empleados group by codDepto, sexEmp;
    SELECT codDepto, avg(salEmp) from empleados group by codDepto;
    SELECT nDIEmp, salEmp from empleados where salEmp >= (select avg(salEmp) from empleados);
    SELECT d.codDepto, d.nombreDepto, count(*) as 'Num empleados' from departamentos d, empleados e 
    where d.codDepto = e.codDepto
    group by d.codDepto having count(*) >= 3;
    SELECT nDIEmp, nomEmp, count(*) as 'Num Empleados' from empleados;


    
CREATE DATABASE HOSPITAL

CREATE TABLE Paciente
(
Cedula varchar (12) primary key,
Nombre varchar (50) not null,
Edad int not null,
Sexo char(1) CHECK (Sexo = 'F' or Sexo = 'M'),
Provincia Varchar(20) not null,
Canton Varchar(20) not null,
Distrito Varchar(20) null,
Telefono varchar (20) null,
Asegurado bit
)

CREATE TABLE Provincia
(
Codigo int identity (1,1),
Descripcion varchar (20),
constraint Pk_codigo primary key (Codigo) 
)

CREATE TABLE Canton
(
Codigo int identity(1,1),
Descripcion varchar (20),
CodigoProvincia int,
constraint Pk_codigoCanton primary key (codigo),
constraint Fk_codigoProvincia foreign key (CodigoProvincia) References Provincia(Codigo)
)
CREATE TABLE Distrito
(
Distrito_codigo int,
Descripcion varchar (20),
CodigoCanton int,
constraint Pk_codigoDistrito primary key (Distrito_codigo),
constraint Fk_Distrito_Canton foreign key (CodigoCanton) References Canton(Codigo)
)
SELECT * FROM Distrito
  INSERT INTO Distrito ( Distrito_codigo,descripcion,codigocanton) values (1, 'limon', 1)

SELECT * FROM Canton 
INSERT INTO Canton values ('Canton 1',1),('Canton 2',1),('Canton 3',2),('Canton 4',3),('Canton 5',4),('Canton 6',4)

SELECT * FROM Provincia
INSERT INTO Provincia values ('San Jose'),('Alajuela'),('Heredia'),('Cartago')

SELECT Provincia.Codigo, Provincia.Descripcion, Canton.codigo, Canton.Descripcion, Distrito_codigo, Distrito.Descripcion
FROM Provincia inner join canton on provincia.codigo = canton.codigoprovincia inner join distrito on canton.codigo = distrito.codigocanton
where Provincia.codigo = @codigoprovincia

UPDATE PACIENTE SET NOMBRE = 'Allan Morales', EDAD = 23, SEXO = 'M', PROVINCIA = 'SAN JOSE', CANTON = 'GUADALUPE', DISTRITO = 'IPIS', TELEFONO = '1111', ASEGURADO = 0 WHERE CEDULA = '1'
SELECT * FROM PACIENTE

INSERT INTO PACIENTE (CEDULA, NOMBRE, EDAD, SEXO, PROVINCIA, CANTON, DISTRITO, TELEFONO, ASEGURADO) VALUES ('1', 'Allan', 20, 'M','San Jose','GUADALUPE', 'IPIS','333',1)
INSERT INTO PACIENTE (CEDULA, NOMBRE, EDAD, SEXO, PROVINCIA, CANTON, DISTRITO, TELEFONO, ASEGURADO) VALUES ('2', 'Raquel', 30, 'F','HEREDIA','SAN RAFAEL', 'POAS','444',0)
SELECT * FROM Paciente

SELECT * FROM PACIENTE WHERE NOMBRE like '%Mar%' 


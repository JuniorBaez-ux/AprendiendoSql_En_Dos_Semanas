--Crear la base de datos donde realizaremos todos los ejercicios
 Create DataBase Bd1;
 use Bd1;
--2 - Crear una tabla (create table - sp_tables - sp_columns - drop table)
 if object_id('Usuarios') is not null
  drop table Usuarios;

 create table Usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns Usuarios;

 drop table Usuarios;

 exec sp_tables @table_owner='dbo';

 --2.2 Necesita almacenar información referente a los libros de su biblioteca personal. Los datos que 
--guardará serán: título del libro, nombre del autor y nombre de la editorial.

--1- Elimine la tabla "libros", si existe:
 if object_id('Libros') is not null
  drop table Libros;

--2- Verifique que la tabla "libros" no existe en la base de datos activa (exec sp_tables @table_owner='dbo').
exec sp_tables @table_owner='dbo'

--3- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); 
--autor, varchar(30) y editorial, varchar(15).
Create Table Libros
(
	Titulo varchar(20),
	Autor varchar(30),
	Editorial varchar(15)
);

--4- Intente crearla nuevamente. Aparece mensaje de error.
Create Table Libros
(
	Titulo varchar(20),
	Autor varchar(30),
	Editorial varchar(15)
);

--5- Visualice las tablas existentes.
exec sp_tables @table_owner = 'dbo';

--6- Visualice la estructura de la tabla "libros".
exec sp_columns Libros; 

--7- Elimine la tabla.
drop table Libros;

--8- Intente eliminar la tabla nuevamente.
drop table Libros;

------------------------------------------------------------------------------------------------

--3 - Insertar y recuperar registros de una tabla (insert into - select)
if object_id('Usuarios') is not null
	drop table Usuarios;
Create Table Usuarios
(
	Nombre varchar(30),
	Clave varchar(20)
);

insert into Usuarios(Nombre,Clave) Values ('Anneury','abc123');

select * from Usuarios;

insert into Usuarios(Nombre,Clave) Values ('Marco','1234');

select * from Usuarios;


--3.2 Ejercicios
--	Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.
--1- Elimine la tabla "libros", si existe:
 if object_id('libros') is not null
  drop table libros;

--2- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo (cadena de 20), 
--autor (cadena de 30) y editorial (cadena de 15).
Create Table Libros 
(
	Titulo varchar(20),
	Autor varchar(30),
	Editorial varchar(15)
);

--3- Visualice las tablas existentes (exec sp_tables @table_owner='dbo').
exec sp_tables @table_owner = 'dbp';

--4- Visualice la estructura de la tabla "libros" (sp_columns).
exec sp_columns Libros;

--5- Ingrese los siguientes registros:
/* 
insert into libros (titulo,autor,editorial)
values ('El aleph','Borges','Planeta');
insert into libros (titulo,autor,editorial) 
values ('Martin Fierro','Jose Hernandez','Emece');
insert into libros (titulo,autor,editorial)
values ('Aprenda PHP','Mario Molina','Emece');
*/
insert into Libros (Titulo, Autor, Editorial) Values ('El aleph','Borges','Planeta');
insert into Libros (Titulo, Autor, Editorial) Values ('Martin Fierro','Jose Hernandez','Emece');
insert into Libros (Titulo, Autor, Editorial) Values ('Aprenda PHP','Mario Molina','Emece');

--6- Muestre todos los registros (select).
select * from Libros;

------------------------------------------------------------------------------------------------

--4- Tipos de datos básicos
if object_id('Libros') is not null
	drop table Libros;

Create Table Libros
(
	Titulo varchar(80),
	Autor varchar(40),
	Editorial varchar(30),
	Precio float,
	Cantidad integer
);

exec sp_columns Libros;

insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) Values ('El Marquez','Julio Suarez','Emece', 25.50, 5);

select * from Libros;

--4.2 Ejercicios
--Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
--datos: nombre, documento, sexo, domicilio, sueldobasico.

--1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  drop table Empleados;

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table Empleados
 (
  Nombre varchar(20),
  Documento varchar(8),
  Sexo varchar(1),
  Domicilio varchar(30),
  Sueldobasico float
 );

--3- Vea la estructura de la tabla:
exec sp_columns Empleados;
--4- Ingrese algunos registros:
/*
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Juan Perez','22333444','m','Sarmiento 123',500);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Ana Acosta','24555666','f','Colon 134',650);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Bartolome Barrios','27888999','m','Urquiza 479',800);
*/
insert into Empleados(Nombre, Documento, Sexo, Domicilio, Sueldobasico) Values ('Juan Perez','22333444','m','Sarmiento 123',500);
insert into Empleados(Nombre, Documento, Sexo, Domicilio, Sueldobasico) Values ('Juan Perez','22333444','m','Sarmiento 123',500);
insert into Empleados(Nombre, Documento, Sexo, Domicilio, Sueldobasico) Values ('Juan Perez','22333444','m','Sarmiento 123',500);

--5- Seleccione todos los registros.
select * from Empleados;

------------------------------------------------------------------------------------------------

--5 - Recuperar algunos campos (select)

--Borramos la tabla libros si ya existe
if object_id('Libros') is not null
	drop table Libros;

-- creamos la tabla Libros
create table Libros
(
	Titulo varchar(40),
	Autor varchar(30),
	Editorial varchar(15),
	Precio float,
	Cantidad integer
);
go

--llamamo el procedimiento almacenado sp_columns para conocer los campos 
--de la tabla Libros
exec sp_columns Libros;

--insertamos varias filas en la tabla Libros
insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) Values ('Marios','Uchija itachi','Genea',35.5,5);
insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) Values ('Marios','Uchija itachi','Genea',35.5,5);
insert into Libros(Titulo, Autor, Editorial, Precio, Cantidad) Values ('Marios','Uchija itachi','Genea',35.5,5);

--recuperamos todos los datos que agregamos
select * from Libros;

--recuperamos solo el titulo, autor y editorial de la tabla libros
select Titulo,Autor,Editorial from Libros;

--Recuperamos la Editorial y la cantidad
select Editorial, Cantidad from Libros;


--5.2 Ejercicios 
 --Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".
--1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  drop table Empleados;

--2- Cree la tabla:
 create table Empleados
 (
  Nombre varchar(20),
  Documento varchar(8), 
  Sexo varchar(1),
  Domicilio varchar(30),
  Sueldobasico float
 );

--3- Vea la estructura de la tabla:
 exec sp_columns Empleados;

--4- Ingrese algunos registros:
 insert into Empleados (Nombre, Documento, Sexo, Domicilio, Sueldobasico) values ('Juan Juarez','22333444','m','Sarmiento 123',500);
 insert into Empleados (Nombre, Documento, Sexo, Domicilio, Sueldobasico) values ('Ana Acosta','27888999','f','Colon 134',700);
 insert into Empleados (Nombre, Documento, Sexo, Domicilio, Sueldobasico) values ('Carlos Caseres','31222333','m','Urquiza 479',850);

--5- Muestre todos los datos de los empleados
select * from Empleados;

--6- Muestre el nombre, documento y domicilio de los empleados
select Nombre, Documento, Domicilio from Empleados;
--7- Realice un "select" mostrando el documento, sexo y sueldo básico de todos los empleados
select Documento, Sexo, Sueldobasico from Empleados;

------------------------------------------------------------------------------------------------

--6 -Recuperar algunos registros (where)

if object_id('Usuarios') is not null
  drop table Usuarios;

create table Usuarios 
(
  Nombre varchar(30),
  Clave varchar(10)
);

go 

exec sp_columns Usuarios;

insert into Usuarios (Nombre, Clave) values ('Marcelo','Boca');
insert into Usuarios (Nombre, Clave) values ('JuanPerez','Juancito');
insert into Usuarios (Nombre, Clave) values ('Susana','River');
insert into Usuarios (Nombre, Clave) values ('Luis','River');

-- Recuperamos el usuario cuyo nombre es "Leonardo"
select * from Usuarios
  where Nombre='Leonardo';

-- Recuperamos el nombre de los usuarios cuya clave es "River"
select Nombre from Usuarios
  where Clave = 'River';

-- Recuperamos el nombres de los usuarios cuya clave es "Santi"
select Nombre from Usuarios
  where Clave = 'Santi';

--5.1 Ejercicios
--1- Elimine "agenda", si existe:
 if object_id('Agenda') is not null
  drop table Agenda;

--2- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
--domicilio (cadena de 30) y telefono (cadena de 11).
create table Agenda 
(
	Apellido varchar(30),
	Nombre varchar(20),
	Domicilio varchar(30),
	Telefono varchar(11)
);
--3- Visualice la estructura de la tabla "agenda".
exec sp_columns Agenda;

--4- Ingrese los siguientes registros:
/*
 Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Hector, Salta 545, 4887788; 
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454.
 */
insert into Agenda(Apellido, Nombre, Domicilio, Telefono)  Values ('Acosta', 'Ana', 'Colon 123', '4234567');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Bustamante', 'Betina', 'Avellaneda 135', '4458787');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Lopez', 'Hector', 'Salta 545', '4887788'); 
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Lopez', 'Luis', 'Urquiza 333', '4545454');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Lopez', 'Marisa', 'Urquiza 333', '4545454');

--5- Seleccione todos los registros de la tabla
select * from Agenda;

--6- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)
select * from Agenda
where Nombre = 'Marisa';

--7- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)
select Nombre, Domicilio from Agenda
where Apellido = 'Lopez';

--8- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)
select Nombre from Agenda
where Telefono = '4545454';

-------------------------------------------------------------------------------------------------

--7 - Operadores relacionales
if object_id('Libros') is not null
  drop table Libros;

create table Libros
(
  Titulo varchar(30),
  Autor varchar(30),
  Editorial varchar(15),
  Precio float
);

go

insert into Libros (Titulo,Autor,Editorial,Precio) values ('El aleph','Borges','Emece',24.50);
insert into Libros (Titulo,Autor,Editorial,Precio) values ('Martin Fierro','Jose Hernandez','Emece',16.00);
insert into Libros (Titulo,Autor,Editorial,Precio) values ('Aprenda PHP','Mario Molina','Emece',35.40);
insert into Libros (Titulo,Autor,Editorial,Precio) values ('Cervantes y el quijote','Borges','Paidos',50.90);

-- Seleccionamos los registros cuyo autor sea diferente de 'Borges'
select * from Libros
  where Autor<>'Borges';

-- Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y precio
select Titulo, Precio
  from Libros
  where Precio>20;

-- Recuperamos aquellos libros cuyo precio es menor o igual a 30
select * from Libros
  where Precio <= 30;

--7.1 Ejercicios

--1- Elimine "articulos", si existe:
 if object_id('Articulos') is not null
  drop table Articulos;

--2- Cree la tabla, con la siguiente estructura:
 create table Articulos
 (
  Codigo integer,
  Nombre varchar(20),
  Descripcion varchar(30),
  Precio float,
  Cantidad integer
 );

--3- Vea la estructura de la tabla (sp_columns).

--4- Ingrese algunos registros:
/*
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);
*/
 insert into Articulos (Codigo, Nombre, Descripcion, Precio, Cantidad) values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into Articulos (Codigo, Nombre, Descripcion, Precio, Cantidad) values (2,'impresora','Epson Stylus C85',500,30);
 insert into Articulos (Codigo, Nombre, Descripcion, Precio, Cantidad) values (3,'monitor','Samsung 14',800,10);
 insert into Articulos (Codigo, Nombre, Descripcion, Precio, Cantidad) values (4,'teclado','ingles Biswal',100,50);
 insert into Articulos (Codigo, Nombre, Descripcion, Precio, Cantidad) values (5,'teclado','español Biswal',90,50);

--5- Seleccione los datos de las impresoras (2 registros)
select * from Articulos
where Nombre = 'impresora';

--6- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)
select * from Articulos 
where Precio >= 400;

--7- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)
select Codigo, Nombre from Articulos
where Cantidad < 30;

--8- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)
select Nombre, Descripcion from Articulos
where Precio <> 100; 

------------------------------------------------------------------------------------------------------------

--8- Borrar registros (delete)

if object_id('Usuarios') is not null
  drop table Usuarios;

create table Usuarios(
  Nombre varchar(30),
  Clave varchar(10)
);

go

insert into Usuarios (Nombre,Clave) values ('Marcelo','River');
insert into Usuarios (Nombre,Clave) values ('Susana','chapita');
insert into Usuarios (Nombre,Clave) values ('CarlosFuentes','Boca');
insert into Usuarios (Nombre,Clave) values ('FedericoLopez','Boca');

select * from Usuarios;

-- Eliminamos el registro cuyo nombre de usuario es "Marcelo"
delete from Usuarios
  where Nombre = 'Marcelo';

select * from Usuarios;

-- Intentamos eliminarlo nuevamente (no se borra registro)
delete from Usuarios
 where Nombre = 'Marcelo';

select * from Usuarios;

-- Eliminamos todos los registros cuya clave es 'Boca'
delete from Usuarios
  where Clave = 'Boca';

select * from Usuarios;

-- Eliminemos todos los registros
delete from Usuarios;

select * from Usuarios;

--8.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('agenda') is not null
  drop table agenda;

--2- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
--domicilio (cadena de 30) y telefono (cadena de 11):
Create table Agenda 
(
	Apellido varchar(30),
	Nombre varchar(20),
	Domicilio varchar(30),
	Telefono varchar(11)
);

--3- Ingrese los siguientes registros (insert into):
 /*
 Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456.
 */
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Alvarez','Alberto','Colon 123','4234567');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Juarez','Juan','Avellaneda 135','4458787');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Lopez','Maria','Urquiza 333','4545454'); 
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Lopez','Jose','Urquiza 333','4545454');
insert into Agenda(Apellido, Nombre, Domicilio, Telefono) Values ('Salas','Susana','Gral. Paz 1234','4123456');

select * from Agenda;

--4- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)
delete from Agenda 
where Nombre = 'Juan';

select * from Agenda;

--5- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):
delete from Agenda
where Telefono = '4545454';



--6- Muestre la tabla.
select * from Agenda;
--7- Elimine todos los registros (2 registros afectados):
delete from Agenda;

--8- Muestre la tabla.
select * from Agenda;

------------------------------------------------------------------------------------------------

--9- Actualizar registros (update)

if object_id('Usuarios') is not null
  drop table Usuarios;

Create table Usuarios
(
	Nombre varchar(20),
	Clave varchar(10)
);

go

insert into Usuarios (Nombre,Clave) values ('Marcelo','River');
insert into Usuarios (Nombre,Clave) values ('Susana','chapita');
insert into Usuarios (Nombre,Clave) values ('Carlosfuentes','Boca');
insert into usuarios (nombre,clave) values ('Federicolopez','Boca');

update Usuarios set Clave = 'RealMadrid';

select * from usuarios;

update Usuarios set Clave = 'Boca'
  where nombre = 'Federicolopez';

select * from usuarios;

update Usuarios set Clave = 'payaso'
  where Nombre = 'JuanaJuarez';

select * from usuarios;

update Usuarios set Nombre = 'Marceloduarte', Clave='Marce'
  where Nombre = 'Marcelo';

select * from Usuarios;

--9.1 Ejercicios
--1- Elimine la tabla si existe:
 if object_id('Agenda') is not null
  drop table Agenda;

--2- Cree la tabla:
 create table Agenda
 (
  Apellido varchar(30),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar(11)
 );
 select * from Agenda;

--3- Ingrese los siguientes registros (1 registro actualizado):
 insert into Agenda (Apellido,Nombre,Domicilio,Telefono) Values ('Acosta','Alberto','Colon 123','4234567');
 insert into Agenda (Apellido,Nombre,Domicilio,Telefono) Values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into Agenda (Apellido,Nombre,Domicilio,Telefono) Values ('Lopez','Maria','Urquiza 333','4545454');
 insert into Agenda (Apellido,Nombre,Domicilio,Telefono) Values ('Lopez','Jose','Urquiza 333','4545454');
 insert into Agenda (Apellido,Nombre,Domicilio,Telefono) Values ('Suarez','Susana','Gral. Paz 1234','4123456');
 select * from Agenda;

--4- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)
update Agenda set Nombre = 'Juan jose'
where Nombre = 'Juan';
select * from Agenda;

--5- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" 
--(2 registros afectados)
update Agenda set Telefono = '4445566'
where Telefono = '4545454';
select * from Agenda;

--6- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ningún 
--registro afectado porque ninguno cumple con la condición del "where")
update Agenda set Nombre = 'Juan Jose'
where Nombre = 'Juan';
select * from Agenda;

--7 - Luego de cada actualización ejecute un select que muestre todos los registros de la tabla.
select * from Agenda;

----------------------------------------------------------------------------------------------------------

--11 Valores null (is null)

if object_id('Libros') is not null
   drop table Libros;

create table Libros
(
  Titulo varchar(30) not null,
  Autor varchar(30) not null,
  Editorial varchar(15) null,
  Precio float
);

go

-- Agregamos un registro a la tabla con valor nulo para el campo "precio":
insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',null);

-- Ingresamos otro registro, con valor nulo para el campo "editorial"
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais','Lewis Carroll',null,0);

-- Veamos lo que sucede si intentamos ingresar el valor "null"
-- en campos que no lo admiten, como "titulo":
 insert into libros (titulo,autor,editorial,precio) values(null,'Borges','Siglo XXI',25);

exec sp_columns libros;

-- Dijimos que el valor "null" no es lo mismo que una cadena vacía. 
-- Vamos a ingresar un registro con cadena vacía para el campo "editorial":
insert into libros (titulo,autor,editorial,precio) values('Uno','Richard Bach','',18.50);

-- Ingresamos otro registro, ahora cargamos una cadena vacía en el campo "titulo":
insert into libros (titulo,autor,editorial,precio) values('','Richard Bach','Planeta',22);

select * from libros;

-- Recuperemos los registros que contengan el valor "null" en el campo "precio":
select * from libros
  where precio is null;

-- La sentencia anterior tendrá una salida diferente a la siguiente:
select * from libros
  where precio = 0;

-- Recuperemos los libros cuyo nombre de editorial es "null":
 select * from libros
  where editorial is null;

-- Ahora veamos los libros cuya editorial almacena una cadena vacía:
 select * from libros
  where editorial=''; 

-- Para recuperar los libros cuyo precio no sea nulo tipeamos:
 select * from libros
  where precio is not null;

--11.1 Ejercicios

--1- Elimine la tabla, si existe:
  if object_id('Medicamentos') is not null
   drop table Medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table Medicamentos
 (
  Codigo integer not null,
  Nombre varchar(20) not null,
  Laboratorio varchar(20),
  Precio float,
  Cantidad integer not null
 );

--3- Visualice la estructura de la tabla "medicamentos":
 exec sp_columns Medicamentos;
--note que los campos "codigo", "nombre" y "cantidad", en la columna "IS_NULLABLE" aparece "NO" y en 
--las otras "YES". 

--4- Ingrese algunos registros con valores "null" para los campos que lo admitan:
 insert into Medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(1,'Sertal gotas',null,null,100); 
 insert into Medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(2,'Sertal compuesto',null,8.90,150);
 insert into Medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(3,'Buscapina','Roche',null,200);

--5- Vea todos los registros:
 select * from Medicamentos;

--6- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio:
 insert into Medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Bayaspirina','',0,150);

--7- Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre:
 insert into Medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(0,'','Bayer',15.60,0);

--8- Muestre todos los registros:
 select * from Medicamentos;

--9- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de 
--error):
 insert into Medicamentos (codigo,nombre,laboratorio,precio,cantidad) values(null,'Amoxidal jarabe','Bayer',25,120);

--10- Recupere los registros que contengan valor "null" en el campo "laboratorio", luego los que 
--tengan una cadena vacía en el mismo campo. Note que el resultado es diferente.
select * from Medicamentos
where Laboratorio = null;

select * from Medicamentos
where Laboratorio = ' ';
--11- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
--valor 0 en el mismo campo. Note que el resultado es distinto.
select Precio from Medicamentos
where Precio = null;
select Precio from Medicamentos
where Precio = 0;

--12- Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
--distintos de "null".
--Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
--que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
--campo laboratorio (incluso cadena vacía).
select * from Medicamentos 
where Laboratorio<>' ';
select * from Medicamentos 
where Laboratorio<>null;

--13- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
--Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
--tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
--campo precio (incluso el valor 0).
select * from Medicamentos
where Precio = 0;
select * from Medicamentos
where Precio = null;

------------------------------------------------------------------------------------------------------------------

--12- Clave primaria

if object_id('usuarios') is not null
  drop table usuarios;

create table usuarios(
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
);

go

exec sp_columns usuarios;

insert into usuarios (nombre, clave) values ('juanperez','Boca');
insert into usuarios (nombre, clave) values ('raulgarcia','River');

--  Intentamos ingresar un valor de clave primaria existente (genera error):
insert into usuarios (nombre, clave) values ('juanperez','payaso');

-- Intentamos ingresar el valor "null" en el campo clave primaria (genera error):
insert into usuarios (nombre, clave) values (null,'payaso');

-- Intentemos actualizar el nombre de un usuario colocando un nombre existente (genera error):
update usuarios set nombre='juanperez'
  where nombre='raulgarcia';

--12 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('libros') is not null
  drop table libros;

--2- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":
 create table libros
 (
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 );

--3- Ingrese los siguientes registros:
 insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece');
 insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta');
 insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

--4- Ingrese un registro con código repetido (aparece un mensaje de error)
insert into libros (codigo,titulo,autor,editorial) values (1,'Eli','Sandt','Trimors');

--5- Intente ingresar el valor "null" en el campo "codigo"
insert into libros (codigo,titulo,autor,editorial) values (null,'Eli','Sandt','Trimors');

--6- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)
update libros set codigo = 1
where titulo = 'Martin Fierro';


-----------------------------------------------------------------------------------------------------------


--13 Campo con atributo Identity

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
);

go

insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',23);

select * from libros;

insert into libros (titulo,autor,editorial,precio) values('Uno','Richard Bach','Planeta',18);
insert into libros (titulo,autor,editorial,precio) values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);
insert into libros (titulo,autor,editorial,precio) values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);

select * from libros;

-- Intentemos ingresar un valor para el campo "codigo" (genera error):
insert into libros (codigo,titulo,autor,editorial,precio) values(5,'Martin Fierro','Jose Hernandez','Paidos',25);

-- Intentemos cambiar el valor de código de un registro (genera error):
update libros set codigo=9
  where titulo='Uno';

exec sp_columns libros;

-- Eliminemos el último registro:
delete from libros
  where autor='Lewis Carroll';

-- Ingresamos un quinto registro
insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro','Jose Hernandez','Paidos',25); 

--  El campo código se guardó el valor secuencial sin considerar que el valor "4" ya no existe:
select * from libros;

--13.1-

--1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

--3- Visualice la estructura de la tabla "medicamentos":
 exec sp_columns medicamentos;

--4- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

--5- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 select * from medicamentos;

--6- Intente ingresar un registro con un valor para el campo "codigo"
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (5,'Amoxidal 500','Bayer',15.60,100);

--7- Intente actualizar un valor de código (aparece un mensaje de error)
update medicamentos set codigo = 8
where nombre = 'Amoxidal';

--8- Elimine el registro con codigo "3" (1 registro eliminado)
delete from medicamentos
where codigo = 3;

--9- Ingrese un nuevo registro:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

--10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
 select * from medicamentos;

 -------------------------------------------------------------------------------------------------------------------------------


 --14- Otras características del atributo Identity

 if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity(100,2),
  titulo varchar(20),
  autor varchar(30),
  precio float
);

go

insert into libros (titulo,autor,precio)
  values('El aleph','Borges',23);
insert into libros (titulo,autor,precio)
  values('Uno','Richard Bach',18);
insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',45.60);

select * from libros;

-- Para saber cuál es el valor de inicio del campo "identity" de la tabla "libros":
select ident_seed('libros');

-- Si intentamos ingresar un valor para el campo "codigo" (genera error):
insert into libros (codigo,titulo,autor,precio)
  values(106,'Martin Fierro','Jose Hernandez',25);

-- Para permitir ingresar un valor en un campo de identidad activamos la opción "identity_insert":
set identity_insert libros on;

-- Recordemos que si "identity_insert" está en ON, la instrucción "insert" DEBE explicitar un valor:
insert into libros (codigo,titulo,autor)
 values (100,'Matematica estas ahi','Paenza');

-- Note que ingresamos un valor de código que ya existe; esto está permitido porque
-- el atributo "identity" no implica unicidad.
insert into libros (codigo,titulo,autor)
 values (1,'Ilusiones','Richard Bach');

-- Si no se coloca un valor para el campo de identidad, 
-- la sentencia no se ejecuta y aparece un mensaje de error:
insert into libros (titulo,autor)
 values ('Uno','Richard Bach');

-- Para desactivar la opción "identity_insert" 
set identity_insert libros off;

-- Intentemos ingresar un valor para el campo "codigo" (genera error):
insert into libros (codigo,titulo,autor)
  values (300,'Uno','Richard Bach');

--14.1 Ejercicios

--1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente comenzando en 
--10 e incrementándose en 1:
 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

--3- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

--4- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 select * from medicamentos;

--5- Intente ingresar un registro con un valor para el campo "codigo".
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (15,'Amoxidal 500','Bayer',15.60,100);

--6- Setee la opción "identity_insert" en "on"
set identity_insert medicamentos on;

--7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

--8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.
insert into medicamentos(codigo,nombre,laboratorio,precio,cantidad) values (12,'Amoxilina 500','Bayer',15.60,100);

--9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
--"medicamentos"
	select ident_seed('medicamentos');

--10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
--de "medicamentos"
select ident_incr('medicamentos');


-----------------------------------------------------------------------------------------------------------------------------------


--15-Truncate table

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
);

go

insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

select * from libros;

-- Truncamos la tabla:
truncate table libros;

-- Ingresamos nuevamente algunos registros:
insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

-- Si seleccionamos todos los registros vemos que la secuencia se reinició en 1:
select * from libros;

-- Eliminemos todos los registros con "delete":
delete from libros;

-- Ingresamos nuevamente algunos registros:
insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

-- Seleccionamos todos los registros y vemos que la secuencia continuó:
select * from libros;

--15.1 Ejercicios

--1- Elimine la tabla "alumnos" si existe:
 if object_id('alumnos') is not null
  drop table alumnos;

--2- Cree la tabla con la siguiente estructura:
 create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
 );

--3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
  select * from alumnos;

--4- Elimine todos los registros con "delete".
delete from alumnos;

--5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos:
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;

--6- Elimine todos los registros con "truncate table".
truncate table alumnos; 

--7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició 
--la secuencia del campo "identity":
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;


---------------------------------------------------------------------------------------------------------------------------------


--17-Tipo de dato (texto)

if object_id('visitantes') is not null
  drop table visitantes;

/* Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" 
   algunos datos de las personas que visitan o compran en su stand para luego enviarle 
   publicidad de sus productos. */
create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
);

go

-- Intentamos ingresar una cadena de mayor longitud que la definida 
-- en el campo sexo (se genera un error):
insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567');

-- Ingresamos un número telefónico olvidando las comillas, es decir, 
-- como un valor numérico (lo transforma a cadena):
insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);

select * from visitantes;

--17- Ejercicios

--1- Elimine la tabla "autos" si existe:
 if object_id('autos') is not null
  drop table autos;

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
--"patente" como clave primaria:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

--Hemos definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
--siempre tendrá la misma longitud (6 caracteres). Lo mismo sucede con el campo "modelo", en el cual 
--almacenaremos el año, necesitamos 4 caracteres fijos.

--3- Ingrese los siguientes registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

--4- Seleccione todos los autos del año 1990:
 select * from autos
  where modelo='1990';


--------------------------------------------------------------------------------------------------------------------------------------------


--18- Tipo de dato (numérico)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo smallint identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio smallmoney,
  cantidad tinyint
);

go

-- Intentemos ingresar un valor fuera del rango definido, una cantidad 
-- que supera el rango del tipo "tinyint", el valor 260 (genera error):
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',25.60,260);

-- Intentamos ingresar un precio que supera el rango del tipo "smallmoney",
-- el valor 250000 (genera error):
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',250000,100);

-- Intentamos ingresar una cadena que SQL Server no pueda convertir a valor 
-- numérico en el campo "precio" (genera error):
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta','a50.30',100);

-- Ingresamos una cadena en el campo "cantidad" (lo convierte a valor numérico):
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta',50.30,'100');

select * from libros;


--18.1 Ejercicios

--1- Elimine la tabla "cuentas" si existe:
 if object_id('cuentas') is not null
  drop table cuentas;

--2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 -- Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
 -- Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 -- Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 -- Saldo de la cuenta: valores altos con decimales.
 create table cuentas 
 (
	numero int not null,
	documento char(8) not null,
	nombre varchar(30),
	saldo real,
	primary key(numero)
 );
 
--3- Ingrese los siguientes registros:
 insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);

--Note que hay dos cuentas, con distinto número de cuenta, de la misma persona.

--4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)
select * from cuentas 
where saldo > 4000;

--5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
--registros)
select numero, saldo from cuentas
where nombre = 'Juan Lopez';

--6- Muestre las cuentas con saldo negativo (1 registro)
select * from cuentas 
where saldo < 0;

--7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
 select * from cuentas
  where numero>=3000;


  ------------------------------------------------------------------------------------------------------------------------------------------------


--19- Tipo de dato (fecha y hora)

  if object_id('empleados') is not null
  drop table empleados;

create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
);

go

-- Seteamos el formato de la fecha para que guarde día, mes y año:
set dateformat dmy;

insert into empleados values('Ana Gomez','22222222','12-01-1980');
insert into empleados values('Bernardo Huerta','23333333','15-03-81');
insert into empleados values('Carla Juarez','24444444','20/05/1983');
insert into empleados values('Daniel Lopez','25555555','2.5.1990');

-- Note que el formato de visualización es "y-m-d".
select * from empleados;

-- Mostramos los datos de los empleados cuya fecha de ingreso es anterior a '01-01-1985':
select * from empleados where fechaingreso<'01-01-1985';

-- Actualizamos el nombre a "Maria Carla Juarez' 
-- del empleado cuya fecha de ingreso es igual a '20/05/1983':
update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';

select * from empleados;

-- Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':
delete from empleados where fechaingreso<>'20/05/1983';

select * from empleados;

--19.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('alumnos') is not null
  drop table alumnos;

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table alumnos(
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
 );

--3- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año": 
 set dateformat 'dmy';

--4- Ingrese un alumno empleando distintos separadores para las fechas:
 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972');

--5- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972');

--6- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
--"fechanacimiento":
 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null);

--7- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
--orden incorrecto "03-15-90":
 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);
--aparece un mensaje de error porque lo lee con el formato día, mes y año y no reconoce el mes 15.

--8- Muestre todos los alumnos que ingresaron antes del '1-1-91'.
select * from alumnos
where fechaingreso < '1-1-91';
--1 registro.

--9- Muestre todos los alumnos que tienen "null" en "fechanacimiento":
 select *from alumnos where fechanacimiento is null;
--1 registro.

--10- Intente ingresar una fecha de ingreso omitiendo los separadores:
 insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null);
--No lo acepta.

--11- Setee el formato de entrada de fechas para que acepte valores "mes-dia-año".
set dateformat 'mdy';
--12- Ingrese el registro del punto 7.
 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null);

 select * from alumnos
 where nombre = 'Carlos';


 ---------------------------------------------------------------------------------------------------------------------------------------


 --20-Ingresar algunos campos (insert into)


 if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15)
);

go

-- Si ingresamos valores para todos los campos, podemos omitir la lista de campos:
insert into libros
  values ('Uno','Richard Bach','Planeta');

-- Podemos ingresar valores para algunos de los campos:
insert into libros (titulo, autor)
  values ('El aleph','Borges');

-- No podemos omitir el valor para un campo declarado "not null",
-- como el campo "titulo" (genera error):
insert into libros (autor,editorial)
  values ('Lewis Carroll','Planeta');

select * from libros;

--21- Ejercicios

--1- Elimine la tabla "cuentas" si existe:
 if object_id('cuentas') is not null
  drop table cuentas;

--2- Cree la tabla :
 create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
 );

--3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
--lista de campos (error, no se debe ingresar para el campo identity):
 insert into cuentas
  values (1,'25666777','Juan Perez',2500.50);

--4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
--campo "identity"):
 insert into cuentas
  values ('25666777','Juan Perez',2500.50);

--5- Ingrese un registro omitiendo algún campo que admitan valores nulos.
 insert into cuentas (numero,documento,nombre)
  values (5,'28999777','Luis Lopez');

--6- Intente ingresar un registro con valor para el campo "numero" (error):
 insert into cuentas (numero,documento,nombre,saldo)
  values (5,'28999777','Luis Lopez',34000);

--7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)
 insert into cuentas (numero,documento,nombre)
  values (5,'28999777','Luis Lopez','12345');

--8- Intente ingresar un registro sin valor para el campo "documento" (error)
 insert into cuentas (numero,documento,nombre)
  values (5,null,'Luis Lopez')

--9- Vea los registros ingresados:
 select * from libros;


 --------------------------------------------------------------------------------------------------------------------------------


 --21- Valores por defecto (default)

 if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
);

go

-- Ingresamos un registro omitiendo los valores para el campo "autor" y "cantidad":
insert into libros (titulo,editorial,precio)
	values('Java en 10 minutos','Paidos',50.40);

select * from libros;

-- Si ingresamos un registro sin valor para el campo "precio", 
-- que admite valores nulos, se ingresará "null" en ese campo:
insert into libros (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');

select * from libros;

-- Visualicemos la estructura de la tabla:
exec sp_columns libros;

-- Podemos emplear "default" para dar el valor por defecto a algunos campos:
insert into libros (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);

select * from libros;

-- Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:
insert into libros default values;

select * from libros;

-- Podemos ingresar el valor "null" en el campo "cantidad":
insert into libros (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);

--21.1 Ejercicios

--1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

--2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

--4- Vea la información de las columnas "COLUMN_DEF" y "IS_NULLABLE":
 exec sp_columns visitantes;

--5- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
--cláusula "default":
 insert into visitantes (nombre, domicilio, montocompra)
  values ('Susana Molina','Colon 123',59.80);
 insert into visitantes (nombre, edad, ciudad, mail)
  values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
 select * from visitantes;

--6- Use la palabra "default" para ingresar valores en un insert.
insert into visitantes(nombre, edad, ciudad) values ('Anneury',default,'Salcedo');

--7- Ingrese un registro con "default values".
insert into visitantes default values

select * from visitantes


------------------------------------------------------------------------------------------------------------------------------------------


--22- Columnas calculadas (operadores aritméticos y de concatenación)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

-- Queremos saber el monto total en dinero de cada libro: 
select titulo, precio,cantidad,
  precio*cantidad
  from libros;

-- Conocer el precio de cada libro con un 10% de descuento:
select titulo,precio,
  precio-(precio*0.1)
  from libros;

-- Actualizar los precios con un 10% de descuento:
update libros set precio=precio-(precio*0.1);

select * from libros;

-- Queremos una columna con el título, el autor y la editorial de cada libro:
select titulo+'-'+autor+'-'+editorial
  from libros;

--22.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id ('articulos') is not null
  drop table articulos;

--2- Cree la tabla:
 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

--4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
--precios empleando operadores aritméticos.
update articulos set precio = precio+(precio*0.15)
select * from articulos

--5- Vea el resultado:
 select * from articulos;

--6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
--separados por coma.
select nombre+'-'+descripcion from articulos;
--7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")
update articulos set cantidad = cantidad -5
where nombre = 'teclado';
select * from articulos;


-----------------------------------------------------------------------------------------------------------------------------------------


--23- Alias

if object_id('agenda') is not null
  drop table agenda;

create table agenda(
  nombre varchar(30),
  domicilio varchar(30),
  telefono varchar(11)
);

go

insert into agenda
  values('Juan Perez','Avellaneda 908','4252525');
insert into agenda
  values('Marta Lopez','Sucre 34','4556688');
insert into agenda
  values('Carlos Garcia','Sarmiento 1258',null);

select nombre as NombreYApellido,
  domicilio,telefono
  from agenda;

select nombre as 'Nombre y apellido',
  domicilio,telefono
  from agenda;


--23.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id ('libros') is not null
  drop table libros;

--2- Cree la tabla:
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

--4- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto total" en la 
--que calcule el monto total en dinero de cada libro (precio por cantidad)
select titulo, autor, editorial, precio, cantidad, precio * cantidad as 'Monto Total' from libros

--5- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas 
--extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
--con un 10% de descuento con el encabezado "precio final".
select titulo, autor, editorial, precio, precio*0.10 as 'Descuento', precio + precio*0.10 as 'Precio Final' from libros

--6- Muestre una columna con el título y el autor concatenados con el encabezado "Título y autor"
select titulo+'--'+autor as 'Titulo y Autor' from libros


--------------------------------------------------------------------------------------------------------------------------------------------------


--25-Funciones para el manejo de cadenas

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, empleando la función "substring()":
select substring(titulo,1,12) as titulo
  from libros;

-- Mostramos sólo los 12 primeros caracteres de los títulos de los libros y
-- sus autores, ahora empleando la función "left()":
select left(titulo,12) as titulo
  from libros;

-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres con un solo decimal, empleando la función "str":
select titulo,
  str(precio,6,1)
  from libros;

-- Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena
-- de caracteres especificando un solo argumento:
select titulo,
  str(precio)
  from libros;

-- Mostramos los títulos, autores y editoriales de todos libros, al último
-- campo lo queremos en mayúsculas:
select titulo, autor, upper(editorial)
   from libros;


----------------------------------------------------------------------------------------------------------------------------------------------


--27-Funciones para el uso de fechas y horas

if object_id ('libros') is not null
  drop table libros;

create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
);

go

set dateformat ymd;

insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
insert into libros 
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

-- Mostramos el título del libro y el año de edición:
select titulo, datepart (year,edicion) from libros;

-- Mostramos el título del libro y el nombre del mes de edición:
select titulo, datename (month,edicion) from libros;

-- Mostramos el título del libro y los años que tienen de editados:
select titulo, datediff(year,edicion,getdate()) from libros;

-- Muestre los títulos de los libros que se editaron el día 9, de cualquier mes de cualquier año:
 select titulo from libros
  where datepart(day,edicion)=9;

--27.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id ('empleados') is not null
  drop table empleados;

--2- Cree la tabla:
 create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 );

--3- Ingrese algunos registros:
 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

--4- Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento 
--precedido por "DNI Nº " y el sueldo precedido por "$ ".
 select nombre+space(1)+upper(apellido) as 'Nombre y Apellido',
  stuff(documento,1,0,'DNI Nº ') as documento,
  stuff(sueldo,1,0,'$ ') as sueldo from empleados;

--5- Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".
 select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados;

--6- Muestre los nombres y apellidos de los empleados que cumplen años en el mes "october" (3 
--registros)
 select nombre,apellido from empleados
  where datename(month,fechanacimiento)='october';

--7- Muestre los nombres y apellidos de los empleados que ingresaron en un determinado año (2 
--registros).
 select nombre,apellido from empleados
  where datepart(year,fechaingreso)=2000; 


------------------------------------------------------------------------------------------------------------------------------------------------

--28- Ordenar registros (order by)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
);

go

insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);

-- Recuperamos los registros ordenados por el título:
select * from libros
 order by titulo;

-- Ordenamos los registros por el campo "precio", referenciando el campo
-- por su posición en la lista de selección:
select titulo,autor,precio
  from libros order by 3;

-- Los ordenamos por "editorial", de mayor a menor empleando "desc":
select * from libros
  order by editorial desc;

-- Ordenamos por dos campos:
 select * from libros
  order by titulo,editorial;

-- Ordenamos en distintos sentidos:
 select * from libros
  order by titulo asc, editorial desc;

-- Ordenamos por un campo que no se lista en la selección:
 select titulo, autor
  from libros
  order by precio;

-- Ordenamos por un valor calculado:
 select titulo, autor, editorial,
        precio+(precio*0.1) as 'precio con descuento'
   from libros
   order by 4;


--28.1 Ejercicios

--1- Elimine la tabla "visitas", si existe:
 if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
);

--3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fecha)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fecha)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

--4- Ordene los registros por fecha, en orden descendente.
select * from visitas
order by fecha desc;

--5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
--del mes (descendente)
select nombre, pais, datename(month, fecha) as 'Mes' from visitas
order by pais asc, datename(month, fecha) desc;

--6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la 
--hora.
select pais, datename(month, fecha) as 'Mes', datename(day,fecha) as 'Dia', datename(hour, fecha) as 'Hora' from visitas
order by datename(month, fecha), datename(day, fecha), datename(hour, fecha);

--7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
--registros)

select mail, pais from visitas
where datename(month,fecha)= 'Octubre'
order by 2


-----------------------------------------------------------------------------------------------------------------------------------------------------


--29- Operadores lógicos ( and - or - not)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','Borges','Planeta',39.50);
insert into libros
  values('Java en 10 minutos','Mario Molina','Planeta',50.50);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Paidos',16.80);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',19.50);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',18.40);

-- Recuperamos los libros cuyo autor sea igual a "Borges" y 
-- cuyo precio no supere los 20 pesos:
select * from libros
  where (autor='Borges') and
  (precio<=20);

-- Seleccionamos los libros cuyo autor es "Borges" y/o cuya editorial es "Planeta":
select * from libros
  where autor='Borges' or
  editorial='Planeta';

-- Recuperamos los libros cuya editorial NO es "Planeta":
 select * from libros
  where not editorial='Planeta';

-- Veamos cómo el uso de paréntesis hace que SQL Server evalúe en forma diferente
-- ciertas consultas aparentemente iguales:
 select * from libros
  where (autor='Borges') or
  (editorial='Paidos' and precio<20);

 select * from libros
  where (autor='Borges' or editorial='Paidos') and
  (precio<20);

--29.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
 );

--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,100);
 insert into medicamentos
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos
  values('Amoxidal 500','Bayer',15.60,100);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,200);
 insert into medicamentos
  values('Bayaspirina','Bayer',2.10,150); 
 insert into medicamentos
  values('Amoxidal jarabe','Bayer',5.10,250); 

--4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
--menor a 5 (1 registro cumple con ambas condiciones)
select codigo, nombre from medicamentos
where laboratorio = 'Roche' and precio < 5; 

--5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
 select * from medicamentos
  where laboratorio='Roche' or
  precio<5;

--Note que el resultado es diferente al del punto 4, hemos cambiado el operador de la sentencia 
--anterior.

--6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 
--registro)
select * from medicamentos 
where not laboratorio = 'Bayer' and  cantidad = 100;

--7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100;

--Analice estas 2 últimas sentencias. El operador "not" afecta a la condición a la cual antecede, no a 
--las siguientes. Los resultados de los puntos 6 y 7 son diferentes.

--8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
--registro eliminado)
delete from medicamentos 
where laboratorio = 'Bayer' and precio > 10;

--9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 
--registro afectado)
update medicamentos set cantidad = 200
where laboratorio = 'Roche' and precio > 5;

select * from medicamentos;

--10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros 
--borrados)

delete from medicamentos 
where laboratorio = 'Bayer' or precio < 3;


-----------------------------------------------------------------------------------------------------------------------------------------------------


--30- Otros operadores relacionales (is null)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros (titulo,autor,precio)
  values('Antología poética','Borges',25.50);
insert into libros (titulo,autor,precio)
  values('Java en 10 minutos','Mario Molina',45.80);
insert into libros (titulo,autor)
  values('Martin Fierro','Jose Hernandez');
insert into libros (titulo,autor)
  values('Aprenda PHP','Mario Molina');

select * from libros
  where editorial is null;

select * from libros
  where editorial is not null;


--30.1 Ejercicio

--1- Elimine la tabla, si existe;
 if object_id('peliculas') is not null
  drop table peliculas;

--2- Créela con la siguiente estructura:
 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

--3- Ingrese algunos registros:
 insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita',null,120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

--4- Recupere las películas cuyo actor sea nulo (2 registros)
select * from peliculas
where actor is null;

--5- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)
update peliculas set duracion = 0
where duracion is null;
select * from peliculas
--6- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)
delete from peliculas
where actor is null;

select * from peliculas


-------------------------------------------------------------------------------------------------------------------------------------------


--31- 	Otros operadores relacionales (between)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',25.90);
insert into libros (titulo,autor,precio)
  values('Antología poética','Borges',32);
insert into libros (titulo,autor,precio)
  values('Java en 10 minutos','Mario Molina',45.80);
insert into libros (titulo,autor,precio)
  values('Martin Fierro','Jose Hernandez',40);
insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',56.50);

-- Recuperamos los registros cuyo precio esté entre 20 y 40 empleando "between":
select * from libros
  where precio between 20 and 40;

-- Para seleccionar los libros cuyo precio NO esté entre un intervalo de valores
-- antecedemos "not" al "between":
select * from libros
  where precio not between 20 and 35;


--31.1 Ejercicios

--1- Elimine la tabla "visitas", si existe:
 if object_id('visitas') is not null
  drop table visitas;

--2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
);

--3- Ingrese algunos registros:
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20');
 insert into visitas (nombre,mail,pais,fechayhora)
  values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');
 insert into visitas (nombre,mail,pais)
  values ('Federico1','federicogarcia@xaxamail.com','Argentina');

--4- Seleccione los usuarios que visitaron la página entre el '2006-09-12' y '2006-10-11' (5 
--registros)
 select * from visitas
  where fechayhora between '2006-09-12' and '2006-10-11';
--Note que incluye los de fecha mayor o igual al valor mínimo y menores al valor máximo, y que los 
--valores null no se incluyen.

--5- Recupere las visitas cuyo número se encuentra entre 2 y 5 (4 registros)
--Note que incluye los valores límites. 
select * from visitas
where numero between 2 and 5;


--------------------------------------------------------------------------------------------------------------------------------------


--32--Otros operadores relacionales (in)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(20),
  precio decimal(6,2),
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Cervantes y el quijote','Borges','Paidos',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros (titulo,precio)
  values('Antología poética',32);
insert into libros (titulo,autor,precio)
  values('Martin Fierro','Jose Hernandez',40);
insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',56.50);

select * from libros
  where autor in('Borges','Paenza');

select * from libros
  where autor not in ('Borges','Paenza');

--32.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 );

--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01');
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01');
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01');
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01');
 insert into medicamentos 
  values('Bayaspirina','Bayer',2.10,150,'2019-12-01'); 
 insert into medicamentos 
  values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01'); 
   
--4- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" 
--empleando el operador "in" (4 registros)
select nombre,precio from medicamentos
where laboratorio in('Bayer','Bago');

--5- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y 
--luego el operador "in" (2 registros):
 select * from medicamentos
  where cantidad between 1 and 5;
 select * from medicamentos
  where cantidad in (1,2,3,4,5);
--Note que es más conveniente emplear, en este caso, el operador ""between".


--------------------------------------------------------------------------------------------------------------------------------------------------


--33-Búsqueda de patrones (like - not like)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);

-- Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":
select * from libros
  where autor like '%Borges%';

-- Seleccionamos los libros cuyos títulos comienzan con la letra "M":
select * from libros
  where titulo like 'M%';

-- Seleccionamos todos los títulos que NO comienzan con "M":
select * from libros
  where titulo not like 'M%';

-- Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe 
-- "Carroll" o "Carrolt", podemos emplear el comodín "_" (guión bajo) y establecer
-- la siguiente condición:
select * from libros
  where autor like '%Carrol_';

-- Buscamos los libros cuya editorial comienza con las letras entre la "P" y la "S":
select titulo,autor,editorial
  from libros
  where editorial like '[P-S]%';

-- Seleccionamos los libros cuya editorial NO comienza con las letras "P" ni "N":
select titulo,autor,editorial
  from libros
  where editorial like '[^PN]%';

-- Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:
select titulo,precio from libros
  where precio like '1_.%';

-- Recuperamos los libros que NO incluyen centavos en sus precios:
select titulo,precio from libros
  where precio like '%.00';

--33.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
 set dateformat 'ymd';
--3- Ingrese algunos registros:
 insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

--4- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)
select * from empleados
where nombre like '%Perez%';

--5- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)
select * from empleados
where domicilio like 'Co%8%';

--6- Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 (4 registros)
select * from  empleados 
where documento like '%[02468]';

--7- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y cuyo nombre finalice en 
--"ez" (2 registros)
select  * from empleados
where documento not like '[^13]%' and nombre like '%ez';
--8- Recupere todos los nombres que tengan una "y" o una "j" en su nombre o apellido (3 registros)
select nombre from empleados 
where nombre like '%[yj]%';

--9- Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o 
--"G" y tengan 8 caracteres (3 registros)
	select nombre,seccion from empleados
	where seccion like '[GS]_______';
--10- Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con 
--"S" o "G" (2 registros)
select nombre, seccion from empleados
where seccion not like '[GS]%';
--11- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 
--registros)
select nombre,sueldo from empleados
where sueldo not like '%.00';

--12- Muestre los empleados que hayan ingresado en "1990" (3 registros)
select * from empleados
where fechaingreso like '%1990%';


-------------------------------------------------------------------------------------------------------------------------------------


--34-Contar registros (count)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Emece',15.90);
insert into libros
  values('Antología poética','J. L. Borges','Planeta',null);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros
  values('Uno','Richard Bach','Planeta',20);

-- Averiguemos la cantidad de libros usando la función "count()":
select count(*)
  from libros;

-- Contamos los libros de editorial "Planeta":
select count(*)
  from libros
  where editorial='Planeta';

-- Contamos los registros que tienen precio (sin tener en cuenta 
-- los que tienen valor nulo),
select count(precio)
  from libros;

--34.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );

 set dateformat 'ymd';
--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

--4- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)
select count(*)
from medicamentos;

--5- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)
select count(laboratorio)
from medicamentos;

--6- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen cantidad 
--distinto a "null", disponer alias para las columnas.
 select count(precio) as 'Con precio',
  count(cantidad) as 'Con cantidad'
  from medicamentos;

--7- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 
--registros)
select count(precio) from medicamentos
where laboratorio like 'B%';



--8- Cuente la cantidad de medicamentos con número de lote distitno de "null" (0 registros)
select count(numerolote) from medicamentos


--------------------------------------------------------------------------------------------------------------------------------------------------


--35- Contar registros (count_big)

if object_id ('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
);

insert into libros values('El aleph','Borges','Emece',15.90);
insert into libros values('Antología poética','Borges','Planeta',null);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
insert into libros values('Matematica estas ahi','Paenza','Siglo XXI',15);
insert into libros values('Martin Fierro','Jose Hernandez',default,40);
insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',null);
insert into libros values('Uno','Richard Bach','Planeta',20);

select count_big(*)
  from libros;

select count_big(*)
  from libros
  where editorial='Planeta';

select count_big(precio)
  from libros;

-- Contamos las editoriales (sin repetir):
select count_big(distinct editorial)
from libros;

--35.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );

 set dateformat 'ymd';
--3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

--4- Muestre la cantidad de registros empleando la función "count_big(*)" (6 registros)
select count_big(*) from medicamentos

--5- Cuente la cantidad de laboratorios distintos (3 registros)
select count_big(distinct laboratorio) from medicamentos;

--6- Cuente la cantidad de medicamentos que tienen precio y cantidad distinto de "null" (5 y 5)
select count_big(precio) as 'Con Precio', count_big(distinct cantidad) as 'Cantidad Null' from medicamentos


-------------------------------------------------------------------------------------------------------------------------------------


--36-Funciones de agrupamiento (count - sum - min - max - avg)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Planeta',15,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',46.00,100);
insert into libros (titulo,autor,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll',220);
insert into libros (titulo,autor,cantidad)
  values('PHP de la A a la Z',default,0);

-- Cantidad total de libros, sumamos las cantidades de cada uno:
 select sum(cantidad)
  from libros;

-- Para conocer cuántos libros tenemos de la editorial "Emece":
 select sum(cantidad)
  from libros
  where editorial='Emece';

-- Queremos saber cuál es el libro más costoso:
 select max(precio)
  from libros;

-- Para conocer el precio mínimo de los libros de "Rowling":
 select min(precio)
  from libros
  where autor like '%Rowling%';

 -- Queremos saber el promedio del precio de los libros referentes a "PHP":
 select avg(precio)
  from libros
  where titulo like '%PHP%';

  --36.1-Ejercicios

 -- 1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3);
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4);
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null);

--4- Muestre la cantidad de empleados usando "count" (9 empleados)
select count_big(*) from empleados;

--5- Muestre la cantidad de empleados con sueldo no nulo de la sección "Secretaria" (2 empleados)
select count_big(distinct sueldo) from empleados
where seccion = 'Secretaria';

--6- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000)
select max(sueldo) as 'Mayor',min(sueldo) as 'Menor' from empleados;

--7- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)
select max(cantidadhijos) as 'Hijos' from empleados
where nombre like '%Perez%';

--8- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es 
--tenido en cuenta)
select avg(sueldo) from empleados
--9- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100)
select avg(sueldo) from empleados
where seccion like '%Secretaria%';

--10- Muestre el promedio de hijos de todos los empleados de "Sistemas" (2)
select avg(cantidadhijos) from empleados
where seccion like '%Sistemas%';

----------------------------------------------------------------------------------------------------------------------------------------


--37-Agrupar registros (group by)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

insert into libros
  values('El aleph','Borges','Planeta',15,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18.20,null);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);
insert into libros
  values('PHP de la A a la Z',null,null,null,0);

-- Cantidad de libros de cada editorial:
select editorial, count(*)
  from libros
  group by editorial;

-- Cantidad libros con precio no nulo de cada editorial:
select editorial, count(precio)
  from libros
  group by editorial;

-- Total en dinero de los libros agrupados por editorial:
select editorial, sum(precio)
  from libros
  group by editorial;

-- Máximo y mínimo valor de los libros agrupados por editorial:
select editorial,
  max(precio) as mayor,
  min(precio) as menor
  from libros
  group by editorial;

-- Promedio del valor de los libros agrupados por editorial:
select editorial, avg(precio)
  from libros
  group by editorial;

-- Contar y agrupar por editorial considerando solamente los libros cuyo precio es menor a 30 pesos:
select editorial, count(*)
  from libros
  where precio<30
  group by editorial;

-- Todos los valores de editorial, incluso los que devuelven cero o "null" en la columna de agregado,
--  debemos emplear la palabra clave "all" al lado de "group by":
select editorial, count(*)
  from libros
  where precio<30
  group by all editorial;

--37.1 Ejercicios

--1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

--2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

--3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

--4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
select count_big(ciudad) from visitantes
group by ciudad;

--5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
select count_big( telefono) from visitantes
group by ciudad;

--6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
select count_big(montocompra) from visitantes
group by sexo;

--7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)
select sexo,ciudad, max(montocompra) as 'Maxima Compra', min(montocompra) as 'Minima Compra' from visitantes
group by sexo,ciudad;
--8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)
select ciudad, avg(montocompra)from visitantes
group by ciudad;
--9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):
select ciudad,count_big(*) from visitantes
where mail is not null and mail<>'no tiene'
group by ciudad;
--10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
--valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)
select ciudad,count_big(*) from visitantes
where mail is not null and mail<>'no tiene'
group by all ciudad;


----------------------------------------------------------------------------------------------------------------------------------------------


--38-Seleccionar grupos (having)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Planeta',35,null);
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece',22.20,200);
insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta',40,200);
insert into libros
  values('Antologia poetica','J.L. Borges','Planeta',null,150);
insert into libros
  values('Aprenda PHP','Mario Molina','Emece',18,null);
insert into libros
  values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);
insert into libros
  values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);
insert into libros
  values('PHP de la A a la Z',null,null,110,0);
insert into libros
  values('Uno','Richard Bach','Planeta',25,null);

--  Cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, 
--  los que devuelvan un valor mayor a 2
select editorial, count(*) from libros
  group by editorial
  having count(*)>2;

-- Promedio de los precios de los libros agrupados por editorial, pero solamente de 
-- aquellos grupos cuyo promedio supere los 25 pesos:
 select editorial, avg(precio) from libros
  group by editorial
  having avg(precio)>25;

-- Cantidad de libros, sin considerar los que tienen precio nulo (where), agrupados por 
-- editorial (group by), sin considerar la editorial "Planeta" (having):
 select editorial, count(*) from libros
  where precio is not null
  group by editorial
  having editorial<>'Planeta';

-- Promedio de los precios agrupados por editorial, 
-- de aquellas editoriales que tienen más de 2 libros:
 select editorial, avg(precio) from libros
  group by editorial
  having count(*) > 2; 

-- Mayor valor de los libros agrupados y ordenados por editorial y seleccionamos las 
-- filas que tienen un valor menor a 100 y mayor a 30:
 select editorial, max(precio) as 'mayor'
  from libros
  group by editorial
  having max(precio)<100 and
  max(precio)>30
  order by editorial;

--38.1- Ejercicios

--1- Elimine la tabla "clientes", si existe:
 if object_id('clientes') is not null
  drop table clientes;

--2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
);

--3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

--4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)
select count_big(*) from clientes
group by ciudad,provincia;

--5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
--menos de 2 clientes (3 filas)
select count(*) from clientes 
group by ciudad, provincia
having count(*) < 2

--6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia 
--(group by), teniendo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
--clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (4 filas 
--devueltas)
select ciudad, count(*) from clientes
where domicilio like '%San Martin%'
group by all ciudad
having count(*)<2 and ciudad <> 'Cordoba';


----------------------------------------------------------------------------------------------------------------------------------


--39- 	Modificador del group by (with rollup)

if object_id('visitantes') is not null
  drop table visitantes;

create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
);

go

insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

-- Cantidad de visitantes por ciudad y el total de visitantes
select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad with rollup;

-- Filas de resumen cuando agrupamos por 2 campos, "ciudad" y "sexo":
 select ciudad,sexo,
  count(*) as cantidad
  from visitantes
  group by ciudad,sexo
  with rollup;

-- Para conocer la cantidad de visitantes y la suma de sus compras agrupados
-- por ciudad y sexo,
 select ciudad,sexo,
  count(*) as cantidad,
  sum(montocompra) as total
  from visitantes
  group by ciudad,sexo
  with rollup;

--39.1 Ejercicios

--1- Elimine la tabla "clientes", si existe:
 if object_id('clientes') is not null
  drop table clientes;

--2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  estado varchar (20),
  pais varchar(20),
  primary key(codigo)
 );

--3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
 insert into clientes
  values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

--4- Necesitamos la cantidad de clientes por país y la cantidad total de clientes en una sola consulta 
--(4 filas)
select pais, count(*) as 'Cantidad' from clientes 
group by pais
with rollup

--Note que la consulta retorna los registros agrupados por pais y una fila extra en la que la columna 
--"pais" contiene "null" y la columna con la cantidad muestra la cantidad total.

--5- Necesitamos la cantidad de clientes agrupados por pais y estado, incluyendo resultados paciales 
--(9 filas)
select pais, estado, count(*) as 'Cantidad' from clientes
group by pais, estado with rollup

--Note que la salida muestra los totales por pais y estado y produce 4 filas extras: 3 muestran los 
--totales para cada pais, con la columna "estado" conteniendo "null" y 1 muestra el total de todos los 
--clientes, con las columnas "pais" y "estado" conteniendo "null".

--6- Necesitamos la cantidad de clientes agrupados por pais, estado y ciudad, empleando "rollup" (16 
--filas)
select pais, estado, ciudad, count(*) as 'Cantidad' from clientes
group by pais, estado, ciudad with rollup

--El resultado muestra los totales por pais, estado y ciudad y genera 9 filas extras: 5 muestran los 
--totales para cada estado, con la columna correspondiente a "ciudad" conteniendo "null", 3 muestran 
--los totales para cada pais, con las columnas "ciudad" y "estado" conteniendo "null" y 1 muestra el 
--total de todos los clientes, con las columnas "pais", "estado" y "ciudad" conteniendo "null".


----------------------------------------------------------------------------------------------------------------------------------------------


--40-	Modificador del group by (with cube)

if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
);

go

insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
insert into empleados
  values ('26666666','Ester Juarez','f','c','Sistemas');
insert into empleados
  values ('27777777','Fabian Torres','m','s','Sistemas');
insert into empleados
  values ('28888888','Gabriela Lopez','f','c','Sistemas');
insert into empleados
  values ('29999999','Hector Garcia','m','c','Administracion');
insert into empleados
  values ('30000000','Ines Torres','f','c','Administracion');
insert into empleados
  values ('11111111','Juan Garcia','m','v','Administracion');
insert into empleados
  values ('12222222','Luisa Perez','f','v','Administracion');
insert into empleados
  values ('31111111','Marcela Garcia','f','s','Administracion');
insert into empleados
  values ('32222222','Nestor Fuentes','m','c','Sistemas');
insert into empleados
  values ('33333333','Oscar Garcia','m','s','Sistemas');
insert into empleados
  values ('34444444','Patricia Juarez','f','c','Administracion');
insert into empleados
  values ('35555555','Roberto Torres','m','c','Sistemas');
insert into empleados
  values ('36666666','Susana Torres','f','c','Administracion');

select sexo,estadocivil,seccion,
  count(*) from empleados
  group by sexo,estadocivil,seccion
  with rollup;

select sexo,estadocivil,seccion,
  count(*) from empleados
  group by sexo,estadocivil,seccion
  with cube;

--40.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('ventas') is not null
  drop table ventas;

--2- Cree la tabla:
 create table ventas(
  numero int identity,
  montocompra decimal(6,2),
  tipopago char(1),--c=contado, t=tarjeta
  vendedor varchar(30),
  primary key (numero)
 );

--3- Ingrese algunos registros:
 insert into ventas
  values(100.50,'c','Marisa Perez');
 insert into ventas
  values(200,'c','Marisa Perez');
 insert into ventas
  values(50,'t','Juan Lopez');
 insert into ventas
  values(220,'c','Juan Lopez');
 insert into ventas
  values(150,'t','Marisa Perez');
 insert into ventas
  values(550.80,'c','Marisa Perez');
 insert into ventas
  values(300,'t','Juan Lopez');
 insert into ventas
  values(25,'c','Marisa Perez');

--4- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "rollup".
--Las agrupaciones de resumen son las siguientes:
--- vendedor (tipopago seteado a "null"), 2 filas y
--- total (todos los campos seteados a "null"), 1 fila
select tipopago, vendedor, count(*) as 'Cantidad' from ventas
group by tipopago, vendedor
with rollup;

--5- Agrupe por "tipopago" y "vendedor" y cuente la cantidad empleando "cube".
--Las agrupaciones de resumen son las siguientes:
--- vendedor (tipopago seteado a "null"), 2 filas,
--- total (todos los campos seteados a "null"), 1 fila y
--- tipopago (vendedor seteado a "null"), 2 filas.
select tipopago, vendedor, count(*) as 'Cantidad' from ventas
group by tipopago, vendedor
with cube;


----------------------------------------------------------------------------------------------------------------------------------------------------


--41- Función grouping

if object_id('visitantes') is not null
  drop table visitantes;

create table visitantes(
  nombre varchar(30),
  sexo char(1),
  ciudad varchar(20)
);

go 

insert into visitantes values('Susana Molina', 'f', 'Cordoba');
insert into visitantes values('Marcela Mercado', 'f','Cordoba');
insert into visitantes values('Roberto Perez','f',null);
insert into visitantes values('Alberto Garcia','m','Cordoba');
insert into visitantes values('Teresa Garcia','f','Alta Gracia');

-- Contamos la cantidad de visitantes agrupando por ciudad y empleando "rollup":
select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad
  with rollup;

-- Contamos la cantidad de visitantes agrupando por ciudad y empleando "rollup"
-- empleando grouping:
select ciudad,
  count(*) as cantidad,
  grouping(ciudad) as resumen
  from visitantes
  group by ciudad
  with rollup;

--41.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20),
  primary key (documento)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','m','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','f','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','m','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','m','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez',null,'c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres',null,'s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez','f',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia','m',null,'Administracion');

--4- Cuente la cantidad de empleados agrupados por sexo y estado civil, empleando "rollup".
--Es dificil distinguir los valores de detalle y resumen.
select sexo, estadocivil, count(*) as cantidad from empleados 
group by sexo, estadocivil
with rollup

--5- Realice la misma consulta anterior pero emplee la función "grouping" para los dos campos por los 
--que se agrupa para distinguir los valores de resumen y de detalle.
--Note que las columnas de resumen contienen 1 y las de detalle 0.
select sexo, estadocivil, count(*) as cantidad, grouping(sexo) as 'resumen sexo', grouping(estadocivil) as 'resumen estado civil' from empleados 
group by sexo, estadocivil
with rollup

--6- Realice la misma consulta anterior pero con "cube" en lugar de "rollup", distinguiendo los 
--valores de resumen y de detalle.
--Note que las columnas de resumen contienen 1 y las de detalle 0.
 select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with cube;


  ------------------------------------------------------------------------------------------------------------------------------------------------


  --42-Cláusulas compute y compute by 

 --1- Elimine la tabla si existe:
 if object_id('inmuebles') is not null
  drop table inmuebles;

--2- Créela con la siguiente estructura:
 create table inmuebles (
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2),
  monto decimal (8,2)
 );

--3- Ingrese algunos registros:
 insert into inmuebles
  values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200);
 insert into inmuebles
  values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500);
 insert into inmuebles
  values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500);
 insert into inmuebles
  values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800);
 insert into inmuebles
  values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500);
 insert into inmuebles
  values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200);

--4- Muestre todos los datos y el promedio del monto empleando "compute" (1 resultado parcial)
 select*from inmuebles
 compute min(monto);


--5- Empleando cláusulas "compute" consulte el promedio de las superficies y el total de los montos (2 
--columnas extras)
 select *from inmuebles
  compute avg(superficie),sum(monto);
   select *from inmuebles

   --me da error por eso las dejare vacias
--6- Realice la misma consulta anterior pero empleando "compute by" para obtener resultados parciales 
--por documento,barrio y ciudad.

--7- Realice la misma consulta anterior pero con resultados parciales por documento y barrio (6 
--resultados parciales dobles)

--8- Realice la misma consulta anterior pero con resultados parciales por documento (4 resultados 
--parciales dobles)

--9- Intente realizar la misma consulta anterior pero con resultados parciales por documento y ciudad.
--Aparece un mensaje de error indicando que el subgrupo de campos listados luego del "by" no es 
--correcto.

--10- Combine cláusulas "compute" con "compute by" para averiguar el total de monto a pagar por 
--propietario y el promedio de monto de todos (4 resultados parciales y 1 general)


---------------------------------------------------------------------------------------------------------------------------------------------------------


--43- 	Registros duplicados (distinct)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
);

go

insert into libros
  values('El aleph','Borges','Planeta');
insert into libros
  values('Martin Fierro','Jose Hernandez','Emece');
insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta');
insert into libros
  values('Antologia poetica','Borges','Planeta');
insert into libros
  values('Aprenda PHP','Mario Molina','Emece');
insert into libros
  values('Aprenda PHP','Lopez','Emece');
insert into libros
  values('Manual de PHP', 'J. Paez', null);
insert into libros
  values('Cervantes y el quijote',null,'Paidos');
insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
insert into libros
  values('PHP de la A a la Z',null,null);
insert into libros
  values('Uno','Richard Bach','Planeta');

-- Para obtener la lista de autores sin repetición
select distinct autor from libros;

-- Para obtener la lista de autores conocidos, es decir, no incluyendo "null" 
-- en la lista:
select distinct autor from libros
  where autor is not null;

-- Contamos los distintos autores
select count(distinct autor) as 'Cantidad'
  from libros;

-- Nombres de las editoriales sin repetir:
select distinct editorial from libros;

--  Cantidad de editoriales distintas:
select count(distinct editorial) from libros;

-- Distintos autores de la editorial "Planeta":
select distinct autor from libros
  where editorial='Planeta';

-- Distintos autores que tiene cada editorial empleando "group by":
select editorial,count(distinct autor)
  from libros
  group by editorial;

-- Mostramos los títulos y editoriales de los libros sin repetir 
-- títulos ni editoriales:
select distinct titulo,editorial
  from libros
  order by titulo;

--43.1 Ejercicios

--1- Elimine la tabla "clientes", si existe:
 if object_id('clientes') is not null
  drop table clientes;

--2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

--3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

--4- Obtenga las provincias sin repetir (3 registros)
select distinct provincia from clientes

--5- Cuente las distintas provincias.
select count(provincia) as 'Numero de provincias' from clientes

--6- Se necesitan los nombres de las ciudades sin repetir (6 registros)
select distinct ciudad from clientes;

--7- Obtenga la cantidad de ciudades distintas.
select count(distinct ciudad) from clientes

--8- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
select distinct ciudad from clientes 
where provincia like '%Cordoba%';

--9- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)
select provincia, count(distinct ciudad) as 'Ciudades' from clientes
group by provincia;


---------------------------------------------------------------------------------------------------------------------------------------------------


--44-	Cláusula top

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(20),
  editorial varchar(20)
);

go

insert into libros values ('Uno','Richard Bach','Planeta');
insert into libros values ('El aleph','Borges','Emece');
insert into libros values ('Alicia en el pais...','Carroll','Planeta');
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI');
insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI');
insert into libros values ('Java desde cero','Mario Molina','Emece');
insert into libros values ('Ilusiones','Richard Bach','Planeta');

-- Obtenemos todos los datos de los primeros 2 libros de la tabla:
select top 2 * from libros;

-- Mostramos los títulos y autores de los 3 primeros libros ordenados por autor:
select top 3 titulo,autor 
  from libros
  order by autor;

-- Realizamos la misma consulta anterior pero empleamos la cláusula "with ties", 
-- con lo cual incluiremos en la selección, todos los registros que tengan el
-- mismo autor que el último registro retornado, aunque pasemos de 3:
select top 3 with ties titulo,autor 
  from libros
  order by autor;

-- El 50% de los registros de la tabla libros:
select top 50 percent
  * from libros
  order by autor;

--44.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 );

--3- Ingrese algunos registros:
 insert into empleados
  values ('22222222','Alberto Lopez','c','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','c','Administracion');
 insert into empleados
  values ('24444444','Carlos Fuentes','s','Administracion');
 insert into empleados
  values ('25555555','Daniel Garcia','s','Sistemas');
 insert into empleados
  values ('26666666','Ester Juarez','c','Sistemas');
 insert into empleados
  values ('27777777','Fabian Torres','s','Sistemas');
 insert into empleados
  values ('28888888','Gabriela Lopez',null,'Sistemas');
 insert into empleados
  values ('29999999','Hector Garcia',null,'Administracion');

--4- Muestre los 5 primeros registros (5 registros)
select top 5 * from empleados

--5- Muestre nombre y seccion de los 4 primeros registros ordenados por sección (4 registros)
select top 4 nombre, seccion from empleados
order by seccion;

--6- Realice la misma consulta anterior pero incluya todos los registros que tengan el mismo valor en 
--"seccion" que el último (8 registros)
select top 4 with ties nombre, seccion from empleados 
order by seccion;

--7- Muestre nombre, estado civil y seccion de los primeros 4 empleados ordenados por estado civil y 
--sección (4 registros)
select top 4 nombre, estadocivil, seccion from empleados 
order by estadocivil, seccion;

--8- Realice la misma consulta anterior pero incluya todos los valores iguales al último registro 
--retornado (5 registros)
select top 4 with ties nombre, estadocivil, seccion from empleados
order by estadocivil, seccion;


--------------------------------------------------------------------------------------------------------------------------------------------------


--45- 	Clave primaria compuesta

if object_id('vehiculos') is not null
  drop table vehiculos;

create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime,
  primary key(patente,horallegada)
);

go

insert into vehiculos values('AIC124','a','8:05','12:30');
insert into vehiculos values('CAA258','a','8:05',null);
insert into vehiculos values('DSE367','m','8:30','18:00');
insert into vehiculos values('FGT458','a','9:00',null);
insert into vehiculos values('AIC124','a','16:00',null);
insert into vehiculos values('LOI587','m','18:05','19:55');

-- Si intentamos ingresar un registro con clave primaria repetida:
insert into vehiculos values('LOI587','m','18:05',null);

-- Si ingresamos un registro repitiendo el valor de uno de los campos
-- que forman parte de la clave, si lo acepta:
insert into vehiculos values('LOI587','m','21:30',null);

-- Si intentamos actualizar un registro repitiendo la clave primaria
-- (se genera un error):
update vehiculos set horallegada='8:05'
  where patente='AIC124' and horallegada='16:00';

-- Recordemos que los campos que forman parte de la clave primaria no 
-- aceptan valores nulos, aunque no se haya aclarado en la definición 
-- de la tabla (genera un error):
insert into vehiculos values('HUO690','m',null,null);

-- mostramos la estructura de la tabla 
-- (los campos que forman parte de la clave primaria (patente y horallegada)
--  tienen "NO" en la columna "IS_NULLABLE", es decir, no admiten valores nulos.):
exec sp_columns vehiculos;

--45.1 Ejercicios 

--1- Elimine la tabla si existe:
 if object_id('consultas') is not null
  drop table consultas;

----2- La tabla contiene los siguientes datos:
--  - fechayhora: datetime not null, fecha y hora de la consulta,
--  - medico: varchar(30), not null, nombre del médico (Perez,Lopez,Duarte),
--  - documento: char(8) not null, documento del paciente,
--  - paciente: varchar(30), nombre del paciente,
--  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
-- );

--3- Un médico sólo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
--determinada, varios médicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
--primaria compuesta:
 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

--4- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.
 insert into consultas
  values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI');
 insert into consultas
  values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI');

--5- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.
 insert into consultas
  values ('2006/12/05 8:00','Lopez','12222222','Acosta Betina','PAMI');
 insert into consultas
  values ('2006/12/05 8:00','Duarte','23333333','Fuentes Carlos','PAMI'); 
 insert into consultas
  values ('2006/12/05 8:00','Perez','12222222','Acosta Betina','PAMI');


--6- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.
 insert into consultas
  values ('2006/12/05 8:00','Lopez','12222222','Anneury Sosa','PAMI');


  ---------------------------------------------------------------------------------------------------------------------------------------------------


--47- Restricción default 

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  editorial varchar(15),
  precio decimal(6,2)
);

go

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros (titulo,editorial) values('Aprenda PHP','Emece');

-- Veamos que SQL Server creó automáticamente una restricción "default"
-- para el campo "autor":
exec sp_helpconstraint libros;

drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);

go

-- Agregamos una restricción "default" empleando "alter table" 
-- para que almacene el valor "Desconocido" en el campo "autor":
alter table libros
  add constraint DF_libros_autor
  default 'Desconocido'
  for autor;

-- Veamos la restrición agregada anteriormente con el procedimiento 
-- almacenado "sp_helpcontraint":
exec sp_helpconstraint libros;

insert into libros (titulo,editorial) values('Martin Fierro','Emece');
insert into libros default values;

-- Veamos cómo se almacenaron los registros sin valor explícito
-- para el campo con restricción "default":
select * from libros;

-- Agregamos otra restricción "default" para el campo "precio" 
-- para que almacene el valor 0 en dicho campo:
alter table libros
  add constraint DF_libros_precio
  default 0
  for precio;

exec sp_helpconstraint libros;

--47.1 Ejercicios

--1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

--2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  numero int identity,
  nombre varchar(30),
  edad tinyint,
  domicilio varchar(30),
  ciudad varchar(20),
  montocompra decimal (6,2) not null
 );

--3- Defina una restricción "default" para el campo "ciudad" que almacene el valor "Cordoba" en caso 
--de no ingresar valor para dicho campo:
 alter table visitantes
  add constraint DF_visitantes_ciudad
  default 'Cordoba'
  for ciudad;

--4- Defina una restricción "default" para el campo "montocompra" que almacene el valor "0" en caso de 
--no ingresar valor para dicho campo:
 alter table visitantes
  add constraint DF_visitantes_montocompra
  default 0
  for montocompra;

--5- Ingrese algunos registros sin valor para los campos con restricción "default":
 insert into visitantes
  values ('Susana Molina',35,'Colon 123',default,59.80);
 insert into visitantes (nombre,edad,domicilio)
  values ('Marcos Torres',29,'Carlos Paz');
 insert into visitantes
  values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

--6- Vea cómo se almacenaron los registros:
 select * from visitantes;

--7- Vea las restricciones creadas anteriormente.
--aparecen dos filas, una por cada restricción.

--8- Intente agregar otra restricción "default" al campo "ciudad".
--Aparece un mensaje de error indicando que el campo ya tiene una restricción "default" y sabemos 
--que no puede establecerse más de una restricción "default" por campo.
alter table visitantes
add constraint DF_visitantes_ciudad
default 0
for ciudad

--9- Intente establecer una restricción "default" al campo "identity".
--No se permite.
alter table visitantes 
add constraint DF_vistantes_numero
default 0
for numero


-----------------------------------------------------------------------------------------------------------------------------------------------


--48-	Restricción check

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2)
);

go

insert into libros values ('Uno','Bach','Planeta',22,20);
insert into libros values ('El quijote','Cervantes','Emece',15,13);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);

-- Agregamos una restricción "check" para asegurar que los valores de los campos
-- correspondientes a precios no puedan ser negativos:
alter table libros
  add constraint CK_libros_precios_positivo
  check (preciomin>=0 and preciomay>=0);

update libros set preciomay=48
  where titulo='Aprenda PHP';

delete from libros where titulo='Java en 10 minutos'; 

-- Agregamos la restricción "check" que impida que se ingresen valores 
-- para "preciomay" superiores a "preciomin":
alter table libros
 add constraint CK_libros_preciominmay
 check (preciomay<=preciomin);

exec sp_helpconstraint libros;

insert into libros default values;

select * from libros;

-- Genera un error si intentamos ingresar un preciomin negativo
insert into libros values ('Java Total','Martinez','Cuello',-1,40);

--48.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

--3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
--sueldo:
 alter table empleados
   add constraint CK_empleados_sueldo_positivo
   check (sueldo>0);

   set dateformat 'ymd'; 
--4- Ingrese algunos registros válidos:
 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

--5- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
--valor 5000:
 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000);
--La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

--6- Elimine el registro infractor y vuelva a crear la restricción:
 delete from empleados where sueldo=6000;

 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000); 

--7- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
--fecha actual:
 alter table empleados
   add constraint CK_fechanacimiento_actual
   check (fechanacimiento<getdate());

--8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
--"Administracion" y "Contaduría":
 alter table empleados
   add constraint CK_empleados_seccion_lista
   check (seccion in ('Sistemas','Administracion','Contaduria'));

--9- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.
alter table empleados
	add constraint CK_empleados_cantidadhijos_cantidad
	check(cantidadhijos >= 0 and cantidadhijos <= 15)

--10- Vea todas las restricciones de la tabla (5 filas):
 exec sp_helpconstraint empleados;

--11- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
--Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".
insert into empleados values ('44444444','Anneury Sosa','2000/11/02',0,'Sistemas',-1500);

--12- Intente agregar un registro con fecha de nacimiento futura.
--Mensaje de error.
insert into empleados values ('54444444','Pedro Sanchez','2022/11/04',5,'Administracion',1500);

--13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
--Mensaje de error.
update empleados set cantidadhijos = 21
where seccion like '%Sistemas%'; 

--14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no 
--esté incluido en la lista de permitidos.
--Mensaje de error.
update empleados set seccion = 'Maestro'
where documento like '22222222';

--15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen 
--con la letra "B":
 alter table empleados
   add constraint CK_seccion_letrainicial
   check (seccion like '%B');
--Note que NO se puede establecer esta restricción porque va en contra de la establecida anteriormente 
--para el mismo campo, si lo permitiera, no podríamos ingresar ningún valor para "seccion".


----------------------------------------------------------------------------------------------------------------------------------------------


--49-Deshabilitar restricciones (with check - nocheck)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2)
);

go

insert into libros values ('Uno','Bach','Planeta',22);
insert into libros values ('El quijote','Cervantes','Emece',15);
insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);

-- Agregamos una restricción "check" para asegurar que los precios no puedan ser 
-- negativos, pero como ya tenemos almacenado un precio que infringe la restricción,
-- vamos a especificar que no haya comprobación de datos existentes:
alter table libros
   with nocheck
   add constraint CK_libros_precio_positivo
   check (precio>=0);

-- Si intentamos ingresar un registro con precio negativo, no lo permite.
-- Para que lo permita, debemos dehabilitar la comprobación:
alter table libros
  nocheck constraint CK_libros_precio_positivo;

-- Ingresemos un registro con precio negativo (si lo permite):
insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);

-- Veamos si la restricción está o no habilitada:
-- La columna "status_enabled" nos informa que está deshabilitada (Disabled)
exec sp_helpconstraint libros;

-- Habilitamos la restricción.
-- Si ahora intentamos ingresar un precio negativo SQL Server no lo permitirá.
alter table libros
  check constraint CK_libros_precio_positivo;

select * from libros;

--49.1 Ejercicios

--1- Elimine la tabla (si existe):
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura e ingrese los registros siguientes:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 );

 insert into empleados
  values ('22222222','Alberto Acosta','Sistemas',-10);
 insert into empleados
  values ('33333333','Beatriz Benitez','Recursos',3000);
 insert into empleados
  values ('34444444','Carlos Caseres','Contaduria',4000);

--3- Intente agregar una restricción "check" para asegurarse que no se ingresen valores negativos para 
--el sueldo:
 alter table empleados
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);
--No se permite porque hay un valor negativo almacenado.

--5- Vuelva a intentarlo agregando la opción "with nocheck":
 alter table empleados
 with nocheck
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);

--6- Intente ingresar un valor negativo para sueldo:
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',-2000);
--No es posible a causa de la restricción.

--7- Deshabilite la restricción e ingrese el registro anterior:
 alter table empleados
  nocheck constraint CK_empleados_sueldo_positivo;
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',2000);

--8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
--"Administracion" y "Contaduría":
 alter table empleados
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'));
--No lo permite porque existe un valor fuera de la lista.

--9- Establezca la restricción anterior evitando que se controlen los datos existentes.
alter table empleados 
with nocheck
add constraint CK_empleados_seccion_lista
check(seccion in('Sistemas','Administracion','Contaduria'));

--10- Vea si las restricciones de la tabla están o no habilitadas:
 exec sp_helpconstraint empleados;
--Muestra 2 filas, una por cada restricción.

--11- Habilite la restricción deshabilitada.
alter table empleados 
check constraint CK_empleados_sueldo_positivo

--12- Intente modificar la sección del empleado "Carlos Caseres" a "Recursos".
--No lo permite.
update empleados set seccion = 'Recursos'
where nombre like '%Caseres%';

--13- Deshabilite la restricción para poder realizar la actualización del punto precedente.
alter table empleados 
nocheck constraint CK_empleados_seccion_lista;

update empleados set seccion = 'Recursos'
where nombre like '%Caseres%';


------------------------------------------------------------------------------------------------------------------------------------------------


--50 	Restricción primary key

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
);

go

-- Veamos la restricción "primary key" que creó automáticamente SQL Server:
exec sp_helpconstraint libros;

-- Vamos a eliminar la tabla y la crearemos nuevamente, sin establecer la 
-- clave primaria:
drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
);

go

-- Definimos una restricción "primary key" para nuestra tabla "libros" 
-- para asegurarnos que cada libro tendrá un código diferente y único:
alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

-- Veamos la información respecto a ella:
exec sp_helpconstraint libros;

--41.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

--2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

--3- Ingrese algunos registros, dos de ellos con el mismo número de documento:
 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

--4- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita 
--ni admita valores nulos:
 alter table empleados
 add constraint PK_empleados_documento
 primary key(documento);
--No lo permite porque la tabla contiene datos que no cumplen con la restricción, debemos eliminar (o 
--modificar) el registro que tiene documento duplicado:
 delete from empleados
  where nombre='Carlos Fuentes';

--5- Establezca la restricción "primary key" del punto 4.
alter table empleados 
add constraint PK_empleados_documento
primary key (documento)

--6- Intente actualizar un documento para que se repita.
update empleados set documento = '22222222'
where seccion like 'Ad%';

--No lo permite porque va contra la restricción.

--7-Intente establecer otra restricción "primary key" con el campo "nombre".
alter table empleados 
add constraint PK_empleados_nombre
primary key (nombre);

--No lo permite, sólo puede haber una restricción "primary key" por tabla.

--8- Intente ingresar un registro con valor nulo para el documento.
--No lo permite porque la restricción no admite valores nulos.
insert into empleados values(null,'Anneury Sosa','Sistemas');

--9- Establezca una restricción "default" para que almacene "00000000" en el documento en caso de 
--omitirlo en un "insert".
alter table empleados
add constraint DF_empleados_documento
default '00000000'
for documento;

--10- Ingrese un registro sin valor para el documento.
insert into empleados(nombre,seccion)  values ('Anneury Sosa','Sistemas');

--11- Vea el registro:
 select * from empleados;

--12- Intente ingresar otro empleado sin documento explícito.
--No lo permite porque se duplicaría la clave.
insert into empleados(nombre,seccion)  values ('Anneury Sosa','Sistemas');

--13- Vea las restricciones de la tabla empleados (2 filas):
 exec sp_helpconstraint empleados;


 -----------------------------------------------------------------------------------------------------------------------------------------


--51 Restricción unique

 if object_id('alumnos') is not null
  drop table alumnos;

create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8)
);

go

-- Agregamos una restricción "primary" para el campo "legajo":
alter table alumnos
 add constraint PK_alumnos_legajo
 primary key(legajo);

-- Agregamos una restricción "unique" para el campo "documento":
alter table alumnos
 add constraint UQ_alumnos_documento
 unique (documento);

insert into alumnos values('A111','Lopez','Ana','22222222');
insert into alumnos values('A123','Garcia','Maria','23333333');

exec sp_helpconstraint alumnos;

--51.1 Ejercicios

--1- Elimine la tabla si existe:
 if object_id('remis') is not null
  drop table remis;

--2- Cree la tabla con la siguiente estructura:
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

--3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
 insert into remis values('ABC123','Renault clio','1990');
 insert into remis values('DEF456','Peugeot 504','1995');
 insert into remis values('DEF456','Fiat Duna','1998');
 insert into remis values('GHI789','Fiat Duna','1995');
 insert into remis values(null,'Fiat Duna','1995');

--4- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
--valores repetidos.
alter table remis
add constraint UQ_remis_patente
unique (patente);
--No se puede porque hay valores duplicados.

--5- Elimine el registro con patente duplicada y establezca la restricción.
--Note que hay 1 registro con valor nulo en "patente".
delete from remis 
where numero = 3;

alter table remis 
add constraint UQ_remis_patente
unique (patente);
select * from remis
--6- Intente ingresar un registro con patente repetida (no lo permite)
insert into remis values ('DEF456','Fiat Duna','2000');

--7- Intente ingresar un registro con valor nulo para el campo "patente".
--No lo permite porque la clave estaría duplicada.
insert into remis values (null,'Honda Accord', '2020');

--8- Muestre la información de las restricciones:
 exec sp_helpconstraint remis;


 -------------------------------------------------------------------------------------------------------------------------------------------


 --52-	Información de restricciones (sp_helpconstraint)

 if object_id('alumnos') is not null
  drop table alumnos;

create table alumnos(
  legajo char(4) not null,
  apellido varchar(20),
  nombre varchar(20),
  documento char(8),
  domicilio varchar(30),
  ciudad varchar(30),
  notafinal decimal(4,2)
);

go

-- Agregamos una restricción "primary" para el campo "legajo":
alter table alumnos
 add constraint PK_alumnos_legajo
 primary key(legajo);

-- Agregamos una restricción "unique" para el campo "documento"
alter table alumnos
 add constraint UQ_alumnos_documento
 unique (documento);

-- Agregamos una restricción "check" para que el campo "notafinal" 
-- admita solamente valores entre 0 y 10:
alter table alumnos
 add constraint CK_alumnos_nota
 check (notafinal>=0 and notafinal<=10);

-- Agregamos una restricción "default" para el campo "ciudad":
alter table alumnos
 add constraint DF_alumnos_ciudad
 default 'Cordoba'
 for ciudad;

 -- Veamos las restricciones:
exec sp_helpconstraint alumnos;

-- Deshabilitamos la restricción "check":
alter table alumnos
  nocheck constraint CK_alumnos_nota;

 -- Veamos las restricciones:
exec sp_helpconstraint alumnos;


-----------------------------------------------------------------------------------------------------------------------------------------------


--53 	Eliminar restricciones (alter table - drop)

if object_id('libros') is not null
  drop table libros;

create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
);

go

-- Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos 
-- que cada libro tendrá un código diferente y único:
alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

-- Definimos una restricción "check" para asegurarnos que el precio no será negativo:
alter table libros
 add constraint CK_libros_precio
 check (precio>=0);

-- Definimos una restricción "default" para el campo "autor" para que almacene "Desconocido":
alter table libros
 add constraint DF_libros_autor
 default 'Desconocido'
 for autor;

-- Definimos una restricción "default" para el campo "precio" para que almacene 0:
alter table libros
 add constraint DF_libros_precio
 default 0
 for precio;

-- Vemos las restricciones:
exec sp_helpconstraint libros;

-- Eliminamos la restricción "DF_libros_autor":
alter table libros
  drop DF_libros_autor;

-- Eliminamos la restricción "PK_libros_codigo":
alter table libros
  drop PK_libros_codigo;

exec sp_helpconstraint libros;

--53.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--3- Establezca una restricción "check" que admita solamente los valores "a" y "m" para el campo 
--"tipo":
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

--4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
--ingresarse valor para dicho campo:
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

--5- Establezca una restricción "check" para el campo "patente" para que acepte 3 letras seguidas de 3 
--dígitos:
 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

--6- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada":
 alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente,horallegada);

--7- Ingrese un vehículo:
 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

--8- Intente ingresar un registro repitiendo la clave primaria:
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);
--No se permite.

--9- Ingrese un registro repitiendo la patente pero no la hora de llegada:
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

--10- Ingrese un registro repitiendo la hora de llegada pero no la patente:
 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

--11- Vea todas las restricciones para la tabla "vehiculos":
 exec sp_helpconstraint vehiculos;
--aparecen 4 filas, 2 correspondientes a restricciones "check", 1 a "default" y 1 a "primary key".

--12- Elimine la restricción "default" del campo "tipo".
alter table vehiculos
drop CK_vehiculos_tipo;

--13- Vea si se ha eliminado:
 exec sp_helpconstraint vehiculos;

--14- Elimine la restricción "primary key" y "check".
alter table vehiculos
drop PK_vehiculos_patentellegada, CK_vehiculos_patente_patron;

--15- Vea si se han eliminado:
 exec sp_helpconstraint vehiculos;


 -------------------------------------------------------------------------------------------------------------------------------------------------------


 --54-Crear y asociar reglas (create rule - sp_bindrule)

 if object_id('empleados') is not null
  drop table empleados;

create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20),
  fechaingreso datetime,
  fechanacimiento datetime,
  hijos tinyint,
  sueldo decimal(6,2)
);

go

-- Recuerde que las reglas son objetos independientes de las tablas (no se eliminan al 
-- borrar la tabla), así que debemos eliminarlas con las siguientes intrucciones:
if object_id ('RG_documento_patron') is not null
  drop rule RG_documento_patron;
if object_id ('RG_empleados_seccion') is not null
  drop rule RG_empleados_seccion;
if object_id ('RG_empleados_fechaingreso') is not null
  drop rule RG_empleados_fechaingreso;
if object_id ('RG_hijos') is not null
  drop rule RG_hijos;
if object_id ('RG_empleados_sueldo') is not null
  drop rule RG_empleados_sueldo;
if object_id ('RG_empleados_sueldo2') is not null
  drop rule RG_empleados_sueldo2;

go

insert into empleados 
   values('22222222','Ana Acosta','Contaduria','1990-10-10','1972-10-10',2,700);
insert into empleados 
   values('23333333','Carlos Costa','Contaduria','1990-12-10','1972-05-04',0,750);
insert into empleados 
   values('24444444','Daniel Duarte','Sistemas','1995-05-05','1975-10-06',1,880);
insert into empleados 
   values('25555555','Fabiola Fuentes','Secretaria','1998-02-11','1978-02-08',3,550);
insert into empleados 
   values('26666666','Gaston Garcia','Secretaria','1999-05-08','1981-01-01',3,670);
insert into empleados 
   values('27777777','Ines Irala','Gerencia','2000-04-10','1985-12-12',0,6000);

go

-- Creamos una regla que establezca un patrón para el documento:
create rule RG_documento_patron
   as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';

go

-- Ejecutamos el procedimiento almacenado del sistema "sp_help" para 
-- ver si la regla creada anteriormente fue creada:
exec sp_help;

-- Ejecutamos el procedimiento almacenado del sistema "sp_helpconstraint" para ver si está asociada la regla
-- a algún campo de "empleados" (No aparece porque aún no la asociamos):
exec sp_helpconstraint empleados;

-- Si ingresamos un registro con un documento que no cumpla la regla, SQL Server lo acepta porque la regla
-- aún no está asociada al campo:
insert into empleados values('ab888888','Juan Juarez','Secretaria','2001-04-11','1986-11-12',0,600);

-- Asociamos la regla "RG_documento_patron" al campo "documento":
exec sp_bindrule RG_documento_patron, 'empleados.documento';

-- Volvemos a ejecutar "sp_helpconstraint" (aparece la regla):
exec sp_helpconstraint empleados;

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "seccion":
create rule RG_empleados_seccion
 as @seccion in ('Secretaria','Contaduria','Sistemas','Gerencia');

go

-- La asociamos al campo "seccion":
exec sp_bindrule RG_empleados_seccion, 'empleados.seccion';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "fechaingreso",
-- para que no sea posterior a la fecha actual:
create rule RG_empleados_fechaingreso
 as @fecha <= getdate();

go

-- Asociamos la regla anteriormente creada a los campos "fechaingreso" y "fechanacimiento":
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechaingreso';
exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechanacimiento';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en el campo "hijos":
create rule RG_hijos
 as @hijos between 0 and 20;

go

-- La asociamos al campo "hijos":
exec sp_bindrule RG_hijos, 'empleados.hijos';

go

-- Creamos una regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo
 as @sueldo>0 and @sueldo<= 5000;

go

-- La asociamos al campo "sueldo":
exec sp_bindrule RG_empleados_sueldo, 'empleados.sueldo';

go

-- Creamos otra regla para restringir los valores que se pueden ingresar en un campo "sueldo":
create rule RG_empleados_sueldo2
 as @sueldo>0 and @sueldo<= 7000;

go
 
-- La asociamos al campo "sueldo" (la nueva regla reeemplaza la asociación anterior):
exec sp_bindrule RG_empleados_sueldo2, 'empleados.sueldo';

insert into empleados values('29999999','Luis Lopez','Secretaria','2002-03-03','1990-09-09',0,6000);

exec sp_help;

exec sp_helpconstraint empleados;

--54.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_horallegada') is not null
   drop rule RG_horallegada;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;
 if object_id ('RG_menor_fechaactual') is not null
   drop rule RG_menor_fechaactual;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--4- Ingrese algunos registros:
 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null);
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10');
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null);
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null);

--5- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
--seguidas de 3 dígitos):
 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'

--6- Ejecute el procedimiento almacenado del sistema "sp_help" para ver que la regla creada 
--anteriormente existe:
 exec sp_help;

--7- Ejecute el procedimiento almacenado del sistema "sp_helpconstraint" para ver que la regla creada 
--anteriormente no está asociada aún a ningún campo de la tabla "vehiculos".
exec sp_helpconstraint vehiculos;

--8-  Asocie la regla al campo "patente":
--Note que hay una patente que no cumple la regla, SQL Server NO controla los datos existentes, pero 
--si controla las inserciones y actualizaciones:
exec sp_bindrule RG_patente_patron, 'vehiculos.patente';

 select * from vehiculos;

--9- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla.
--aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.
 insert into vehiculos values ('BCD2','m','1990-02-01 12:00',null);

--10- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
--ingresarse los caracteres "a" y "m".
create rule RG_tipo_controlador
as @tipo= 'a' or @tipo='m';

--11- Asocie la regla al campo "tipo".
exec sp_bindrule RG_tipo_controlador, 'vehiculos.tipo';

--12- Intente actualizar un registro cambiando el valor de "tipo" a un valor que no cumpla con la 
--regla anterior.
update vehiculos set tipo = 'F'
where patente = 'CC1234';
--No lo permite.

--13- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
--que solamente puedan ingresarse los caracteres "a", "c" y "m".
create rule RG_vehiculos_tipo2
as @tipo2 = 'a' or @tipo2 = 'c' or @tipo2 = 'm';

--14- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
--asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".
exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';

--15- Actualice el registro que no pudo actualizar en el punto 12:
 update vehiculos set tipo='c' where patente='AAA111';

--16- Cree una regla que permita fechas menores o iguales a la actual.
create rule RG_menor_fechaactual
as @fecha <= getdate();

--17- Asocie la regla anterior a los campos "horallegada" y "horasalida":
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada';
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida';

--18- Ingrese un registro en el cual la hora de entrada sea posterior a la hora de salida:
 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

--19- Intente establecer una restricción "check" que asegure que la fecha y hora de llegada a la playa 
--no sea posterior a la fecha y hora de salida:
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);
--No lo permite porque hay un registro que no cumple la restricción.

--20- Elimine dicho registro:
 delete from vehiculos where patente='NOP555';

--21- Establezca la restricción "check" que no pudo establecer en el punto 19:
 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida);

--22- Cree una restricción "default" que almacene el valor "b" en el campo "tipo:
 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo;
--Note que esta restricción va contra la regla asociada al campo "tipo" que solamente permite los 
--valores "a", "c" y "m". SQL Server no informa el conflicto hasta que no intenta ingresar el valor 
--por defecto.

--23- Intente ingresar un registro con el valor por defecto para el campo "tipo":
 insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30');
--No lo permite porque va contra la regla asociada al campo "tipo".

--24- Vea las reglas asociadas a "empleados" y las restricciones aplicadas a la misma tabla ejecutando 
--"sp_helpconstraint".
exec sp_helpconstraint vehiculos;
--Muestra 1 restricción "check", 1 restricción "default" y 4 reglas asociadas.


--------------------------------------------------------------------------------------------------------------------------------


--55- Eliminar y desasociar reglas (sp_unbindrule - drop rule)

if object_id ('empleados') is not null
  drop table empleados;

if object_id ('RG_sueldo_100a1000') is not null
   drop rule RG_sueldo_100a1000;

create table empleados(
  documento char(8),
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
);

go

-- Creamos una regla para restringir los valores que se pueden ingresar
-- en un campo "sueldo":
create rule RG_sueldo_100a1000
   as @sueldo between 100 and 1000;

go

-- Asociamos la regla creada anteriormente al campo "sueldo":
exec sp_bindrule RG_sueldo_100a1000, 'empleados.sueldo';

-- Vemos si la regla está asociada a algún campo de "empleados":
exec sp_helpconstraint empleados;

-- Quitamos la asociación:
exec sp_unbindrule 'empleados.sueldo';

-- Ahora que hemos quitado la asociación, podemos ingresar el valor
-- "1200" en el campo "sueldo":
insert into empleados values ('30111222','Pedro Torres','Contaduria',1200);

-- Vemos si la regla está asociada a algún campo de "empleados":
exec sp_helpconstraint empleados;

-- Ejecutamos el procedimiento "sp_help" para verificar que la regla aún existe:
exec sp_help;

-- Ahora si podemos borrar la regla:
drop rule RG_sueldo_100a1000;

--55.1 Ejercicios

--1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

--2- Elimine las siguientes reglas, si existen:
 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron;
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo;
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2;

--3- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

--4- Cree una regla para restringir los valores que se pueden ingresar en un campo "patente" (3 letras 
--seguidas de 3 dígitos):
 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]';

--5-Asocie la regla al campo "patente":
 exec sp_bindrule RG_patente_patron,'vehiculos.patente';

--6- Intente ingresar un registro con valor para el campo "patente" que no cumpla con la regla:
 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null);
--aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.

--7- Cree otra regla que controle los valores para el campo "tipo" para que solamente puedan 
--ingresarse los caracteres "a" y "m":
 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

--8- Asocie la regla al campo "tipo":
 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo';

--9- Intente ingresar un registro con el valor 'c' para "tipo":
 insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);
--No lo permite.

--10- Cree otra regla llamada "RG_vehiculos_tipo2" que controle los valores para el campo "tipo" para 
--que solamente puedan ingresarse los caracteres "a", "c" y "m":
 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m');

--11- Si la asociamos a un campo que ya tiene asociada otra regla, la nueva regla reeemplaza la 
--asociación anterior. Asocie la regla creada en el punto anterior al campo "tipo".
exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo';

--12- Ingrese el registro que no pudo ingresar en el punto 9.
 insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL);

--13- Intente eliminar la regla "RG_vehiculos_tipo2".
--No es posible porque está asociada a un campo de "vehiculos".
exec sp_unbindrule 'vehiculos.tipo';


--14- Elimine la regla "RG_vehiculos_tipo".
--Es posible porque no está asociada a ningún campo.
drop rule RG_vehiculos_tipo2;

--15- Intente eliminar la regla "RG_patente_patron".
--No es posible porque está asociada.
drop rule RG_patente_patron;

--16- Quite la asociación de la regla con el campo "patente" de "vehiculos".
exec sp_unbindrule 'vehiculos.patente';

--17- Vea si la regla "RG_patente_patron" está asociada a algún campo de "vehiculos".
--No lo está.
exec sp_helpconstraint vehiculos;

--18- Verifique que la regla aún existe en la base de datos activa:
 exec sp_help;
--aparece la regla.

--19- Elimine la regla que no pudo eliminar en el punto 15.
drop rule RG_patente_patron;

--20- Verifique que la regla ya no existe en la base de datos activa.
--No aparece la regla "RG_patente_patron".

exec sp_helpconstraint vehiculos;


------------------------------------------------------------------------------------------------------------------------------


--57	Valores predeterminados (create default)

if object_id ('empleados') is not null
  drop table empleados;

if object_id ('VP_cero') is not null
   drop default VP_cero;
if object_id ('VP_100') is not null
   drop default VP_100;
if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
if object_id ('VP_telefono') is not null
   drop default VP_telefono;

create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  telefono char(14),
  sueldo decimal(6,2)
);

go

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado con el valor "Desconocido":
create default VP_datodesconocido
  as 'Desconocido';

go

-- Lo asociamos al campo "domicilio":
exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';

-- Lo asociamos al campo "barrio":
exec sp_bindefault VP_datodesconocido, 'empleados.barrio';

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado que inserta el valor "0":
create default VP_cero
  as 0;

go

-- Lo asociamos al campo "sueldo":
exec sp_bindefault VP_cero, 'empleados.sueldo';

insert into empleados default values;

select * from empleados;

go

-- Creamos un valor predeterminado que inserta el valor "100":
create default VP_100
  as 100;

go

-- Lo asociamos al campo "sueldo"
-- Recuerde que si asociamos a un campo que ya tiene asociado un valor
-- predeterminado otro valor predeterminado, la nueva asociación reemplaza a la anterior 
exec sp_bindefault VP_100, 'empleados.sueldo';

insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;

exec sp_help;

go

-- Creamos un valor predeterminado que inserta ceros con el formato válido
-- para un campo número de teléfono:
create default VP_telefono
 as '(0000)0-000000';

go

-- La asociamos al campo "telefono" de la tabla "empleados":
exec sp_bindefault VP_telefono,'empleados.telefono';

insert into empleados default values;

select * from empleados;

exec sp_helpconstraint empleados;

--57. Ejercicios

 if object_id ('clientes') is not null
  drop table clientes;

 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;

 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

 create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]';

 exec sp_bindrule RG_legajo_patron,'clientes.legajo';

 create default VP_legajo_patron
  as 'AA00';

 exec sp_bindefault VP_legajo_patron,'clientes.legajo';

 create default VP_datodesconocido
  as '??';

 exec sp_bindefault VP_datodesconocido,'clientes.domicilio';

 exec sp_bindefault VP_datodesconocido,'clientes.ciudad';

 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10');
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.provincia';

 create default VP_fechaactual
  as getdate();

 exec sp_bindefault VP_fechaactual,'clientes.fechaingreso';

 insert into clientes default values;
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso';

 insert into clientes default values;

 create rule RG_legajo
  as @valor like 'B%';

 exec sp_bindrule RG_legajo,'clientes.legajo';

 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10');


 ---------------------------------------------------------------------------------------------------------------------------------------


--58	Desasociar y eliminar valores predeterminados

 if object_id ('libros') is not null
  drop table libros;

 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_desconocido') is not null
   drop default VP_desconocido;
 if object_id ('RG_positivo') is not null
   drop rule RG_positivo;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );

 create rule RG_positivo
 as @valor >=0;

 exec sp_bindrule RG_positivo,'libros.precio';

 exec sp_bindrule RG_positivo,'libros.cantidad';

 create default VP_cero
  as 0;

 exec sp_bindefault VP_cero,'libros.precio';

 exec sp_bindefault VP_cero,'libros.cantidad';

 create default VP_desconocido
  as 'Desconocido';

 exec sp_bindefault VP_desconocido,'libros.autor';

 exec sp_bindefault VP_desconocido,'libros.editorial';

 exec sp_help;

 exec sp_helpconstraint libros;

 insert into libros (titulo) values('Aprenda PHP');
 select * from libros;

 exec sp_unbindefault 'libros.precio';

 insert into libros (titulo) values('Matematica estas ahi');
 select * from libros;

 exec sp_helpconstraint libros;

 exec sp_help VP_cero;

 drop default VP_cero;

 exec sp_unbindefault 'libros.cantidad';

 exec sp_helpconstraint libros;

 exec sp_help VP_cero;

 drop default VP_cero;

 exec sp_help VP_cero;


 ---------------------------------------------------------------------------------------------------------------------------------------------


-- 62	Creación de índices

 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',9);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

 create unique clustered index I_alumnos_apellido
 on alumnos(apellido);

 create clustered index I_alumnos_apellido
 on alumnos(apellido); 

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key clustered (legajo);

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key nonclustered (legajo);

 exec sp_helpindex alumnos;

 exec sp_helpconstraint alumnos;

 create unique nonclustered index I_alumnos_documento
 on alumnos(documento);

 insert into alumnos values ('A789','27777777','Morales','Hector',8);

 exec sp_helpindex alumnos;

 create index I_alumnos_apellidonombre
  on alumnos(apellido,nombre);

 select name from sysindexes
  where name like '%alumnos%';

 alter table alumnos
  add constraint UQ_alumnos_documento
  unique (documento);

 exec sp_helpconstraint alumnos;

 exec sp_helpindex alumnos;

 select name from sysindexes
  where name like '%alumnos%';

 select name from sysindexes
  where name like 'I_%';


  ------------------------------------------------------------------------------------------------------------------------------------


--63 Regenerar índices

 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido); 

 exec sp_helpindex alumnos;

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido,nombre)
  with drop_existing;

 exec sp_helpindex alumnos;

 alter table alumnos
  add constraint UQ_alumnos_documento
  unique nonclustered (documento);

 exec sp_helpindex alumnos;

 create clustered index UQ_alumnos_documento
  on alumnos(documento)
  with drop_existing;

 create nonclustered index I_alumnos_legajo
  on alumnos(legajo); 

 exec sp_helpindex alumnos;

 create clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

 exec sp_helpindex alumnos;

 create nonclustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido)
  with drop_existing;

 create clustered index I_alumnos_apellido
  on alumnos(apellido)
  with drop_existing;

 create unique clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

 exec sp_helpindex alumnos;

 create clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;

 exec sp_helpindex alumnos;


 ------------------------------------------------------------------------------------------------------------------------------------------------------------


--64	Eliminar índices 

 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido);

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key clustered (legajo);

 exec sp_helpindex alumnos;

 drop index PK_alumnos_legajo;

 drop index I_alumnos_apellido;

 drop index alumnos.I_alumnos_apellido;

 exec sp_helpindex alumnos;

 if exists (select name from sysindexes
  where name = 'I_alumnos_apellido')
   drop index alumnos.I_alumnos_apellido;

 alter table alumnos
  drop PK_alumnos_legajo;

 exec sp_helpindex alumnos;


 ---------------------------------------------------------------------------------------------------------------------------------------------


--66	Combinación interna (inner join)

  if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo;

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  order by p.nombre;

 select c.nombre,domicilio,ciudad
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  where p.nombre='Santa Fe';


  ------------------------------------------------------------------------------------------------------------------


--  67	Combinación externa izquierda (left join)

 if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null;

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre;

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba';


-------------------------------------------------------------------------------------------------------------------------------------------------


--68	Combinación externa derecha (right join)

  if (object_id('clientes')) is not null
   drop table clientes;
  if (object_id('provincias')) is not null
   drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias (nombre) values('Cordoba');
 insert into provincias (nombre) values('Santa Fe');
 insert into provincias (nombre) values('Corrientes');

 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1);
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4);
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5);

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo;

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is not null;

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad;

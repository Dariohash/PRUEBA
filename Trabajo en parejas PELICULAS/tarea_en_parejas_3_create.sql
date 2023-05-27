-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-27 20:11:21.832
CREATE DATABASE PELICULAS
GO
USE PELICULAS
-- tables
-- Table: actor
CREATE TABLE actor (
    id int  NOT NULL,
    nombre varchar(100)  NOT NULL,
    genero char(1)  NOT NULL,
    CONSTRAINT actor_pk PRIMARY KEY  (id)
);

-- Table: clasificaciones
CREATE TABLE clasificaciones (
    estrellas int  NOT NULL,
    comentarios varchar(255)  NOT NULL,
    pelicula_id int  NOT NULL,
    critica_id int  NOT NULL,
    CONSTRAINT clasificaciones_pk PRIMARY KEY  (pelicula_id,critica_id)
);

-- Table: critica
CREATE TABLE critica (
    id int  NOT NULL,
    name varchar(100)  NOT NULL,
    CONSTRAINT critica_pk PRIMARY KEY  (id)
);

-- Table: director
CREATE TABLE director (
    id int  NOT NULL,
    nombre varchar(100)  NOT NULL,
    CONSTRAINT director_pk PRIMARY KEY  (id)
);

-- Table: genero
CREATE TABLE genero (
    id int  NOT NULL,
    descripcion varchar(50)  NOT NULL,
    CONSTRAINT genero_pk PRIMARY KEY  (id)
);

-- Table: pelicula
CREATE TABLE pelicula (
    id int  NOT NULL,
    titulo varchar(50)  NOT NULL,
    anio int  NOT NULL,
    lenguaje varchar(50)  NOT NULL,
    duracion int  NOT NULL,
    genero_id int  NOT NULL,
    director_id int  NOT NULL,
    CONSTRAINT pelicula_pk PRIMARY KEY  (id)
);

-- Table: reparto_pelicula
CREATE TABLE reparto_pelicula (
    rol varchar(50)  NOT NULL,
    actor_id int  NOT NULL,
    pelicula_id int  NOT NULL,
    CONSTRAINT reparto_pelicula_pk PRIMARY KEY  (actor_id,pelicula_id)
);

-- foreign keys
-- Reference: clasificaciones_critica (table: clasificaciones)
ALTER TABLE clasificaciones ADD CONSTRAINT clasificaciones_critica
    FOREIGN KEY (critica_id)
    REFERENCES critica (id);

-- Reference: clasificaciones_pelicula (table: clasificaciones)
ALTER TABLE clasificaciones ADD CONSTRAINT clasificaciones_pelicula
    FOREIGN KEY (pelicula_id)
    REFERENCES pelicula (id);

-- Reference: pelicula_director (table: pelicula)
ALTER TABLE pelicula ADD CONSTRAINT pelicula_director
    FOREIGN KEY (director_id)
    REFERENCES director (id);

-- Reference: pelicula_genero (table: pelicula)
ALTER TABLE pelicula ADD CONSTRAINT pelicula_genero
    FOREIGN KEY (genero_id)
    REFERENCES genero (id);

-- Reference: reparto_pelicula_actor (table: reparto_pelicula)
ALTER TABLE reparto_pelicula ADD CONSTRAINT reparto_pelicula_actor
    FOREIGN KEY (actor_id)
    REFERENCES actor (id);

-- Reference: reparto_pelicula_pelicula (table: reparto_pelicula)
ALTER TABLE reparto_pelicula ADD CONSTRAINT reparto_pelicula_pelicula
    FOREIGN KEY (pelicula_id)
    REFERENCES pelicula (id);

-- End of file.

INSERT INTO actor (Id, Nombre,genero) 
VALUES 
('001','Luis Cruz', 'M'),
('002','Jhonny Depp','M'),
('003','Brad Pitt','M'),
('004','Vin Diesel','M'),
('005','Demi Moore','F'),
('006','Bruce Willis','M'),
('007','Angelina Jolie','F'),
('008','Jennifer Aniston','F'),
('009','Will Smith','M'),
('010','Scarlett Johansson','F')

select * from actor
------crear un procedure para (agregar)
CREATE PROCEDURE pr_insertaractor (@id int ,@nombre varchar (100), @genero char (1))
AS
BEGIN
    INSERT INTO actor(id ,nombre, genero)
	VALUES (@id ,@nombre, @genero)
END
GO
EXEC pr_insertaractor 11,'Sebastian Reyes', 'M'
---crear un procedure para (Buscar)
CREATE PROCEDURE pr_buscaractor (@nombre varchar(100))
AS
BEGIN
      SELECT *
	  FROM actor
	  WHERE nombre like'%' + @nombre + '%'
END
GO
EXEC pr_buscaractor 'Vin'

INSERT INTO Critica (Id, nombre) 
VALUES 
('001','Jose Ruiz'),
('002','Cesar Frias'),
('003','Liz Cruz'),
('004','Gustabo Palacios'),
('005','Sofia Flores'),
('006','José Herrera'),
('007','Norelia Chumacero'),
('008','Lucia Santos'),
('009','Ana Castro'),
('010','Angelo Torres')

/*3. Escribir la sentencia SQL que permita mostrar el comentario y la calificación de estrellas a una 
película que colocó una persona cuyo nombre es “Cesar Frias”.*/
select * from critica
select comentarios, estrellas
from clasificaciones
where critica_id = 002
/*4. Escribir la sentencia SQL que permita mostrar el comentario y la calificación de estrellas a una 
película que colocó una persona cuyo nombre es “Sofia Flores”.*/
select comentarios, estrellas
from clasificaciones
where critica_id=005
------------------------------------------------------------------------------
INSERT INTO clasificaciones(estrellas, comentarios, pelicula_id,critica_id)
VALUES
('5','Excelente pelicula, muy recomendada'                   ,'009','001'),
('5','Me encato, muy buena pelicula'                         ,'002','005'),
('3','Si estuvo buena la pelicula'                           ,'007','003'),
('5','Me encato, buenas ecenas tiene'                        ,'004','007'),
('4','Me gusto esta pelicula, ahora es una de mis faboritas' ,'005','002'),
('4','Tiene unas ecenas uufff... increibles'                 ,'010','006'),
('1','No me gusto, pesima pelicula'                          ,'001','002'),
('0','Remala, no la recomendaria'                            ,'008','010'),
('2','No es lo que esperaba, no me gusto'                    ,'007','009'),
('3','No a estado tan emocionante como me la imagine'        ,'006','008')


/*1. Escribir la sentencia SQL que permita mostrar el nombre de todas las personas que dieron una 
calificación de cinco (5) estrellas a alguna película.*/
select * from clasificaciones
where estrellas=5
order by critica_id asc

/*2. Escribir la sentencia SQL que permita mostrar el nombre de todas las personas que dieron una 
calificación de al menos tres (3) estrellas a alguna película.*/
select * from clasificaciones
where estrellas<=3
order by critica_id asc




INSERT INTO director(id, nombre)
VALUES
('001','Martin Scorsese'),
('002','Alejandro González'),
('003','Billy Wilder'),
('004','Oliver Stone'),
('005','Charles Chaplin'),
('006','Terry Gilliam'),
('007','Frank Capra'),
('008','Claudia Llosa'),
('009','Dorian Fernandez'),
('010','Joanna Lombardi')

select * from director
--para modificar y guardar cambios
update director 
set nombre = 'Criz Diaz'
where id=3

INSERT INTO genero(id, descripcion)
VALUES
('001','Terror'),
('002','Comedia'),
('003','Drama'),
('004','Terror'),
('005','Drama'),
('006','Acción'),
('007','Ciencia Ficción'),
('008','Fantasía'),
('009','Comedia'),
('010','Romance')

select * from genero
-----modificar y guardar cambios
update genero
set descripcion='Terror'
where id=1
------------------------- agregar datos a una tabla
insert into genero(id, descripcion)
values
('011','Romance')

-------------Eliminar datos de una tabla
delete genero 
where id=11
--------------------------------------
INSERT INTO pelicula(id,titulo, anio, lenguaje, duracion, genero_id, director_id)
VALUES
('001','La casa negra','2017','Español','150 ',       '002','010'),
('002','El dragon rojo','2019','Ingles','170 ' ,      '001','009'),
('003','El padrino','2020','Español','160 ',          '003','008'),
('004','El mago de Oz','2018','Español','210 ',       '007','004'),
('005','Cadena perpetua','2017','Ingles','150 ',      '004','005'),
('006','Casablanca','2016','Frances','180 ',          '006','006'),
('007','Hombres de negro','2018','Español','190 ',    '005','007'),
('008','Sin nombre','2017','Ingles','170',           '008','002'),
('009','La resaca','2016','Ingles','190',            '010','003'),
('010','Como caido del cielo','2019','Español','180','009','001')  
/*5. Escribir la sentencia SQL que permita mostrar el nombre y director (nombre) de todas las películas
que fueron estrenadas el año 2020.*/
select* from pelicula

select * from pelicula
inner join director on director.director_id

select a.titulo, b.director
from pelicula a inner join director b on a.director_id=b.id
where anio=2020

------
select titulo, director_id
from pelicula
where anio=2020


INSERT INTO reparto_pelicula(rol, actor_id, pelicula_id)
VALUES
('Papel principal', '003','010'  ),
('Papel secundario','001','008'  ),
('Papel principal', '002','002'  ),
('Papel secundario','004','004'  ),
('Papel principal', '005','006'  ),
('Papel principal', '008','005'  ),
('Papel secundario','010','007'  ),
('Papel principal', '007','009'  ),
('Papel principal', '009','003'  ),
('Papel secundario','006','001'  )  

select * from reparto_pelicula

------------------------------------------------------
/*Escribir la sentencia SQL que permita mostrar el comentario y la calificación de estrellas a una 
película que colocó una persona cuyo nombre es “Cesar Frias”.*/
select * from critica
select* from clasificaciones
---usando inner join
select   critica.nombre, clasificaciones.comentarios, clasificaciones.estrellas,clasificaciones.critica_id
from critica inner join clasificaciones 
on critica.id =clasificaciones.critica_id
where critica.nombre='Cesar Frias'
-----------------------------------------------------------------

select* from genero
select descripcion, id
from genero 
where descripcion='drama'


select *from actor

update actor 
set nombre = 'Celeste Rojas'
where id=5

select* from director
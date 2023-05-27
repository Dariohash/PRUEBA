-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-27 20:11:21.832

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


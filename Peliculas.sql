create database Peliculas 
use peliculas

create table Pelicula(
id int primary key identity (1,1) not null,
titulo varchar(50) not null,
anio int not null,
lenguage varchar(50) not null,
duracion int not null,
idDirector int not null,
idGenero int not null,
CONSTRAINT fk_Director FOREIGN KEY (idDirector) REFERENCES Director(id),
CONSTRAINT fk_DGenero FOREIGN KEY (idGenero) REFERENCES Genero(id)
);

create table Papel_del_actor(
papel varchar (50) not null,
idActor int not null,
idPelicula int not null,
CONSTRAINT fk_Actor FOREIGN KEY (idActor) REFERENCES Actor(id),
CONSTRAINT fk_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula(id),
);

create table Actor(
id int primary key identity (1,1) not null,
nombre varchar(100) not null,
genero char(1) not null
);

create table Genero (
id int primary key identity (1,1) not null,
descripcion varchar(50)
);

create table Director (
id int primary key identity (1,1) not null,
nombre varchar(100)
);

create table Calificacion(
estrella int identity (1,1) not null,
comentario varchar(255) not null,
idCritica int not null,
idPelicula int not null,
CONSTRAINT fk_Critica FOREIGN KEY (idCritica) REFERENCES Critica(id),
CONSTRAINT fk_Pelicula FOREIGN KEY (idPelicula) REFERENCES Pelicula(id)
);

create table Critica(
id int primary key identity (1,1) not null,
nombre varchar(100)
);

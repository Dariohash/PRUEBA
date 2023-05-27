CREATE DATABASE Escuela
go

use Escuela
go

/* Creando tabla Alumno, asignatura y profesor */

Create table Alumnos(
Id char(8) primary key,
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Direccion varchar(50),
Fecha_nacimiento char(8)
);

Create table Asignatura(
Id char(8) primary key,
Nombre varchar(20) not null
);

Create table Profesor(
Id char(8) primary key,
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Direccion varchar(50),
Fecha_nacimiento char(8),
Nivel_Academico varchar (20)
);

/* Creando tabla Inscripción con campos para llaves foraneas */

Create table Inscripcion(
Id char(8) primary key,
IdAsignatura char(8) not null,
IdAlumno char(8) not null,
IdProfesor char(8) not null,
Fecha char(8),
CONSTRAINT fk_Asignatura FOREIGN KEY (IdAsignatura) REFERENCES Asignatura (Id),
CONSTRAINT fk_Alumno FOREIGN KEY (IdAlumno) REFERENCES Alumnos (Id),
CONSTRAINT fk_Profesor FOREIGN KEY (IdProfesor) REFERENCES Profesor (Id)
);
/*INSERTAMOS DATOS A LA TABLA ALUMNOS 
INSERT INTO “Nombre_Tabla” (“columna1”, “columna2”, etc)
VALUES (“Dato1”, “Dato2”, etc); <<Con esta sintacsis podemos dejar columnas bacias teniendo en cuneta que no tenga not null>>
---------------
INSERT INTO “Nombre_Tabla”
VALUES (“Dato1”, “Dato2”, etc); <<Con esta sintacsis es obligatorio dar valor a todas as columnas>>
*/
insert into "Alumnos" ("Id", "Nombre","Apellido","Direccion","Fecha_nacimiento")
values ('001', 'Dario', 'Campoverde_Veliz', 'Nueva_Esperanza', '04/08/00');

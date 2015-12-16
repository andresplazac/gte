use master

create database GTE

go

use GTE

create table Invitado
(
IDUsuario int,
IDTablero int,
primary key(IDUsuario, IDTablero)
)

create table Autenticacion
(
IDUsuario int identity primary key,
IDAccenture varchar(50),
Vigencia bit
)

create table Estado
(
IDEstado int primary key,
NombreEstado varchar(100)
)

create table Tablero
(
IDTablero int primary key identity,
IDUsuario int,
CodigoARS varchar(10),
LinkSharepoint varchar(400),
NombreTablero varchar(200),
FechaCreacion datetime
)

create table Tarea
(
IDTarea int primary key identity,
IDTablero int,
IDEstado int,
IDUsuario int, --Usuario que crea la tarea
IDResponsable int,  --ID usuario responsable
FechaCreacion datetime,
FechaModificacion datetime,
FechaTermino datetime,
NombreTarea varchar(200),
Descripcion varchar(2000),
Posicion int
)

create table Comentario
(
IDComentario int primary key,
IDUsuario int, --ID creador
FechaCreacion datetime,
FechaModificacion datetime,
Detalle varchar(2000)
)

create table LogActividad
(
IDUsuario int,
IDTablero int,
IDTarea int,
IDComentario int,
FechaAccion datetime,
DetalleAccion varchar(300)
)

/*
Referencias foraneas.
*/
-- Invitado
ALTER TABLE Invitado ADD CONSTRAINT FK_Invitado_IDUsuario
FOREIGN KEY (IDUsuario) 
REFERENCES Autenticacion (IDUsuario) 

ALTER TABLE Invitado ADD CONSTRAINT FK_Invitado_IDTablero
FOREIGN KEY (IDTablero) 
REFERENCES Tablero (IDTablero) 

-- Tablero
ALTER TABLE Tablero ADD CONSTRAINT FK_Tablero_IDUsuario
FOREIGN KEY (IDUsuario) 
REFERENCES Autenticacion (IDUsuario) 

-- Tarea
ALTER TABLE Tarea ADD CONSTRAINT FK_Tarea_IDTablero
FOREIGN KEY (IDTablero) 
REFERENCES Tablero (IDTablero) 

ALTER TABLE Tarea ADD CONSTRAINT FK_Tarea_IDEstado
FOREIGN KEY (IDEstado) 
REFERENCES Estado (IDEstado) 

ALTER TABLE Tarea ADD CONSTRAINT FK_Tarea_IDUsuario
FOREIGN KEY (IDUsuario) 
REFERENCES Autenticacion (IDUsuario) 

ALTER TABLE Tarea ADD CONSTRAINT FK_Tarea_IDResponsable
FOREIGN KEY (IDResponsable) 
REFERENCES Autenticacion (IDUsuario) 

-- Comentario
ALTER TABLE Comentario ADD CONSTRAINT FK_Comentario_IDUsuario
FOREIGN KEY (IDUsuario) 
REFERENCES Autenticacion (IDUsuario) 

-- Log_Actividad
ALTER TABLE LogActividad ADD CONSTRAINT FK_LogActividad_IDUsuario
FOREIGN KEY (IDUsuario) 
REFERENCES Autenticacion (IDUsuario) 

ALTER TABLE LogActividad ADD CONSTRAINT FK_LogActividad_IDTablero
FOREIGN KEY (IDTablero) 
REFERENCES Tablero (IDTablero) 

ALTER TABLE LogActividad ADD CONSTRAINT FK_LogActividad_IDTarea
FOREIGN KEY (IDTarea) 
REFERENCES Tarea (IDTarea) 

ALTER TABLE LogActividad ADD CONSTRAINT FK_LogActividad_IDComentario
FOREIGN KEY (IDComentario) 
REFERENCES Comentario (IDComentario) 



insert into Autenticacion (IDAccenture, Vigencia)
values
('andres.plaza.chirino',1),
('s.alvarez',1),
('miguel.pastenes',1)


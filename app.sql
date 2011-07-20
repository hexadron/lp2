drop database if exists app;
create database app;
use app;

create table perfil (
  id int not null auto_increment primary key,
  descripcion varchar(100) not null
) DEFAULT CHARSET=utf8;

create table modulo (
  id int not null auto_increment primary key,
  descripcion varchar(100) not null,
  uri varchar(120) not null
) DEFAULT CHARSET=utf8;

create table moduloPorPerfil (
  perfil_id int not null references perfil,
  modulo_id int not null references modulo
) DEFAULT CHARSET=utf8;

create table area (
  id int not null auto_increment primary key,
  descripcion varchar(30) not null
) DEFAULT CHARSET=utf8;

create table usuario (
  id int not null auto_increment primary key,
  usuario varchar(32) not null,
  password varchar(64) not null,
  perfil_id int not null references perfil,
  area_id int null references area
) DEFAULT CHARSET=utf8;

create table equipo (
	codigoPatrimonial int not null auto_increment primary key,
	denominacion text not null,
	fabricante text not null,
	area_id int not null references area,
	enproceso boolean not null default false,
	dadodebaja boolean not null default false
) DEFAULT CHARSET=utf8;

create table tecnico (
	id int not null auto_increment primary key,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	fechaIngreso date not null,
	especialidad varchar(50) not null
) DEFAULT CHARSET=utf8;

create table solicitud (
	id int not null auto_increment primary key,
	fecha timestamp,
	usuario_id int not null references usuario,
	enatencion boolean not null default false
) DEFAULT CHARSET=utf8;

create table detalleSolicitud (
	solicitud_id int not null references solicitud,
	equipo_id int not null references equipo,
	problema text not null
) DEFAULT CHARSET=utf8;

#dummy data
#area
insert into area (descripcion) values ('mantenimiento');
insert into area (descripcion) values ('recursos humanos');
insert into area (descripcion) values ('emergencias');
insert into area (descripcion) values ('clinica');
#perfil
insert into perfil (descripcion) values ('administrador');
insert into perfil (descripcion) values ('jefe del area');
insert into perfil (descripcion) values ('tecnico interno');
insert into perfil (descripcion) values ('usuario');
#modulo
insert into modulo (descripcion, uri) values ('Diagnóstico de Equipos', 'reparacion/diagnostico');
insert into modulo (descripcion, uri) values ('Reparación de Equipos', 'reparacion/reparacion');
insert into modulo (descripcion, uri) values ('Mantener Usuarios', 'security/usuarios');
insert into modulo (descripcion, uri) values ('Mantener Perfiles', 'security/perfiles');
insert into modulo (descripcion, uri) values ('Solicitud de Mantenimiento', 'solicitud');
insert into modulo (descripcion, uri) values ('Asignación de Técnicos', 'reparacion/asignar');
insert into modulo (descripcion, uri) values ('Historial de Desempeño', 'reparacion/historial');
insert into modulo (descripcion, uri) values ('Mantenimiento de Equipos', 'equipos');
#...
insert into modulo (descripcion, uri) values ('Reparación externa', 'reparacionexterna');
insert into modulo (descripcion, uri) values ('Terceros', 'terceros');

#moduloporperfil
#administrador del sistema
insert into moduloPorPerfil values (1, 3);
insert into moduloPorPerfil values (1, 4);
#usuario
insert into moduloPorPerfil values (4, 5); 
#jefe de área
insert into moduloPorPerfil values (2, 6);
insert into moduloPorPerfil values (2, 7);
insert into moduloPorPerfil values (2, 8);
#perfil de técnico interno
insert into moduloPorPerfil values (3, 1);
insert into moduloPorPerfil values (3, 2);

#usuario
insert into usuario (usuario, password, perfil_id) values ('root', 'sudo', 1); -- administrador
insert into usuario (usuario, password, perfil_id, area_id) values ('jefe', 'boss', 2, 1); -- jefe
insert into usuario (usuario, password, perfil_id, area_id) values ('bob', 'sudo', 3, 1); -- técnico interno
insert into usuario (usuario, password, perfil_id, area_id) values ('scott', 'tiger', 4, 3); -- usuario

#equipos
insert into equipo (denominacion, fabricante, area_id) values ('Ventilador', 'General Electrics', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Cocina', 'Imaco', 2);               
insert into equipo (denominacion, fabricante, area_id) values ('Refrigerador', 'Mabe', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Rayos X', 'SuperFabricante', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Rayos Y', 'SuperFabricante', 3);
	
#tecnicos
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Linus', 'Torvalds', now(), 'informática');
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Alan', 'García Perez', now(), 'gasfitería');
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Diego Armando', 'Maradona', now(), 'electricista');
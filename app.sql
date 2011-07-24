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
  uri varchar(120) not null,
  shorthand varchar(50) not null
) DEFAULT CHARSET=utf8;

create table moduloPorPerfil (
  id int not null auto_increment primary key,
  perfil int not null references perfil,
  modulo int not null references modulo
) DEFAULT CHARSET=utf8;

create table area (
  id int not null auto_increment primary key,
  descripcion varchar(30) not null
) DEFAULT CHARSET=utf8;

create table usuario (
  id int not null auto_increment primary key,
  usuario varchar(32) not null,
  password varchar(64) not null,
  perfil int not null references perfil,
  area int null references area
) DEFAULT CHARSET=utf8;

create table equipo (
 	codigoPatrimonial int not null auto_increment primary key,
	denominacion text not null,
	fabricante text not null,
	area int not null references area,
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
	usuario int not null references usuario,
	enatencion boolean not null default false
) DEFAULT CHARSET=utf8;

create table detalleSolicitud (
	#id int not null primary key,
	solicitud int not null references solicitud,
	equipo int not null references equipo,
	problema text not null
) DEFAULT CHARSET=utf8;

create table reparacion (
	solicitud int not null references solicitud,
	equipo int not null references equipo,
	#detallesolicitud int not null references detallesolicitud
	tecnico int not null references tecnico,
	unique(solicitud, equipo)
) DEFAULT CHARSET=utf8;

#dummy data
#area
insert into area (descripcion) values ('Mantenimiento');
insert into area (descripcion) values ('Recursos Humanos');
insert into area (descripcion) values ('Emergencias');
insert into area (descripcion) values ('Clinica');
#perfil
insert into perfil (descripcion) values ('administrador');
insert into perfil (descripcion) values ('jefe del area');
insert into perfil (descripcion) values ('tecnico interno');
insert into perfil (descripcion) values ('usuario');
#modulo
insert into modulo (descripcion, uri, shorthand) values ('Diagnóstico de Equipos', 'reparacion/diagnostico', 'Diagnóstico'); 
insert into modulo (descripcion, uri, shorthand) values ('Reparación de Equipos', 'reparacion/reparacion', 'Reparación');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Usuarios', 'security/usuarios', 'Usuarios');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Perfiles', 'security/perfiles', 'Perfiles');
insert into modulo (descripcion, uri, shorthand) values ('Solicitar Mantenimiento Correctivo', 'solicitud', 'Solicitar Mantenimiento');
insert into modulo (descripcion, uri, shorthand) values ('Asignar Técnicos a Solicitud', 'reparacion/asignar', 'Asignar');
insert into modulo (descripcion, uri, shorthand) values ('Consultar Historial de Desempeño', 'reparacion/historial', 'Historial');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Equipos', 'equipos', 'Equipos');
insert into modulo (descripcion, uri, shorthand) values ('Reparación externa', 'reparacionexterna', 'Externa');
insert into modulo (descripcion, uri, shorthand) values ('Terceros', 'terceros', 'Terceros');

#moduloporperfil
#administrador del sistema
insert into moduloPorPerfil (perfil, modulo) values (1, 3);
insert into moduloPorPerfil (perfil, modulo) values (1, 4);
#usuario
insert into moduloPorPerfil (perfil, modulo) values (4, 5); 
#jefe de área
insert into moduloPorPerfil (perfil, modulo) values (2, 6);
insert into moduloPorPerfil (perfil, modulo) values (2, 7);
insert into moduloPorPerfil (perfil, modulo) values (2, 8);
#perfil de técnico interno
insert into moduloPorPerfil (perfil, modulo) values (3, 1);
insert into moduloPorPerfil (perfil, modulo) values (3, 2);

#usuario
insert into usuario (usuario, password, perfil) values ('root', 'sudo', 1); -- administrador
insert into usuario (usuario, password, perfil, area) values ('jefe', 'boss', 2, 1); -- jefe
insert into usuario (usuario, password, perfil, area) values ('bob', 'sudo', 3, 1); -- técnico interno
insert into usuario (usuario, password, perfil, area) values ('scott', 'tiger', 4, 3); -- usuario

#equipos
insert into equipo (denominacion, fabricante, area) values ('Ventilador', 'General Electrics', 3);
insert into equipo (denominacion, fabricante, area) values ('Cocina', 'Imaco', 2);               
insert into equipo (denominacion, fabricante, area) values ('Refrigerador', 'Mabe', 3);
insert into equipo (denominacion, fabricante, area) values ('Rayos X', 'SuperFabricante', 4);
insert into equipo (denominacion, fabricante, area) values ('Rayos Y', 'SuperFabricante', 4);
	
#tecnicos
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Linus', 'Torvalds', now(), 'informática');
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Alan', 'García Perez', now(), 'gasfitería');
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad) values ('Diego Armando', 'Maradona', now(), 'electricista');
	
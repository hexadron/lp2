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
    dadodebaja boolean not null default false,
    asignado boolean not null default false
) DEFAULT CHARSET=utf8;

create table tecnico (
    id int not null auto_increment primary key,
    nombres varchar(50) not null,
    apellidos varchar(50) not null,
    fechaIngreso date not null,
    especialidad varchar(50) not null,
    usuario_id int not null references usuario
) DEFAULT CHARSET=utf8;

create table solicitud (
    id int not null auto_increment primary key,
    fecha timestamp,
    usuario_id int not null references usuario,
    enatencion boolean not null default false
) DEFAULT CHARSET=utf8;

create table detalleSolicitud (
    id int not null auto_increment primary key,
    solicitud_id int not null references solicitud,
    equipo_id int not null references equipo,
    problema text not null
) DEFAULT CHARSET=utf8;

create table reparacion (
    id int not null auto_increment primary key,
    detallesolicitud_id int not null references detalleSolicitud,
    equipo_id int not null references equipo,
    tecnico_id int not null references tecnico,
    diagnostico text,
    prioridad varchar(20),
    atendida boolean not null default false,
    unique(detallesolicitud_id, equipo_id)
) DEFAULT CHARSET=utf8;

create table detalleReparacion (
    id int not null auto_increment primary key,
    reparacion_id int not null references detalleSolicitud,
    trabajo text,
    costo double,
    garantia double,
    recomendaciones text,
    unique(reparacion_id)
) DEFAULT CHARSET=utf8;

#dummy data
#area
insert into area (descripcion) values ('Mantenimiento');
insert into area (descripcion) values ('Recursos Humanos');
insert into area (descripcion) values ('Emergencias');
insert into area (descripcion) values ('Cl&iacute;nica');
insert into area (descripcion) values ('Log&iacute;stica');
#perfil
insert into perfil (descripcion) values ('Administrador');
insert into perfil (descripcion) values ('Jefe del &aacute;rea');
insert into perfil (descripcion) values ('T&eacute;cnico interno');
insert into perfil (descripcion) values ('Usuario');
insert into perfil (descripcion) values ('Administrativo');
insert into perfil (descripcion) values ('Log&iacute;stica');
#modulo
insert into modulo (descripcion, uri, shorthand) values ('Diagn&oacute;stico de Equipos', 'reparacion/diagnostico', 'Diagn&oacute;stico'); 
insert into modulo (descripcion, uri, shorthand) values ('Reparaci&oacute;n de Equipos', 'reparacion/reparacion', 'Reparaci&oacute;n');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Usuarios', 'security/usuarios', 'Usuarios');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Perfiles', 'security/perfiles', 'Perfiles');
insert into modulo (descripcion, uri, shorthand) values ('Solicitar Mantenimiento Correctivo', 'solicitud', 'Solicitar Mantenimiento');
insert into modulo (descripcion, uri, shorthand) values ('Asignar T&eacute;cnicos a Solicitud', 'reparacion/asignar', 'Asignar');
insert into modulo (descripcion, uri, shorthand) values ('Consultar Historial de Desempe&ntilde;o', 'reparacion/historial', 'Historial');
insert into modulo (descripcion, uri, shorthand) values ('Mantener Equipos', 'equipos', 'Equipos');

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
#administrativo
insert into moduloPorPerfil values (5, 10); 
#logistica
insert into moduloPorPerfil values (6, 11);

#usuario
insert into usuario (usuario, password, perfil_id) values ('root', 'sudo', 1); -- administrador
insert into usuario (usuario, password, perfil_id, area_id) values ('jefe', 'boss', 2, 1); -- jefe
insert into usuario (usuario, password, perfil_id, area_id) values ('scott', 'tiger', 4, 3); -- usuario
insert into usuario (usuario, password, perfil_id, area_id) values ('bob', 'sudo', 3, 1); -- técnico interno
insert into usuario (usuario, password, perfil_id, area_id) values ('bob2', 'sudo', 3, 2); -- técnico interno
insert into usuario (usuario, password, perfil_id, area_id) values ('bob3', 'sudo', 3, 3); -- técnico interno

#equipos
insert into equipo (denominacion, fabricante, area_id) values ('Ventilador', 'General Electrics', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Cocina', 'Imaco', 2);               
insert into equipo (denominacion, fabricante, area_id) values ('Refrigerador', 'Mabe', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Rayos X', 'SuperFabricante', 3);
insert into equipo (denominacion, fabricante, area_id) values ('Rayos Y', 'SuperFabricante', 3);
    
#tecnicos
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad, usuario_id) values ('Linus', 'Torvalds', now(), 'Telecomunicaciones', 4);
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad, usuario_id) values ('Alan', 'Garc&iacute;a P&eacute;rez', now(), 'Gasfiter&iacute;a', 5);
insert into tecnico (nombres, apellidos, fechaIngreso, especialidad, usuario_id) values ('Diego Armando', 'Maradona', now(), 'Electricista', 6);
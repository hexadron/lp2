drop database if exists app;
create database app;
use app;

create table perfil (
  id int not null auto_increment primary key,
  descripcion varchar(100) not null
);

create table modulo (
  id int not null auto_increment primary key,
  descripcion varchar(100) not null,
  uri varchar(120) not null
);

create table moduloPorPerfil (
  perfil_id int not null references perfil,
  modulo_id int not null references modulo
);

create table area (
  id int not null auto_increment primary key,
  descripcion varchar(30) not null
);

create table usuario (
  id int not null auto_increment primary key,
  usuario varchar(32) not null,
  password varchar(64) not null,
  perfil_id int not null references perfil,
  area_id int null references area
);

create table equipo (
	id int not null auto_increment primary key,
	codigoPatrimonial int not null,
	denominacion text not null,
	fabricante text not null,
	area_id int not null references area,
	estado varchar(15) not null
);

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
#perfil de técnico interno
insert into moduloPorPerfil values (3, 1);
insert into moduloPorPerfil values (3, 2);

#usuario
insert into usuario (usuario, password, perfil_id) values ('root', 'sudo', 1); -- administrador
insert into usuario (usuario, password, perfil_id, area_id) values ('jefe', 'sudo', 2, 1); -- jefe
insert into usuario (usuario, password, perfil_id, area_id) values ('bob', 'sudo', 3, 1); -- técnico interno
insert into usuario (usuario, password, perfil_id, area_id) values ('scott', 'tiger', 4, 3); -- usuario

# equipos
insert into equipo (codigoPatrimonial, denominacion, fabricante, area_id, estado) values (1, 'ventilador', 'General Electrics', 3, 'disponible');

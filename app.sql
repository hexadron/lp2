drop database if exists app;
create database app;
use app;

create table perfil (
  id int not null auto_increment primary key,
  descripcion varchar(100) not null,
  uri varchar(120) not null
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

#dummy data
#area
insert into area (descripcion) values ('mantenimiento');
insert into area (descripcion) values ('recursos humanos');
insert into area (descripcion) values ('emergencias');
insert into area (descripcion) values ('clinica');
#perfil
insert into perfil (descripcion, uri) values ('administrador', 'admin');
insert into perfil (descripcion, uri) values ('jefe del area', 'jefe');
insert into perfil (descripcion, uri) values ('tecnico interno', 'tecnico');
insert into perfil (descripcion, uri) values ('usuario', 'usuario');
#modulo
insert into modulo (descripcion, uri) values ('Diagnóstico y Reparacion', 'reparacion');
insert into modulo (descripcion, uri) values ('Reparación externa', 'reparacion_externa');
insert into modulo (descripcion, uri) values ('Asignación de Técnicos', 'asignacion');
insert into modulo (descripcion, uri) values ('Terceros', 'terceros');
insert into modulo (descripcion, uri) values ('Solicitud de Mantenimiento', 'reparacion/solicitar');
#moduloporperfil
insert into moduloPorPerfil values (1, 1);
insert into moduloPorPerfil values (1, 2);
insert into moduloPorPerfil values (1, 3);
insert into moduloPorPerfil values (1, 4);
insert into moduloPorPerfil values (2, 3);
insert into moduloPorPerfil values (3, 1);
insert into moduloPorPerfil values (4, 5);
#usuario
insert into usuario (usuario, password, perfil_id) values ('root', 'sudo', 1);
insert into usuario (usuario, password, perfil_id, area_id) values ('jefe', 'sudo', 2, 1);
insert into usuario (usuario, password, perfil_id, area_id) values ('bob', 'sudo', 3, 1);
insert into usuario (usuario, password, perfil_id, area_id) values ('scott', 'tiger', 4, 3);

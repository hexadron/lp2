class UsuarioSistema
  constructor: (@id, @nombre, @password) ->

class Usuario extends UsuarioSistema

class Administrador extends UsuarioSistema

class EncargadoLogistica extends UsuarioSistema

class Tecnico extends UsuarioSistema
  constructor: (@id, @nombre, @password, @equipos) ->
    super @id, @nombre, @password

  diagnosticar: (id) ->
    equipo.estado = "diagnosticado" for equipo in @equipos when equipo.id is id

  reparar: (id) ->
    equipo.estado = "reparado" for equipo in @equipos when equipo.id is id

class TecnicoExterno extends Tecnico

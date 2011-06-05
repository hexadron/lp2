(function() {
  var Administrador, EncargadoLogistica, Tecnico, TecnicoExterno, Usuario, UsuarioSistema;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  UsuarioSistema = (function() {
    function UsuarioSistema(id, nombre, password) {
      this.id = id;
      this.nombre = nombre;
      this.password = password;
    }
    return UsuarioSistema;
  })();
  Usuario = (function() {
    __extends(Usuario, UsuarioSistema);
    function Usuario() {
      Usuario.__super__.constructor.apply(this, arguments);
    }
    return Usuario;
  })();
  Administrador = (function() {
    __extends(Administrador, UsuarioSistema);
    function Administrador() {
      Administrador.__super__.constructor.apply(this, arguments);
    }
    return Administrador;
  })();
  EncargadoLogistica = (function() {
    __extends(EncargadoLogistica, UsuarioSistema);
    function EncargadoLogistica() {
      EncargadoLogistica.__super__.constructor.apply(this, arguments);
    }
    return EncargadoLogistica;
  })();
  Tecnico = (function() {
    __extends(Tecnico, UsuarioSistema);
    function Tecnico(id, nombre, password, equipos) {
      this.id = id;
      this.nombre = nombre;
      this.password = password;
      this.equipos = equipos;
      Tecnico.__super__.constructor.call(this, this.id, this.nombre, this.password);
    }
    Tecnico.prototype.diagnosticar = function(id) {
      var equipo, _i, _len, _ref, _results;
      _ref = this.equipos;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        equipo = _ref[_i];
        if (equipo.id === id) {
          _results.push(equipo.estado = "diagnosticado");
        }
      }
      return _results;
    };
    Tecnico.prototype.reparar = function(id) {
      var equipo, _i, _len, _ref, _results;
      _ref = this.equipos;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        equipo = _ref[_i];
        if (equipo.id === id) {
          _results.push(equipo.estado = "reparado");
        }
      }
      return _results;
    };
    return Tecnico;
  })();
  TecnicoExterno = (function() {
    __extends(TecnicoExterno, Tecnico);
    function TecnicoExterno() {
      TecnicoExterno.__super__.constructor.apply(this, arguments);
    }
    return TecnicoExterno;
  })();
}).call(this);

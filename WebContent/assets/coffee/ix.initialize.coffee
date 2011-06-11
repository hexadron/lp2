$ ->
  #table = new TableView {el: $('table')}
  #new ToolbarView {el: $('#menu'), table: table}
  #new HiddenFormView {el: $('#footer')}
  new Switch el: $('#aleph')

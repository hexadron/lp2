(function() {
  $(function() {
    var table;
    table = new TableView({
      el: $('table')
    });
    new ToolbarView({
      el: $('#menu'),
      table: table
    });
    return new HiddenFormView({
      el: $('#footer')
    });
  });
}).call(this);
